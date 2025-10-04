const { defineConfig } = require('cypress')

module.exports = defineConfig({
  e2e: {
    setupNodeEvents(on, config) {
      // implement node event listeners here
    },
    baseUrl: 'http://localhost:3000', // adjust to your app's URL
    specPattern: 'cypress/e2e/**/*.cy.{js,jsx,ts,tsx}',
  },
})