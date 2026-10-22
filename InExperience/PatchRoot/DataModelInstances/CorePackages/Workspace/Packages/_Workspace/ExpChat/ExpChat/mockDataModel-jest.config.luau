local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "ExpChat-MockDataModel",
	mockDataModel = true,
	testMatch = {
		"**/GetChatModerationStore/**/*.test",
		"**/GetUserChatSettingsStore/**/*.test",
		"**/useDictationAudioPipeline.test"
	},
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}