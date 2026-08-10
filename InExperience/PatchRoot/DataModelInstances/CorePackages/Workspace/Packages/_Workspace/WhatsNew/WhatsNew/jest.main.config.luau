local jestConfigsModule = require(script:FindFirstAncestor("WhatsNew").Parent.Dev.JestConfigs)

return {
	displayName = "WhatsNew",
	testMatch = { "**/*.test" },
	testPathIgnorePatterns = {
		"/storage/",
		"/telemetry/",
		"createWhatsNewStore.test",
		"createInGameWhatsNewHost.test"
	},
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}