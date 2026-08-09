local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "NotificationModalsManager",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}