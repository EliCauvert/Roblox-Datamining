local parent = script:FindFirstAncestor("SocialExperienceJoin").Parent
local supportedTelemetryBackends = require(parent.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends
local eventNamesModule = require(script.Parent.EventNames)

return {
	defaults = {
		links = "",
		throttlingThousandths = game:DefineFastInt("SocialExperienceJoinAnalyticsThrottlingThousandths", 1000)
	},
	[eventNamesModule.JoinExperience] = {
		description = "Experience launch attempt from another user's presence; followUser differentiates Join from Play.",
		lastUpdated = { 26, 10, 5 },
		backendsList = {
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					status = function(p1)
						return p1
					end,
					followUser = if require(parent.SharedFlags).FFlagJoinabilityCTARefactor then function(p1)
						return p1
					end else nil
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