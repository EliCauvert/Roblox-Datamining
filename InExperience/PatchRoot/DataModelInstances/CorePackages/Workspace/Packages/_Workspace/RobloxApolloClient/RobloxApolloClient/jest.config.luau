local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "RobloxApolloClient",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}