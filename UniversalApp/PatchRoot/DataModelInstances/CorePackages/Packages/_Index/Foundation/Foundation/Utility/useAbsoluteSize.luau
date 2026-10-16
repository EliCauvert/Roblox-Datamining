local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return function(Callback) --[[ Line: 8 | Named "useAbsoluteSize" ]]
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.zero)
	
	return UseStateResult, (ReactModule.useCallback(function(Frame) --[[ Line: 11 ]]
		-- upvalues: UseStateResult2 (copy), Callback (copy)
		UseStateResult2(Frame.AbsoluteSize)
		
		if Callback then
			Callback(Frame)
		end
	end, { Callback }))
end