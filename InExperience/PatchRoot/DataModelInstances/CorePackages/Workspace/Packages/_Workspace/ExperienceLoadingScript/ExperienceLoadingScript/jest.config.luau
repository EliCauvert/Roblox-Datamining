local parent = script.Parent
local jestConfigsModule = require(parent.Parent.Dev.JestConfigs)

return {
	displayName = "ExperienceLoadingScript",
	setupFilesAfterEnv = {
		parent.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}