local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "CoreScriptsRoactCommon-MockDataModel",
	mockDataModel = true,
	testMatch = { "**/GetPlaytestModeStore/**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}