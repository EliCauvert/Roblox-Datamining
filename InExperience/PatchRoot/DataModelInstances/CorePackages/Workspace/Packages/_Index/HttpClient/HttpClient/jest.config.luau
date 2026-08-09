local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "HttpClient",
	mockDataModel = true,
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}