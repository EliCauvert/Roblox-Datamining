local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "PurchasePrompt",
	testMatch = { "**/*.test" },
	testPathIgnorePatterns = { "launchRobuxPackagePurchase" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	},
	coveragePathIgnorePatterns = { "Localization/Locales/.*%.lua$" }
}