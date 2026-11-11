local JestConfigsModule = require(script:FindFirstAncestor("UserBlockingRodux").Parent.Dev.JestConfigs)

return {
	displayName = "UserBlockingRodux",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}