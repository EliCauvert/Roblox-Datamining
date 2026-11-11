local ReactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(Current)
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(Current)
	UseRefResult.current = Current
	
	return UseRefResult
end