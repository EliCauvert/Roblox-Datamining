_G.__TESTEZ_RUNNING_TEST__ = true
local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "FocusNavigationUtils",
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}