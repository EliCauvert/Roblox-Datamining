local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(p0, p1)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), var1 (ref), p1 (ref)
		if var2.current then
			var2.current()
			var2.current = nil
		end
		if p2 then
			var1.current = p2
			var2.current = p1(p2)
		end
	end, { p1 })
	reactModule.useImperativeHandle(p0, function()
		-- upvalues: var1 (ref)
		return var1.current
	end)
	
	return var3
end