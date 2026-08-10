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
local var10 = tModule.strictInterface({
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

return reactModule.memo(function(p0) --[[ line: 172 | named "CollectionGrid" ]]
	-- upvalues: validateProps (ref), var10 (ref), cryoModule (ref), t (ref), useCollectionLayoutModule (ref), argCheckModule (ref), useDesignTokens (ref), useCollectionSizeBindingsModule (ref), reactModule (ref), fFlagLuaAppRfyRevealRows (ref), collectionHeaderModule (ref), fFlagLuaAppSortHeaderAnchorTag (ref), gridOfCollectionItemsModule (ref)
	local createElement_2
	validateProps(var10, p0)
	local var12 = cryoModule.Dictionary.join(t, p0)
	local sideMargin = var12.sideMargin
	local var13 = useCollectionLayoutModule(var12.collectionItemSize)
	local numColumns = p0.numColumns or var13.itemsPerRow
	local columnGap = p0.columnGap or var13.gutter
	local verticalPadding = p0.verticalPadding or var13.verticalGap
	argCheckModule.assert(numColumns >= 1)
	argCheckModule.assert(sideMargin >= 0)
	argCheckModule.assert(verticalPadding >= 0)
	argCheckModule.assert(columnGap >= 0)
	local size400 = useDesignTokens().Size.Size_400
	local var17, _, var18, var19 = useCollectionSizeBindingsModule(numColumns, columnGap, sideMargin, 0, var12.getItemHeight, var12.onContainerSizeChanged)
	local var20 = var12.title and var12.title ~= ""
	local createElement = reactModule.createElement
	local var21 = "Frame"
	local t_1 = {
		ref = var12.containerRef,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = var12.Position,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = var12.LayoutOrder,
		ZIndex = if fFlagLuaAppRfyRevealRows then var12.ZIndex else nil,
		[reactModule.Tag] = if var12.testId then `data-testid={var12.testId}` else nil
	}
	local t_2 = {}
	local createElement_1 = reactModule.createElement
	local var24 = "Frame"
	local t_3 = {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[reactModule.Change.AbsoluteSize] = var18,
		ref = var19
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
			Padding = UDim.new(0, if var20 or var12.headerComponent then size400 else nil)
		})
	}
	
	if var12.headerComponent then
		createElement_2 = var12.headerComponent
	else
		createElement_2 = reactModule.createElement
		createElement_2 = createElement_2(collectionHeaderModule, {
			LayoutOrder = 1,
			title = var12.title,
			subtitle = var12.subtitle,
			tooltipInfoText = var12.tooltipInfoText,
			onActivateInfoIcon = var12.onActivateInfoIcon,
			tooltipSupportsVR = var12.tooltipSupportsVR,
			tooltipSupportsTenFootUi = var12.tooltipSupportsTenFootUi,
			hideButton = if #var12.items >= 1 then var12.hideHeaderButton or not var20 else true,
			onActivate = var12.onActivateHeader,
			buttonText = var12.headerButtonText,
			headerTag = if fFlagLuaAppSortHeaderAnchorTag then var12.headerTag else nil
		})
	end
	t_4.Header = createElement_2
	t_4.GridOfItems = reactModule.createElement(gridOfCollectionItemsModule, {
		LayoutOrder = 2,
		verticalScrollingFrameRef = var12.verticalScrollingFrameRef,
		onViewableItemsChanged = var12.onViewableItemsChanged,
		itemSizeBinding = var17,
		maxNumRows = var12.maxNumRows,
		numColumns = numColumns,
		items = var12.items,
		renderItem = var12.renderItem,
		columnGap = columnGap,
		sideMargin = sideMargin,
		verticalPadding = verticalPadding,
		bufferRowsBelowScreen = var12.bufferRowsBelowScreen,
		bufferRowsAboveScreen = var12.bufferRowsAboveScreen,
		disableRelativeGap = var12.disableRelativeGap,
		thresholdRowsFromBottom = var12.thresholdRowsFromBottom,
		onReachedThresholdFromEnd = var12.onReachedThresholdFromEnd
	})
	t_2.CollectionContent = createElement_1(var24, t_3, t_4)
	
	return createElement(var21, t_1, t_2)
end)