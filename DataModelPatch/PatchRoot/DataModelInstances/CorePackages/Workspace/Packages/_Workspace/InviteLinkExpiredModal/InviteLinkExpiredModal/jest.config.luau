local JestConfigsModule = require(script:FindFirstAncestor("InviteLinkExpiredModal").Parent.Dev.JestConfigs)

return {
	displayName = "InviteLinkExpiredModal",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		script.Parent.NetworkImplHandler,
		JestConfigsModule.setupFiles.RetryTimes
	}
}