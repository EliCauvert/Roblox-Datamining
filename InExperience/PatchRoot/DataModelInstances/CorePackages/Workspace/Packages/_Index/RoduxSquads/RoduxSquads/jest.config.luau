local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "RoduxSquads",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}