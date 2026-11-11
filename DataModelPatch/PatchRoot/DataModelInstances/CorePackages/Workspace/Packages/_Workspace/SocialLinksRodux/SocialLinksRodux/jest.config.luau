local JestConfigsModule = require(script:FindFirstAncestor("SocialLinksRodux").Parent.Dev.JestConfigs)

return {
	displayName = "SocialLinksRodux",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}