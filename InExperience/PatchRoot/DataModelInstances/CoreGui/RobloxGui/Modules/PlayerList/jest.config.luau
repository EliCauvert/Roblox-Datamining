local JestConfigsModule = require(game:GetService("CorePackages").Workspace.Packages.JestConfigs)
_G.__TESTEZ_RUNNING_TEST__ = true

return {
	displayName = "PlayerList",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		script.Parent.TestHelpers.JestSetupDummyInstances,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(10, 10),
		JestConfigsModule.setupFiles.RetryTimes
	}
}