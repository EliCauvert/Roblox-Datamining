_G.__TESTEZ_RUNNING_TEST__ = true
local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "ExperimentCacheManager",
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}