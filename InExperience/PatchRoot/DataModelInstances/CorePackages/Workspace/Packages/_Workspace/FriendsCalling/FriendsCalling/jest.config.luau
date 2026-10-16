local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "FriendsCalling",
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}