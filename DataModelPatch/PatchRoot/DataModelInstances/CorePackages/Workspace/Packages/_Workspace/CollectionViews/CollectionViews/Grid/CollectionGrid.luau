local CollectionViews = script:FindFirstAncestor("CollectionViews")
local Parent = CollectionViews.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local ArgCheckModule = require(Parent.ArgCheck)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local TModule = require(Parent.t)
local ValidatePropsFunction = require(Parent.DiscoveryUtils).validateProps
local UseCollectionSizeBindingsModule = require(CollectionViews.useCollectionSizeBindings)
local CollectionHeaderModule = require(CollectionViews.CollectionHeader)
local GridOfCollectionItemsModule = require(CollectionViews.Grid.GridOfCollectionItems)
local _ = require(CollectionViews.CollectionViewTypes)
local UseCollectionLayoutModule = require(CollectionViews.CollectionLayoutStore.useCollectionLayout)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagRenameDeprecatedUIBloxTokens = SharedFlagsModule.FFlagRenameDeprecatedUIBloxTokens
local FFlagLuaAppRfyRevealRows = SharedFlagsModule.FFlagLuaAppRfyRevealRows
local FFlagLuaAppSortHeaderAnchorTag = SharedFlagsModule.FFlagLuaAppSortHeaderAnchorTag
local StrictInterfaceResult = TModule.strictInterface({
	testId = TModule.optional(TModule.string),
	Position = TModule.optional(TModule.UDim2),
	LayoutOrder = TModule.optional(TModule.number),
	ZIndex = if FFlagLuaAppRfyRevealRows then TModule.optional(TModule.number) else nil,
	containerRef = TModule.optional(TModule.union(TModule.table, TModule.callback)),
	verticalPadding = TModule.optional(TModule.number),
	maxNumRows = TModule.optional(TModule.number),
	verticalScrollingFrameRef = TModule.optional(TModule.table),
	collectionItemSize = TModule.optional(TModule.string),
	numColumns = TModule.optional(TModule.number),
	items = TModule.table,
	renderItem = TModule.callback,
	getItemHeight = TModule.callback,
	columnGap = TModule.optional(TModule.number),
	sideMargin = TModule.optional(TModule.number),
	title = TModule.optional(TModule.union(TModule.string, TModule.callback)),
	subtitle = TModule.optional(TModule.string),
	tooltipInfoText = TModule.optional(TModule.string),
	onActivateInfoIcon = TModule.optional(TModule.callback),
	tooltipSupportsVR = TModule.optional(TModule.boolean),
	tooltipSupportsTenFootUi = TModule.optional(TModule.boolean),
	onActivateHeader = TModule.optional(TModule.callback),
	headerButtonText = TModule.optional(TModule.string),
	headerTag = if FFlagLuaAppSortHeaderAnchorTag then TModule.optional(TModule.string) else nil,
	onViewableItemsChanged = TModule.optional(TModule.callback),
	onContainerSizeChanged = TModule.optional(TModule.callback),
	hideHeaderButton = TModule.optional(TModule.boolean),
	bufferRowsBelowScreen = TModule.optional(TModule.number),
	bufferRowsAboveScreen = TModule.optional(TModule.number),
	disableRelativeGap = TModule.optional(TModule.boolean),
	headerComponent = TModule.optional(TModule.table),
	thresholdRowsFromBottom = TModule.optional(TModule.number),
	onReachedThresholdFromEnd = TModule.optional(TModule.union(TModule.table, TModule.callback))
})
local config = {
	numColumns = 0,
	columnGap = 0,
	sideMargin = 0,
	verticalPadding = 0
}

