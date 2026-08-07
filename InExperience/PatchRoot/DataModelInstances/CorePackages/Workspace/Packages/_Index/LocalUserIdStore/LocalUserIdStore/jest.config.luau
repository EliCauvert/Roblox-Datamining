local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "LocalUserIdStore",
	mockDataModel = true,
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}