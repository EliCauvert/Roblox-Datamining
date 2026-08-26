local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(p1, p2)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef({})
	local var2 = reactModule.useRef(p1)
	
	if #var1.current < p1 then
		for _ = 1, p1 - #var1.current do
			local var3 = reactModule.createRef()
			var3.current = p2
			table.insert(var1.current, var3)
		end
	elseif p1 < var2.current then
		for i = p1 + 1, var2.current do
			var1.current[i].current = p2
		end
	end
	var2.current = p1
	
	return reactModule.useMemo(function()
		-- upvalues: var1 (ref), p1 (ref)
		return table.move(var1.current, 1, p1, 1, {})
	end, { p1 })
end