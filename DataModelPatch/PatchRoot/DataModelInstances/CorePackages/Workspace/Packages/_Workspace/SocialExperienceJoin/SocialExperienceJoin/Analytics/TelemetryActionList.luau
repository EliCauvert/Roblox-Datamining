local SupportedTelemetryBackends = require(script:FindFirstAncestor("SocialExperienceJoin").Parent.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends
local EventNamesModule = require(script.Parent.EventNames)

return {
	defaults = {
		links = "",
		throttlingThousandths = game:DefineFastInt("SocialExperienceJoinAnalyticsThrottlingThousandths", 1000)
	},
	[EventNamesModule.JoinExperience] = {
		description = "Join Experience Attempt from other user",
		lastUpdated = { 24, 7, 17 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					status = function(p1)
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.PurchaseExperienceAttempt] = {
		description = "Purchase Experience Attempt Status after requesting",
		lastUpdated = { 24, 7, 17 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					status = function(p1)
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.PurchaseExperience] = {
		description = "Purchase Experience Button click",
		lastUpdated = { 24, 7, 17 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CancelPurchaseExperience] = {
		description = "Cancel Purchase Experience Attempt from other user",
		lastUpdated = { 24, 7, 17 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.UnableToJoinViewDetails] = {
		description = "Unable to Join Experience View Details",
		lastUpdated = { 24, 7, 17 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.UnableToJoinCancel] = {
		description = "Unable to Join Experience Cancel",
		lastUpdated = { 24, 7, 17 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	}
}