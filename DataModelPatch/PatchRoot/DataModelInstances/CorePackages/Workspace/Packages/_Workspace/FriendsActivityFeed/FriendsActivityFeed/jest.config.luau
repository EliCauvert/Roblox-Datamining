local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "FriendsActivityFeed",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}