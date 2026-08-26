local loggingProtocolModule = require(script:FindFirstAncestor("InExperienceShop").Parent.LoggingProtocol)

return function(p1, p2)
	-- upvalues: loggingProtocolModule (ref)
	loggingProtocolModule.default:logRobloxTelemetryCounter(p1, p2 or 1, {})
end