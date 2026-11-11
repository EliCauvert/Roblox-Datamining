local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "LegallySensitiveContent",
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}