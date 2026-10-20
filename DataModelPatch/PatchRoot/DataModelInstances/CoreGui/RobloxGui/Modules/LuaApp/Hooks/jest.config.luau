local JestConfigsModule = require(game:GetService("CorePackages").Workspace.Packages.JestConfigs)

return {
	displayName = "LuaApp/Hooks",
	mockDataModel = true,
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}