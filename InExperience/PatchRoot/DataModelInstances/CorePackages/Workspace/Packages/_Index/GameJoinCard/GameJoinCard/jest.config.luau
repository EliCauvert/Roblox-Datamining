local parent = script.Parent
local jestConfigsModule = require(parent.Parent.Dev.JestConfigs)

return {
	displayName = "GameJoinCard",
	rootDir = parent,
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}