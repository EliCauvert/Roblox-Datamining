local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "UserBlockingNetworking",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}