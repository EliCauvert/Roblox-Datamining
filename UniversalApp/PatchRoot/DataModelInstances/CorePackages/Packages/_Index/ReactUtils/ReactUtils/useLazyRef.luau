local ReactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(Callback)
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	
	if UseRefResult.current == nil then
		UseRefResult.current = Callback()
	end
	assert(UseRefResult.current ~= nil, "Ref must be defined after initialization function is called")
	
	return UseRefResult
end