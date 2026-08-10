local jestConfigsModule = require(script:FindFirstAncestor("SocialLuaAnalytics").Parent.Dev.JestConfigs)

return {
	displayName = "SocialLuaAnalytics",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}