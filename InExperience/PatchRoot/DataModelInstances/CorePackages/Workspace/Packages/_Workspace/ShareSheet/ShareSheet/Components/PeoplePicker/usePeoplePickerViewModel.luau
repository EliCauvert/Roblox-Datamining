local parent = script:FindFirstAncestor("ShareSheet").Parent
local reactModule = require(parent.React)
local _ = require(parent.AppChat.GetConversationListStore)
local _ = require(script.Parent.PeoplePickerHeader.PeoplePickerHeaderContainer)
local _ = require(script.Parent.PeoplePickerList.usePeoplePickerListViewModel)
local shareSheetPeoplePickerSearchDebounceMs = game:DefineFastInt("ShareSheetPeoplePickerSearchDebounceMs", 250)

local function usePeoplePickerSearch()
	-- upvalues: reactModule (ref), shareSheetPeoplePickerSearchDebounceMs (ref)
	local var1, var2 = reactModule.useState("")
	local var3, var4 = reactModule.useState("")
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var3 (ref), shareSheetPeoplePickerSearchDebounceMs (copy), var4 (ref)
		if var1 == var3 then
			return
		end
		local var5 = false
		local delayedThread = task.delay(shareSheetPeoplePickerSearchDebounceMs / 1000, function()
			-- upvalues: var5 (write), var4 (copy), var1 (copy)
			if not var5 then
				var4(var1)
			end
		end)
		
		return function()
			-- upvalues: var5 (write), delayedThread (ref)
			var5 = true
			pcall(task.cancel, delayedThread)
		end
	end, { var3, var1 })
	
	return {
		debouncedQuery = var3,
		query = var1,
		reset = reactModule.useCallback(function()
			-- upvalues: var2 (ref), var4 (ref)
			var2("")
			var4("")
		end, {}),
		setQuery = var2
	}
end

return function(p1)
	-- upvalues: usePeoplePickerSearch (ref), reactModule (ref)
	local var1 = usePeoplePickerSearch()
	
	return {
		viewModel = {
			headerProps = {
				goBack = reactModule.useCallback(function()
					-- upvalues: var1 (ref), p1 (ref)
					var1.reset()
					p1.onBack()
				end, { p1.onBack, var1.reset }),
				query = var1.query,
				setQuery = var1.setQuery
			},
			listProps = {
				LayoutOrder = 1,
				conversations = p1.conversations,
				debouncedQuery = var1.debouncedQuery,
				isLoading = p1.isLoading,
				onConversationActivated = p1.onConversationActivated,
				selectedConversationIds = p1.selectedConversationIds
			}
		}
	}
end