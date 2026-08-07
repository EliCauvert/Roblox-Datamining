local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(p0, p1) --[[ line: 14 | named "useRefs" ]]
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef({})
	local var2 = reactModule.useRef(p0)
	
	if #var1.current < p0 then
		for _ = 1, p0 - #var1.current do
			local var3 = reactModule.createRef()
			var3.current = p1
			table.insert(var1.current, var3)
		end
	elseif p0 < var2.current then
		for i = p0 + 1, var2.current do
			var1.current[i].current = p1
		end
	end
	var2.current = p0
	
	return reactModule.useMemo(function() --[[ line: 33 ]]
		-- upvalues: var1 (ref), p0 (ref)
		return table.move(var1.current, 1, p0, 1, {})
	end, { p0 })
end