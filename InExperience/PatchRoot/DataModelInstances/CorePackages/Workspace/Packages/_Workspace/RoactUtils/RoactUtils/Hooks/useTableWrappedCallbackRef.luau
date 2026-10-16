local ReactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)

return function(p1) --[[ Line: 12 | Named "useTableWrappedCallbackRef" ]]
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useImperativeHandle(p1, function() --[[ Line: 20 ]]
		-- upvalues: UseRefResult (copy)
		return UseRefResult.current
	end)
	
	return UseRefResult
end