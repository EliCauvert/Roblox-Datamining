local parent = script.Parent
local jestConfigsModule = require(parent.Parent.Dev.JestConfigs)

return {
	displayName = "InExperienceIntervention",
	rootDir = parent,
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}