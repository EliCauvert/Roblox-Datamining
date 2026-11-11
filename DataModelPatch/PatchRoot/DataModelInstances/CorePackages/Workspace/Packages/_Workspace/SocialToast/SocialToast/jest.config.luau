local JestConfigsModule = require(script:FindFirstAncestor("SocialToast").Parent.Dev.JestConfigs)

return {
	displayName = "SocialToast",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}