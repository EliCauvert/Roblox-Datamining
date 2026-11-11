local ReactModule = require(script.Parent.Parent.React)

return function(Callback1, Callback)
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	
	return (ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), Callback (copy), Callback1 (copy)
		if UseRefResult.current and Callback then
			Callback(UseRefResult.current)
		end
		if Current then
			Callback1(Current)
		end
		UseRefResult.current = Current
	end, { Callback1, Callback }))
end