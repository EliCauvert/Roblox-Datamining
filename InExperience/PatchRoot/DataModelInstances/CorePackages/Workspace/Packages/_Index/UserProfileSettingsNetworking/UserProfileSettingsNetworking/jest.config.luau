local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "UserProfileSettingsNetworking",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}