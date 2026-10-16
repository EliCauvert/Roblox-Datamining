local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "HomeStore",
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}