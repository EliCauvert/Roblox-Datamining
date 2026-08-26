local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(p1, p2)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useCallback(function(p3)
		-- upvalues: var2 (ref), var1 (ref), p2 (ref)
		if var2.current then
			var2.current()
			var2.current = nil
		end
		if p3 then
			var1.current = p3
			var2.current = p2(p3)
		end
	end, { p2 })
	reactModule.useImperativeHandle(p1, function()
		-- upvalues: var1 (ref)
		return var1.current
	end)
	
	return var3
end