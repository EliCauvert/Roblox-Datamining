return {
	displayName = "FloatingWindow",
	setupFilesAfterEnv = {
		require(script.Parent.Parent.Dev.JestConfigs).setupFiles.RetryTimes
	}
}