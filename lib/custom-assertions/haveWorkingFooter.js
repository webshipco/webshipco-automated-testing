exports.assertion = function () {
  this.message = 'Testing if the header contains the expected elements';
  this.expected = [
    "Contact",
    "About us",
    "Privacy",
    "© Copyright 2023 Webship",
    "Github",
    "Gitlab",
    "Bitbucket",
    "Twitter",
    "Linkedin",
    "Youtube"
  ];

  this.pass = function(value) {
    return value && this.expected.every(text => value.includes(text));
  };

  this.value = function(result) {
    return result.value;
  };

  this.command = function(callback) {
    const self = this;

    return this.api.url(function(currentUrl) {
      self.api
        .assert.textContains('footer', self.expected[0])
        .assert.textContains('footer', self.expected[1])
        .assert.textContains('footer', self.expected[2])
        .assert.textContains('footer', self.expected[3])
        .assert.textContains('footer', self.expected[4])
        .assert.textContains('footer', self.expected[5])
        .assert.textContains('footer', self.expected[6])
        .assert.textContains('footer', self.expected[7])
        .assert.textContains('footer', self.expected[8])
        .assert.textContains('footer', self.expected[9])
        .assert.textContains('footer', self.expected[10])
        .smartClickLink("Contact")
        .waitForElementPresent('body', 3000)
        .assert.textContains('.page-title', "Contact")
        .url(currentUrl.value)
        .smartClickLink("About us")
        .waitForElementPresent('body', 3000)
        .assert.textContains('.page-title', "About us")
        .url(currentUrl.value)
        .smartClickLink("Privacy")
        .waitForElementPresent('body', 3000)
        .assert.textContains('.page-title', "Privacy")
        .url(currentUrl.value, callback);
    });
  };
};