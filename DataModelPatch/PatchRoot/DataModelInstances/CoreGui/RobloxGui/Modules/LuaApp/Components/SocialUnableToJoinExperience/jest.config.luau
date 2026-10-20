local JestConfigsModule = require(game:GetService("CorePackages").Workspace.Packages.JestConfigs)

return {
	displayName = "SocialAppIntegration-SocialUnableToJoinExperience",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}