local ReactModule = require(script:FindFirstAncestor("RoactAppExperiment").Parent.React)

return function(Current) --[[ Line: 9 | Named "usePrevious" ]]
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function() --[[ Line: 11 ]]
		-- upvalues: UseRefResult (copy), Current (copy)
		UseRefResult.current = Current
	end)
	
	return UseRefResult.current
end