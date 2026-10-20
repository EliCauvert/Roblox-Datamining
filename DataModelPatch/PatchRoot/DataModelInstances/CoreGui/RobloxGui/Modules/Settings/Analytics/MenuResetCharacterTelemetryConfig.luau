return {
	eventName = "experienceMenuResetCharacter",
	description = "Report when respawn button in experience menu is activated",
	backends = {
		require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol).TelemetryBackends.Counter
	},
	throttlingPercentage = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Settings.Flags.FIntMenuButtonsThrottleHundredthsPercent),
	lastUpdated = { 25, 4, 23 }
}