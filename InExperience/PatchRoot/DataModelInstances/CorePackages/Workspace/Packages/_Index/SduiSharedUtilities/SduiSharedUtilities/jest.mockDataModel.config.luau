local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "SduiSharedUtilities-MockDataModel",
	mockDataModel = true,
	testMatch = {
		"**/SduiPageAnalytics.test",
		"**/createSduiApiStore.test"
	},
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}