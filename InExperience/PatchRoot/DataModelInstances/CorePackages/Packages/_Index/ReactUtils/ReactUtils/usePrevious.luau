local ReactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(Current) --[[ Line: 10 | Named "usePrevious" ]]
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function() --[[ Line: 12 ]]
		-- upvalues: UseRefResult (copy), Current (copy)
		UseRefResult.current = Current
	end)
	
	return UseRefResult.current
end