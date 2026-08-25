local loggingProtocolModule = require(script:FindFirstAncestor("ServerTriggeredModals").Parent.LoggingProtocol)
local default = loggingProtocolModule.default
local t = {
	eventName = "ServerTriggeredModals_HttpStatusCode",
	description = "Response status code from server triggered modals request",
	backends = { loggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 25, 8, 29 }
}

return function(p0, p1, p2)
	-- upvalues: default (ref), t (ref)
	if p2 == nil then
		p2 = default
	end
	assert(p2, "loggingProtocol must exists")
	p2:logRobloxTelemetryCounter(t, 1, { endpoint_name = p0, status_code = p1 or "unknown" })
end