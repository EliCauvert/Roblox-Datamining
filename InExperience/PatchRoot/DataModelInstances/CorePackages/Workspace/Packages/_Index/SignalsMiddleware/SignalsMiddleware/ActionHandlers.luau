local SignalsExperimentalModule = require(script.Parent.Parent.SignalsExperimental)

return {
	create = function() --[[ Line: 13 ]]
		return {}
	end,
	register = function(p1, Key, p2) --[[ Line: 18 ]]
		if not p1[Key] then
			p1[Key] = {}
		end
		table.insert(p1[Key], p2)
	end,
	handleAction = function(p1, p2) --[[ Line: 28 ]]
		-- upvalues: SignalsExperimentalModule (copy)
		local v1 = p1[p2.type]
		
		if v1 and #v1 > 0 then
			SignalsExperimentalModule.batch(function() --[[ Line: 35 ]]
				-- upvalues: v1 (copy), p2 (copy)
				for _, value in v1 do
					value(p2)
				end
			end)
			
			return
		end
	end
}