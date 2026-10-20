local JestConfigsModule = require(script:FindFirstAncestor("TrustedContacts").Parent.Dev.JestConfigs)

return {
	displayName = "TrustedContacts",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}