local Default = require(script:FindFirstAncestor("DiscoveryUtils").Parent.LoggingProtocol).default
local config = {
	eventName = "DiscoveryResponseSize",
	description = "Response body size for discovery network requests",
	links = "",
	backends = { Default.TelemetryBackends.Stats },
	throttlingPercentage = game:DefineFastInt("DiscoveryResponseSizeEventHundredthsPercent", 0),
	lastUpdated = { 24, 8, 2 }
}

return function(Endpoint_name, p1, Default1) --[[ Line: 23 | Named "logResponseTelemetry" ]]
	-- upvalues: Default (copy), config (copy)
	if Default1 == nil then
		Default1 = Default
	end
	assert(Default1, "LoggingProtocol must exist")
	Default1:logRobloxTelemetryStat(config, p1.responseSize, { endpoint_name = Endpoint_name })
end