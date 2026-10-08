local musicPicker = script:FindFirstAncestor("MusicPicker")
local reactModule = require(musicPicker.Parent.React)
local _ = require(musicPicker.Types.MusicPickerTypes)
local fFlagMusicPickerSearchDebounceModule = require(musicPicker.Flags.FFlagMusicPickerSearchDebounce)

return function(p1)
	-- upvalues: reactModule (ref), fFlagMusicPickerSearchDebounceModule (ref)
	local tabs = p1.tabs
	local onQueryChanged = p1.onQueryChanged
	local onTabChanged = p1.onTabChanged
	local initialQuery = p1.initialQuery or ""
	local var1, var2 = reactModule.useState(initialQuery)
	local var3, var4 = reactModule.useState(initialQuery)
	local var5, var6 = reactModule.useState(if #tabs > 0 then tabs[1].id else nil)
	reactModule.useEffect(function()
		-- upvalues: tabs (ref), var5 (ref), var6 (ref)
		local var7 = false
		
		for i, v in tabs do
			if v.id == var5 then
				var7 = true
				break
			end
		end
		if not var7 then
			var6(if #tabs > 0 then tabs[1].id else nil)
		end
	end, { tabs, var5 })
	local var8 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), var4 (ref), onQueryChanged (ref)
		var2(p2)
		
		if p2 == "" then
			var4("")
			
			if onQueryChanged ~= nil then
				onQueryChanged("")
			end
		end
	end, { onQueryChanged })
	local var9 = reactModule.useCallback(function()
		-- upvalues: fFlagMusicPickerSearchDebounceModule (copy), var1 (ref), var3 (ref), var4 (ref), onQueryChanged (ref)
		if fFlagMusicPickerSearchDebounceModule and var1 == var3 then return end
		var4(var1)
		
		if onQueryChanged ~= nil then
			onQueryChanged(var1)
		end
	end, {
		onQueryChanged,
		var1,
		if fFlagMusicPickerSearchDebounceModule then var3 else false
	})
	
	if fFlagMusicPickerSearchDebounceModule then
		reactModule.useEffect(function()
			-- upvalues: var1 (ref), var3 (ref), var4 (ref), onQueryChanged (ref)
			if var1 == "" or var1 == var3 then
				return nil
			end
			local var10 = false
			task.delay(0.3, function()
				-- upvalues: var10 (write), var4 (copy), var1 (copy), onQueryChanged (copy)
				if var10 then return end
				var4(var1)
				
				if onQueryChanged ~= nil then
					onQueryChanged(var1)
				end
			end)
			
			return function()
				-- upvalues: var10 (write)
				var10 = true
			end
		end, { var1, var3, onQueryChanged })
	end
	return {
		searchText = var1,
		submittedQuery = var3,
		mode = if var3 == "" then "tabs" else "search",
		activeTabId = var5,
		onSearchChanged = var8,
		onSubmitSearch = var9,
		onTabSelected = reactModule.useCallback(function(p2)
			-- upvalues: var6 (ref), onTabChanged (ref)
			var6(p2)
			
			if onTabChanged ~= nil then
				onTabChanged(p2)
			end
		end, { onTabChanged })
	}
end