const {Then} = require('@cucumber/cucumber');

/**
* Verify, that current page header is working
* Example: Then I should have a working header
*/

Then(/^I should have a working header$/, function () {
  return this.shouldSee = function (browser) {
    browser.assert.textContains('header', "Services")
      .assert.textContains('header', "Docs")
      .assert.textContains('header', "Blog")
      .smartClickLink("Services")
      .waitForElementPresent('body', 3000)
      .assert.textContains('.page-title', "Services")
      .url(currentUrl.value)
      .smartClickLink("Docs")
      .waitForElementPresent('body', 3000)
      .assert.textContains('.page-title', "Docs")
      .url(currentUrl.value);
  };
}); 

Then(/^I should have a working footer$/, function () {
  return this.shouldSee = function (browser) {
    browser.assert.textContains('footer', "Contact")
      .assert.textContains('footer', "About us")
      .assert.textContains('footer', "Privacy")
      .assert.textContains('footer', "© Copyright 2023 Webship")
      .assert.textContains('footer', "Github")
      .assert.textContains('footer', "Gitlab")
      .assert.textContains('footer', "Bitbucket")
      .assert.textContains('footer', "Twitter")
      .assert.textContains('footer', "Linkedin")
      .assert.textContains('footer', "Youtube")
      .smartClickLink("Contact")
      .waitForElementPresent('body', 3000)
      .assert.textContains('.page-title', "Contact")
      .url(currentUrl.value)
      .smartClickLink("About us")
      .waitForElementPresent('body', 3000)
      .assert.textContains('.page-title', "About us")
      .url(currentUrl.value)
      .smartClickLink("Privacy")
      .waitForElementPresent('body', 3000)
      .assert.textContains('.page-title', "Privacy")
      .url(currentUrl.value);
  };
});

