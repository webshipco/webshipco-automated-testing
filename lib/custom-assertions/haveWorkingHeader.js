module.exports.assertion = function () {
  return browser.url(function(currentUrl) {
    browser.assert.textContains('header', "Services")
      .assert.textContains('header', "Documentation")
      .assert.textContains('header', "Blog")
      .smartClickLink("Services")
      .waitForElementPresent('body', 3000)
      .assert.textContains('.page-title', "Services")
      .url(currentUrl.value)
      .smartClickLink("Documentation")
      .waitForElementPresent('body', 3000)
      .assert.textContains('.page-title', "Documentation")
      .url(currentUrl.value);
    });
}