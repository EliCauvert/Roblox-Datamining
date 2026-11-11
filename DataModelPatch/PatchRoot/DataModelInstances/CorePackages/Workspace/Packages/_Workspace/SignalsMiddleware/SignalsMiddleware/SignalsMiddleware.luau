local SignalsExperimentalModule = require(script.Parent.Parent.SignalsExperimental)

return function(p1)
	-- upvalues: SignalsExperimentalModule (copy)
	return function(Callback, _)
		-- upvalues: p1 (copy), SignalsExperimentalModule (upval)
		return function(p2)
			-- upvalues: p1 (upval), SignalsExperimentalModule (upval), Callback (copy)
			local v1 = p1[p2.type]
			
			if v1 and #v1 > 0 then
				SignalsExperimentalModule.batch(function()
					-- upvalues: v1 (copy), p2 (copy), Callback (upval)
					local v2 = true
					
					for _, value in v1 do
						v2 = value(p2) and v2
					end
					return if v2 then nil else Callback(p2)
				end)
				
				return nil
			else
				return Callback(p2)
			end
		end
	end
end