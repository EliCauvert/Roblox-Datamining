local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "PurchasePrompt-MockDataModel",
	mockDataModel = true,
	testMatch = { "**/launchRobuxPackagePurchase.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler()
	},
	coveragePathIgnorePatterns = { "Localization/Locales/.*%.lua$" }
}