local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "PurchasePrompt-MockDataModel",
	mockDataModel = true,
	testMatch = {
		"**/launchRobuxPackagePurchase.test",
		"**/NativePurchaseFinishedConnector.test",
		"**/NativePurchaseFinishedConnectorFlagOff.test",
		"**/Network.getPlayerOwns.test"
	},
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	},
	coveragePathIgnorePatterns = { "Localization/Locales/.*%.lua$" }
}