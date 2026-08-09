local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "ExpChat",
	mockDataModel = false,
	testMatch = { "**/*.test" },
	testPathIgnorePatterns = { "GetChatModerationStore", "GetUserChatSettingsStore" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		script.Parent.setupJest
	}
}