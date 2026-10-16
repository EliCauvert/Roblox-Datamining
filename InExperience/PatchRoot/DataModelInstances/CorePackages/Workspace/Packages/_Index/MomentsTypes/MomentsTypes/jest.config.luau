local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "MomentsTypes",
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}