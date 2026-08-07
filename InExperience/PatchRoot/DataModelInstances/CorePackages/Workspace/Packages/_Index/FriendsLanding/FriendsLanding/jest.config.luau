local parent = script.Parent
local jestConfigsModule = require(parent.Parent.Dev.JestConfigs)

return {
	displayName = "FriendsLanding",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		parent.TestHelpers.CollisionMatchersSetup,
		parent.TestHelpers.NetworkImplHandler, jestConfigsModule.setupFiles.RetryTimes
	}
}