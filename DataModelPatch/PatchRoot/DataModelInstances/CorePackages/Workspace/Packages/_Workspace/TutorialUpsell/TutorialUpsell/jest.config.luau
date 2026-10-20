local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "TutorialUpsell",
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}