const { Builder, By, Key, until } = require('selenium-webdriver');
const chrome = require('selenium-webdriver/chrome');

async function runTest() {
    let driver = await new Builder()
        .forBrowser('chrome')
        .setChromeOptions(new chrome.Options().headless())
        .build();
    try {
        await driver.get('https://www.example.com');
        // Your test steps here
    } finally {
        await driver.quit();
    }
}

runTest();