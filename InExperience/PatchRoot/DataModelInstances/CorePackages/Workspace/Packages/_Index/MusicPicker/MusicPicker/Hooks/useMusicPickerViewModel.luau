local musicPicker = script:FindFirstAncestor("MusicPicker")
local reactModule = require(musicPicker.Parent.React)
local _ = require(musicPicker.Types.MusicPickerTypes)

return function(p1)
	-- upvalues: reactModule (ref)
	local tabs = p1.tabs
	local onQueryChanged = p1.onQueryChanged
	local onTabChanged = p1.onTabChanged
	local var1, var2 = reactModule.useState("")
	local var3, var4 = reactModule.useState("")
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
	
	return {
		searchText = var1,
		submittedQuery = var3,
		mode = if var3 == "" then "tabs" else "search",
		activeTabId = var5,
		onSearchChanged = reactModule.useCallback(function(p2)
			-- upvalues: var2 (ref), var4 (ref), onQueryChanged (ref)
			var2(p2)
			
			if p2 == "" then
				var4("")
				
				if onQueryChanged ~= nil then
					onQueryChanged("")
				end
			end
		end, { onQueryChanged }),
		onSubmitSearch = reactModule.useCallback(function()
			-- upvalues: var4 (ref), var1 (ref), onQueryChanged (ref)
			var4(var1)
			
			if onQueryChanged ~= nil then
				onQueryChanged(var1)
			end
		end, { onQueryChanged, var1 }),
		onTabSelected = reactModule.useCallback(function(p2)
			-- upvalues: var6 (ref), onTabChanged (ref)
			var6(p2)
			
			if onTabChanged ~= nil then
				onTabChanged(p2)
			end
		end, { onTabChanged })
	}
end