local loggingProtocolModule = require(script:FindFirstAncestor("InExperienceShop").Parent.LoggingProtocol)

return function(p0, p1)
	-- upvalues: loggingProtocolModule (ref)
	loggingProtocolModule.default:logRobloxTelemetryCounter(p0, p1 or 1, {})
end