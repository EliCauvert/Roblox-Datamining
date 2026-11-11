local JestConfigsModule = require(script:FindFirstAncestor("SocialModalsCommon").Parent.Dev.JestConfigs)

return {
	displayName = "SocialModalsCommon",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}