local JestConfigsModule = require(script:FindFirstAncestor("FriendsRodux").Parent.Dev.JestConfigs)

return {
	displayName = "FriendsRodux",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}