local supportedTelemetryBackends = require(script:FindFirstAncestor("SocialExperienceJoin").Parent.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends
local eventNamesModule = require(script.Parent.EventNames)

return {
	defaults = {
		links = "",
		throttlingThousandths = game:DefineFastInt("SocialExperienceJoinAnalyticsThrottlingThousandths", 1000)
	},
	[eventNamesModule.JoinExperience] = {
		description = "Join Experience Attempt from other user",
		lastUpdated = { 24, 7, 17 },
		backendsList = {
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					status = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.PurchaseExperienceAttempt] = {
		description = "Purchase Experience Attempt Status after requesting",
		lastUpdated = { 24, 7, 17 },
		backendsList = {
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					status = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.PurchaseExperience] = {
		description = "Purchase Experience Button click",
		lastUpdated = { 24, 7, 17 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CancelPurchaseExperience] = {
		description = "Cancel Purchase Experience Attempt from other user",
		lastUpdated = { 24, 7, 17 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.UnableToJoinViewDetails] = {
		description = "Unable to Join Experience View Details",
		lastUpdated = { 24, 7, 17 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.UnableToJoinCancel] = {
		description = "Unable to Join Experience Cancel",
		lastUpdated = { 24, 7, 17 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	}
}