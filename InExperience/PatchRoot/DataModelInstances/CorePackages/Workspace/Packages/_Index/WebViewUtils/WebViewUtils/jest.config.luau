local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	mockDataModel = true,
	displayName = "WebViewUtils",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}