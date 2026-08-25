local var0 = nil
local t = {}
local t_1 = {
	getSceneOverrides = function()
		-- upvalues: var0 (write)
		return var0
	end,
	setSceneOverrides = function(value)
		-- upvalues: var0 (write), t (ref)
		var0 = value
		
		for i, v in t do
			v(value)
		end
	end,
	subscribe = function(p0)
		-- upvalues: t (ref)
		table.insert(t, p0)
		
		return function()
			-- upvalues: t (copy), p0 (ref)
			local index = table.find(t, p0)
			
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