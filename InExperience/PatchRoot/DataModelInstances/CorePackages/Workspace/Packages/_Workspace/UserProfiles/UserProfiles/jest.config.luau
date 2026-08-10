local jestConfigsModule = require(script:FindFirstAncestor("UserProfiles").Parent.Dev.JestConfigs)

return {
	displayName = "UserProfiles",
	testMatch = { "**/*.test", "!**/Stores/**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}