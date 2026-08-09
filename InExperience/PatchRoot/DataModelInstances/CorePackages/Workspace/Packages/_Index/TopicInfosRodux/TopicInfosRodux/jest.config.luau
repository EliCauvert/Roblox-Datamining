local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "TopicInfosRodux",
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}