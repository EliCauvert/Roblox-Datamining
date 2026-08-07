local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "SocialContextToasts",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}