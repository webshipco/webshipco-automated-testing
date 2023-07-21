module.exports.command = function () {
  return browser.url('{URL}')
                .assert.textContains('footer', "Services")
                .assert.textContains('footer', "Documentation")
                .assert.textContains('footer', "Blog")
                .assert.textContains('footer', "© Copyright 2023 Webship")
                .assert.textContains('footer', "Github")
                .assert.textContains('footer', "Gitlab")
                .assert.textContains('footer', "Bitbucket")
                .assert.textContains('footer', "Twitter")
                .assert.textContains('footer', "Linkedin")
                .assert.textContains('footer', "Youtube")
                .smartClickLink("Services")
                .waitForElementPresent('body', 3000)
                .assert.textContains('page-title', "Services")
                .back()
                .smartClickLink("Documentation")
                .waitForElementPresent('body', 3000)
                .assert.textContains('page-title', "Documentation")
                .back()
                .smartClickLink("Blog")
                .waitForElementPresent('body', 3000)
                .assert.textContains('page-title', "Blog")
                .back();


}