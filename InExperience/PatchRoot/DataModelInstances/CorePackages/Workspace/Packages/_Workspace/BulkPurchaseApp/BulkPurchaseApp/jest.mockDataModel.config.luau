local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "BulkPurchaseApp-MockDataModel",
	mockDataModel = true,
	testMatch = { "**/getGuiObjectIsObscured.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}