local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "TextChannelWindow",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}