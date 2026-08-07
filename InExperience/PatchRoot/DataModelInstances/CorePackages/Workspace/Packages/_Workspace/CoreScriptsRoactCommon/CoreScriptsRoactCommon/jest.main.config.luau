local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "CoreScriptsRoactCommon",
	testMatch = { "**/*.test" },
	testPathIgnorePatterns = { "/GetPlaytestModeStore/" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}