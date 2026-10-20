local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return function(Callback)
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.zero)
	
	return UseStateResult, (ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2 (copy), Callback (copy)
		UseStateResult2(Frame.AbsoluteSize)
		
		if Callback then
			Callback(Frame)
		end
	end, { Callback }))
end