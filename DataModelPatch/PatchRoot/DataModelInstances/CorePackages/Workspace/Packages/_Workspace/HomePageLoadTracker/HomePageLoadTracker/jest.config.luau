local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "HomePageLoadTracker",
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}