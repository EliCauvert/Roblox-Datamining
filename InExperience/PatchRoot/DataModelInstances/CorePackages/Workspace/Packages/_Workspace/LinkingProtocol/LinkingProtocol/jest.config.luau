local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "LinkingProtocolJest3",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}