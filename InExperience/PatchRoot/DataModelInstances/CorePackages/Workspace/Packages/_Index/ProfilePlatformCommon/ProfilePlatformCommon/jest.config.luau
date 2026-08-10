local jestConfigsModule = require(script:FindFirstAncestor("ProfilePlatformCommon").Parent.Dev.JestConfigs)

return {
	displayName = "ProfilePlatformCommon",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}