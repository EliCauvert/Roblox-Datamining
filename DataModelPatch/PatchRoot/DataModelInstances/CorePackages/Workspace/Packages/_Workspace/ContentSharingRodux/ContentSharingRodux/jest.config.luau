local JestConfigsModule = require(script:FindFirstAncestor("ContentSharingRodux").Parent.Dev.JestConfigs)

return {
	displayName = "ContentSharingRodux",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}