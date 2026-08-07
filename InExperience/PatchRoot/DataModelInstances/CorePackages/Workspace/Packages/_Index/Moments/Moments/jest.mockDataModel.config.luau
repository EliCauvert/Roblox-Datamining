local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "Moments-MockDataModel",
	mockDataModel = true,
	testMatch = { "**/Analytics/**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}