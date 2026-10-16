local ReactModule = require(script:FindFirstAncestor("AccountUpgrade").Parent.React)

return function(p1, Callback) --[[ Line: 17 | Named "useTextFieldValue" ]]
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1 or "")
	local UseRefResult = ReactModule.useRef(UseStateResult)
	
	return {
		value = UseStateResult,
		valueRef = UseRefResult,
		onChanged = ReactModule.useCallback(function(Current) --[[ Line: 21 ]]
			-- upvalues: UseRefResult (copy), UseStateResult2 (copy), Callback (copy)
			UseRefResult.current = Current
			UseStateResult2(Current)
			Callback(Current)
		end, { Callback })
	}
end