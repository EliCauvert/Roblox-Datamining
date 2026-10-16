local Parent = script.Parent
local JestConfigsModule = require(Parent.Parent.Dev.JestConfigs)

return {
	displayName = "GenericAbuseReporting",
	testMatch = { "**/*.test" },
	testPathIgnorePatterns = { "analyticsService" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.ErrorLogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		Parent.extendExpectations,
		JestConfigsModule.setupFiles.RetryTimes
	}
}