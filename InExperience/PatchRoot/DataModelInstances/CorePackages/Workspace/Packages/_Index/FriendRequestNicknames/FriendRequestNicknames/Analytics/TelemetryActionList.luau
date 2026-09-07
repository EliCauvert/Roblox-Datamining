local supportedTelemetryBackends = require(script:FindFirstAncestor("FriendRequestNicknames").Parent.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends
local eventNamesModule = require(script.Parent.EventNames)

return {
	defaults = {
		links = "",
		throttlingThousandths = game:DefineFastInt("FriendRequestNicknamesTelemetryThrottlingThousandths", 1000)
	},
	[eventNamesModule.SetNicknameModalOpened] = {
		description = "Friend Request Nicknames modal opened",
		lastUpdated = { 24, 8, 7 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.SetNicknameSkipClicked] = {
		description = "Friend Request Nicknames modal clicked skip",
		lastUpdated = { 24, 8, 7 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.SetNicknameAddNameClicked] = {
		description = "Friend Request Nicknames modal clicked add name",
		lastUpdated = { 24, 8, 7 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	}
}