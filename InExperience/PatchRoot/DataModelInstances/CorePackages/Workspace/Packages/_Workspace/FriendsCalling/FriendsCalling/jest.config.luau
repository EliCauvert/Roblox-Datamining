local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "FriendsCalling",
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}