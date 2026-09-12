local reactModule = require(script:FindFirstAncestor("AccountUpgrade").Parent.React)

return function(value, p1)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(value or "")
	local var3 = reactModule.useRef(var1)
	
	return {
		value = var1,
		valueRef = var3,
		onChanged = reactModule.useCallback(function(p2)
			-- upvalues: var3 (ref), var2 (ref), p1 (ref)
			var3.current = p2
			var2(p2)
			p1(p2)
		end, { p1 })
	}
end