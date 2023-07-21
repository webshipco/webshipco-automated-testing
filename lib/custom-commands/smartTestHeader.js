module.exports.command = function () {
  return browser.url('{URL}')
        .browser.assert.textContains('header', "Contact")
        .browser.assert.textContains('header', "About us")
        .browser.assert.textContains('header', "Privacy")
        .browser.smartClickLink("Contact")
        .browser.waitForElementPresent('body', 3000)
        .browser.assert.textContains('page-title', "Contact")
        .browser.back()
        .browser.smartClickLink("About us")
        .browser.waitForElementPresent('body', 3000)
        .browser.assert.textContains('page-title', "About us")
        .browser.back()
        .browser.smartClickLink("Blog")
        .browser.waitForElementPresent('body', 3000)
        .browser.assert.textContains('page-title', "Privacy")
        .browser.back();

}