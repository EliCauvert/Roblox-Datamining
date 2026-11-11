local Parent = script.Parent
local JestConfigsModule = require(Parent.Parent.Dev.JestConfigs)

return {
	displayName = "AddFriends",
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		Parent.TestHelpers.CollisionMatchersSetup,
		Parent.TestHelpers.NetworkImplHandler, JestConfigsModule.setupFiles.RetryTimes
	}
}