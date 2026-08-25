local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local createTelemetryEmitterModule = require(script.Parent.createTelemetryEmitter)

return function(value)
	-- upvalues: reactModule (ref), createTelemetryEmitterModule (ref)
	return createTelemetryEmitterModule(reactModule.useContext(value))
end