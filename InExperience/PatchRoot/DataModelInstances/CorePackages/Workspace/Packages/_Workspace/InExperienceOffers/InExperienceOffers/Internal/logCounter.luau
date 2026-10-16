local LoggingProtocolModule = require(script:FindFirstAncestor("InExperienceOffers").Parent.LoggingProtocol)

return function(p1, p2, p3) --[[ Line: 11 | Named "logCounter" ]]
	-- upvalues: LoggingProtocolModule (copy)
	LoggingProtocolModule.default:logRobloxTelemetryCounter(p1, p2 or 1, p3 or {})
end