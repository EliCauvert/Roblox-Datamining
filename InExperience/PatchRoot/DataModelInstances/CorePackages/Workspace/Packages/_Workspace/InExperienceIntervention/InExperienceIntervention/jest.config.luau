local Parent = script.Parent
local JestConfigsModule = require(Parent.Parent.Dev.JestConfigs)

return {
	displayName = "InExperienceIntervention",
	rootDir = Parent,
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}