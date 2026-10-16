local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "BuildExperience",
	testPathIgnorePatterns = { "LibraryAudioPlayerContainer.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.ErrorLogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}