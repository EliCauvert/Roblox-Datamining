local JestConfigsModule = require(game:GetService("CorePackages").Workspace.Packages.JestConfigs)
_G.__TESTEZ_RUNNING_TEST__ = true

return {
	displayName = "Settings",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(10, 10),
		JestConfigsModule.setupFiles.RetryTimes
	}
}