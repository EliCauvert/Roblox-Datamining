local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "InExperienceShop-MockDataModel",
	mockDataModel = true,
	testMatch = {
		"**/Mocks/**/*.test", "**/Mocks/*.test", "**/Api/**/*.test", "**/Api/*.test",
		"**/Stores/**/*.test", "**/Stores/*.test", "**/Internal/whenJoinSettles.test",
		"**/initShopGlobalIcon.test"
	},
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}