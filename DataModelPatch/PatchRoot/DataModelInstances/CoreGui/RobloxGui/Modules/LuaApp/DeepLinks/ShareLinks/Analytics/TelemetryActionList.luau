local CorePackages = game:GetService("CorePackages")
local SupportedTelemetryBackends = require(CorePackages.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends
local EventNamesModule = require(script.Parent.EventNames)

local function DidSucceed(p1): string
	return if p1 then "True" else "False"
end

local Identity = require(CorePackages.Packages.Dash).identity

return {
	defaults = {
		links = "",
		throttlingThousandths = game:DefineFastInt("ShareLinksAnalyticsThrottlingThousandths", 10000)
	},
	[EventNamesModule.ShareLinkLatency] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryStat,
				dynamicCustomFields = { linkStatus = Identity, linkType = Identity }
			}
		}
	},
	[EventNamesModule.ShareLinkResolveLink] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = { linkStatus = Identity, linkType = Identity }
			}
		}
	},
	[EventNamesModule.StaticShareLinkLatency] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryStat,
				dynamicCustomFields = { staticLinkType = Identity, didSucceed = DidSucceed }
			}
		}
	},
	[EventNamesModule.StaticShareLinkResolveLink] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = { staticLinkType = Identity, didSucceed = DidSucceed }
			},
			{
				type = SupportedTelemetryBackends.EventIngest,
				dynamicCustomFields = {
					staticLinkType = Identity,
					linkId = Identity,
					extraProps = Identity,
					didSucceed = DidSucceed
				}
			}
		}
	}
}