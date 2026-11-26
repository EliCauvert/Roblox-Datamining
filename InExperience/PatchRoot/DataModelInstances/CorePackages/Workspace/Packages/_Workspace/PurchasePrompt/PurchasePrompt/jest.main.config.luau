local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "PurchasePrompt",
	testMatch = { "**/*.test" },
	testPathIgnorePatterns = {
		"launchRobuxPackagePurchase",
		"NativePurchaseFinishedConnector",
		"Network.getPlayerOwns.test",
		"ProductPurchaseContainerGameplayPaused",
		"ProductPurchaseContainerDidMount"
	},
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	},
	coveragePathIgnorePatterns = { "Localization/Locales/.*%.lua$" }
}