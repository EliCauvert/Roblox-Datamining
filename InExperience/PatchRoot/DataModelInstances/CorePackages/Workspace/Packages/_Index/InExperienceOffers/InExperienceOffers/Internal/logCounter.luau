local loggingProtocolModule = require(script:FindFirstAncestor("InExperienceOffers").Parent.LoggingProtocol)

return function(p1, p2, p3)
	-- upvalues: loggingProtocolModule (ref)
	loggingProtocolModule.default:logRobloxTelemetryCounter(p1, p2 or 1, p3 or {})
end