import { Then } from '@cucumber/cucumber';

/**
* Verify, that current page header is working
* Example: Then I should have a working header
*/

Then(/^I should have a working header$/, function () {
  return browser.assert.haveWorkingHeader();
});

/**
* Verify, that current page footer is working
* Example: Then I should have a working footer
*/

Then(/^I should have a working footer$/, function () {
  return browser.assert.haveWorkingFooter();
});
