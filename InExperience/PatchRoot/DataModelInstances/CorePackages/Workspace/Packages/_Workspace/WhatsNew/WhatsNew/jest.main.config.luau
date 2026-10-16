local JestConfigsModule = require(script:FindFirstAncestor("WhatsNew").Parent.Dev.JestConfigs)

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
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}