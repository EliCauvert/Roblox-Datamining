local JestConfigsModule = require(script:FindFirstAncestor("GraphQLServer").Parent.Dev.JestConfigs)

return {
	displayName = "GraphQlServer",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}