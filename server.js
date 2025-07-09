const puppeteer = require('puppeteer');

(async () => {
    const browser = await puppeteer.launch({
        headless: true,
        args: ['--no-sandbox']
    });
    const page = await browser.newPage();
    await page.goto('http://localhost:8080', { waitUntil: 'networkidle0' });
    await page.screenshot({ path: '/output/screenshot.png' });
    await browser.close();
    console.log("Screenshot saved to /output/screenshot.png");
})();
// This script uses Puppeteer to take a screenshot of a web page.
// It launches a headless browser, navigates to the specified URL, and saves a screenshot   