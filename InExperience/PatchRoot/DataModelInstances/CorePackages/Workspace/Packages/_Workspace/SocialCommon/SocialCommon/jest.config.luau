local JestConfigsModule = require(script:FindFirstAncestor("SocialCommon").Parent.Dev.JestConfigs)

return {
	displayName = "SocialCommon",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		script.Parent.TestHelpers.collisionMatcherSetup,
		JestConfigsModule.setupFiles.RetryTimes
	}
}