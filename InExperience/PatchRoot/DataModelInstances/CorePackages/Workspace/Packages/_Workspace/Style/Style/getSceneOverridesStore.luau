local var0 = nil
local t = {}
local t_1 = {
	getSceneOverrides = function() --[[ line: 24 ]]
		-- upvalues: var0 (write)
		return var0
	end,
	setSceneOverrides = function(value) --[[ line: 27 ]]
		-- upvalues: var0 (write), t (ref)
		var0 = value
		
		for i, v in t do
			v(value)
		end
	end,
	subscribe = function(p0) --[[ line: 33 ]]
		-- upvalues: t (ref)
		table.insert(t, p0)
		
		return function() --[[ line: 35 ]]
			-- upvalues: t (copy), p0 (ref)
			local index = table.find(t, p0)
			
			if index then
				table.remove(t, index)
			end
		end
	end
}

return function() --[[ line: 44 | named "getSceneOverridesStore" ]]
	-- upvalues: t_1 (ref)
	return t_1
end