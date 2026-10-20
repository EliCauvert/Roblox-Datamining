local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "Screentime",
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}