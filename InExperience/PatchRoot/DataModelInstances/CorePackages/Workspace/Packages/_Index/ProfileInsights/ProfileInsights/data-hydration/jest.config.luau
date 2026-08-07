local jestConfigsModule = require(script.Parent.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "ProfileInsightsDataHydration",
	mockDataModel = true,
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}