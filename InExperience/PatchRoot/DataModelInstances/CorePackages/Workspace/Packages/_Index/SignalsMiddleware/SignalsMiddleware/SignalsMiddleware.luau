local signalsExperimentalModule = require(script.Parent.Parent.SignalsExperimental)

return function(value) --[[ line: 4 | named "createSignalsMiddleware" ]]
	-- upvalues: signalsExperimentalModule (ref)
	return function(p0, _) --[[ line: 5 ]]
		-- upvalues: value (ref), signalsExperimentalModule (copy)
		return function(p1) --[[ line: 6 ]]
			-- upvalues: value (copy), signalsExperimentalModule (copy), p0 (ref)
			local type = value[p1.type]
			
			if type and #type > 0 then
				signalsExperimentalModule.batch(function() --[[ line: 10 ]]
					-- upvalues: type (ref), p1 (ref), p0 (copy)
					local var1 = true
					
					for i, v in type do
						var1 = v(p1) and var1
					end
					return if var1 then nil else p0(p1)
				end)
				
				return nil
			end
			return p0(p1)
		end
	end
end