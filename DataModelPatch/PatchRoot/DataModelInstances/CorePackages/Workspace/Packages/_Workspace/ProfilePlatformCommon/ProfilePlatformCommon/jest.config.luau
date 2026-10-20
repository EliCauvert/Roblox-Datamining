local JestConfigsModule = require(script:FindFirstAncestor("ProfilePlatformCommon").Parent.Dev.JestConfigs)

return {
	displayName = "ProfilePlatformCommon",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}