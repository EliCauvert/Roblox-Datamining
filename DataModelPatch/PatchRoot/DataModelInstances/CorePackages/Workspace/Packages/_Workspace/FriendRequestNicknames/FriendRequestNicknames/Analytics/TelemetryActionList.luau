local SupportedTelemetryBackends = require(script:FindFirstAncestor("FriendRequestNicknames").Parent.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends
local EventNamesModule = require(script.Parent.EventNames)

return {
	defaults = {
		links = "",
		throttlingThousandths = game:DefineFastInt("FriendRequestNicknamesTelemetryThrottlingThousandths", 1000)
	},
	[EventNamesModule.SetNicknameModalOpened] = {
		description = "Friend Request Nicknames modal opened",
		lastUpdated = { 24, 8, 7 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.SetNicknameSkipClicked] = {
		description = "Friend Request Nicknames modal clicked skip",
		lastUpdated = { 24, 8, 7 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.SetNicknameAddNameClicked] = {
		description = "Friend Request Nicknames modal clicked add name",
		lastUpdated = { 24, 8, 7 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	}
}