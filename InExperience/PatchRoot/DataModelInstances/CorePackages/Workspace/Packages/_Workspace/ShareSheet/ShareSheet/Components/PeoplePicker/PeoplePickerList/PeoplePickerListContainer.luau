local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local ReactModule = require(Parent.React)
local PeoplePickerEmptyStateModule = require(script.Parent.PeoplePickerEmptyState)
local PeoplePickerVirtualizedListModule = require(script.Parent.PeoplePickerVirtualizedList)
local UsePeoplePickerListViewModelModule = require(script.Parent.usePeoplePickerListViewModel)
local _ = require(ShareSheet.Components.PeoplePicker.usePeoplePickerPagination)
local View = require(Parent.Foundation).View

return function(Frame) --[[ Line: 20 | Named "PeoplePickerListContainer" ]]
	-- upvalues: UsePeoplePickerListViewModelModule (copy), ReactModule (copy), View (copy), PeoplePickerVirtualizedListModule (copy), PeoplePickerEmptyStateModule (copy)
	local UsePeoplePickerListViewModelModuleResult = UsePeoplePickerListViewModelModule(Frame)
	
	return ReactModule.createElement(View, {
		testId = "share-sheet-people-picker-list",
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.fromScale(1, 1)
	}, {
		List = ReactModule.createElement(PeoplePickerVirtualizedListModule, {
			debouncedQuery = Frame.debouncedQuery,
			items = UsePeoplePickerListViewModelModuleResult.items,
			onConversationActivated = Frame.onConversationActivated,
			paginationProps = Frame.paginationProps,
			skeletonCount = UsePeoplePickerListViewModelModuleResult.skeletonCount
		}),
		EmptyState = if UsePeoplePickerListViewModelModuleResult.shouldShowEmptyState then ReactModule.createElement(PeoplePickerEmptyStateModule, { testId = "share-sheet-people-picker-empty-state" }) else nil
	})
end