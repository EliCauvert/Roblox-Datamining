local jestConfigsModule = require(script:FindFirstAncestor("VirtualEvents").Parent.Dev.JestConfigs)

return {
	displayName = "VirtualEvents",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}