local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "ChatMute",
	mockDataModel = true,
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}