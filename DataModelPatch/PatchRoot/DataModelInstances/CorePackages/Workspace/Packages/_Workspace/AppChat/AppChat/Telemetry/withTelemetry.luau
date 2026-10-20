local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local CreateTelemetryEmitterModule = require(script.Parent.createTelemetryEmitter)

return function(p1)
	-- upvalues: CreateTelemetryEmitterModule (copy), ReactModule (copy)
	return function(Callback)
		-- upvalues: CreateTelemetryEmitterModule (upval), ReactModule (upval), p1 (copy)
		assert(type(Callback) == "function", "Expect renderCallback to be a function.")
		
		return ReactModule.createElement(p1.Consumer, {
			render = function(p2)
				-- upvalues: CreateTelemetryEmitterModule (upval), Callback (copy)
				return Callback((CreateTelemetryEmitterModule(p2)))
			end
		})
	end
end