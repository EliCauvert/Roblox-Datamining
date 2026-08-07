local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "HttpSignals",
	mockDataModel = true,
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}