local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "SduiSharedUtilities-MockDataModel",
	mockDataModel = true,
	testMatch = {
		"**/SduiPageAnalytics.test",
		"**/createSduiApiStore.test"
	},
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}