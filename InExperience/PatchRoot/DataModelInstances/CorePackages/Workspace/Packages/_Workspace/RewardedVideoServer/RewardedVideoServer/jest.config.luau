local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "RewardedVideoServer",
	mockDataModel = true,
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	},
	testMatch = { "**/*.test" }
}