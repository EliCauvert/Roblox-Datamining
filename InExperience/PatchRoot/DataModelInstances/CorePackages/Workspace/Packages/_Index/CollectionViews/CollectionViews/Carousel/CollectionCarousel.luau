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
local calculateCarouselSpacingMetricsModule = require(collectionViews.Carousel.calculateCarouselSpacingMetrics)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagCollectionViewMathChanges = sharedFlagsModule.FFlagCollectionViewMathChanges
local fFlagLuaAppEnableVRCarouselScrolling = sharedFlagsModule.FFlagLuaAppEnableVRCarouselScrolling
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

local function _(p1, p2)
	-- upvalues: fFlagLuaAppEnableVRCarouselScrolling (ref)
	return if p1 == nil then if fFlagLuaAppEnableVRCarouselScrolling then true else not p2 else p1
end

local _ = function(p1, _, p2, p3, p4)
	-- upvalues: responsiveModule (ref), fFlagLuaAppEnableVRCarouselScrolling (ref)
	if not p2 then
		return false
	elseif p3 == nil then
		local _ = true
		local pointer = responsiveModule.Input.Pointer
		local _ = p1 == pointer and ((if p1 == pointer then fFlagLuaAppEnableVRCarouselScrolling else nil) and p4)
		
		return u435
	end
	return p3
end

