local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local createTelemetryEmitterModule = require(script.Parent.createTelemetryEmitter)

return function(p1)
	-- upvalues: createTelemetryEmitterModule (ref), reactModule (ref)
	return function(p2)
		-- upvalues: createTelemetryEmitterModule (copy), reactModule (copy), p1 (ref)
		assert(type(p2) == "function", "Expect renderCallback to be a function.")
		
		return reactModule.createElement(p1.Consumer, {
			render = function(p3)
				-- upvalues: createTelemetryEmitterModule (copy), p2 (ref)
				return p2(createTelemetryEmitterModule(p3))
			end
		})
	end
end