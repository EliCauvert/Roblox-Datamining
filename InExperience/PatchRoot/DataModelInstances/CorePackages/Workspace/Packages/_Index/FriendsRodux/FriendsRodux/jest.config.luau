local jestConfigsModule = require(script:FindFirstAncestor("FriendsRodux").Parent.Dev.JestConfigs)

return {
	displayName = "FriendsRodux",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}