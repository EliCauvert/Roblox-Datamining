local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local createTelemetryEmitterModule = require(script.Parent.createTelemetryEmitter)

return function(p0)
	-- upvalues: createTelemetryEmitterModule (ref), reactModule (ref)
	return function(p1)
		-- upvalues: createTelemetryEmitterModule (copy), reactModule (copy), p0 (ref)
		assert(type(p1) == "function", "Expect renderCallback to be a function.")
		
		return reactModule.createElement(p0.Consumer, {
			render = function(p2)
				-- upvalues: createTelemetryEmitterModule (copy), p1 (ref)
				return p1(createTelemetryEmitterModule(p2))
			end
		})
	end
end