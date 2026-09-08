local parent = script.Parent.Parent
local signalsExperimentalModule = require(parent.SignalsExperimental)
local actionHandlersModule = require(script.Parent.ActionHandlers)
local fFlagSignalsRegistryOwnedFanout = require(parent.SharedFlags).FFlagSignalsRegistryOwnedFanout

return function(value)
	-- upvalues: fFlagSignalsRegistryOwnedFanout (ref), signalsExperimentalModule (ref), actionHandlersModule (ref)
	return function(p1, _)
		-- upvalues: fFlagSignalsRegistryOwnedFanout (copy), signalsExperimentalModule (copy), actionHandlersModule (copy), value (ref)
		return function(p2)
			-- upvalues: fFlagSignalsRegistryOwnedFanout (copy), signalsExperimentalModule (copy), actionHandlersModule (copy), value (copy), p1 (ref)
			local type
			if fFlagSignalsRegistryOwnedFanout then
				type = nil
				signalsExperimentalModule.batch(function()
					-- upvalues: actionHandlersModule (copy), value (copy), p2 (ref), type (write), p1 (copy)
					actionHandlersModule.handleAction(value, p2)
					type = p1(p2)
				end)
				
				return type
			end
			type = value[p2.type]
			
			if type and #type > 0 then
				signalsExperimentalModule.batch(function()
					-- upvalues: type (ref), p2 (ref), p1 (copy)
					local var1 = true
					
					for i, v in type do
						var1 = v(p2) and var1
					end
					return if var1 then nil else p1(p2)
				end)
				
				return nil
			end
			return p1(p2)
		end
	end
end