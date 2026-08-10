local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "GameHydrationReact",
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}