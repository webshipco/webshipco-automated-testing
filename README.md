# Webship.co Automated Testing

[![Github Actions](https://github.com/webshipco/webshipco-automated-testing/actions/workflows/github-actions.yml/badge.svg)](https://github.com/webshipco/webshipco-automated-testing/actions/workflows/github-actions.yml)

A public example of testing a real Drupal site with [webship-js](https://www.npmjs.com/package/webship-js) and [@webship-js/drupal-core-steps](https://www.npmjs.com/package/@webship-js/drupal-core-steps): the scenarios in `tests/features/` test [https://webship.co](https://webship.co) (Drupal 11, the webtheme theme) the way an **anonymous visitor** uses it, on a desktop and on a phone.

The suite never logs in, never creates an account and never sends a form: on the contact form and the newsletter form it checks the fields and what the browser says of a value, nothing more. It is written to be copied: take the structure, the configuration and the steps, and write the scenarios of your own site.

## Install, from nothing to a green run

You need [Node.js](https://nodejs.org/) 20 or later (the CI uses Node.js 24) and git.

```bash
git clone https://github.com/webshipco/webshipco-automated-testing.git
cd webshipco-automated-testing
npm ci
npx playwright install --with-deps chromium
npm run test:dry-run
npm test
```

- `npm ci` installs the exact versions of `package-lock.json`: webship-js 2.0.12, @webship-js/drupal-core-steps 2.2.3, cucumber-js and Playwright.
- `npx playwright install --with-deps chromium` installs the browser and the system libraries it needs (they ask for `sudo` on a desktop; on a machine that already has them, `npx playwright install chromium` is enough).
- `npm run test:dry-run` reads every scenario without opening a browser: it fails on a step that has no definition (undefined) or more than one (ambiguous).
- `npm test` runs the suite against https://webship.co, one scenario at a time, in a few minutes.

## Test another site: LAUNCH_URL

The site under test is `LAUNCH_URL`, https://webship.co when it is not set:

```bash
LAUNCH_URL=https://staging.example.com npm test
```

The scenarios check what webship.co shows (its menu, its products, its pages), so another copy of webship.co (a staging site, a local DDEV site) runs them as they are. For your own Drupal site, keep `cucumber.js`, `playwright.config.ts`, `tests/step-definitions/` and the shape of the features, and write the pages, headings and links of your site into them.

A local copy on HTTPS with a locally issued certificate (a DDEV site, `LAUNCH_URL=https://example.ddev.site npm test`) needs nothing more: `playwright.config.ts` sets `ignoreHTTPSErrors`, and the API steps follow the browser's setting.

## Features

| Feature file | What it checks |
| --- | --- |
| `home-page.feature` | The title and message of the home page, the latest release of each product and the release page it opens, the newsletter field (never sent). |
| `main-menu.feature` | `@desktop`: the seven links of the main menu, each to the page's own address, and each link opening its page. |
| `mobile-menu.feature` | `@mobile`: the three-line Menu button opens the menu and closes it, Escape closes it, a link of the open menu opens its page. |
| `products.feature` | The Products page with its logos, the Webship-js page with its step packs and releases, the Webship Workspace install command, a release page and its GitHub link. |
| `docs.feature` | The documentation home, the book sidebar marking the page being read, the book navigation, the Contents button on a phone, the step packs with their logos, the install command of a pack. |
| `blog.feature` | Ten posts to a page, the pager, a post with its title, date and breadcrumb. |
| `services.feature` | The services offered, and Contact Us opening the contact page. |
| `about-us.feature` | What Webship.co loves to help with. |
| `contact.feature` | The required and optional fields of the contact form, the browser's own check of the email address, the email link. The form is never sent. |
| `privacy.feature` | The sections of the privacy policy. |
| `footer.feature` | The footer menu, the social accounts, the badge of this suite, and the footer and logo linking to the pages' own addresses. |
| `cookie-consent.feature` | Manage consents lists the services; accepting and declining are remembered in the consent cookie. |
| `not-found.feature` | A missing page says it was not found and keeps the main menu. |
| `status-codes.feature` | 200 for each main page, 404 for a missing one, asked outside the browser. |
| `robots-and-sitemap.feature` | robots.txt keeps crawlers out of the administration and the login; sitemap.xml lists the documentation and the posts. |
| `metatags.feature` | The title, description, Open Graph tags and canonical URL of the content pages. |
| `accessibility.feature` | `@a11y`: language, landmarks, skip link, named links, buttons and fields, zoom, and a set of axe rules on the main pages. |
| `site-health.feature` | The front page, the Drupal 11 generator, core's JavaScript settings, no PHP error, the page cache for a visitor, no administration shown to a visitor, the administration closed to a visitor. |

### Known issues of the site

A scenario that fails because of a defect of webship.co is tagged `@known-issue` and says why under its title. `npm test` leaves these scenarios out (`not @known-issue and not @wip`), so the suite stays a guard against new failures; `npm run test:known-issues` runs only them, and each one passes once the site is fixed. Then remove its tag.

| Scenario | The defect |
| --- | --- |
| `home-page.feature`: the pictures of the latest posts open the posts | They link to `/media/<id>/edit`, which answers 403 to a visitor. |
| `mobile-menu.feature`: a tap beside the open menu closes it | The overlay behind the menu has no style (the template names it `overlay`, the style sheet styles `header-nav-overlay`): it is 0 px high and a tap beside the menu leaves it open. |
| `main-menu.feature`: the main menu of the privacy policy links to the address of each page | It links to `/index%2ephp/<page>`: a visit to an `/index%2Ephp/` address renders the links of a page's blocks with that prefix and the cache keeps them for every visitor. |
| `cookie-consent.feature`: no analytics cookie is set before the visitor chooses | Google Analytics loads and sets its `_ga` cookies whatever the choice in the consent manager. |
| `robots-and-sitemap.feature`: sitemap.xml lists the main pages | The products, the blog, Services, About us, Contact and the privacy policy are not in the sitemap. |
| `metatags.feature`: a description and an Open Graph title on the main pages | The home page, Products, Services, Contact and the blog have no description; none of the eight main pages has `og:title`. |
| `accessibility.feature`: the WCAG 2.2 AA audit of axe | Every main page fails it: too little colour contrast on every page, images without alt text on all but the privacy policy, a code block the keyboard cannot scroll (documentation), links told apart by colour alone (privacy policy). |

## The steps it uses

The steps come from three places, in this order in `cucumber.js`:

1. **webship-js** (the built-in steps): opening pages; the web-first assertions that wait for their answer (`"<selector>" should be visible`, `should have text`, `should have a count of`, `should be in the viewport`, `should have attribute … with value …`), where the selector is CSS or a Playwright text selector (`"text='Data Collected'" should be visible`, `"title" should have text "Contact | Webship.co"`); the named-selector steps (`I see visible main menu`, `I don't see main menu`, `When I click on menu button`), whose names are in `tests/selectors/webship-co.json`; links and buttons by role (`When I click the "Docs" link`, `the "Products" link should be visible`); the `@mobile` and `@desktop` viewports; and the keyboard, modal, cookie, field, link, path, API (status codes, robots.txt, sitemap.xml) and accessibility (axe) steps.
2. **@webship-js/drupal-core-steps**, where it fits a visitor: they read what Drupal core states, whatever the theme.

   | Step | Why |
   | --- | --- |
   | `I should see the page title "…"` | The heading of the main region, as Drupal renders it. |
   | `I should be on the front page` | `drupalSettings.path.isFront`: the front page as Drupal sees it, not a URL. |
   | `"…" should be in the breadcrumb`, `the breadcrumb should contain "…"` | Drupal's breadcrumb landmark. |
   | `I should be on a "webblog" page` | The content type of the page. |
   | `I should be on the 404 page` | Drupal's "Page not found" page. |
   | `I should see an image with the "…" alt text` | A picture by its alternative text. |
   | `the "…" meta tag should be / contain / not be "…"`, `the page should have the canonical URL "…"` | The metatags and the canonical link. |
   | `the site generator should be "Drupal 11"`, `the core JavaScript settings should be initialized`, `the page should not have PHP errors` | The health of the page a visitor gets. |
   | `the page should be served from the page cache` | `X-Drupal-Cache: HIT`: a visitor gets a cached page. |
   | `I should not be on an admin page`, `I should not see the toolbar`, `I should not see the navigation sidebar`, `I should not see the local tasks` | A visitor sees no administration. |
   | `I should be denied access to "/admin"` | The administration is closed to a visitor. |
   | `the checkbox labeled "…" should be checked / unchecked` | The switches of the consent manager, by their label. |

   The steps of the pack that log in, create content or read the administration pages are not used: this suite is a visitor. `cucumber.js` gives the pack no `users`, and nothing needs one.
3. **This suite's own steps**, in `tests/step-definitions/visitor.steps.js`: `the field "…" should pass / fail the browser's validation` (the browser's own check of a value, nothing sent) and `the images in "…" should be loaded`. A hook there answers Google Analytics with an empty response, so a run is not counted in the site's analytics; a scenario tagged `@analytics` lets it load.

The scenarios follow the practice of the book *Automated Functional Testing Recipes*: visibility with the visible and hidden steps rather than `I should see` (which ignores letter case and reads hidden text); waits that end as soon as the page is ready, never a sleep; fields by their label; no comment at the end of a step line.

## Gentle with a live site

- One scenario at a time: no parallel workers, and no retry that would hide a failure behind a second visit.
- A fixed list of pages, no crawling; status codes, robots.txt and sitemap.xml are asked once each with a plain GET.
- A link is followed only once its address is checked, so the suite never opens an `/index%2Ephp/` address (see the known issues).
- No form is sent; Google Analytics is not loaded.
- The CI runs on a push or a pull request to `main`, by hand, and once a week; one run at a time.

## Reports

Each run writes `tests/reports/cucumber_report.json` (cucumber's JSON) and `tests/reports/cucumber_report.html`, the HTML report webship-js builds when the run ends. A failed step leaves a screenshot and the page's HTML in `tests/screenshots/`. `npm run generate-reports -- --format pdf` builds a PDF from the JSON report. The CI keeps the reports and screenshots of each run as an artifact.

## Scripts

| Script | What it does |
| --- | --- |
| `npm test` | The suite, without the known issues. |
| `npm run test:dry-run` | Undefined and ambiguous steps, without a browser. |
| `npm run test:known-issues` | Only the scenarios tagged `@known-issue`. |
| `npm run test:headed` | The suite in a visible browser. |
| `npm run generate-reports` | The HTML report from the JSON report, again (`--format pdf` or `all`). |

One feature: `npx cucumber-js tests/features/mobile-menu.feature`. One tag: `CUCUMBER_TAGS="@mobile and not @known-issue" npm test` (`CUCUMBER_TAGS` replaces the default expression).

## CI

The CI is [GitHub Actions](.github/workflows/github-actions.yml), the badge at the top of this page (and in the footer of webship.co). It runs on a push and on a pull request to `main`, by hand, and every Monday, one run at a time: `npm ci`, `npx playwright install --with-deps chromium`, `npm run test:dry-run` and `npm test`, with `SLOW_MO=0` (no pause between browser actions: nobody watches a CI run; locally the pause is 300 ms, 800 ms with `npm run test:headed`). The reports and the failure screenshots of each run stay 14 days as an artifact of the run.

## Learn more

- webship-js: [github.com/webship/webship-js](https://github.com/webship/webship-js) and the documentation at [webship.co/docs](https://webship.co/docs).
- @webship-js/drupal-core-steps: [github.com/webship/drupal-core-steps](https://github.com/webship/drupal-core-steps).
