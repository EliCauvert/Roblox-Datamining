local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "ServerTriggeredModals",
	mockDataModel = true,
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}