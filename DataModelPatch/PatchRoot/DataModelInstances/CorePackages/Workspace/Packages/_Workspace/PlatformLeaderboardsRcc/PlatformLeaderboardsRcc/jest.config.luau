local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "PlatformLeaderboardsRcc",
	mockDataModel = true,
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}