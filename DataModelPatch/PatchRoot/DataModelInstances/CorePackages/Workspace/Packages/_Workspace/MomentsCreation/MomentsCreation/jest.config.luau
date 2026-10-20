local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "MomentsCreation",
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}