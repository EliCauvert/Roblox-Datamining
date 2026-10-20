local SignalsExperimentalModule = require(script.Parent.Parent.SignalsExperimental)

return {
	create = function()
		return {}
	end,
	register = function(p1, Key, p2)
		if not p1[Key] then
			p1[Key] = {}
		end
		table.insert(p1[Key], p2)
	end,
	handleAction = function(p1, p2)
		-- upvalues: SignalsExperimentalModule (copy)
		local v1 = p1[p2.type]
		
		if v1 and #v1 > 0 then
			SignalsExperimentalModule.batch(function()
				-- upvalues: v1 (copy), p2 (copy)
				for _, value in v1 do
					value(p2)
				end
			end)
			
			return
		end
	end
}