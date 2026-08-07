local parent = script:FindFirstAncestor("SocialCarousel").Parent
local supportedTelemetryBackends = require(parent.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends
local eventNamesModule = require(script.Parent.EventNames)

return {
	defaults = {
		links = "",
		throttlingThousandths = game:DefineFastInt("SocialCarouselAnalyticsThrottlingThousandths", 10000)
	},
	[eventNamesModule.UserPressed] = {
		description = "User pressed on a user tile",
		lastUpdated = { 25, 4, 14 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.UserSeen] = {
		description = "User has seen an user tile",
		lastUpdated = { 25, 4, 14 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.ViewAddFriends] = {
		description = "User pressed on the add friends tile",
		lastUpdated = { 25, 4, 21 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.ViewAllFriends] = {
		description = "User pressed on the carousel header",
		lastUpdated = { 25, 4, 21 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.StartSquadPressed] = {
		description = "User pressed on the start squad tile",
		lastUpdated = { 25, 11, 11 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.ShareQRPressed] = if require(parent.SharedFlags).FFlagSocialCarouselShareQREnabled then {
		description = "User pressed on the share QR tile",
		lastUpdated = { 26, 4, 14 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil
}