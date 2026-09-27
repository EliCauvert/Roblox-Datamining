local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)

return function(value)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useBinding(value or "")
	local var3 = reactModule.useRef({})
	reactModule.useEffect(function()
		-- upvalues: value (ref), var3 (ref), var1 (ref), var2 (ref)
		local value_1 = value or ""
		local current = var3.current
		local index = table.find(current, value_1)
		
		if index == nil then
			table.clear(current)
			
			if var1:getValue() ~= value_1 then
				var2(value_1)
			end
			return
		else
			for _ = 1, index do
				table.remove(current, 1)
			end
		end
	end, { value })
	
	return var1, reactModule.useCallback(function(p1)
		-- upvalues: var3 (ref), var2 (ref)
		table.insert(var3.current, p1)
		var2(p1)
	end, { var2 })
end