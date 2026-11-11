local JestConfigsModule = require(script:FindFirstAncestor("AppChat").Parent.Dev.JestConfigs)

return {
	displayName = "AppChat",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		script.Parent.setupJest,
		script.Parent.setupLogger,
		JestConfigsModule.setupFiles.RetryTimes
	}
}