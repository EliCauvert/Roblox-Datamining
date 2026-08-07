local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "OnPlatformSurveys",
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}