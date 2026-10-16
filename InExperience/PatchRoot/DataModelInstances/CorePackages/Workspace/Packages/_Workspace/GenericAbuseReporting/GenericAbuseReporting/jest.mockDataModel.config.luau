local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "GenericAbuseReporting-MockDataModel",
	mockDataModel = true,
	testMatch = { "**/analyticsService.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.ErrorLogHandler,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}