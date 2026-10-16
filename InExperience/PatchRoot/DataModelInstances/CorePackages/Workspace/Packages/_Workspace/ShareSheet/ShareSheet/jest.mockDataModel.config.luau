local JestConfigsModule = require(script:FindFirstAncestor("ShareSheet").Parent.Dev.JestConfigs)

return {
	displayName = "ShareSheet-MockDataModel",
	mockDataModel = true,
	testMatch = { "**/telemetry/**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}