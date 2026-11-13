local AppChat = script:FindFirstAncestor("AppChat")
local TelemetryModule = require(AppChat.Telemetry.Telemetry)
local NamedCounterConfigurationAndFormatFunction = require(AppChat.Telemetry.DefaultTelemetryEvents).namedCounterConfigurationAndFormat

return {
	Rendered = TelemetryModule.new({
		name = "genericShareLinkCardRendered",
		description = "A v2 share link that chat has no dedicated card for rendered as the generic card.",
		lastUpdated = { 2026, 10, 22 },
		backendsList = {
			NamedCounterConfigurationAndFormatFunction("AppChat.ShareLink.GenericCard.Rendered", function(p1)
				return { linkType = p1.linkType, status = p1.status }
			end)
		}
	}),
	Tapped = TelemetryModule.new({
		name = "genericShareLinkCardTapped",
		description = "The user tapped a generic share link card to open the link.",
		lastUpdated = { 2026, 10, 22 },
		backendsList = {
			NamedCounterConfigurationAndFormatFunction("AppChat.ShareLink.GenericCard.Tapped", function(p1)
				return { linkType = p1.linkType }
			end)
		}
	})
}