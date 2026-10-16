local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "Moments-MockDataModel",
	mockDataModel = true,
	testMatch = {
		"**/Analytics/**/*.test",
		"**/Upload/postLifecycleSubscription.test"
	},
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}