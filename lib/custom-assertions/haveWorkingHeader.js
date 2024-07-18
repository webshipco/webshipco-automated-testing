exports.assertion = function () {
  this.message = 'Testing if the header contains the expected elements';
  this.expected = [
    "Services",
    "Docs",
    "Blog"
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
        .assert.textContains('header', self.expected[0])
        .assert.textContains('header', self.expected[1])
        .assert.textContains('header', self.expected[2])
        .smartClickLink("Services")
        .waitForElementPresent('body', 3000)
        .assert.textContains('.page-title', "Services")
        .url(currentUrl.value)
        .smartClickLink("Docs")
        .waitForElementPresent('body', 3000)
        .assert.textContains('.page-title', "Docs")
        .url(currentUrl.value, callback);
    });
  };
};