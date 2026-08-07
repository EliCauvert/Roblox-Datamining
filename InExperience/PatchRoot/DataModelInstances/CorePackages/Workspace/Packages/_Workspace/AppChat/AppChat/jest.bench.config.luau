local appChat = script:FindFirstAncestor("AppChat")
local jestConfigsModule = require(appChat.Parent.Dev.JestConfigs)

return jestConfigsModule.createBenchmarkConfig("AppChatBenchmarks", {
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		appChat.setupJest,
		appChat.setupLogger
	}
})