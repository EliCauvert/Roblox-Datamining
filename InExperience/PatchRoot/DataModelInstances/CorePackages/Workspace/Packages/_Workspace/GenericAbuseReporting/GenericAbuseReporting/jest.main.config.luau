local parent = script.Parent
local jestConfigsModule = require(parent.Parent.Dev.JestConfigs)

return {
	displayName = "GenericAbuseReporting",
	testMatch = { "**/*.test" },
	testPathIgnorePatterns = { "analyticsService" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.ErrorLogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		parent.extendExpectations,
		jestConfigsModule.setupFiles.RetryTimes
	}
}