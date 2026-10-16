local Parent = script:FindFirstAncestor("SocialExperienceJoin").Parent
local SupportedTelemetryBackends = require(Parent.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends
local EventNamesModule = require(script.Parent.EventNames)

return {
	defaults = {
		links = "",
		throttlingThousandths = game:DefineFastInt("SocialExperienceJoinAnalyticsThrottlingThousandths", 1000)
	},
	[EventNamesModule.JoinExperience] = {
		description = "Experience launch attempt from another user's presence; followUser differentiates Join from Play.",
		lastUpdated = { 26, 10, 5 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					status = function(p1) --[[ Line: 21 ]]
						return p1
					end,
					followUser = if require(Parent.SharedFlags).FFlagJoinabilityCTARefactor then function(p1) --[[ Line: 25 ]]
						return p1
					end else nil
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
					status = function(p1) --[[ Line: 40 ]]
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