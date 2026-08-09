local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "RobloxAppUpdate",
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}