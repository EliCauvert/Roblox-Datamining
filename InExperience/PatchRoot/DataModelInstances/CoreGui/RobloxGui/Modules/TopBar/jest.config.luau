local JestConfigsModule = require(game:GetService("CorePackages").Workspace.Packages.JestConfigs)

return {
	displayName = "TopBar",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		script.Parent.TestHelpers.JestSetupDummyInstances,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(10, 10),
		JestConfigsModule.setupFiles.RetryTimes
	}
}