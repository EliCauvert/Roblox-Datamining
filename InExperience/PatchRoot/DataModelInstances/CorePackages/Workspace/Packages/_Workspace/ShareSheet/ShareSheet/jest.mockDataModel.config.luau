local jestConfigsModule = require(script:FindFirstAncestor("ShareSheet").Parent.Dev.JestConfigs)

return {
	displayName = "ShareSheet-MockDataModel",
	mockDataModel = true,
	testMatch = { "**/telemetry/**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}