return reactModule.memo(function(p1)
	-- upvalues: validateProps (ref), var1 (ref), cryoModule (ref), t (ref), useCollectionLayoutModule (ref), argCheckModule (ref), reactModule (ref), fFlagCollectionViewMathChanges (ref), useLastInput (ref), usePreferredInput (ref), useIsSpatial (ref), responsiveModule (ref), fFlagLuaAppEnableVRCarouselScrolling (ref), useCollectionSizeBindingsModule (ref), calculateCarouselSpacingMetricsModule (ref), useScrollButtonHandlersModule (ref), useCarouselScrollingBindingModule (ref), useDesignTokens (ref), scrollingRowOfCollectionItemsModule (ref), collectionBackgroundMuralModule (ref), maybeForceDarkThemeModule (ref), collectionHeaderModule (ref), compositionTags (ref), carouselScrollButtonsModule (ref)
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
	local var6 = nil
	local var7 = nil
	local var8 = nil
	
	if fFlagCollectionViewMathChanges then
		local var9, var10 = reactModule.useBinding(0)
		var6 = var9
		var7 = var10
		var8 = reactModule.useCallback(function(p2)
			-- upvalues: var7 (write)
			if p2 then
				var7(p2.AbsoluteSize.X)
			end
		end, {})
	end
	local var11 = reactModule.useCallback(function(p2)
		-- upvalues: var5 (ref), fFlagCollectionViewMathChanges (copy), var7 (write), var2 (ref)
		var5.current = p2
		
		if fFlagCollectionViewMathChanges and p2 then
			var7(p2.AbsoluteSize.X)
		end
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
	local var12 = useLastInput()
	local var13 = useIsSpatial()
	local hideHeaderButton = var2.hideHeaderButton or usePreferredInput() == responsiveModule.Input.Directional
	local scrollingEnabledOverride = var2.scrollingEnabledOverride
	local var14 = if scrollingEnabledOverride ~= nil then if fFlagLuaAppEnableVRCarouselScrolling then true else not var13 else scrollingEnabledOverride
	local minValue = math.min(var2.maxItemsToShow or #var2.items, #var2.items)
	
	if not var14 then
		minValue = math.min(numColumns, minValue)
	end
	argCheckModule.assert(minValue >= 0)
	local var15 = if var14 and numColumns < minValue then var2.fractionalItemAmount else 0
	local var16, var17, var18, var19 = useCollectionSizeBindingsModule(numColumns, columnGap, sideMargin, var15, var2.getItemHeight, var2.onContainerSizeChanged, var4)
	local var20 = if fFlagCollectionViewMathChanges then reactModule.useMemo(function()
		-- upvalues: reactModule (copy), var6 (write), var16 (ref), calculateCarouselSpacingMetricsModule (copy), numColumns (ref), columnGap (ref), var4 (ref), var15 (ref)
		return reactModule.joinBindings({ var6, var16 }):map(function(p2)
			-- upvalues: calculateCarouselSpacingMetricsModule (copy), numColumns (copy), columnGap (copy), var4 (copy), var15 (copy)
			return calculateCarouselSpacingMetricsModule(p2[1], numColumns, columnGap, var4 or 0, var15, p2[2].X)
		end)
	end, {
		var6, var16, numColumns, columnGap, var4, var15
	}) else nil
	local shouldShowScrollButtonsOverride = var2.shouldShowScrollButtonsOverride
	local var21 = not var14 and (if shouldShowScrollButtonsOverride == nil then if var12 ~= responsiveModule.Input.Pointer then fFlagLuaAppEnableVRCarouselScrolling and (if fFlagLuaAppEnableVRCarouselScrolling then var13 else nil) else true else shouldShowScrollButtonsOverride)
	local var22, var23, var24, var25 = useScrollButtonHandlersModule(var5, minValue, var21, numColumns, if fFlagCollectionViewMathChanges then nil else var16, if fFlagCollectionViewMathChanges then nil else columnGap, nil, if fFlagCollectionViewMathChanges then var20 else nil)
	local var26 = useCarouselScrollingBindingModule(var5, var2.enableHoverOverflow == true)
	local var27 = columnGap * 0.5
	local var28 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), reactModule (copy), var16 (ref), var26 (ref), var27 (ref)
		return if var2.enableHoverOverflow then reactModule.joinBindings({ var16, var26 }):map(function(p2)
			-- upvalues: var27 (copy)
			return UDim2.new(1, if p2[2] then 0 else -var27 * 2, 0, p2[1].Y)
		end) else nil
	end, { var16, var26, var27, var2.enableHoverOverflow })
	local var29 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), var26 (ref), var27 (ref)
		return if var2.enableHoverOverflow then var26:map(function(p2)
			-- upvalues: var27 (copy)
			return UDim2.new(0, if p2 then 0 else var27, 0, 500)
		end) else nil
	end, { var26, var27, var2.enableHoverOverflow })
	local var30 = useDesignTokens()
	local size400 = var30.Size.Size_400
	local size500 = var30.Size.Size_500
	local white100 = var30.Color.Extended.White.White_100
	local var31 = var2.backgroundMuralUrl ~= nil
	local var32 = var2.title and var2.title ~= ""
	local var33 = reactModule.createElement(scrollingRowOfCollectionItemsModule, {
		Position = var29,
		Size = var28,
		ScrollingEnabled = var14,
		onChangeCanvasPosition = var2.onChangeCanvasPosition,
		onScrollingFrameRefCallback = var11,
		itemSizeBinding = var16,
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
		AutomaticSize = var2.AutomaticSize,
		spacingMetricsBinding = if fFlagCollectionViewMathChanges then var20 else nil,
		onScrollingFrameAbsoluteSizeChanged = if fFlagCollectionViewMathChanges then var8 else nil
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
			containerSizeBinding = var17
		}) or nil,
		CollectionContent = reactModule.createElement("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			[reactModule.Change.AbsoluteSize] = var18,
			ref = var19
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
				Padding = UDim.new(0, if var32 or var2.headerComponent then size400 else 0)
			}),
			CollectionHeader = if var2.headerComponent then var2.headerComponent else maybeForceDarkThemeModule(reactModule.createElement(collectionHeaderModule, {
				LayoutOrder = 1,
				title = var2.title,
				subtitle = var2.subtitle,
				tooltipInfoText = var2.tooltipInfoText,
				onActivateInfoIcon = var2.onActivateInfoIcon,
				tooltipSupportsVR = var2.tooltipSupportsVR,
				tooltipSupportsTenFootUi = var2.tooltipSupportsTenFootUi,
				hideButton = if #var2.items >= 1 then hideHeaderButton or not var32 else true,
				onActivate = var2.onActivateHeader,
				onActivateSubtitle = var2.onActivateSubtitle,
				buttonText = var2.headerButtonText,
				titleColor = if var31 then white100 else nil,
				subtitleColor = if var31 then white100 else nil,
				hideSubtitleChevron = var2.hideSubtitleChevron
			}), var31),
			Items = reactModule.createElement("Frame", {
				Size = if var2.enableHoverOverflow then var16:map(function(p2)
					return UDim2.new(1, 0, 0, p2.Y)
				end) else UDim2.new(1, 0, 0, 0),
				AutomaticSize = if not var2.enableHoverOverflow then Enum.AutomaticSize.Y else nil,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				[reactModule.Tag] = if var2.collectionItemSize and not var2.enableHoverOverflow then compositionTags.Utility.ClipAtMaxWidth else nil
			}, {
				CarouselClip = if var2.enableHoverOverflow then reactModule.createElement("Frame", {
					Size = var26:map(function(p2)
						-- upvalues: var27 (ref)
						return UDim2.new(1, if p2 then 0 else var27 * 2, 1, 1000)
					end),
					Position = var26:map(function(p2)
						-- upvalues: var27 (ref)
						return UDim2.new(0, if p2 then 0 else -var27, 0, -500)
					end),
					BackgroundTransparency = 1,
					[reactModule.Tag] = if var2.collectionItemSize then compositionTags.Utility.ClipAtMaxWidth else nil
				}, { ScrollingItems = var33 }) else nil,
				ScrollingItems = if not var2.enableHoverOverflow then var33 else nil,
				ScrollButtons = if var21 then reactModule.createElement(carouselScrollButtonsModule, {
					ZIndex = 10,
					handleScrollLeft = var22,
					handleScrollRight = var23,
					leftScrollingEnabled = var24,
					rightScrollingEnabled = var25,
					Size = UDim2.new(1, 2 * sideMargin, 1, 0),
					Position = UDim2.new(0.5, 0, 0, 0),
					AnchorPoint = Vector2.new(0.5, 0),
					buttonOffsetFromEdge = var30.Size.Size_200,
					onScrollButtonEnter = var2.onScrollButtonEnter,
					onScrollButtonLeave = var2.onScrollButtonLeave
				}) else nil
			})
		})
	})
end)