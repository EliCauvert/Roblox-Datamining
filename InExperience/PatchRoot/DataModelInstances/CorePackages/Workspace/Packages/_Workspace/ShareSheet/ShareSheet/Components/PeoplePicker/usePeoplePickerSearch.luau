local ReactModule = require(script:FindFirstAncestor("ShareSheet").Parent.React)
local ShareSheetPeoplePickerSearchDebounceMs = game:DefineFastInt("ShareSheetPeoplePickerSearchDebounceMs", 250)

return function()
	-- upvalues: ReactModule (copy), ShareSheetPeoplePickerSearchDebounceMs (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseStateResult1 (copy), ShareSheetPeoplePickerSearchDebounceMs (upval), UseStateResult2_1 (copy)
		if UseStateResult == UseStateResult1 then return end
		local Flag = false
		local DelayedThread = task.delay(ShareSheetPeoplePickerSearchDebounceMs / 1000, function()
			-- upvalues: Flag (ref), UseStateResult2_1 (upval), UseStateResult (upval)
			if not Flag then
				UseStateResult2_1(UseStateResult)
			end
		end)
		
		return function()
			-- upvalues: Flag (ref), DelayedThread (copy)
			Flag = true
			pcall(task.cancel, DelayedThread)
		end
	end, { UseStateResult1, UseStateResult })
	
	return {
		debouncedQuery = UseStateResult1,
		query = UseStateResult,
		reset = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy)
			UseStateResult2("")
			UseStateResult2_1("")
		end, {}),
		setQuery = UseStateResult2
	}
end