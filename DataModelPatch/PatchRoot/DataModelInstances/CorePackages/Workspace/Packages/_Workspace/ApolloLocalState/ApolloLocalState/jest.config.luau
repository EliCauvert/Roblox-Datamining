local JestConfigsModule = require(script:FindFirstAncestor("ApolloLocalState").Parent.Dev.JestConfigs)

return {
	displayName = "ApolloLocalState",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}