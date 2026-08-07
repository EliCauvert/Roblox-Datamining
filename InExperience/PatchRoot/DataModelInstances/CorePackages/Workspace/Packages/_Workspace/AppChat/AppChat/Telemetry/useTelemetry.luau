local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local createTelemetryEmitterModule = require(script.Parent.createTelemetryEmitter)

return function(value) --[[ line: 7 | named "useTelemetry" ]]
	-- upvalues: reactModule (ref), createTelemetryEmitterModule (ref)
	return createTelemetryEmitterModule(reactModule.useContext(value))
end