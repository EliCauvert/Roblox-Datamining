return {
	displayName = "VR",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		require(game:GetService("CorePackages").Workspace.Packages.JestConfigs).setupFiles.createPromiseRejectionHandler(10, 10)
	}
}