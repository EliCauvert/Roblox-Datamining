local socialLuaAnalyticsModule = require(script:FindFirstAncestor("SocialBlockingModal").Parent.SocialLuaAnalytics)
local supportedTelemetryBackends = socialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends
local eventTypes = socialLuaAnalyticsModule.Analytics.Enums.EventTypes
local contexts = socialLuaAnalyticsModule.Analytics.Enums.Contexts
local eventNamesModule = require(script.Parent.EventNames)

return {
	defaults = {
		links = "",
		throttlingThousandths = game:DefineFastInt("SocialBlockingModalAnalyticsThrottlingThousandths", 10000)
	},
	[eventNamesModule.SocialBlockingModalSeen] = {
		description = "Social blocking modal mounted",
		lastUpdated = { 25, 6, 25 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 22 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.UserSeen
				end,
				staticCustomFields = { eventContext = contexts.SocialBlockingModal }
			},
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.SocialBlockingModalBlockPressed] = {
		description = "Social blocking modal block button pressed",
		lastUpdated = { 25, 6, 25 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 40 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					btn = "Block",
					eventContext = contexts.SocialBlockingModal
				}
			},
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.SocialBlockingModalBlockAndReportPressed] = {
		description = "Social blocking modal block and report button pressed",
		lastUpdated = { 25, 6, 25 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 59 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					btn = "BlockAndReport",
					eventContext = contexts.SocialBlockingModal
				}
			},
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.SocialBlockingModalCancelPressed] = {
		description = "Social blocking modal cancel button pressed",
		lastUpdated = { 25, 6, 25 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 78 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					btn = "Cancel",
					eventContext = contexts.SocialBlockingModal
				}
			},
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	}
}