local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)

return function(p1) --[[ Line: 5 | Named "useGetAndSetRef" ]]
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(p1)
	
	return ReactModule.useCallback(function() --[[ Line: 7 ]]
		-- upvalues: UseRefResult (copy)
		return UseRefResult.current
	end, {}), (ReactModule.useCallback(function(Callback) --[[ Line: 10 ]]
		-- upvalues: UseRefResult (copy)
		if typeof(Callback) == "function" then
			UseRefResult.current = Callback(UseRefResult.current)
			
			return
		else
			UseRefResult.current = Callback
		end
	end, {}))
end