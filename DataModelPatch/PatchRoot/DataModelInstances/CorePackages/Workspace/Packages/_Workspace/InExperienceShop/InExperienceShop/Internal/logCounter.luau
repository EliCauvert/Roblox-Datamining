local LoggingProtocolModule = require(script:FindFirstAncestor("InExperienceShop").Parent.LoggingProtocol)

return function(p1, p2)
	-- upvalues: LoggingProtocolModule (copy)
	LoggingProtocolModule.default:logRobloxTelemetryCounter(p1, p2 or 1, {})
end