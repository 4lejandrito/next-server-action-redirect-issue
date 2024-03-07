const { test, expect } = require("@playwright/test");

test("redirects on form submission", async ({ page }) => {
  await page.goto("https://localhost");
  await page.getByText("Redirect").click();
  await expect(page.getByText("Redirected successfully")).toBeVisible();
});
