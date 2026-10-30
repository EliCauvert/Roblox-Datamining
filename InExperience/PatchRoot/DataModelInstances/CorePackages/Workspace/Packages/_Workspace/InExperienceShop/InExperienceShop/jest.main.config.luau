local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "InExperienceShop",
	testMatch = { "**/*.test" },
	testPathIgnorePatterns = {
		"/Mocks/", "/Api/", "/Stores/", "whenJoinSettles", "initShopGlobalIcon",
		"useCloseOnCoreMenu", "submitFreeTrialMenuBadge"
	},
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.ErrorLogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}