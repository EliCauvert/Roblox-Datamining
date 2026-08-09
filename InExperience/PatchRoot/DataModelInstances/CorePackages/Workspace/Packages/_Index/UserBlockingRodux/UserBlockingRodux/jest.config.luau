local jestConfigsModule = require(script:FindFirstAncestor("UserBlockingRodux").Parent.Dev.JestConfigs)

return {
	displayName = "UserBlockingRodux",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}