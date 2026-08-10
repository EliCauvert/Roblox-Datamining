local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "EditProfileBackground",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		script.Parent.TestHelpers.collisionMatcherSetup,
		jestConfigsModule.setupFiles.RetryTimes
	}
}