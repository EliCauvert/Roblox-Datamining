local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "RobloxAppToastsRodux",
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}