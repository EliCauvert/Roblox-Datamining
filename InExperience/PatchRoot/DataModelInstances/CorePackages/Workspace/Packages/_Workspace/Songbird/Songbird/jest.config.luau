local Songbird = script:FindFirstAncestor("Songbird")
local JestConfigsModule = require(Songbird.Parent.Dev.JestConfigs)

return {
	displayName = Songbird.Name,
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.ErrorLogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}