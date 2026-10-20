local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "LinkingProtocolJest3",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}