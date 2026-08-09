local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "SelfieQr",
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}