local jestConfigsModule = require(script:FindFirstAncestor("SocialToast").Parent.Dev.JestConfigs)

return {
	displayName = "SocialToast",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}