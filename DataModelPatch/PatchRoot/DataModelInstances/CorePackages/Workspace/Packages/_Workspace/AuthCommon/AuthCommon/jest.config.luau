local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "AuthCommon",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.ErrorLogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}