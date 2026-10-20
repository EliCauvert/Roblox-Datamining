local JestConfigsModule = require(script:FindFirstAncestor("WhatsNew").Parent.Dev.JestConfigs)

return {
	displayName = "WhatsNew-MockDataModel",
	mockDataModel = true,
	testMatch = { "**/storage/**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}