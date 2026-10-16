local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "UserCtaCommon",
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}