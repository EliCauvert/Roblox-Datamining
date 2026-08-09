local jestConfigsModule = require(script:FindFirstAncestor("TrustedContacts").Parent.Dev.JestConfigs)

return {
	displayName = "TrustedContacts",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}