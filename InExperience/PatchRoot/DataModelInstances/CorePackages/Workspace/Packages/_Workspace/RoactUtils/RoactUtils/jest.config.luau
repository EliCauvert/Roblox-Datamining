local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "RoactUtils",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}