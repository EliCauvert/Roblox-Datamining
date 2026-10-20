return {
	displayName = "CoreScripts",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		require(game:GetService("CorePackages").Workspace.Packages.JestConfigs).setupFiles.RetryTimes
	}
}