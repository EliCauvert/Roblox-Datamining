local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	mockDataModel = true,
	displayName = "IsLocalUserSoothsayerStore",
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}