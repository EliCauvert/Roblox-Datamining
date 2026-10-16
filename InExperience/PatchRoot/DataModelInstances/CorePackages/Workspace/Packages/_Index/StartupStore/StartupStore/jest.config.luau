local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	mockDataModel = true,
	displayName = "StartupStore",
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}