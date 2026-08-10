local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "InExperienceSessionization",
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.ErrorLogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}