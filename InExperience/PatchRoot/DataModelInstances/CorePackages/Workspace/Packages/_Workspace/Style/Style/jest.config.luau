return {
	displayName = "Style",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		require(script.Parent.Parent.Dev.JestConfigs).setupFiles.UIBloxInitializer
	}
}