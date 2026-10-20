local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "PeekView",
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}