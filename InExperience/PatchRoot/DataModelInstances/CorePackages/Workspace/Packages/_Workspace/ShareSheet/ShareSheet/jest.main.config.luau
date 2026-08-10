local jestConfigsModule = require(script:FindFirstAncestor("ShareSheet").Parent.Dev.JestConfigs)

return {
	displayName = "ShareSheet",
	testMatch = { "**/*.test" },
	testPathIgnorePatterns = { "/telemetry/" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}