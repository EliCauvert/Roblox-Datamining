local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "FlyoutSidePanel-MockDataModel",
	mockDataModel = true,
	testMatch = { "**/FlyoutTooltipManager.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}