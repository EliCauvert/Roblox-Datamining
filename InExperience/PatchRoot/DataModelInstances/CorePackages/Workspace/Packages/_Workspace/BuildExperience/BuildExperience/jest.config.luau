local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "BuildExperience",
	testPathIgnorePatterns = { "LibraryAudioPlayerContainer.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.ErrorLogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}