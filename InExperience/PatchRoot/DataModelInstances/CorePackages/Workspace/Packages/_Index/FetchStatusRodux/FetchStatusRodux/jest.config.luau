local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "FetchStatusRodux",
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}