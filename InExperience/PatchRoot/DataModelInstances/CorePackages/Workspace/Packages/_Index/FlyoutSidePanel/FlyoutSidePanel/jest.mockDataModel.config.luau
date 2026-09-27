local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "FlyoutSidePanel-MockDataModel",
	mockDataModel = true,
	testMatch = { "**/FlyoutTooltipManager.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}