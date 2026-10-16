local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "DsaIllegalContentReporting",
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}