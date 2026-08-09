local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "LegallySensitiveContent",
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}