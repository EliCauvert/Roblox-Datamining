local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "ExpChat-MockDataModel",
	mockDataModel = true,
	testMatch = {
		"**/GetChatModerationStore/**/*.test",
		"**/GetUserChatSettingsStore/**/*.test"
	},
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}