const {Then} = require('@cucumber/cucumber');
const playwright = require('playwright');
const playwrightConfig = require(require('path').join(process.cwd(), 'playwright.config'));
const assert = require('assert');

/**
 * Verify, that current page header is working
 * Example: Then I should have a working header
 */

Then(/^I should have a working header$/, async function () {
  const page = this.page;
  const header = page.locator('header').first();
  
  // Verify header contains Services, Docs, Blog text
  const headerText = await header.textContent() || '';
  assert.ok(headerText.includes('Services'), 'Header should contain "Services"');
  assert.ok(headerText.includes('Docs'), 'Header should contain "Docs"');
  assert.ok(headerText.includes('Blog'), 'Header should contain "Blog"');
}); 


Then(/^I should have a working footer$/, async function () {
  const page = this.page;
  const footer = page.locator('footer').first();
  
  // Verify footer contains all expected text
  const footerText = await footer.textContent() || '';
  assert.ok(footerText.includes('Contact'), 'Footer should contain "Contact"');
  assert.ok(footerText.includes('About us'), 'Footer should contain "About us"');
  assert.ok(footerText.includes('Privacy'), 'Footer should contain "Privacy"');
  assert.ok(footerText.includes('Copyright') && footerText.includes('Webship'), 'Footer should contain copyright notice');
  assert.ok(footerText.includes('Github'), 'Footer should contain "Github"');
  assert.ok(footerText.includes('Gitlab'), 'Footer should contain "Gitlab"');
  assert.ok(footerText.includes('Bitbucket'), 'Footer should contain "Bitbucket"');
  assert.ok(footerText.includes('X'), 'Footer should contain "X"');
  assert.ok(footerText.includes('Linkedin'), 'Footer should contain "Linkedin"');
  assert.ok(footerText.includes('Youtube'), 'Footer should contain "Youtube"');
});


