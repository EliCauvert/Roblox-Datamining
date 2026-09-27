local jestConfigsModule = require(game:GetService("CorePackages").Workspace.Packages.JestConfigs)
_G.__TESTEZ_RUNNING_TEST__ = true

return {
	displayName = "PlayerList",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		script.Parent.TestHelpers.JestSetupDummyInstances,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(10, 10),
		jestConfigsModule.setupFiles.RetryTimes
	}
}