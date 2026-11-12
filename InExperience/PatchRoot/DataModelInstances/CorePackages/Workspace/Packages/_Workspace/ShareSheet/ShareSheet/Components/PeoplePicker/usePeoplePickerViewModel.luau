local ShareSheet = script:FindFirstAncestor("ShareSheet")
local ReactModule = require(ShareSheet.Parent.React)
local _ = require(script.Parent.PeoplePickerHeader.PeoplePickerHeaderContainer)
local _ = require(script.Parent.PeoplePickerList.PeoplePickerListContainer)
local UsePeoplePickerPaginationModule = require(script.Parent.usePeoplePickerPagination)
local _ = require(script.Parent.usePeoplePickerSearch)
local _ = require(ShareSheet.Recipients.Recipient)
local _ = require(ShareSheet.Types)

return function(p1)
	-- upvalues: UsePeoplePickerPaginationModule (copy), ReactModule (copy)
	local Search = p1.search
	local UsePeoplePickerPaginationModuleResult = UsePeoplePickerPaginationModule({
		conversationCount = #p1.recipients,
		isEligibilityLoading = p1.isEligibilityLoading,
		isPeoplePickerDisplayed = p1.isPeoplePickerDisplayed,
		loadMore = p1.loadMore,
		listResult = p1.listResult
	})
	
	return {
		viewModel = {
			headerProps = {
				goBack = ReactModule.useCallback(function()
					-- upvalues: Search (copy), p1 (copy)
					Search.reset()
					p1.onBack()
				end, { p1.onBack, Search.reset }),
				query = Search.query,
				setQuery = Search.setQuery
			},
			listProps = {
				LayoutOrder = 1,
				recipients = p1.recipients,
				filterQuery = p1.filterQuery,
				scrollResetQuery = Search.debouncedQuery,
				isLoading = UsePeoplePickerPaginationModuleResult.isLoading,
				onConversationActivated = p1.onConversationActivated,
				paginationProps = UsePeoplePickerPaginationModuleResult.paginationProps,
				selectedConversationIds = p1.selectedConversationIds
			}
		}
	}
end