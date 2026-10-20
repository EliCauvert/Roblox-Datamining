local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "EditProfile",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		script.Parent.TestHelpers.collisionMatcherSetup,
		JestConfigsModule.setupFiles.RetryTimes
	}
}