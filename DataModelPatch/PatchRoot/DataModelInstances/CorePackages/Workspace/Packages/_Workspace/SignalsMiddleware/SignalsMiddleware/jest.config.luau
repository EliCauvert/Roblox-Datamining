local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "SignalsMiddleware",
	mockDataModel = true,
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}