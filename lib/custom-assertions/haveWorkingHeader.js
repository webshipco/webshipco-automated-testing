export default function assertion () {
  return browser.url(function(currentUrl) {
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
    });
}