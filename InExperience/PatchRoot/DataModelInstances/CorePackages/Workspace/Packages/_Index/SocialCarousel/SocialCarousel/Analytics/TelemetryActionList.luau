local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local SupportedTelemetryBackends = require(Parent.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends
local EventNamesModule = require(script.Parent.EventNames)
local FFlagSocialCarouselShareQREnabled = require(Parent.SharedFlags).FFlagSocialCarouselShareQREnabled

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
	[EventNamesModule.AddFriendsTileSeen] = if require(SocialCarousel.Flags.FFlagSocialCarouselLogNewFriendRequestsBadge) then {
		description = "New-friend-request badge count resolved or changed on the Home Add Friends tile",
		lastUpdated = { 26, 10, 29 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
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
	[EventNamesModule.ShareQRPressed] = if FFlagSocialCarouselShareQREnabled then {
		description = "User pressed on the share QR tile",
		lastUpdated = { 26, 4, 14 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil
}