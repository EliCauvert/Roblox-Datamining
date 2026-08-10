local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "Style",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.RetryTimes
	}
}