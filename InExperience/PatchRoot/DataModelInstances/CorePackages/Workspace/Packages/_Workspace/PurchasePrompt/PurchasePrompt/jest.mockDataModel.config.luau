local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "PurchasePrompt-MockDataModel",
	mockDataModel = true,
	testMatch = { "**/launchRobuxPackagePurchase.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	},
	coveragePathIgnorePatterns = { "Localization/Locales/.*%.lua$" }
}