local jestConfigsModule = require(script:FindFirstAncestor("AppChat").Parent.Dev.JestConfigs)

return {
	displayName = "AppChat",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		script.Parent.setupJest,
		script.Parent.setupLogger,
		jestConfigsModule.setupFiles.RetryTimes
	}
}