local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "VirtualCursor",
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}