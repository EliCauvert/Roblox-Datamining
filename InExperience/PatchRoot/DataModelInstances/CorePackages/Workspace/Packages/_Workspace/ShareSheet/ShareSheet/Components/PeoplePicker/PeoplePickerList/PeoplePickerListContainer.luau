local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local peoplePickerEmptyStateModule = require(script.Parent.PeoplePickerEmptyState)
local peoplePickerVirtualizedListModule = require(script.Parent.PeoplePickerVirtualizedList)
local usePeoplePickerListViewModelModule = require(script.Parent.usePeoplePickerListViewModel)
local _ = require(shareSheet.Components.PeoplePicker.usePeoplePickerPagination)
local view = foundationModule.View

return function(p1)
	-- upvalues: usePeoplePickerListViewModelModule (ref), reactModule (ref), view (ref), peoplePickerVirtualizedListModule (ref), peoplePickerEmptyStateModule (ref)
	local var1 = usePeoplePickerListViewModelModule(p1)
	
	return reactModule.createElement(view, {
		testId = "share-sheet-people-picker-list",
		LayoutOrder = p1.LayoutOrder,
		Size = UDim2.fromScale(1, 1)
	}, {
		List = reactModule.createElement(peoplePickerVirtualizedListModule, {
			debouncedQuery = p1.debouncedQuery,
			items = var1.items,
			onConversationActivated = p1.onConversationActivated,
			paginationProps = p1.paginationProps,
			skeletonCount = var1.skeletonCount
		}),
		EmptyState = if var1.shouldShowEmptyState then reactModule.createElement(peoplePickerEmptyStateModule, { testId = "share-sheet-people-picker-empty-state" }) else nil
	})
end