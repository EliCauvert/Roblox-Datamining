local JestConfigsModule = require(script:FindFirstAncestor("UserProfiles").Parent.Dev.JestConfigs)

return {
	displayName = "UserProfiles",
	testMatch = { "**/*.test", "!**/Stores/**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}