local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "NextDataExpirationTimeRodux",
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}