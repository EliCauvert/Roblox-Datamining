local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local ViewRecyclerModule = require(Parent.ViewRecycler)
local PeoplePickerListViewModule = require(script.Parent.PeoplePickerListView)
local ShareSheetConstantsModule = require(ShareSheet.ShareSheetConstants)
local UsePeoplePickerListItemViewModelModule = require(script.Parent.usePeoplePickerListItemViewModel)
local _ = require(script.Parent.usePeoplePickerListViewModel)
local _ = require(ShareSheet.Components.PeoplePicker.usePeoplePickerPagination)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens

local function PeoplePickerListItem(p1) --[[ Line: 42 ]]
	-- upvalues: UsePeoplePickerListItemViewModelModule (copy), ReactModule (copy), PeoplePickerListViewModule (copy)
	return ReactModule.createElement(PeoplePickerListViewModule.Item, (UsePeoplePickerListItemViewModelModule(p1)))
end

local function getItemKey(p1): string --[[ Line: 48 ]]
	return if p1.kind == "conversation" then `item--{p1.item.id}` else `skeleton--{p1.index}`
end

local RecyclableView = ViewRecyclerModule.createRecyclableView(function(p1) --[[ Line: 56 | Named "ConversationRowView" ]]
	-- upvalues: SignalsReactModule (copy), ReactModule (copy), PeoplePickerListItem (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(p1.itemSignal)
	local Item = UseSignalStateResult.item
	
	return ReactModule.createElement(PeoplePickerListItem, {
		description = Item.description,
		isLoading = Item.isLoading,
		isSelected = Item.isSelected,
		primaryUserId = Item.primaryUserId,
		secondUserId = Item.secondUserId,
		title = Item.displayName,
		onActivated = function() --[[ Line: 67 ]]
			-- upvalues: UseSignalStateResult (copy), Item (copy)
			UseSignalStateResult.onConversationActivated(Item.id)
		end,
		testId = `share-sheet-people-picker-row--{Item.id}`
	})
end)
local RecyclableView1 = ViewRecyclerModule.createRecyclableView(function(p1) --[[ Line: 74 | Named "SkeletonRowView" ]]
	-- upvalues: SignalsReactModule (copy), ReactModule (copy), PeoplePickerListItem (copy)
	return ReactModule.createElement(PeoplePickerListItem, {
		description = "",
		isLoading = true,
		isSelected = false,
		primaryUserId = "",
		title = "",
		onActivated = function() --[[ Line: 83 ]] end,
		testId = `share-sheet-people-picker-skeleton--{SignalsReactModule.useSignalState(p3.itemSignal).index}`
	})
end)

local function getItemType(p1) --[[ Line: 91 ]]
	-- upvalues: RecyclableView (copy), RecyclableView1 (copy)
	return if p1.kind == "conversation" then RecyclableView else RecyclableView1
end

local function useMeasuredLayout(EstimatedItemLength) --[[ Line: 95 ]]
	-- upvalues: ReactModule (copy), ViewRecyclerModule (copy)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 96 ]]
		-- upvalues: ViewRecyclerModule (upval), EstimatedItemLength (copy)
		return ViewRecyclerModule.Layout.measured({ estimatedItemLength = EstimatedItemLength })
	end, { EstimatedItemLength })
	ReactModule.useEffect(function() --[[ Line: 102 ]]
		-- upvalues: UseMemoResult (copy)
		return function() --[[ Line: 103 ]]
			-- upvalues: UseMemoResult (upval)
			UseMemoResult.destroy()
		end
	end, { UseMemoResult })
	
	return UseMemoResult
end

return function(p1) --[[ Line: 111 | Named "PeoplePickerVirtualizedList" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), getItemKey (copy), PeoplePickerListViewModule (copy), useMeasuredLayout (copy), ViewRecyclerModule (copy), getItemType (copy), ShareSheetConstantsModule (copy)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 113 ]]
		-- upvalues: p1 (copy)
		local CountItems = #p1.items
		local Buffer = table.create(CountItems + p1.skeletonCount)
		
		for i, item in p1.items do
			Buffer[i] = {
				kind = "conversation",
				item = item,
				onConversationActivated = p1.onConversationActivated
			}
		end
		for i1 = 1, p1.skeletonCount do
			Buffer[CountItems + i1] = { kind = "skeleton", index = i1 }
		end
		return Buffer
	end, { p1.items, p1.onConversationActivated, p1.skeletonCount })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 131 ]]
		-- upvalues: UseMemoResult (copy), getItemKey (upval)
		return { items = UseMemoResult, getItemKey = getItemKey }
	end, { UseMemoResult })
	local UseMeasuredLayoutResult = useMeasuredLayout(PeoplePickerListViewModule.getItemLayoutMetrics((UseTokensFunction())).estimatedRowHeight)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(p1.debouncedQuery)
	ReactModule.useEffect(function() --[[ Line: 141 ]]
		-- upvalues: UseRefResult1 (copy), p1 (copy), UseRefResult (copy)
		if UseRefResult1.current == p1.debouncedQuery then return end
		UseRefResult1.current = p1.debouncedQuery
		local Current = UseRefResult.current
		
		if Current then
			Current.scrollToOffset(0)
		end
	end, { p1.debouncedQuery })
	
	return ReactModule.createElement(ViewRecyclerModule.VirtualList, {
		data = UseMemoResult1,
		layout = UseMeasuredLayoutResult,
		axis = ViewRecyclerModule.Axis.Y,
		itemType = getItemType,
		overscan = math.max(0, ShareSheetConstantsModule.FIntShareSheetPeoplePickerOverscanRows),
		endReachedThreshold = p1.paginationProps.endReachedThreshold,
		listRef = UseRefResult,
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