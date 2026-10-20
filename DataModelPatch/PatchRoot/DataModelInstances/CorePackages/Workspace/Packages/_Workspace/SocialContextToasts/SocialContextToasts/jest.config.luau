local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "SocialContextToasts",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}