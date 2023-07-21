module.exports.command = function (url) {
  return browser.url(browser.launch_url + url)
                .browser.assert.textContains('footer', "Services")
                .browser.assert.textContains('footer', "Documentation")
                .browser.assert.textContains('footer', "Blog")
                .browser.assert.textContains('footer', "© Copyright 2023 Webship")
                .browser.assert.textContains('footer', "Github")
                .browser.assert.textContains('footer', "Gitlab")
                .browser.assert.textContains('footer', "Bitbucket")
                .browser.assert.textContains('footer', "Twitter")
                .browser.assert.textContains('footer', "Linkedin")
                .browser.assert.textContains('footer', "Youtube")
                .browser.smartClickLink("Services")
                .browser.waitForElementPresent('body', 3000)
                .browser.assert.textContains('page-title', "Services")
                .browser.back()
                .browser.smartClickLink("Documentation")
                .browser.waitForElementPresent('body', 3000)
                .browser.assert.textContains('page-title', "Documentation")
                .browser.back()
                .browser.smartClickLink("Blog")
                .browser.waitForElementPresent('body', 3000)
                .browser.assert.textContains('page-title', "Blog")
                .browser.back();


}