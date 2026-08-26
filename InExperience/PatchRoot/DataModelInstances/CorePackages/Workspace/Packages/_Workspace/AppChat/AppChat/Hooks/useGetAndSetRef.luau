local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)

return function(value)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(value)
	
	return reactModule.useCallback(function()
		-- upvalues: var1 (ref)
		return var1.current
	end, {}), reactModule.useCallback(function(p1)
		-- upvalues: var1 (ref)
		if typeof(p1) == "function" then
			var1.current = p1(var1.current)
			
			return
		end
		var1.current = p1
	end, {})
end