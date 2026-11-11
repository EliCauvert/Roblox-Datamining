local ReactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(Current)
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), Current (copy)
		UseRefResult.current = Current
	end)
	
	return UseRefResult.current
end