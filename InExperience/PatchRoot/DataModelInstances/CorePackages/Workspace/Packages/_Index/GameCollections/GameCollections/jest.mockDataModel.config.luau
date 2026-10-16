local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "GameCollections-MockDataModel",
	mockDataModel = true,
	testMatch = { "**/SendGameImpressions.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}