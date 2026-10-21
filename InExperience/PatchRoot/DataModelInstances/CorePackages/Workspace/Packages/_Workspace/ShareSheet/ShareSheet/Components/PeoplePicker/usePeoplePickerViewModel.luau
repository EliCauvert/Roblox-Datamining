local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local ReactModule = require(Parent.React)
local FFlagShareSheetFriendsSort = require(Parent.SharedFlags).FFlagShareSheetFriendsSort
local _ = require(Parent.AppChat.GetConversationListStore)
local _ = require(script.Parent.PeoplePickerHeader.PeoplePickerHeaderContainer)
local _ = require(script.Parent.PeoplePickerList.PeoplePickerListContainer)
local UsePeoplePickerPaginationModule = require(script.Parent.usePeoplePickerPagination)
local UsePeoplePickerSearchModule = require(script.Parent.usePeoplePickerSearch)
local _ = require(ShareSheet.Recipients.Recipient)
local _ = require(ShareSheet.Types)

return function(p1)
	-- upvalues: FFlagShareSheetFriendsSort (copy), UsePeoplePickerSearchModule (copy), UsePeoplePickerPaginationModule (copy), ReactModule (copy)
	local Search = if FFlagShareSheetFriendsSort then p1.search else UsePeoplePickerSearchModule()
	local UsePeoplePickerPaginationModuleResult = UsePeoplePickerPaginationModule({
		conversationCount = if FFlagShareSheetFriendsSort then #p1.recipients else #p1.conversations,
		isEligibilityLoading = p1.isEligibilityLoading,
		isPeoplePickerDisplayed = p1.isPeoplePickerDisplayed,
		listStatus = p1.listStatus,
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
				conversations = p1.conversations,
				recipients = p1.recipients,
				filterQuery = if FFlagShareSheetFriendsSort then p1.filterQuery else Search.debouncedQuery,
				scrollResetQuery = Search.debouncedQuery,
				isLoading = UsePeoplePickerPaginationModuleResult.isLoading,
				onConversationActivated = p1.onConversationActivated,
				paginationProps = UsePeoplePickerPaginationModuleResult.paginationProps,
				selectedConversationIds = p1.selectedConversationIds
			}
		}
	}
end