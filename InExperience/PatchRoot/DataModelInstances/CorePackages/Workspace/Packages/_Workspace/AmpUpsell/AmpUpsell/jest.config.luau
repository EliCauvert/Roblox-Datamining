local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "AmpUpsell",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}