local MusicPicker = script:FindFirstAncestor("MusicPicker")
local ReactModule = require(MusicPicker.Parent.React)
local _ = require(MusicPicker.Types.MusicPickerTypes)

return function(p1) --[[ Line: 47 | Named "useMusicPickerViewModel" ]]
	-- upvalues: ReactModule (copy)
	local Tabs = p1.tabs
	local OnQueryChangedFunction = p1.onQueryChanged
	local OnTabChangedFunction = p1.onTabChanged
	local InitialQuery = p1.initialQuery or ""
	local UseStateResult, UseStateResult2 = ReactModule.useState(InitialQuery)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(InitialQuery)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(if #Tabs > 0 then Tabs[1].id else nil)
	ReactModule.useEffect(function() --[[ Line: 61 ]]
		-- upvalues: Tabs (copy), UseStateResult3 (copy), UseStateResult2_2 (copy)
		local Flag = false
		
		for _, tab in Tabs do
			if tab.id == UseStateResult3 then
				Flag = true
				break
			end
		end
		if not Flag then
			UseStateResult2_2(if #Tabs > 0 then Tabs[1].id else nil)
		end
	end, { Tabs, UseStateResult3 })
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 74 ]]
		-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy), OnQueryChangedFunction (copy)
		UseStateResult2(p2)
		
		if p2 == "" then
			UseStateResult2_1("")
			
			if OnQueryChangedFunction ~= nil then
				OnQueryChangedFunction("")
			end
		end
	end, { OnQueryChangedFunction })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 87 ]]
		-- upvalues: UseStateResult (copy), UseStateResult1 (copy), UseStateResult2_1 (copy), OnQueryChangedFunction (copy)
		if UseStateResult == UseStateResult1 then return end
		UseStateResult2_1(UseStateResult)
		
		if OnQueryChangedFunction ~= nil then
			OnQueryChangedFunction(UseStateResult)
		end
	end, { OnQueryChangedFunction, UseStateResult, UseStateResult1 })
	ReactModule.useEffect(function() --[[ Line: 100 ]]
		-- upvalues: UseStateResult (copy), UseStateResult1 (copy), UseStateResult2_1 (copy), OnQueryChangedFunction (copy)
		if UseStateResult == "" or UseStateResult == UseStateResult1 then
			return nil
		else
			local Flag = false
			task.delay(0.3, function() --[[ Line: 105 ]]
				-- upvalues: Flag (ref), UseStateResult2_1 (upval), UseStateResult (upval), OnQueryChangedFunction (upval)
				if Flag then return end
				UseStateResult2_1(UseStateResult)
				
				if OnQueryChangedFunction ~= nil then
					OnQueryChangedFunction(UseStateResult)
				end
			end)
			
			return function() --[[ Line: 114 ]]
				-- upvalues: Flag (ref)
				Flag = true
			end
		end
	end, { UseStateResult, UseStateResult1, OnQueryChangedFunction })
	
	return {
		searchText = UseStateResult,
		submittedQuery = UseStateResult1,
		mode = if UseStateResult1 == "" then "tabs" else "search",
		activeTabId = UseStateResult3,
		onSearchChanged = UseResult,
		onSubmitSearch = UseResult1,
		onTabSelected = ReactModule.useCallback(function(p2) --[[ Line: 119 ]]
			-- upvalues: UseStateResult2_2 (copy), OnTabChangedFunction (copy)
			UseStateResult2_2(p2)
			
			if OnTabChangedFunction ~= nil then
				OnTabChangedFunction(p2)
			end
		end, { OnTabChangedFunction })
	}
end