local eventNamesModule = require(script.Parent.Enums.EventNames)
local supportedTelemetryBackends = require(script:FindFirstAncestor("EditProfileBackground").Parent.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends

return {
	defaults = {
		links = "",
		throttlingThousandths = game:DefineFastInt("EditProfileBackgroundAnalyticsThrottlingThousandths", 1000)
	},
	[eventNamesModule.EditProfileBackgroundOpened] = {
		description = "Edit Profile Background Page Opened",
		lastUpdated = { 25, 7, 30 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.EditProfileBackgroundLoadingStage] = {
		description = "Edit Profile Background Loading Stage",
		lastUpdated = { 25, 7, 30 },
		backendsList = {
			{
				type = supportedTelemetryBackends.RobloxTelemetryStat,
				dynamicCustomFields = {
					status = function(p0)
						return p0
					end
				}
			}
		}
	},
	[eventNamesModule.BackgroundSelected] = {
		description = "Background Selected",
		lastUpdated = { 25, 7, 30 },
		backendsList = {
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					backgroundId = function(value)
						return value
					end
				}
			}
		}
	},
	[eventNamesModule.EditProfileBackgroundFailure] = {
		description = "Edit Profile Background Failure",
		lastUpdated = { 25, 8, 4 },
		backendsList = {
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					errorType = function(p1)
						return p1
					end,
					errorCode = function(p2)
						return p2
					end
				}
			}
		}
	}
}