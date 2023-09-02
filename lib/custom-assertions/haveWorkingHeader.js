module.exports.assertion = function () {
  return browser.url(function(result){
    var savedUrl=result.value;
         browser .assert.textContains('header', "Services")
                .assert.textContains('header', "Documentation")
                .assert.textContains('header', "Blog")
                .smartClickLink("Services")
                .waitForElementPresent('body', 3000)
                .assert.textContains('.page-title', "Services")
                .url(savedUrl)
                .smartClickLink("Documentation")
                .waitForElementPresent('body', 3000)
                .assert.textContains('.page-title', "Documentation")
                .url(savedUrl);
    });
}