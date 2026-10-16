local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	mockDataModel = true,
	displayName = "IsLocalUserSoothsayerStore",
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}