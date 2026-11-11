local JestConfigsModule = require(script:FindFirstAncestor("VirtualEventsState").Parent.Dev.JestConfigs)

return {
	displayName = "VirtualEventsState",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}