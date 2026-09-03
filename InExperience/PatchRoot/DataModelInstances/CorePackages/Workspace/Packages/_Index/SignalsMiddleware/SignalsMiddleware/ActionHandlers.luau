local signalsExperimentalModule = require(script.Parent.Parent.SignalsExperimental)

return {
	create = function()
		return {}
	end,
	register = function(p1, p2, p3)
		if not p1[p2] then
			p1[p2] = {}
		end
		table.insert(p1[p2], p3)
	end,
	handleAction = function(p1, p2)
		-- upvalues: signalsExperimentalModule (ref)
		local type = p1[p2.type]
		
		if type and #type > 0 then
			signalsExperimentalModule.batch(function()
				-- upvalues: type (ref), p2 (ref)
				for i, v in type do
					v(p2)
				end
			end)
			
			return
		end
	end
}