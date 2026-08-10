local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "SocialWidgets-FriendsCarousel",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		script.Parent.FlagAndNetworkImplHandler,
		jestConfigsModule.setupFiles.RetryTimes
	}
}