local collectionViews = script:FindFirstAncestor("CollectionViews")
local parent = collectionViews.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local argCheckModule = require(parent.ArgCheck)
local useDesignTokens = require(parent.Style).useDesignTokens
local tModule = require(parent.t)
local validateProps = require(parent.DiscoveryUtils).validateProps
local useCollectionSizeBindingsModule = require(collectionViews.useCollectionSizeBindings)
local collectionHeaderModule = require(collectionViews.CollectionHeader)
local gridOfCollectionItemsModule = require(collectionViews.Grid.GridOfCollectionItems)
local _ = require(collectionViews.CollectionViewTypes)
local useCollectionLayoutModule = require(collectionViews.CollectionLayoutStore.useCollectionLayout)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppRfyRevealRows = sharedFlagsModule.FFlagLuaAppRfyRevealRows
local fFlagLuaAppSortHeaderAnchorTag = sharedFlagsModule.FFlagLuaAppSortHeaderAnchorTag
local var1 = tModule.strictInterface({
	testId = tModule.optional(tModule.string),
	Position = tModule.optional(tModule.UDim2),
	LayoutOrder = tModule.optional(tModule.number),
	ZIndex = if fFlagLuaAppRfyRevealRows then tModule.optional(tModule.number) else nil,
	containerRef = tModule.optional(tModule.union(tModule.table, tModule.callback)),
	verticalPadding = tModule.optional(tModule.number),
	maxNumRows = tModule.optional(tModule.number),
	verticalScrollingFrameRef = tModule.optional(tModule.table),
	collectionItemSize = tModule.optional(tModule.string),
	numColumns = tModule.optional(tModule.number),
	items = tModule.table,
	renderItem = tModule.callback,
	getItemHeight = tModule.callback,
	columnGap = tModule.optional(tModule.number),
	sideMargin = tModule.optional(tModule.number),
	title = tModule.optional(tModule.union(tModule.string, tModule.callback)),
	subtitle = tModule.optional(tModule.string),
	tooltipInfoText = tModule.optional(tModule.string),
	onActivateInfoIcon = tModule.optional(tModule.callback),
	tooltipSupportsVR = tModule.optional(tModule.boolean),
	tooltipSupportsTenFootUi = tModule.optional(tModule.boolean),
	onActivateHeader = tModule.optional(tModule.callback),
	headerButtonText = tModule.optional(tModule.string),
	headerTag = if fFlagLuaAppSortHeaderAnchorTag then tModule.optional(tModule.string) else nil,
	onViewableItemsChanged = tModule.optional(tModule.callback),
	onContainerSizeChanged = tModule.optional(tModule.callback),
	hideHeaderButton = tModule.optional(tModule.boolean),
	bufferRowsBelowScreen = tModule.optional(tModule.number),
	bufferRowsAboveScreen = tModule.optional(tModule.number),
	disableRelativeGap = tModule.optional(tModule.boolean),
	headerComponent = tModule.optional(tModule.table),
	thresholdRowsFromBottom = tModule.optional(tModule.number),
	onReachedThresholdFromEnd = tModule.optional(tModule.union(tModule.table, tModule.callback))
})
local t = {
	numColumns = 0,
	columnGap = 0,
	sideMargin = 0,
	verticalPadding = 0
}

return reactModule.memo(function(p1)
	-- upvalues: validateProps (ref), var1 (ref), cryoModule (ref), t (ref), useCollectionLayoutModule (ref), argCheckModule (ref), useDesignTokens (ref), useCollectionSizeBindingsModule (ref), reactModule (ref), fFlagLuaAppRfyRevealRows (ref), collectionHeaderModule (ref), fFlagLuaAppSortHeaderAnchorTag (ref), gridOfCollectionItemsModule (ref)
	local createElement_2
	validateProps(var1, p1)
	local var2 = cryoModule.Dictionary.join(t, p1)
	local sideMargin = var2.sideMargin
	local var3 = useCollectionLayoutModule(var2.collectionItemSize)
	local numColumns = p1.numColumns or var3.itemsPerRow
	local columnGap = p1.columnGap or var3.gutter
	local verticalPadding = p1.verticalPadding or var3.verticalGap
	argCheckModule.assert(numColumns >= 1)
	argCheckModule.assert(sideMargin >= 0)
	argCheckModule.assert(verticalPadding >= 0)
	argCheckModule.assert(columnGap >= 0)
	local size400 = useDesignTokens().Size.Size_400
	local var4, _, var5, var6 = useCollectionSizeBindingsModule(numColumns, columnGap, sideMargin, 0, var2.getItemHeight, var2.onContainerSizeChanged)
	local var7 = var2.title and var2.title ~= ""
	local createElement = reactModule.createElement
	local var8 = "Frame"
	local t_1 = {
		ref = var2.containerRef,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = var2.Position,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = var2.LayoutOrder,
		ZIndex = if fFlagLuaAppRfyRevealRows then var2.ZIndex else nil,
		[reactModule.Tag] = if var2.testId then `data-testid={var2.testId}` else nil
	}
	local t_2 = {}
	local createElement_1 = reactModule.createElement
	local var9 = "Frame"
	local t_3 = {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[reactModule.Change.AbsoluteSize] = var5,
		ref = var6
	}
	local t_4 = {
		UIPadding = if sideMargin > 0 then reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, sideMargin),
			PaddingRight = UDim.new(0, sideMargin)
		}) else nil,
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, if var7 or var2.headerComponent then size400 else nil)
		})
	}
	
	if var2.headerComponent then
		createElement_2 = var2.headerComponent
	else
		createElement_2 = reactModule.createElement
		createElement_2 = createElement_2(collectionHeaderModule, {
			LayoutOrder = 1,
			title = var2.title,
			subtitle = var2.subtitle,
			tooltipInfoText = var2.tooltipInfoText,
			onActivateInfoIcon = var2.onActivateInfoIcon,
			tooltipSupportsVR = var2.tooltipSupportsVR,
			tooltipSupportsTenFootUi = var2.tooltipSupportsTenFootUi,
			hideButton = if #var2.items >= 1 then var2.hideHeaderButton or not var7 else true,
			onActivate = var2.onActivateHeader,
			buttonText = var2.headerButtonText,
			headerTag = if fFlagLuaAppSortHeaderAnchorTag then var2.headerTag else nil
		})
	end
	t_4.Header = createElement_2
	t_4.GridOfItems = reactModule.createElement(gridOfCollectionItemsModule, {
		LayoutOrder = 2,
		verticalScrollingFrameRef = var2.verticalScrollingFrameRef,
		onViewableItemsChanged = var2.onViewableItemsChanged,
		itemSizeBinding = var4,
		maxNumRows = var2.maxNumRows,
		numColumns = numColumns,
		items = var2.items,
		renderItem = var2.renderItem,
		columnGap = columnGap,
		sideMargin = sideMargin,
		verticalPadding = verticalPadding,
		bufferRowsBelowScreen = var2.bufferRowsBelowScreen,
		bufferRowsAboveScreen = var2.bufferRowsAboveScreen,
		disableRelativeGap = var2.disableRelativeGap,
		thresholdRowsFromBottom = var2.thresholdRowsFromBottom,
		onReachedThresholdFromEnd = var2.onReachedThresholdFromEnd
	})
	t_2.CollectionContent = createElement_1(var9, t_3, t_4)
	
	return createElement(var8, t_1, t_2)
end)