local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)

return function(value) --[[ line: 5 | named "useGetAndSetRef" ]]
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(value)
	
	return reactModule.useCallback(function() --[[ line: 7 ]]
		-- upvalues: var1 (ref)
		return var1.current
	end, {}), reactModule.useCallback(function(p0) --[[ line: 10 ]]
		-- upvalues: var1 (ref)
		if typeof(p0) == "function" then
			var1.current = p0(var1.current)
			
			return
		end
		var1.current = p0
	end, {})
end