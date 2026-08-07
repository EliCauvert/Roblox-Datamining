local loggingProtocolModule = require(script.Parent.Parent.LoggingProtocol)
local default = loggingProtocolModule.default
local t = {
	eventName = "AdMenuEvent",
	description = "        This event is fired when a user interacts with the ad menu.\n    ",
	links = "https://roblox.atlassian.net/browse/ADS-6383",
	backends = { loggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 24, 10, 29 }
}
local t_1 = {
	eventName = "WhyThisAdEvent",
	description = "        This event is fired when a user interacts with the \"Why this ad?\" button.\n    ",
	links = "https://roblox.atlassian.net/browse/ADS-6383",
	backends = { loggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 24, 10, 29 }
}
local t_2 = {
	eventName = "ReportAdEvent",
	description = "        This event is fired when a user interacts with the \"Report this ad\" button.\n    ",
	links = "https://roblox.atlassian.net/browse/ADS-6383",
	backends = { loggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 24, 10, 29 }
}
local t_3 = {
	eventName = "ImmersiveBrandedAdButtonClickEvent",
	description = "This event is fired when a user clicks one of the immersive branded ad buttons (disclosure, \"Why this ad?\", or \"Report this ad\").",
	links = "",
	backends = { loggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 26, 3, 11 }
}
local t_4 = {
	eventName = "ImmersiveBrandedAdLinkingFailedEvent",
	description = "This event is fired when a user tries to click one of the immersive branded ad menu/dialog links, but LinkingProtocol fails.",
	links = "",
	backends = { loggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 26, 3, 24 }
}

return {
	logAdMenuEvent = function(p0) --[[ line: 72 ]]
		-- upvalues: default (ref), t (ref)
		default:logRobloxTelemetryCounter(t, 1, { state = p0 })
	end,
	logWhyThisAdEvent = function() --[[ line: 78 ]]
		-- upvalues: default (ref), t_1 (ref)
		default:logRobloxTelemetryCounter(t_1, 1)
	end,
	logReportAdEvent = function(p1) --[[ line: 88 ]]
		-- upvalues: default (ref), t_2 (ref)
		default:logRobloxTelemetryCounter(t_2, 1, { state = p1 })
	end,
	logImmersiveBrandedAdButtonClickCounter = function(p2) --[[ line: 94 ]]
		-- upvalues: default (ref), t_3 (ref)
		default:logRobloxTelemetryCounter(t_3, 1, { buttonName = p2 })
	end,
	logImmersiveBrandedAdLinkingFailedCounter = function(p3) --[[ line: 102 ]]
		-- upvalues: default (ref), t_4 (ref)
		default:logRobloxTelemetryCounter(t_4, 1, { linkName = p3 })
	end
}