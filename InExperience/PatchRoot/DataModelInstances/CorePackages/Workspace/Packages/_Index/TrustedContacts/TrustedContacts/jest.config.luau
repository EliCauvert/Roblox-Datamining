local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local JestConfigsModule = require(TrustedContacts.Parent.Dev.JestConfigs)

return {
	displayName = "TrustedContacts",
	testMatch = { "**/*.test" },
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.LogHandler,
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		TrustedContacts.TestHelpers.NetworkImplHandler,
		JestConfigsModule.setupFiles.RemoveLeakedScreenGuis,
		JestConfigsModule.setupFiles.RetryTimes
	}
}