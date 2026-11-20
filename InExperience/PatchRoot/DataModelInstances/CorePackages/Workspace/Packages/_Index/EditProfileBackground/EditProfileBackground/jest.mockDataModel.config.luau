local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "EditProfileBackground-MockDataModel",
	mockDataModel = true,
	testMatch = {
		"**/AvatarModelPrefetch.test",
		"**/DisplayBackground.test",
		"**/EditProfileBackgroundPage.test"
	},
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		script.Parent.TestHelpers.collisionMatcherSetup,
		JestConfigsModule.setupFiles.RetryTimes
	}
}