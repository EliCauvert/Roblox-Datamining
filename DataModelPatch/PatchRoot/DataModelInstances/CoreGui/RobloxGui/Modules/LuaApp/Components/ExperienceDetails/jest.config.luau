local JestConfigsModule = require(game:GetService("CorePackages").Workspace.Packages.JestConfigs)

return {
	displayName = "ExperienceDetails",
	testMatch = { "**/*.test" },
	snapshotFormat = { printInstanceDefaults = false },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}