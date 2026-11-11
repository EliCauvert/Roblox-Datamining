local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "PurchasePrompt",
	testMatch = { "**/*.test" },
	testPathIgnorePatterns = { "launchRobuxPackagePurchase" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler()
	},
	coveragePathIgnorePatterns = { "Localization/Locales/.*%.lua$" }
}