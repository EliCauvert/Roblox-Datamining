local jestConfigsModule = require(game:GetService("CorePackages").Workspace.Packages.JestConfigs)
_G.__TESTEZ_RUNNING_TEST__ = true

return {
	displayName = "CoreScriptsRhodiumTest",
	testMatch = { "**/*.test" },
	testPathIgnorePatterns = { "TestHelpers" },
	setupFilesAfterEnv = {
		script.Parent.TestHelpers.JestSetupDummyInstances,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes,
		script.Parent.TestHelpers["JestResetInputDevice.test"]
	}
}