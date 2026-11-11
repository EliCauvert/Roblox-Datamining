local SocialLuaAnalytics = script:FindFirstAncestor("SocialLuaAnalytics")
local _ = require(SocialLuaAnalytics.Analytics.Types)
local SupportedTelemetryBackendsModule = require(SocialLuaAnalytics.Analytics.Enums.SupportedTelemetryBackends)
local ContextsModule = require(SocialLuaAnalytics.Analytics.Enums.Contexts)

return {
	defaults = {
		links = "",
		throttlingThousandths = game:DefineFastInt("ExampleSLATelemetryThrottlingThousandths", 800)
	},
	PageLoad = {
		description = "QR code page load",
		lastUpdated = { 24, 5, 9 },
		backendsList = {
			{
				type = SupportedTelemetryBackendsModule.RobloxTelemetryCounter
			}
		}
	},
	PageLoadWithCustomIncrement = {
		description = "QR code page load",
		lastUpdated = { 24, 5, 9 },
		backendsList = {
			{
				incrementValue = 2,
				type = SupportedTelemetryBackendsModule.RobloxTelemetryCounter,
				dynamicCustomFields = {
					successStatus = function(p1)
						return p1
					end
				},
				staticCustomFields = { ctx = ContextsModule.Party }
			}
		},
		eventStreamCtx = ContextsModule.Party
	},
	PageLoadWithDynamicName = {
		description = "Test for dynamic name",
		lastUpdated = { 24, 5, 9 },
		backendsList = {
			{
				type = SupportedTelemetryBackendsModule.RobloxTelemetryCounter,
				overrideName = function(p1): string
					return "PageLoadWithDynamicName" .. p1.successStatus
				end
			}
		}
	},
	SimplePageLoadTimer = {
		description = "QR code page load timer",
		lastUpdated = { 24, 5, 9 },
		backendsList = {
			{
				type = SupportedTelemetryBackendsModule.RobloxTelemetryStat
			}
		}
	},
	ComplexPageLoadTimer = {
		description = "QR code page load timer",
		lastUpdated = { 24, 5, 9 },
		backendsList = {
			{
				type = SupportedTelemetryBackendsModule.RobloxTelemetryStat,
				dynamicCustomFields = {
					successStatus = function(p1)
						return p1
					end
				},
				staticCustomFields = { ctx = ContextsModule.Party }
			}
		},
		eventStreamCtx = ContextsModule.Party
	}
}