local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "UnifiedLogging",
	mockDataModel = true,
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}