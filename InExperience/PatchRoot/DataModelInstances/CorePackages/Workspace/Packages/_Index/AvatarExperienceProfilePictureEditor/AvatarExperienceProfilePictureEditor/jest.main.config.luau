local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "AvatarExperienceProfilePictureEditor",
	testMatch = { "**/*.test" },
	testPathIgnorePatterns = { "useOwnedEmotes.test", "useGuiInset.test" },
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		jestConfigsModule.setupFiles.RetryTimes
	}
}