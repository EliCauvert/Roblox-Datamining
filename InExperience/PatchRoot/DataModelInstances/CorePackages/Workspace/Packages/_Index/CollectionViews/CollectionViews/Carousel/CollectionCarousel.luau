local collectionViews = script:FindFirstAncestor("CollectionViews")
local parent = collectionViews.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local argCheckModule = require(parent.ArgCheck)
local useDesignTokens = require(parent.Style).useDesignTokens
local responsiveModule = require(parent.Responsive)
local useLastInput = responsiveModule.useLastInput
local usePreferredInput = responsiveModule.usePreferredInput
local useIsSpatial = responsiveModule.useIsSpatial
local tModule = require(parent.t)
local validateProps = require(parent.DiscoveryUtils).validateProps
local useCollectionSizeBindingsModule = require(collectionViews.useCollectionSizeBindings)
local useScrollButtonHandlersModule = require(collectionViews.Carousel.useScrollButtonHandlers)
local useCarouselScrollingBindingModule = require(collectionViews.Carousel.useCarouselScrollingBinding)
local collectionBackgroundMuralModule = require(collectionViews.Carousel.CollectionBackgroundMural)
local collectionHeaderModule = require(collectionViews.CollectionHeader)
local scrollingRowOfCollectionItemsModule = require(collectionViews.Carousel.ScrollingRowOfCollectionItems)
local maybeForceDarkThemeModule = require(collectionViews.maybeForceDarkTheme)
local carouselScrollButtonsModule = require(collectionViews.Carousel.CarouselScrollButtons)
local _ = require(collectionViews.CollectionViewTypes)
local useCollectionLayoutModule = require(collectionViews.CollectionLayoutStore.useCollectionLayout)
local compositionTags = require(parent.AppComposition).CompositionTags
local var1 = tModule.strictInterface({
	testId = tModule.optional(tModule.string),
	Position = tModule.optional(tModule.UDim2),
	LayoutOrder = tModule.optional(tModule.number),
	containerRef = tModule.optional(tModule.union(tModule.table, tModule.callback)),
	scrollingFrameRef = tModule.optional(tModule.table),
	onScrollingFrameRefCallback = tModule.optional(tModule.callback),
	numColumns = tModule.optional(tModule.number),
	fractionalItemAmount = tModule.optional(tModule.number),
	items = tModule.table,
	renderItem = tModule.callback,
	getItemHeight = tModule.callback,
	columnGap = tModule.optional(tModule.number),
	sideMargin = tModule.optional(tModule.number),
	backgroundMuralUrl = tModule.optional(tModule.string),
	title = tModule.optional(tModule.union(tModule.string, tModule.callback)),
	subtitle = tModule.optional(tModule.string),
	tooltipInfoText = tModule.optional(tModule.string),
	onActivateInfoIcon = tModule.optional(tModule.callback),
	tooltipSupportsVR = tModule.optional(tModule.boolean),
	tooltipSupportsTenFootUi = tModule.optional(tModule.boolean),
	onActivateHeader = tModule.optional(tModule.callback),
	onActivateSubtitle = tModule.optional(tModule.callback),
	headerButtonText = tModule.optional(tModule.string),
	onViewableItemsChanged = tModule.optional(tModule.callback),
	onContainerSizeChanged = tModule.optional(tModule.callback),
	onChangeCanvasPosition = tModule.optional(tModule.callback),
	onReachedThresholdFromEnd = tModule.optional(tModule.union(tModule.callback, tModule.table)),
	thresholdFromEnd = tModule.optional(tModule.number),
	scrollingEnabledOverride = tModule.optional(tModule.boolean),
	shouldShowScrollButtonsOverride = tModule.optional(tModule.boolean),
	hideHeaderButton = tModule.optional(tModule.boolean),
	maxItemsToShow = tModule.optional(tModule.number),
	numItemsToRenderOffScreen = tModule.optional(tModule.number),
	onScrollButtonEnter = tModule.optional(tModule.callback),
	onScrollButtonLeave = tModule.optional(tModule.callback),
	AutomaticSize = tModule.optional(tModule.enum(Enum.AutomaticSize)),
	headerComponent = tModule.optional(tModule.table),
	collectionItemSize = tModule.optional(tModule.string),
	enableHoverOverflow = tModule.optional(tModule.boolean),
	hideSubtitleChevron = tModule.optional(tModule.boolean)
})
local t = {
	numColumns = 0,
	fractionalItemAmount = 0,
	columnGap = 0,
	sideMargin = 0
}

local function _(p1, _)
	return p1 == nil or p1
end

