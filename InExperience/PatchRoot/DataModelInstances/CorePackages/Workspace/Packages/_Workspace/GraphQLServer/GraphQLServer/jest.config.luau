local jestConfigsModule = require(script:FindFirstAncestor("GraphQLServer").Parent.Dev.JestConfigs)

return {
	displayName = "GraphQlServer",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}