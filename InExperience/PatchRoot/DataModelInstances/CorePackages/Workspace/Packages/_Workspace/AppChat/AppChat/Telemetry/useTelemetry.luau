local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local CreateTelemetryEmitterModule = require(script.Parent.createTelemetryEmitter)

return function(p1) --[[ Line: 7 | Named "useTelemetry" ]]
	-- upvalues: ReactModule (copy), CreateTelemetryEmitterModule (copy)
	return CreateTelemetryEmitterModule((ReactModule.useContext(p1)))
end