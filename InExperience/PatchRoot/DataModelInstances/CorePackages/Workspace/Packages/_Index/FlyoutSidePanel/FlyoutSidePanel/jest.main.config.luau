local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "FlyoutSidePanel",
	testMatch = { "**/*.test" },
	testPathIgnorePatterns = { "FlyoutTooltipManager.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}