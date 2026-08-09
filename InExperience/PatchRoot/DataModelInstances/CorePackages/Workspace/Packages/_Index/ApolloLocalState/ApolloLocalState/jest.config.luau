local jestConfigsModule = require(script:FindFirstAncestor("ApolloLocalState").Parent.Dev.JestConfigs)

return {
	displayName = "ApolloLocalState",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}