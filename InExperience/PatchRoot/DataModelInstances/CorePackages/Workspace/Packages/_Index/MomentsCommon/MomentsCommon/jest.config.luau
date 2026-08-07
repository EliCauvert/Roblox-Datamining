local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "MomentsCommon",
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}