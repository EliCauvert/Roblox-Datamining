local JestConfigsModule = require(script:FindFirstAncestor("VirtualEvents").Parent.Dev.JestConfigs)

return {
	displayName = "VirtualEvents",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}