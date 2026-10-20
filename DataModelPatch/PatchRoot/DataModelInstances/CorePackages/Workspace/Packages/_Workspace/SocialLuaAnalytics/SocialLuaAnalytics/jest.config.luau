local JestConfigsModule = require(script:FindFirstAncestor("SocialLuaAnalytics").Parent.Dev.JestConfigs)

return {
	displayName = "SocialLuaAnalytics",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}