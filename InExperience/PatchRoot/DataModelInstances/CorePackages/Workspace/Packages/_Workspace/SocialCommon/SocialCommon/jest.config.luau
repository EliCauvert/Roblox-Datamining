local jestConfigsModule = require(script:FindFirstAncestor("SocialCommon").Parent.Dev.JestConfigs)

return {
	displayName = "SocialCommon",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		script.Parent.TestHelpers.collisionMatcherSetup
	}
}