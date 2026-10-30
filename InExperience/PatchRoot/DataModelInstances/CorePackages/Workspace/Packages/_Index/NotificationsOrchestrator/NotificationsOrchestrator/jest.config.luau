local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "NotificationsOrchestrator",
	mockDataModel = true,
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}