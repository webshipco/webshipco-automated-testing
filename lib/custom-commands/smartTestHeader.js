module.exports.command = function () {
  return browser.url('{URL}')
                .assert.textContains('header', "Contact")
                .assert.textContains('header', "About us")
                .assert.textContains('header', "Privacy")
                .smartClickLink("Contact")
                .waitForElementPresent('body', 3000)
                .assert.textContains('page-title', "Contact")
                .back()
                .smartClickLink("About us")
                .waitForElementPresent('body', 3000)
                .assert.textContains('page-title', "About us")
                .back()
                .smartClickLink("Blog")
                .waitForElementPresent('body', 3000)
                .assert.textContains('page-title', "Privacy")
                .back();

}