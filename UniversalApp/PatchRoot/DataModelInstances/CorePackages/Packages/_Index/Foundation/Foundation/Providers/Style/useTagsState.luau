local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return function()
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState({})
	
	return var1, reactModule.useCallback(function(...)
		-- upvalues: var2 (ref)
		local t = {}
		
		for i, v in { ... } do
			for i_1, v_1 in string.split(v, " ") do
				table.insert(t, v_1)
			end
		end
		var2(function(p0)
			-- upvalues: t (ref)
			local var4 = false
			
			for i, v in t do
				if p0[v] ~= true then
					var4 = true
					break
				end
			end
			if not var4 then
				return p0
			end
			local cloned = table.clone(p0)
			
			for v, v_1 in t do
				cloned[v_1] = true
			end
			return cloned
		end)
	end, { var2 })
end