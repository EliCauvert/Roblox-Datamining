local Parent = script.Parent
local JestConfigsModule = require(Parent.Parent.Dev.JestConfigs)

return {
	displayName = "ContactImporter",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		Parent.TestHelpers.NetworkImplHandler,
		JestConfigsModule.setupFiles.RemoveLeakedScreenGuis,
		JestConfigsModule.setupFiles.RetryTimes
	}
}