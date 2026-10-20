local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "Style",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.RetryTimes
	}
}