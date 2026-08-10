return {
	displayName = "NpcInference",
	mockDataModel = true,
	setupFilesAfterEnv = {
		require(script.Parent.Parent.Dev.JestConfigs).setupFiles.createPromiseRejectionHandler()
	}
}