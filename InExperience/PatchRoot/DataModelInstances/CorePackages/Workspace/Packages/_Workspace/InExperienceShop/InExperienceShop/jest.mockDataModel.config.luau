local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "InExperienceShop-MockDataModel",
	mockDataModel = true,
	testMatch = {
		"**/Mocks/**/*.test", "**/Mocks/*.test", "**/Api/**/*.test", "**/Api/*.test",
		"**/Stores/**/*.test", "**/Stores/*.test", "**/Internal/whenJoinSettles.test",
		"**/Hooks/useCloseOnCoreMenu.test", "**/initShopGlobalIcon.test",
		"**/submitFreeTrialMenuBadge.test"
	},
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}