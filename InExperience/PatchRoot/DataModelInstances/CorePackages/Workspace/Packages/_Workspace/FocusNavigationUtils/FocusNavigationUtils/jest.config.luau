_G.__TESTEZ_RUNNING_TEST__ = true
local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "FocusNavigationUtils",
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}