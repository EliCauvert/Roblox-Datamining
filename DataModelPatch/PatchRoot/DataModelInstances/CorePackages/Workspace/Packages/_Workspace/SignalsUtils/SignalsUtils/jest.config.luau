local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	mockDataModel = true,
	displayName = "SignalsUtils",
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}