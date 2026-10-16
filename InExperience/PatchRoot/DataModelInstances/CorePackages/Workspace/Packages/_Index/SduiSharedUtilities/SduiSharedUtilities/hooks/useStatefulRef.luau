local ReactModule = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.React)

return function(Callback) --[[ Line: 5 | Named "useStatefulRef" ]]
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	
	return UseStateResult, (ReactModule.useCallback(function(Current) --[[ Line: 7 ]]
		-- upvalues: Callback (copy), UseStateResult2 (copy)
		if typeof(Callback) == "function" then
			Callback(Current)
		elseif typeof(Callback) == "table" then
			Callback.current = Current
		end
		UseStateResult2(Current)
	end, { Callback }))
end