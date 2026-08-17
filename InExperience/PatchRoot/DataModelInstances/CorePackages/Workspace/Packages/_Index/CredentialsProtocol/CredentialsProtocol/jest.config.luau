local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "CredentialsProtocol",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}