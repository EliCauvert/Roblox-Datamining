local Parent = script:FindFirstAncestor("SocialCarousel").Parent
local SupportedTelemetryBackends = require(Parent.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends
local EventNamesModule = require(script.Parent.EventNames)

return {
	defaults = {
		links = "",
		throttlingThousandths = game:DefineFastInt("SocialCarouselAnalyticsThrottlingThousandths", 10000)
	},
	[EventNamesModule.UserPressed] = {
		description = "User pressed on a user tile",
		lastUpdated = { 25, 4, 14 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.UserSeen] = {
		description = "User has seen an user tile",
		lastUpdated = { 25, 4, 14 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ViewAddFriends] = {
		description = "User pressed on the add friends tile",
		lastUpdated = { 25, 4, 21 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ViewAllFriends] = {
		description = "User pressed on the carousel header",
		lastUpdated = { 25, 4, 21 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.StartSquadPressed] = {
		description = "User pressed on the start squad tile",
		lastUpdated = { 25, 11, 11 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ShareQRPressed] = if require(Parent.SharedFlags).FFlagSocialCarouselShareQREnabled then {
		description = "User pressed on the share QR tile",
		lastUpdated = { 26, 4, 14 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil
}