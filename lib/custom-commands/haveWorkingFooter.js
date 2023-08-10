module.exports.assertion = function () {
  return browser.url(function(result){
   var savedUrl=result.value;
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
                .url(savedUrl)
                .smartClickLink("About us")
                .waitForElementPresent('body', 3000)
                .assert.textContains('.page-title', "About us")
                .url(savedUrl)
                .smartClickLink("Privacy")
                .waitForElementPresent('body', 3000)
                .assert.textContains('.page-title', "Privacy")
                .url(savedUrl);
  });
}