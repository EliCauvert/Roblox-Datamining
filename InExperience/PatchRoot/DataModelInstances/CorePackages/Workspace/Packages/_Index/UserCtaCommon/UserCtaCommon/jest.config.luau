local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "UserCtaCommon",
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}