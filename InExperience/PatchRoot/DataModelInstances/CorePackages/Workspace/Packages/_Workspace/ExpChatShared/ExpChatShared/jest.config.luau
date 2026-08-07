local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "ExpChatShared",
	mockDataModel = true,
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}