module.exports.command = function () {
  return browser.url()
                .assert.textContains('header', "Services")
                .assert.textContains('header', "Documentation")
                .assert.textContains('header', "Blog")
                .smartClickLink("Services")
                .waitForElementPresent('body', 6000)
                .assert.textContains('.page-title', "Services")
                .back()
                .smartClickLink("Documentation")
                .waitForElementPresent('body', 6000)
                .assert.textContains('.page-title', "Documentation")
                .back()

}