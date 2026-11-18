'use strict';

// The steps and hooks of this suite, on top of webship-js and
// @webship-js/drupal-core-steps. Each step reads as a visitor would say it:
// no step names a site or a platform, so any of them can be copied into a
// suite for another site.

const { Before, Then } = require('@cucumber/cucumber');
const assert = require('assert');

// The visits of this suite are not visitors. Google Analytics gets an empty
// answer, so a run is not counted in the site's analytics and does not
// depend on a third party. A scenario tagged @analytics lets it load, to
// check what the cookie consent does with it.
const ANALYTICS = /^https:\/\/([a-z0-9-]+\.)*(googletagmanager|google-analytics)\.com\//;

Before({ tags: 'not @analytics' }, async function () {
  // On the browser context, so a page the scenario opens later is covered too.
  await (this.context || this.page).route(ANALYTICS, (route) => route.fulfill({ status: 204, body: '' }));
});

// A name of the selector registry (tests/selectors/webship-co.json) stands
// for its CSS selector; anything else is a CSS selector already.
function selectorOf(world, nameOrSelector) {
  const registry = world.__selectorsCss || {};
  return registry[nameOrSelector] || nameOrSelector;
}

// Ask the page the same question every 100 ms until it gives the wanted
// answer or the time is up; return the last answer.
async function pollUntil(page, ask, isWanted, timeout) {
  const deadline = Date.now() + timeout;
  let answer = await ask();
  while (!isWanted(answer) && Date.now() < deadline) {
    await page.waitForTimeout(100);
    answer = await ask();
  }
  return answer;
}

/**
 * Assert what the browser's own validation (the Constraint Validation API)
 * says of a field, found by its label. Nothing is sent: the field is asked
 * whether its value would do, as the browser asks it before a form leaves
 * the page. A form may turn the browser's check off for its submit
 * (novalidate); each field still knows whether its value is acceptable.
 *
 * Example #1: Then the field "Business email" should fail the browser's validation
 * Example #2: Then the field "Business email" should pass the browser's validation
 * Example #3: When I fill in "Email" with "not an email address"
 *               Then the field "Email" should fail the browser's validation
 * Example #4: Then the field "Your Name" should fail the browser's validation
 * Example #5: Then the field "Phone number" should pass the browser's validation
 */
Then(/^the field "([^"]*)" should (pass|fail) the browser's validation$/, async function (label, outcome) {
  const field = this.page.getByLabel(label, { exact: true }).first();
  try {
    await field.waitFor({ state: 'attached', timeout: 5000 });
  } catch {
    assert.fail(`No field labeled "${label}" was found on ${this.page.url()}.`);
  }
  const wanted = outcome === 'pass';
  const state = await pollUntil(
    this.page,
    () => field.evaluate((el) => ({ valid: el.validity.valid, message: el.validationMessage, value: el.value })),
    (s) => s.valid === wanted,
    5000
  );
  assert.strictEqual(
    state.valid,
    wanted,
    wanted
      ? `The browser refuses the value "${state.value}" of the field "${label}": ${state.message}`
      : `The browser accepts the value "${state.value}" of the field "${label}", expected it to refuse it.`
  );
});

/**
 * Assert every image inside an element has loaded: a missing or broken file
 * leaves an image with no natural width. Lazy images are scrolled into view
 * first, the way a visitor reaches them. The element is a name of the
 * selector registry or a CSS selector; it must hold at least one image.
 *
 * Example #1: Then the images in "docs cards" should be loaded
 * Example #2: Then the images in ".docs-cards" should be loaded
 * Example #3: Then the images in "footer" should be loaded
 * Example #4: Then the images in "main article" should be loaded
 * Example #5: Then the images in "#block-webtheme-content" should be loaded
 */
Then(/^the images in "([^"]*)" should be loaded$/, async function (nameOrSelector) {
  const selector = selectorOf(this, nameOrSelector);
  const images = this.page.locator(`${selector} img`);
  try {
    await images.first().waitFor({ state: 'attached', timeout: 5000 });
  } catch {
    assert.fail(`No image was found in "${nameOrSelector}" (${selector}) on ${this.page.url()}.`);
  }
  const count = await images.count();
  const broken = [];
  for (let i = 0; i < count; i += 1) {
    const image = images.nth(i);
    await image.scrollIntoViewIfNeeded({ timeout: 5000 }).catch(() => {});
    const loaded = await pollUntil(
      this.page,
      () => image.evaluate((el) => el.complete && el.naturalWidth > 0),
      (ok) => ok === true,
      5000
    );
    if (!loaded) broken.push(await image.getAttribute('src'));
  }
  assert.deepStrictEqual(broken, [], `${broken.length} of the ${count} images in "${nameOrSelector}" did not load: ${broken.join(', ')}`);
});
