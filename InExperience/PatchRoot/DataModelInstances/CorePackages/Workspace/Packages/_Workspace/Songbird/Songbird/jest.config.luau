local songbird = script:FindFirstAncestor("Songbird")
local jestConfigsModule = require(songbird.Parent.Dev.JestConfigs)

return {
	displayName = songbird.Name,
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.ErrorLogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}