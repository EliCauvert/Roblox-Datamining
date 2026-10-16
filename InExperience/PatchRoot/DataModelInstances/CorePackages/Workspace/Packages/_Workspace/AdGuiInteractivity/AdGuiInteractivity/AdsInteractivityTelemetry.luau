local LoggingProtocolModule = require(script.Parent.Parent.LoggingProtocol)
local Default = LoggingProtocolModule.default
local config = {
	eventName = "AdMenuEvent",
	description = "        This event is fired when a user interacts with the ad menu.\n    ",
	links = "https://roblox.atlassian.net/browse/ADS-6383",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 24, 10, 29 }
}
local config1 = {
	eventName = "WhyThisAdEvent",
	description = "        This event is fired when a user interacts with the \"Why this ad?\" button.\n    ",
	links = "https://roblox.atlassian.net/browse/ADS-6383",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 24, 10, 29 }
}
local config2 = {
	eventName = "ReportAdEvent",
	description = "        This event is fired when a user interacts with the \"Report this ad\" button.\n    ",
	links = "https://roblox.atlassian.net/browse/ADS-6383",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 24, 10, 29 }
}
local config3 = {
	eventName = "ImmersiveBrandedAdButtonClickEvent",
	description = "This event is fired when a user clicks one of the immersive branded ad buttons (disclosure, \"Why this ad?\", or \"Report this ad\").",
	links = "",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 26, 3, 11 }
}
local config4 = {
	eventName = "ImmersiveBrandedAdLinkingFailedEvent",
	description = "This event is fired when a user tries to click one of the immersive branded ad menu/dialog links, but LinkingProtocol fails.",
	links = "",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 26, 3, 24 }
}

return {
	logAdMenuEvent = function(State) --[[ Line: 72 ]]
		-- upvalues: Default (copy), config (copy)
		Default:logRobloxTelemetryCounter(config, 1, { state = State })
	end,
	logWhyThisAdEvent = function() --[[ Line: 78 ]]
		-- upvalues: Default (copy), config1 (copy)
		Default:logRobloxTelemetryCounter(config1, 1)
	end,
	logReportAdEvent = function(State) --[[ Line: 88 ]]
		-- upvalues: Default (copy), config2 (copy)
		Default:logRobloxTelemetryCounter(config2, 1, { state = State })
	end,
	logImmersiveBrandedAdButtonClickCounter = function(ButtonName) --[[ Line: 94 ]]
		-- upvalues: Default (copy), config3 (copy)
		Default:logRobloxTelemetryCounter(config3, 1, { buttonName = ButtonName })
	end,
	logImmersiveBrandedAdLinkingFailedCounter = function(LinkName) --[[ Line: 102 ]]
		-- upvalues: Default (copy), config4 (copy)
		Default:logRobloxTelemetryCounter(config4, 1, { linkName = LinkName })
	end
}