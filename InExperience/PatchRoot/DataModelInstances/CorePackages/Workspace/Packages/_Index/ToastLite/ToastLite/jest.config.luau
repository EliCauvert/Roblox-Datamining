local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "ToastLite",
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}