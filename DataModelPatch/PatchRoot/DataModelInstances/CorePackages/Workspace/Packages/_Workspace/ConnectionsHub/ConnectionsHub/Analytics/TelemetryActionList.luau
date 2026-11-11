local SocialLuaAnalyticsModule = require(script:FindFirstAncestor("ConnectionsHub").Parent.SocialLuaAnalytics)
local SupportedTelemetryBackends = SocialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends
local EventTypes = SocialLuaAnalyticsModule.Analytics.Enums.EventTypes

return {
	defaults = {
		links = "",
		throttlingThousandths = game:DefineFastInt("CoHubAnalyticsThrottlingThousandths", 10000)
	},
	[require(script.Parent.EventNames).CoHubTabClicked] = {
		description = "CoHub tab clicked",
		lastUpdated = { 26, 1, 27 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = SocialLuaAnalyticsModule.Analytics.Enums.Contexts.ConnectionsHub
				},
				dynamicCustomFields = {
					btn = function(Text): string
						return "tabId_" .. Text
					end,
					subpage = function(Text): string
						return "tabId_" .. Text
					end
				}
			},
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					btn = function(p1)
						return p1
					end,
					subpage = function(p1)
						return p1
					end
				}
			}
		}
	}
}