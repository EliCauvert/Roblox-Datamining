local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "PurchasePrompt-MockDataModel",
	mockDataModel = true,
	testMatch = {
		"**/launchRobuxPackagePurchase.test",
		"**/NativePurchaseFinishedConnector.test",
		"**/NativePurchaseFinishedConnectorFlagOff.test"
	},
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	},
	coveragePathIgnorePatterns = { "Localization/Locales/.*%.lua$" }
}