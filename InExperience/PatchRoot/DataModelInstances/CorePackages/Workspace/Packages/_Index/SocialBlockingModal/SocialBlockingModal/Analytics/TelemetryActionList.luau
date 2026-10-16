local SocialLuaAnalyticsModule = require(script:FindFirstAncestor("SocialBlockingModal").Parent.SocialLuaAnalytics)
local SupportedTelemetryBackends = SocialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends
local EventTypes = SocialLuaAnalyticsModule.Analytics.Enums.EventTypes
local Contexts = SocialLuaAnalyticsModule.Analytics.Enums.Contexts
local EventNamesModule = require(script.Parent.EventNames)

return {
	defaults = {
		links = "",
		throttlingThousandths = game:DefineFastInt("SocialBlockingModalAnalyticsThrottlingThousandths", 10000)
	},
	[EventNamesModule.SocialBlockingModalSeen] = {
		description = "Social blocking modal mounted",
		lastUpdated = { 25, 6, 25 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 22 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.UserSeen
				end,
				staticCustomFields = { eventContext = Contexts.SocialBlockingModal }
			},
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.SocialBlockingModalBlockPressed] = {
		description = "Social blocking modal block button pressed",
		lastUpdated = { 25, 6, 25 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 40 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					btn = "Block",
					eventContext = Contexts.SocialBlockingModal
				}
			},
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.SocialBlockingModalBlockAndReportPressed] = {
		description = "Social blocking modal block and report button pressed",
		lastUpdated = { 25, 6, 25 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 59 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					btn = "BlockAndReport",
					eventContext = Contexts.SocialBlockingModal
				}
			},
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.SocialBlockingModalCancelPressed] = {
		description = "Social blocking modal cancel button pressed",
		lastUpdated = { 25, 6, 25 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 78 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					btn = "Cancel",
					eventContext = Contexts.SocialBlockingModal
				}
			},
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	}
}