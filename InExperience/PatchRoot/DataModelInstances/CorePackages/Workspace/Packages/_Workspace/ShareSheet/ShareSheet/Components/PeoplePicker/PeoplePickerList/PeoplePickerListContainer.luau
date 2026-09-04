local reactModule = require(script:FindFirstAncestor("ShareSheet").Parent.React)
local peoplePickerEmptyStateModule = require(script.Parent.PeoplePickerEmptyState)
local peoplePickerListViewModule = require(script.Parent.PeoplePickerListView)
local usePeoplePickerListItemViewModelModule = require(script.Parent.usePeoplePickerListItemViewModel)
local usePeoplePickerListViewModelModule = require(script.Parent.usePeoplePickerListViewModel)

local function PeoplePickerListItem(p1)
	-- upvalues: usePeoplePickerListItemViewModelModule (ref), reactModule (ref), peoplePickerListViewModule (ref)
	return reactModule.createElement(peoplePickerListViewModule.Item, usePeoplePickerListItemViewModelModule(p1))
end

local function createSkeletonItems(p1, p2)
	-- upvalues: reactModule (ref), PeoplePickerListItem (ref)
	local t = {}
	
	for i = 1, p2 do
		t[`Skeleton{i}`] = reactModule.createElement(PeoplePickerListItem, {
			description = "",
			isLoading = true,
			isSelected = false,
			primaryUserId = "",
			title = "",
			onActivated = function() end,
			LayoutOrder = p1 + i,
			testId = `share-sheet-people-picker-skeleton--{i}`
		})
	end
	return t
end

return function(p3)
	-- upvalues: usePeoplePickerListViewModelModule (ref), reactModule (ref), PeoplePickerListItem (ref), createSkeletonItems (ref), peoplePickerEmptyStateModule (ref), peoplePickerListViewModule (ref)
	local var1 = usePeoplePickerListViewModelModule(p3)
	local t = {}
	
	for i, v in var1.items do
		t[v.id] = reactModule.createElement(PeoplePickerListItem, {
			description = v.description,
			isLoading = v.isLoading,
			isSelected = v.isSelected,
			primaryUserId = v.primaryUserId,
			secondUserId = v.secondUserId,
			title = v.displayName,
			onActivated = function()
				-- upvalues: var1 (ref), v (ref)
				var1.onConversationActivated(v.id)
			end,
			LayoutOrder = i,
			testId = `share-sheet-people-picker-row--{v.id}`
		})
	end
	for i_1, v_1 in createSkeletonItems(#var1.items, var1.skeletonCount) do
		t[i_1] = v_1
	end
	return if var1.shouldShowEmptyState then reactModule.createElement(peoplePickerEmptyStateModule, {
		testId = "share-sheet-people-picker-empty-state",
		LayoutOrder = var1.LayoutOrder
	}) else reactModule.createElement(peoplePickerListViewModule.Root, {
		testId = "share-sheet-people-picker-list",
		LayoutOrder = var1.LayoutOrder
	}, t)
end