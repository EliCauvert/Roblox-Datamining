local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "RobloxSubscriptionPurchaseApp",
	mockDataModel = true,
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}