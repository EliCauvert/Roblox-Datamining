local JestConfigsModule = require(script:FindFirstAncestor("WhatsNew").Parent.Dev.JestConfigs)

return {
	displayName = "WhatsNew",
	testMatch = { "**/*.test" },
	testPathIgnorePatterns = { "/storage/" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}