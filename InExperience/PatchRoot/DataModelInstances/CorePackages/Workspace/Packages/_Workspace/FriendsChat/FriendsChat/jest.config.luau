local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "FriendsChat",
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}