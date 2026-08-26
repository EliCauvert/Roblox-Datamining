local var1 = nil
local t = {}
local t_1 = {
	getSceneOverrides = function()
		-- upvalues: var1 (write)
		return var1
	end,
	setSceneOverrides = function(value)
		-- upvalues: var1 (write), t (ref)
		var1 = value
		
		for i, v in t do
			v(value)
		end
	end,
	subscribe = function(p1)
		-- upvalues: t (ref)
		table.insert(t, p1)
		
		return function()
			-- upvalues: t (copy), p1 (ref)
			local index = table.find(t, p1)
			
			if index then
				table.remove(t, index)
			end
		end
	end
}

return function()
	-- upvalues: t_1 (ref)
	return t_1
end