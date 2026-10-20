local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)

return function(p1)
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(p1)
	
	return ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		return UseRefResult.current
	end, {}), (ReactModule.useCallback(function(Callback)
		-- upvalues: UseRefResult (copy)
		if typeof(Callback) == "function" then
			UseRefResult.current = Callback(UseRefResult.current)
			
			return
		else
			UseRefResult.current = Callback
		end
	end, {}))
end