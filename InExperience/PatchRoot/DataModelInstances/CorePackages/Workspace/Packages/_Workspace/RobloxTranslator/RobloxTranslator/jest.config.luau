local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "RobloxTranslator",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(10, 10),
		JestConfigsModule.setupFiles.RetryTimes
	}
}