return {
	displayName = "PopLatencyOverlay",
	setupFilesAfterEnv = {
		require(script.Parent.Parent.Dev.JestConfigs).setupFiles.LogHandler
	}
}