local LoggingProtocolModule = require(script:FindFirstAncestor("ServerTriggeredModals").Parent.LoggingProtocol)
local Default = LoggingProtocolModule.default
local config = {
	eventName = "ServerTriggeredModals_HttpStatusCode",
	description = "Response status code from server triggered modals request",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 25, 8, 29 }
}

return function(Endpoint_name, p1, Default1) --[[ Line: 18 ]]
	-- upvalues: Default (copy), config (copy)
	if Default1 == nil then
		Default1 = Default
	end
	assert(Default1, "loggingProtocol must exists")
	Default1:logRobloxTelemetryCounter(config, 1, {
		endpoint_name = Endpoint_name,
		status_code = p1 or "unknown"
	})
end