local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "MediaPlayback",
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}