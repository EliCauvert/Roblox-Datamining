local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "Screentime",
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}