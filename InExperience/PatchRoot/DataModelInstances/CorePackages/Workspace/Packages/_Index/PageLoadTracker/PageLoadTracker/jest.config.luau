local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "PageLoadTracker",
	mockDataModel = true,
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}