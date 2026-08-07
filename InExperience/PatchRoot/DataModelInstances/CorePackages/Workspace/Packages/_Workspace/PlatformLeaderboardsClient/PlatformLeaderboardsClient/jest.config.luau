local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "PlatformLeaderboardsClient",
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}