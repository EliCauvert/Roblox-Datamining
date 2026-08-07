local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "ProfilePlatform",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes,
		script.Parent.TestHelpers.collisionMatcherSetup
	}
}