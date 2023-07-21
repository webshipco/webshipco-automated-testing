const {Given} = require('@cucumber/cucumber');
const {When, Before} = require('@cucumber/cucumber');
const {Then} = require('@cucumber/cucumber');

/**
* Verify, that current page header is working
* Example: Then I should have a working header
*/

Then(/^I should have a working header$/, function () {
   browser.smartTestHeader();
});

/**
* Verify, that current page footer is working
* Example: Then I should have a working footer
*/

Then(/^I should have a working footer$/, function () {
   browser.smartTestFooter();
});