local _ = function(p1, _, p2, p3, p4)
	-- upvalues: responsiveModule (ref)
	return if p2 then if p3 == nil then if p1 ~= responsiveModule.Input.Pointer then p4 else true else p3 else false
end

return reactModule.memo(function(p1)
	-- upvalues: validateProps (ref), var1 (ref), cryoModule (ref), t (ref), useCollectionLayoutModule (ref), argCheckModule (ref), reactModule (ref), useLastInput (ref), usePreferredInput (ref), useIsSpatial (ref), responsiveModule (ref), useCollectionSizeBindingsModule (ref), useScrollButtonHandlersModule (ref), useCarouselScrollingBindingModule (ref), useDesignTokens (ref), scrollingRowOfCollectionItemsModule (ref), collectionBackgroundMuralModule (ref), maybeForceDarkThemeModule (ref), collectionHeaderModule (ref), compositionTags (ref), carouselScrollButtonsModule (ref)
	validateProps(var1, p1)
	local var2 = cryoModule.Dictionary.join(t, p1)
	local sideMargin = var2.sideMargin
	local var3 = useCollectionLayoutModule(p1.collectionItemSize)
	local numColumns = p1.numColumns or var3.itemsPerRow
	local columnGap = p1.columnGap or var3.gutter
	local var4 = if p1.collectionItemSize then var3.carouselPeek or 0 else nil
	argCheckModule.assert(numColumns >= 1)
	argCheckModule.assert(sideMargin >= 0)
	argCheckModule.assert(var2.fractionalItemAmount >= 0)
	argCheckModule.assert(columnGap >= 0)
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useCallback(function(p2)
		-- upvalues: var5 (ref), var2 (ref)
		var5.current = p2
		
		if var2.onScrollingFrameRefCallback then
			var2.onScrollingFrameRefCallback(p2)
		end
		if var2.scrollingFrameRef then
			var2.scrollingFrameRef.current = p2
		end
	end, {
		var2.onScrollingFrameRefCallback,
		var2.scrollingFrameRef
	})
	local var7 = useLastInput()
	local var8 = useIsSpatial()
	local hideHeaderButton = var2.hideHeaderButton or usePreferredInput() == responsiveModule.Input.Directional
	local scrollingEnabledOverride = var2.scrollingEnabledOverride
	local var9 = scrollingEnabledOverride ~= nil or scrollingEnabledOverride
	local minValue = math.min(var2.maxItemsToShow or #var2.items, #var2.items)
	
	if not var9 then
		minValue = math.min(numColumns, minValue)
	end
	argCheckModule.assert(minValue >= 0)
	local var10, var11, var12, var13 = useCollectionSizeBindingsModule(numColumns, columnGap, sideMargin, if var9 and numColumns < minValue then var2.fractionalItemAmount else 0, var2.getItemHeight, var2.onContainerSizeChanged, var4)
	local shouldShowScrollButtonsOverride = var2.shouldShowScrollButtonsOverride
	local var14 = not var9 and (if shouldShowScrollButtonsOverride == nil then if var7 ~= responsiveModule.Input.Pointer then var8 else true else shouldShowScrollButtonsOverride)
	local var15, var16, var17, var18 = useScrollButtonHandlersModule(var5, minValue, var14, numColumns, var10, columnGap, nil)
	local var19 = useCarouselScrollingBindingModule(var5, var2.enableHoverOverflow == true)
	local var20 = columnGap * 0.5
	local var21 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), reactModule (copy), var10 (ref), var19 (ref), var20 (ref)
		return if var2.enableHoverOverflow then reactModule.joinBindings({ var10, var19 }):map(function(p2)
			-- upvalues: var20 (copy)
			return UDim2.new(1, if p2[2] then 0 else -var20 * 2, 0, p2[1].Y)
		end) else nil
	end, { var10, var19, var20, var2.enableHoverOverflow })
	local var22 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), var19 (ref), var20 (ref)
		return if var2.enableHoverOverflow then var19:map(function(p2)
			-- upvalues: var20 (copy)
			return UDim2.new(0, if p2 then 0 else var20, 0, 500)
		end) else nil
	end, { var19, var20, var2.enableHoverOverflow })
	local var23 = useDesignTokens()
	local size400 = var23.Size.Size_400
	local size500 = var23.Size.Size_500
	local white100 = var23.Color.Extended.White.White_100
	local var24 = var2.backgroundMuralUrl ~= nil
	local var25 = var2.title and var2.title ~= ""
	local var26 = reactModule.createElement(scrollingRowOfCollectionItemsModule, {
		Position = var22,
		Size = var21,
		ScrollingEnabled = var9,
		onChangeCanvasPosition = var2.onChangeCanvasPosition,
		onScrollingFrameRefCallback = var6,
		itemSizeBinding = var10,
		items = var2.items,
		totalItemsOnCanvas = minValue,
		numColumns = numColumns,
		columnGap = columnGap,
		renderItem = var2.renderItem,
		sideMargin = sideMargin,
		numItemsToRenderOffScreen = var2.numItemsToRenderOffScreen,
		onReachedThresholdFromEnd = var2.onReachedThresholdFromEnd,
		thresholdFromEnd = var2.thresholdFromEnd,
		onViewableItemsChanged = var2.onViewableItemsChanged,
		AutomaticSize = var2.AutomaticSize
	})
	
	return reactModule.createElement("Frame", {
		ref = var2.containerRef,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = var2.Position,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = var2.LayoutOrder,
		[reactModule.Tag] = if var2.testId then `data-testid={var2.testId}` else nil
	}, {
		BackgroundMural = var2.backgroundMuralUrl and reactModule.createElement(collectionBackgroundMuralModule, {
			ZIndex = -1,
			backgroundMuralUrl = var2.backgroundMuralUrl,
			containerSizeBinding = var11
		}) or nil,
		CollectionContent = reactModule.createElement("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			[reactModule.Change.AbsoluteSize] = var12,
			ref = var13
		}, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = if var2.backgroundMuralUrl ~= nil then nil else UDim.new(0, size500),
				PaddingLeft = if sideMargin > 0 then UDim.new(0, sideMargin) else nil,
				PaddingRight = if sideMargin > 0 then UDim.new(0, sideMargin) else nil
			}),
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, if var25 or var2.headerComponent then size400 else 0)
			}),
			CollectionHeader = if var2.headerComponent then var2.headerComponent else maybeForceDarkThemeModule(reactModule.createElement(collectionHeaderModule, {
				LayoutOrder = 1,
				title = var2.title,
				subtitle = var2.subtitle,
				tooltipInfoText = var2.tooltipInfoText,
				onActivateInfoIcon = var2.onActivateInfoIcon,
				tooltipSupportsVR = var2.tooltipSupportsVR,
				tooltipSupportsTenFootUi = var2.tooltipSupportsTenFootUi,
				hideButton = if #var2.items >= 1 then hideHeaderButton or not var25 else true,
				onActivate = var2.onActivateHeader,
				onActivateSubtitle = var2.onActivateSubtitle,
				buttonText = var2.headerButtonText,
				titleColor = if var24 then white100 else nil,
				subtitleColor = if var24 then white100 else nil,
				hideSubtitleChevron = var2.hideSubtitleChevron
			}), var24),
			Items = reactModule.createElement("Frame", {
				Size = if var2.enableHoverOverflow then var10:map(function(p2)
					return UDim2.new(1, 0, 0, p2.Y)
				end) else UDim2.new(1, 0, 0, 0),
				AutomaticSize = if not var2.enableHoverOverflow then Enum.AutomaticSize.Y else nil,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				[reactModule.Tag] = if var2.collectionItemSize and not var2.enableHoverOverflow then compositionTags.Utility.ClipAtMaxWidth else nil
			}, {
				CarouselClip = if var2.enableHoverOverflow then reactModule.createElement("Frame", {
					Size = var19:map(function(p2)
						-- upvalues: var20 (ref)
						return UDim2.new(1, if p2 then 0 else var20 * 2, 1, 1000)
					end),
					Position = var19:map(function(p2)
						-- upvalues: var20 (ref)
						return UDim2.new(0, if p2 then 0 else -var20, 0, -500)
					end),
					BackgroundTransparency = 1,
					[reactModule.Tag] = if var2.collectionItemSize then compositionTags.Utility.ClipAtMaxWidth else nil
				}, { ScrollingItems = var26 }) else nil,
				ScrollingItems = if not var2.enableHoverOverflow then var26 else nil,
				ScrollButtons = if var14 then reactModule.createElement(carouselScrollButtonsModule, {
					ZIndex = 10,
					handleScrollLeft = var15,
					handleScrollRight = var16,
					leftScrollingEnabled = var17,
					rightScrollingEnabled = var18,
					Size = UDim2.new(1, 2 * sideMargin, 1, 0),
					Position = UDim2.new(0.5, 0, 0, 0),
					AnchorPoint = Vector2.new(0.5, 0),
					buttonOffsetFromEdge = var23.Size.Size_200,
					onScrollButtonEnter = var2.onScrollButtonEnter,
					onScrollButtonLeave = var2.onScrollButtonLeave
				}) else nil
			})
		})
	})
end)