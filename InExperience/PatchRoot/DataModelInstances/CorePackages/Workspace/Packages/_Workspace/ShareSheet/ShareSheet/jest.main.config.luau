local JestConfigsModule = require(script:FindFirstAncestor("ShareSheet").Parent.Dev.JestConfigs)

return {
	displayName = "ShareSheet",
	testMatch = { "**/*.test" },
	testPathIgnorePatterns = { "/telemetry/" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}