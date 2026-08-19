local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "PageGate",
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}