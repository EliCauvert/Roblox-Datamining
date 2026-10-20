local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "AdGuiInteractivity",
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}