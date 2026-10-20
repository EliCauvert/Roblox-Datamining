local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "Moments",
	testMatch = { "**/*.test" },
	testPathIgnorePatterns = { "/Analytics/", "/Components/Feed/" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}