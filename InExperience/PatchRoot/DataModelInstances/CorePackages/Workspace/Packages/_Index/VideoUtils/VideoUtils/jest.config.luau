local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "VideoUtils",
	mockDataModel = true,
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}