local jestConfigsModule = require(script:FindFirstAncestor("SocialModalsCommon").Parent.Dev.JestConfigs)

return {
	displayName = "SocialModalsCommon",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}