return (ReactModule.memo(function(p1)
	-- upvalues: ValidatePropsFunction (copy), StrictInterfaceResult (copy), CryoModule (copy), config (copy), UseCollectionLayoutModule (copy), ArgCheckModule (copy), UseDesignTokensFunction (copy), FFlagRenameDeprecatedUIBloxTokens (copy), UseCollectionSizeBindingsModule (copy), ReactModule (copy), FFlagLuaAppRfyRevealRows (copy), CollectionHeaderModule (copy), FFlagLuaAppSortHeaderAnchorTag (copy), GridOfCollectionItemsModule (copy)
	ValidatePropsFunction(StrictInterfaceResult, p1)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local SideMargin: number = JoinResult.sideMargin
	local UseCollectionLayoutModuleResult = UseCollectionLayoutModule(JoinResult.collectionItemSize)
	local NumColumns = p1.numColumns or UseCollectionLayoutModuleResult.itemsPerRow
	local ColumnGap = p1.columnGap or UseCollectionLayoutModuleResult.gutter
	local VerticalPadding = p1.verticalPadding or UseCollectionLayoutModuleResult.verticalGap
	ArgCheckModule.assert(NumColumns >= 1)
	ArgCheckModule.assert(SideMargin >= 0)
	ArgCheckModule.assert(VerticalPadding >= 0)
	ArgCheckModule.assert(ColumnGap >= 0)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local Size400 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_400 else UseDesignTokensResult.Global.Size_200
	local UseCollectionSizeBindingsModuleResult, _, UseCollectionSizeBindingsModuleResult3, UseCollectionSizeBindingsModuleResult4 = UseCollectionSizeBindingsModule(NumColumns, ColumnGap, SideMargin, 0, JoinResult.getItemHeight, JoinResult.onContainerSizeChanged)
	local IsNotTitleMatch: boolean = JoinResult.title and JoinResult.title ~= ""
	
	return ReactModule.createElement("Frame", {
		ref = JoinResult.containerRef,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = JoinResult.Position,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = JoinResult.LayoutOrder,
		ZIndex = if FFlagLuaAppRfyRevealRows then JoinResult.ZIndex else nil,
		[ReactModule.Tag] = if JoinResult.testId then `data-testid={JoinResult.testId}` else nil
	}, {
		CollectionContent = ReactModule.createElement("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			[ReactModule.Change.AbsoluteSize] = UseCollectionSizeBindingsModuleResult3,
			ref = UseCollectionSizeBindingsModuleResult4
		}, {
			UIPadding = if SideMargin > 0 then ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, SideMargin),
				PaddingRight = UDim.new(0, SideMargin)
			}) else nil,
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, if IsNotTitleMatch or JoinResult.headerComponent then Size400 else nil)
			}),
			Header = if JoinResult.headerComponent then JoinResult.headerComponent else ReactModule.createElement(CollectionHeaderModule, {
				LayoutOrder = 1,
				title = JoinResult.title,
				subtitle = JoinResult.subtitle,
				tooltipInfoText = JoinResult.tooltipInfoText,
				onActivateInfoIcon = JoinResult.onActivateInfoIcon,
				tooltipSupportsVR = JoinResult.tooltipSupportsVR,
				tooltipSupportsTenFootUi = JoinResult.tooltipSupportsTenFootUi,
				hideButton = #JoinResult.items < 1 or (JoinResult.hideHeaderButton or not IsNotTitleMatch),
				onActivate = JoinResult.onActivateHeader,
				buttonText = JoinResult.headerButtonText,
				headerTag = if FFlagLuaAppSortHeaderAnchorTag then JoinResult.headerTag else nil
			}),
			GridOfItems = ReactModule.createElement(GridOfCollectionItemsModule, {
				LayoutOrder = 2,
				verticalScrollingFrameRef = JoinResult.verticalScrollingFrameRef,
				onViewableItemsChanged = JoinResult.onViewableItemsChanged,
				itemSizeBinding = UseCollectionSizeBindingsModuleResult,
				maxNumRows = JoinResult.maxNumRows,
				numColumns = NumColumns,
				items = JoinResult.items,
				renderItem = JoinResult.renderItem,
				columnGap = ColumnGap,
				sideMargin = SideMargin,
				verticalPadding = VerticalPadding,
				bufferRowsBelowScreen = JoinResult.bufferRowsBelowScreen,
				bufferRowsAboveScreen = JoinResult.bufferRowsAboveScreen,
				disableRelativeGap = JoinResult.disableRelativeGap,
				thresholdRowsFromBottom = JoinResult.thresholdRowsFromBottom,
				onReachedThresholdFromEnd = JoinResult.onReachedThresholdFromEnd
			})
		})
	})
end))