local jestConfigsModule = require(script:FindFirstAncestor("VirtualEventsState").Parent.Dev.JestConfigs)

return {
	displayName = "VirtualEventsState",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}