local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local viewRecyclerModule = require(parent.ViewRecycler)
local peoplePickerListViewModule = require(script.Parent.PeoplePickerListView)
local shareSheetConstantsModule = require(shareSheet.ShareSheetConstants)
local usePeoplePickerListItemViewModelModule = require(script.Parent.usePeoplePickerListItemViewModel)
local _ = require(script.Parent.usePeoplePickerListViewModel)
local _ = require(shareSheet.Components.PeoplePicker.usePeoplePickerPagination)
local useTokens = foundationModule.Hooks.useTokens

local function PeoplePickerListItem(p1)
	-- upvalues: usePeoplePickerListItemViewModelModule (ref), reactModule (ref), peoplePickerListViewModule (ref)
	return reactModule.createElement(peoplePickerListViewModule.Item, usePeoplePickerListItemViewModelModule(p1))
end

local function getItemKey(p1)
	return if p1.kind == "conversation" then `item--{p1.item.id}` else `skeleton--{p1.index}`
end

local var1 = viewRecyclerModule.createRecyclableView(function(p1)
	-- upvalues: signalsReactModule (ref), reactModule (ref), PeoplePickerListItem (ref)
	local var2 = signalsReactModule.useSignalState(p1.itemSignal)
	local item = var2.item
	
	return reactModule.createElement(PeoplePickerListItem, {
		description = item.description,
		isLoading = item.isLoading,
		isSelected = item.isSelected,
		primaryUserId = item.primaryUserId,
		secondUserId = item.secondUserId,
		title = item.displayName,
		onActivated = function()
			-- upvalues: var2 (ref), item (ref)
			var2.onConversationActivated(item.id)
		end,
		testId = `share-sheet-people-picker-row--{item.id}`
	})
end)
local var2 = viewRecyclerModule.createRecyclableView(function(p1)
	-- upvalues: signalsReactModule (ref), reactModule (ref), PeoplePickerListItem (ref)
	return reactModule.createElement(PeoplePickerListItem, {
		description = "",
		isLoading = true,
		isSelected = false,
		primaryUserId = "",
		title = "",
		onActivated = function() end,
		testId = `share-sheet-people-picker-skeleton--{signalsReactModule.useSignalState(p3.itemSignal).index}`
	})
end)

local function getItemType(p1)
	-- upvalues: var1 (ref), var2 (ref)
	return if p1.kind == "conversation" then var1 else var2
end

local function useMeasuredLayout(p1)
	-- upvalues: reactModule (ref), viewRecyclerModule (ref)
	local var3 = reactModule.useMemo(function()
		-- upvalues: viewRecyclerModule (copy), p1 (ref)
		return viewRecyclerModule.Layout.measured({ estimatedItemLength = p1 })
	end, { p1 })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref)
		return function()
			-- upvalues: var3 (copy)
			var3.destroy()
		end
	end, { var3 })
	
	return var3
end

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), getItemKey (ref), peoplePickerListViewModule (ref), useMeasuredLayout (ref), viewRecyclerModule (ref), getItemType (ref), shareSheetConstantsModule (ref)
	local var3 = useTokens()
	local var4 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		local itemsCount = #p1.items
		local list = table.create(itemsCount + p1.skeletonCount)
		
		for i, v in p1.items do
			list[i] = {
				kind = "conversation",
				item = v,
				onConversationActivated = p1.onConversationActivated
			}
		end
		for i_1 = 1, p1.skeletonCount do
			list[itemsCount + i_1] = { kind = "skeleton", index = i_1 }
		end
		return list
	end, { p1.items, p1.onConversationActivated, p1.skeletonCount })
	local var5 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), getItemKey (copy)
		return { items = var4, getItemKey = getItemKey }
	end, { var4 })
	local var6 = useMeasuredLayout(peoplePickerListViewModule.getItemLayoutMetrics(var3).estimatedRowHeight)
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useRef(p1.debouncedQuery)
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), p1 (ref), var7 (ref)
		if var8.current == p1.debouncedQuery then return end
		var8.current = p1.debouncedQuery
		local current = var7.current
		
		if current then
			current.scrollToOffset(0)
		end
	end, { p1.debouncedQuery })
	
	return reactModule.createElement(viewRecyclerModule.VirtualList, {
		data = var5,
		layout = var6,
		axis = viewRecyclerModule.Axis.Y,
		itemType = getItemType,
		overscan = math.max(0, shareSheetConstantsModule.FIntShareSheetPeoplePickerOverscanRows),
		endReachedThreshold = p1.paginationProps.endReachedThreshold,
		listRef = var7,
		onContentLengthChanged = p1.paginationProps.onContentLengthChanged,
		onEndReached = p1.paginationProps.onEndReached,
		onScrollOffsetChanged = p1.paginationProps.onScrollOffsetChanged,
		onViewportChanged = p1.paginationProps.onViewportChanged,
		scrollingFrameRef = p1.paginationProps.scrollingFrameRef,
		scrollingFrameProps = {
			Name = "ShareSheetPeoplePickerScrollingFrame",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ScrollBarThickness = 0,
			Selectable = false
		}
	})
end