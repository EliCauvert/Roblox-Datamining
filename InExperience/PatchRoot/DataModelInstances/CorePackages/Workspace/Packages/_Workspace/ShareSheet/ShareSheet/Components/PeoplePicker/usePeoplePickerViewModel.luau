local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.AppChat.GetConversationListStore)
local _ = require(script.Parent.PeoplePickerHeader.PeoplePickerHeaderContainer)
local _ = require(script.Parent.PeoplePickerList.PeoplePickerListContainer)
local UsePeoplePickerPaginationModule = require(script.Parent.usePeoplePickerPagination)
local _ = require(ShareSheet.Types)
local ShareSheetPeoplePickerSearchDebounceMs = game:DefineFastInt("ShareSheetPeoplePickerSearchDebounceMs", 250)

local function usePeoplePickerSearch() --[[ Line: 45 ]]
	-- upvalues: ReactModule (copy), ShareSheetPeoplePickerSearchDebounceMs (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	ReactModule.useEffect(function() --[[ Line: 49 ]]
		-- upvalues: UseStateResult (copy), UseStateResult1 (copy), ShareSheetPeoplePickerSearchDebounceMs (upval), UseStateResult2_1 (copy)
		if UseStateResult == UseStateResult1 then return end
		local Flag = false
		local DelayedThread = task.delay(ShareSheetPeoplePickerSearchDebounceMs / 1000, function() --[[ Line: 55 ]]
			-- upvalues: Flag (ref), UseStateResult2_1 (upval), UseStateResult (upval)
			if not Flag then
				UseStateResult2_1(UseStateResult)
			end
		end)
		
		return function() --[[ Line: 60 ]]
			-- upvalues: Flag (ref), DelayedThread (copy)
			Flag = true
			pcall(task.cancel, DelayedThread)
		end
	end, { UseStateResult1, UseStateResult })
	
	return {
		debouncedQuery = UseStateResult1,
		query = UseStateResult,
		reset = ReactModule.useCallback(function() --[[ Line: 66 ]]
			-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy)
			UseStateResult2("")
			UseStateResult2_1("")
		end, {}),
		setQuery = UseStateResult2
	}
end

return function(p1) --[[ Line: 79 | Named "usePeoplePickerViewModel" ]]
	-- upvalues: usePeoplePickerSearch (copy), UsePeoplePickerPaginationModule (copy), ReactModule (copy)
	local UsePeoplePickerSearchResult = usePeoplePickerSearch()
	local UsePeoplePickerPaginationModuleResult = UsePeoplePickerPaginationModule({
		conversationCount = #p1.conversations,
		isEligibilityLoading = p1.isEligibilityLoading,
		isPeoplePickerDisplayed = p1.isPeoplePickerDisplayed,
		listStatus = p1.listStatus,
		loadMore = p1.loadMore,
		listResult = p1.listResult
	})
	
	return {
		viewModel = {
			headerProps = {
				goBack = ReactModule.useCallback(function() --[[ Line: 90 ]]
					-- upvalues: UsePeoplePickerSearchResult (copy), p1 (copy)
					UsePeoplePickerSearchResult.reset()
					p1.onBack()
				end, { p1.onBack, UsePeoplePickerSearchResult.reset }),
				query = UsePeoplePickerSearchResult.query,
				setQuery = UsePeoplePickerSearchResult.setQuery
			},
			listProps = {
				LayoutOrder = 1,
				conversations = p1.conversations,
				debouncedQuery = UsePeoplePickerSearchResult.debouncedQuery,
				isLoading = UsePeoplePickerPaginationModuleResult.isLoading,
				onConversationActivated = p1.onConversationActivated,
				paginationProps = UsePeoplePickerPaginationModuleResult.paginationProps,
				selectedConversationIds = p1.selectedConversationIds
			}
		}
	}
end