local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "GenericAbuseReporting-MockDataModel",
	mockDataModel = true,
	testMatch = { "**/analyticsService.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.ErrorLogHandler,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}