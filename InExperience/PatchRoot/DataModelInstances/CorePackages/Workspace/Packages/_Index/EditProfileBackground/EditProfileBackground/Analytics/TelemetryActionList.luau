local EventNamesModule = require(script.Parent.Enums.EventNames)
local SupportedTelemetryBackends = require(script:FindFirstAncestor("EditProfileBackground").Parent.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends

return {
	defaults = {
		links = "",
		throttlingThousandths = game:DefineFastInt("EditProfileBackgroundAnalyticsThrottlingThousandths", 1000)
	},
	[EventNamesModule.EditProfileBackgroundOpened] = {
		description = "Edit Profile Background Page Opened",
		lastUpdated = { 25, 7, 30 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.EditProfileBackgroundLoadingStage] = {
		description = "Edit Profile Background Loading Stage",
		lastUpdated = { 25, 7, 30 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryStat,
				dynamicCustomFields = {
					status = function(p1) --[[ Line: 29 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.BackgroundSelected] = {
		description = "Background Selected",
		lastUpdated = { 25, 7, 30 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					backgroundId = function(p1) --[[ Line: 43 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.EditProfileBackgroundFailure] = {
		description = "Edit Profile Background Failure",
		lastUpdated = { 25, 8, 4 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					errorType = function(p1) --[[ Line: 57 ]]
						return p1
					end,
					errorCode = function(p1) --[[ Line: 60 ]]
						return p1
					end
				}
			}
		}
	}
}