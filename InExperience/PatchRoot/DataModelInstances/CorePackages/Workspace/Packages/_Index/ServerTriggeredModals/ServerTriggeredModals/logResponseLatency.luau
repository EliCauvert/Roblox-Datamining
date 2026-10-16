local LoggingProtocolModule = require(script:FindFirstAncestor("ServerTriggeredModals").Parent.LoggingProtocol)
local Default = LoggingProtocolModule.default
local config = {
	eventName = "ServerTriggeredModals_NetworkLatency",
	description = "Response latency from server triggered modals request",
	backends = { LoggingProtocolModule.TelemetryBackends.Stats },
	lastUpdated = { 25, 8, 29 }
}

return function(Endpoint_name, p1, Status_code, Default1) --[[ Line: 18 ]]
	-- upvalues: Default (copy), config (copy)
	if Default1 == nil then
		Default1 = Default
	end
	assert(Default1, "loggingProtocol must exists")
	Default1:logRobloxTelemetryStat(config, p1, { endpoint_name = Endpoint_name, status_code = Status_code })
end