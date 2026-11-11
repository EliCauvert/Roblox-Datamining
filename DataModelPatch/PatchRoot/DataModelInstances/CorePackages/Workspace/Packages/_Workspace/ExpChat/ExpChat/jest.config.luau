local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "ExpChat",
	mockDataModel = false,
	testMatch = { "**/*.test" },
	testPathIgnorePatterns = { "GetChatModerationStore", "GetUserChatSettingsStore" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes,
		script.Parent.setupJest
	}
}