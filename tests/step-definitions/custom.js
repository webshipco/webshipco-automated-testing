const {Given} = require('@cucumber/cucumber');
const {When, Before} = require('@cucumber/cucumber');
const {Then} = require('@cucumber/cucumber');

/**
* Verify, that current page path is equal to specified
* Example: Then I should be on "/"
* Example: And I should be on "/user/login"
* Example: And I should be on "http://google.com"
*
* @Then /^I should be on "([^"]*)?"$/
*/
Then(/^I should have a working header$/, function () {
  return browser.smartTestHeader();
});

Then(/^I should have a working footer$/, function () {
  return browser.smartTestFooter();
});
