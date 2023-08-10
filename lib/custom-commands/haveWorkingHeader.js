module.exports.command = function () {
  return browser.url()
                .assert.textContains('header', "Services")
                .assert.textContains('header', "Documentation")
                .assert.textContains('header', "Blog")
                .smartClickLink("Services")
                .waitForElementPresent('body', 3000)
                .assert.textContains('.page-title', "Services")
                .url('{URL}')
                .smartClickLink("Documentation")
                .waitForElementPresent('body', 3000)
                .assert.textContains('.page-title', "Documentation")
                .url('{URL}');

}