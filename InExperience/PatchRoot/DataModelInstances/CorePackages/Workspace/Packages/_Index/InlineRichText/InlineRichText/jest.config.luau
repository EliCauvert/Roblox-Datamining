local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "InlineRichText",
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}