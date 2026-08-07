local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "InExperienceShop",
	testMatch = { "**/*.test" },
	testPathIgnorePatterns = {
		"/Mocks/",
		"/Api/",
		"/Stores/",
		"whenJoinSettles",
		"initShopGlobalIcon"
	},
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.ErrorLogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}