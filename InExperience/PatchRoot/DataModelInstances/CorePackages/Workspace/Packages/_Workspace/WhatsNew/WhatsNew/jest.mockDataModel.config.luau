local jestConfigsModule = require(script:FindFirstAncestor("WhatsNew").Parent.Dev.JestConfigs)

return {
	displayName = "WhatsNew-MockDataModel",
	mockDataModel = true,
	testMatch = {
		"**/storage/**/*.test",
		"**/telemetry/**/*.test",
		"**/createWhatsNewStore.test",
		"**/createInGameWhatsNewHost.test"
	},
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}