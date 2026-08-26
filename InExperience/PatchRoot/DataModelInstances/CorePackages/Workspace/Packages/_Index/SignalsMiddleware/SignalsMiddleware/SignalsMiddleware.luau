local signalsExperimentalModule = require(script.Parent.Parent.SignalsExperimental)

return function(value)
	-- upvalues: signalsExperimentalModule (ref)
	return function(p1, _)
		-- upvalues: value (ref), signalsExperimentalModule (copy)
		return function(p2)
			-- upvalues: value (copy), signalsExperimentalModule (copy), p1 (ref)
			local type = value[p2.type]
			
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