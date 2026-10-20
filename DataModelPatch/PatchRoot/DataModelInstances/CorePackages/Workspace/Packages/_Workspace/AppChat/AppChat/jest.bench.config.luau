local AppChat = script:FindFirstAncestor("AppChat")
local JestConfigsModule = require(AppChat.Parent.Dev.JestConfigs)

return JestConfigsModule.createBenchmarkConfig("AppChatBenchmarks", {
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		AppChat.setupJest,
		AppChat.setupLogger
	}
})