local LoggingProtocolModule = require(script:FindFirstAncestor("InExperienceShop").Parent.LoggingProtocol)

return function(p1, p2) --[[ Line: 18 | Named "logCounter" ]]
	-- upvalues: LoggingProtocolModule (copy)
	LoggingProtocolModule.default:logRobloxTelemetryCounter(p1, p2 or 1, {})
end