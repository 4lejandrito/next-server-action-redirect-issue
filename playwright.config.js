const { defineConfig, devices } = require("@playwright/test");

module.exports = defineConfig({
  testDir: "./tests",
  use: {
    ignoreHTTPSErrors: true,
  },
});
