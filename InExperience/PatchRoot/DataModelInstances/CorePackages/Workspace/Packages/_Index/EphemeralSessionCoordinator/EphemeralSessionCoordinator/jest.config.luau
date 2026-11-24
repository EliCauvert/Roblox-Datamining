local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "EphemeralSessionCoordinator",
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}