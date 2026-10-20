local CollectionViews = script:FindFirstAncestor("CollectionViews")
local Parent = CollectionViews.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local ArgCheckModule = require(Parent.ArgCheck)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local ResponsiveModule = require(Parent.Responsive)
local UseLastInputFunction = ResponsiveModule.useLastInput
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local UseIsSpatialFunction = ResponsiveModule.useIsSpatial
local TModule = require(Parent.t)
local ValidatePropsFunction = require(Parent.DiscoveryUtils).validateProps
local UseCollectionSizeBindingsModule = require(CollectionViews.useCollectionSizeBindings)
local UseScrollButtonHandlersModule = require(CollectionViews.Carousel.useScrollButtonHandlers)
local UseCarouselScrollingBindingModule = require(CollectionViews.Carousel.useCarouselScrollingBinding)
local CollectionBackgroundMuralModule = require(CollectionViews.Carousel.CollectionBackgroundMural)
local CollectionHeaderModule = require(CollectionViews.CollectionHeader)
local ScrollingRowOfCollectionItemsModule = require(CollectionViews.Carousel.ScrollingRowOfCollectionItems)
local MaybeForceDarkThemeModule = require(CollectionViews.maybeForceDarkTheme)
local CarouselScrollButtonsModule = require(CollectionViews.Carousel.CarouselScrollButtons)
local _ = require(CollectionViews.CollectionViewTypes)
local UseCollectionLayoutModule = require(CollectionViews.CollectionLayoutStore.useCollectionLayout)
local CompositionTags = require(Parent.AppComposition).CompositionTags
local CalculateCarouselSpacingMetricsModule = require(CollectionViews.Carousel.calculateCarouselSpacingMetrics)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagRenameDeprecatedUIBloxTokens = SharedFlagsModule.FFlagRenameDeprecatedUIBloxTokens
local FFlagCollectionViewMathChanges = SharedFlagsModule.FFlagCollectionViewMathChanges
local FFlagLuaAppEnableVRCarouselScrolling = SharedFlagsModule.FFlagLuaAppEnableVRCarouselScrolling
local FFlagLuaAppFixCarouselPeekInControl = SharedFlagsModule.FFlagLuaAppFixCarouselPeekInControl
local FFlagLuaAppHideCarouselSubtitleChevron = SharedFlagsModule.FFlagLuaAppHideCarouselSubtitleChevron
local StrictInterfaceResult = TModule.strictInterface({
	testId = TModule.optional(TModule.string),
	Position = TModule.optional(TModule.UDim2),
	LayoutOrder = TModule.optional(TModule.number),
	containerRef = TModule.optional(TModule.union(TModule.table, TModule.callback)),
	scrollingFrameRef = TModule.optional(TModule.table),
	onScrollingFrameRefCallback = TModule.optional(TModule.callback),
	numColumns = TModule.optional(TModule.number),
	fractionalItemAmount = TModule.optional(TModule.number),
	items = TModule.table,
	renderItem = TModule.callback,
	getItemHeight = TModule.callback,
	columnGap = TModule.optional(TModule.number),
	sideMargin = TModule.optional(TModule.number),
	backgroundMuralUrl = TModule.optional(TModule.string),
	title = TModule.optional(TModule.union(TModule.string, TModule.callback)),
	subtitle = TModule.optional(TModule.string),
	tooltipInfoText = TModule.optional(TModule.string),
	onActivateInfoIcon = TModule.optional(TModule.callback),
	tooltipSupportsVR = TModule.optional(TModule.boolean),
	tooltipSupportsTenFootUi = TModule.optional(TModule.boolean),
	onActivateHeader = TModule.optional(TModule.callback),
	onActivateSubtitle = TModule.optional(TModule.callback),
	headerButtonText = TModule.optional(TModule.string),
	onViewableItemsChanged = TModule.optional(TModule.callback),
	onContainerSizeChanged = TModule.optional(TModule.callback),
	onChangeCanvasPosition = TModule.optional(TModule.callback),
	onReachedThresholdFromEnd = TModule.optional(TModule.union(TModule.callback, TModule.table)),
	thresholdFromEnd = TModule.optional(TModule.number),
	scrollingEnabledOverride = TModule.optional(TModule.boolean),
	shouldShowScrollButtonsOverride = TModule.optional(TModule.boolean),
	hideHeaderButton = TModule.optional(TModule.boolean),
	maxItemsToShow = TModule.optional(TModule.number),
	numItemsToRenderOffScreen = TModule.optional(TModule.number),
	onScrollButtonEnter = TModule.optional(TModule.callback),
	onScrollButtonLeave = TModule.optional(TModule.callback),
	AutomaticSize = TModule.optional(TModule.enum(Enum.AutomaticSize)),
	headerComponent = TModule.optional(TModule.table),
	collectionItemSize = TModule.optional(TModule.string),
	enableHoverOverflow = TModule.optional(TModule.boolean),
	hideSubtitleChevron = if FFlagLuaAppHideCarouselSubtitleChevron then TModule.optional(TModule.boolean) else nil
})
local config = {
	numColumns = 0,
	fractionalItemAmount = 0,
	columnGap = 0,
	sideMargin = 0
}

local function _(p1, p2)
	-- upvalues: FFlagLuaAppEnableVRCarouselScrolling (copy)
	return if p1 == nil then if FFlagLuaAppEnableVRCarouselScrolling then true else not p2 else p1
end

local _ = function(Pointer, _, p1, p2, p3)
	-- upvalues: ResponsiveModule (copy), FFlagLuaAppEnableVRCarouselScrolling (copy)
	return if p1 then if p2 == nil then Pointer == ResponsiveModule.Input.Pointer or FFlagLuaAppEnableVRCarouselScrolling and p3 else p2 else false
end

return (ReactModule.memo(function(p1)
	-- upvalues: ValidatePropsFunction (copy), StrictInterfaceResult (copy), CryoModule (copy), config (copy), UseCollectionLayoutModule (copy), FFlagLuaAppFixCarouselPeekInControl (copy), ArgCheckModule (copy), ReactModule (copy), FFlagCollectionViewMathChanges (copy), UseLastInputFunction (copy), UsePreferredInputFunction (copy), UseIsSpatialFunction (copy), ResponsiveModule (copy), FFlagLuaAppEnableVRCarouselScrolling (copy), UseCollectionSizeBindingsModule (copy), CalculateCarouselSpacingMetricsModule (copy), UseScrollButtonHandlersModule (copy), UseCarouselScrollingBindingModule (copy), UseDesignTokensFunction (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ScrollingRowOfCollectionItemsModule (copy), CollectionBackgroundMuralModule (copy), MaybeForceDarkThemeModule (copy), CollectionHeaderModule (copy), FFlagLuaAppHideCarouselSubtitleChevron (copy), CompositionTags (copy), CarouselScrollButtonsModule (copy)
	ValidatePropsFunction(StrictInterfaceResult, p1)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local SideMargin: number = JoinResult.sideMargin
	local UseCollectionLayoutModuleResult = UseCollectionLayoutModule(p1.collectionItemSize)
	local NumColumns = p1.numColumns or UseCollectionLayoutModuleResult.itemsPerRow
	local ColumnGap = p1.columnGap or UseCollectionLayoutModuleResult.gutter
	local CarouselPeek = if FFlagLuaAppFixCarouselPeekInControl then if p1.collectionItemSize then UseCollectionLayoutModuleResult.carouselPeek or 0 else nil else UseCollectionLayoutModuleResult.carouselPeek or 0
	ArgCheckModule.assert(NumColumns >= 1)
	ArgCheckModule.assert(SideMargin >= 0)
	ArgCheckModule.assert(JoinResult.fractionalItemAmount >= 0)
	ArgCheckModule.assert(ColumnGap >= 0)
	local UseRefResult = ReactModule.useRef(nil)
	local v1 = nil
	local Callback = nil
	local UseResult = nil
	
	if FFlagCollectionViewMathChanges then
		v1, Callback = ReactModule.useBinding(0)
		UseResult = ReactModule.useCallback(function(Frame)
			-- upvalues: Callback (ref)
			if Frame then
				Callback(Frame.AbsoluteSize.X)
			end
		end, {})
	end
	local UseResult1 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), FFlagCollectionViewMathChanges (upval), Callback (ref), JoinResult (copy)
		UseRefResult.current = Current
		
		if FFlagCollectionViewMathChanges and Current then
			Callback(Current.AbsoluteSize.X)
		end
		if JoinResult.onScrollingFrameRefCallback then
			JoinResult.onScrollingFrameRefCallback(Current)
		end
		if JoinResult.scrollingFrameRef then
			JoinResult.scrollingFrameRef.current = Current
		end
	end, {
		JoinResult.onScrollingFrameRefCallback,
		JoinResult.scrollingFrameRef
	})
	local UseLastInputResult = UseLastInputFunction()
	local UsePreferredInputResult = UsePreferredInputFunction()
	local UseIsSpatialResult = UseIsSpatialFunction()
	local HideHeaderButton = JoinResult.hideHeaderButton or UsePreferredInputResult == ResponsiveModule.Input.Directional
	local ScrollingEnabledOverride = JoinResult.scrollingEnabledOverride
	local NoUseIsSpatialResult = if ScrollingEnabledOverride == nil then if FFlagLuaAppEnableVRCarouselScrolling then true else not UseIsSpatialResult else ScrollingEnabledOverride
	local Smallest = math.min(JoinResult.maxItemsToShow or #JoinResult.items, #JoinResult.items)
	
	if not NoUseIsSpatialResult then
		Smallest = math.min(NumColumns, Smallest)
	end
	ArgCheckModule.assert(Smallest >= 0)
	local FractionalItemAmount = if NoUseIsSpatialResult and NumColumns < Smallest then JoinResult.fractionalItemAmount else 0
	local UseCollectionSizeBindingsModuleResult, UseCollectionSizeBindingsModuleResult2, UseCollectionSizeBindingsModuleResult3, UseCollectionSizeBindingsModuleResult4 = UseCollectionSizeBindingsModule(NumColumns, ColumnGap, SideMargin, FractionalItemAmount, JoinResult.getItemHeight, JoinResult.onContainerSizeChanged, CarouselPeek)
	local UseMemoResult = if FFlagCollectionViewMathChanges then ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), v1 (ref), UseCollectionSizeBindingsModuleResult (copy), CalculateCarouselSpacingMetricsModule (upval), NumColumns (copy), ColumnGap (copy), CarouselPeek (copy), FractionalItemAmount (copy)
		return ReactModule.joinBindings({ v1, UseCollectionSizeBindingsModuleResult }):map(function(Entry)
			-- upvalues: CalculateCarouselSpacingMetricsModule (upval), NumColumns (upval), ColumnGap (upval), CarouselPeek (upval), FractionalItemAmount (upval)
			return CalculateCarouselSpacingMetricsModule(Entry[1], NumColumns, ColumnGap, CarouselPeek or 0, FractionalItemAmount, Entry[2].X)
		end)
	end, {
		v1, UseCollectionSizeBindingsModuleResult, NumColumns, ColumnGap,
		CarouselPeek, FractionalItemAmount
	}) else nil
	local ShouldShowScrollButtonsOverride = JoinResult.shouldShowScrollButtonsOverride
	local UseIsSpatialResult1 = if FFlagLuaAppEnableVRCarouselScrolling then UseIsSpatialResult else nil
	local IsUseLastInputResultMatch = if NoUseIsSpatialResult then if ShouldShowScrollButtonsOverride == nil then UseLastInputResult == ResponsiveModule.Input.Pointer or FFlagLuaAppEnableVRCarouselScrolling and UseIsSpatialResult1 else ShouldShowScrollButtonsOverride else false
	local UseScrollButtonHandlersModuleResult, UseScrollButtonHandlersModuleResult2, UseScrollButtonHandlersModuleResult3, UseScrollButtonHandlersModuleResult4 = UseScrollButtonHandlersModule(UseRefResult, Smallest, IsUseLastInputResultMatch, NumColumns, if FFlagCollectionViewMathChanges then nil else UseCollectionSizeBindingsModuleResult, if FFlagCollectionViewMathChanges then nil else ColumnGap, nil, if FFlagCollectionViewMathChanges then UseMemoResult else nil)
	local UseCarouselScrollingBindingModuleResult = UseCarouselScrollingBindingModule(UseRefResult, JoinResult.enableHoverOverflow == true)
	local ScaledColumnGap = ColumnGap * 0.5
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: JoinResult (copy), ReactModule (upval), UseCollectionSizeBindingsModuleResult (copy), UseCarouselScrollingBindingModuleResult (copy), ScaledColumnGap (copy)
		return if JoinResult.enableHoverOverflow then ReactModule.joinBindings({
			UseCollectionSizeBindingsModuleResult,
			UseCarouselScrollingBindingModuleResult
		}):map(function(Entry): UDim2
			-- upvalues: ScaledColumnGap (upval)
			return UDim2.new(1, if Entry[2] then 0 else -ScaledColumnGap * 2, 0, Entry[1].Y)
		end) else nil
	end, {
		UseCollectionSizeBindingsModuleResult,
		UseCarouselScrollingBindingModuleResult,
		ScaledColumnGap,
		JoinResult.enableHoverOverflow
	})
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: JoinResult (copy), UseCarouselScrollingBindingModuleResult (copy), ScaledColumnGap (copy)
		return if JoinResult.enableHoverOverflow then UseCarouselScrollingBindingModuleResult:map(function(p2): UDim2
			-- upvalues: ScaledColumnGap (upval)
			return UDim2.new(0, if p2 then 0 else ScaledColumnGap, 0, 500)
		end) else nil
	end, {
		UseCarouselScrollingBindingModuleResult,
		ScaledColumnGap,
		JoinResult.enableHoverOverflow
	})
	local UseDesignTokensResult = UseDesignTokensFunction()
	local Size400 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_400 else UseDesignTokensResult.Global.Size_200
	local Size500 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_500 else UseDesignTokensResult.Global.Size_250
	local White100 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Extended.White.White_100 else UseDesignTokensResult.Global.Color.White
	local HasBackgroundMuralUrl = JoinResult.backgroundMuralUrl ~= nil
	local IsNotTitleMatch: boolean = JoinResult.title and JoinResult.title ~= ""
	local Element = ReactModule.createElement(ScrollingRowOfCollectionItemsModule, {
		Position = UseMemoResult2,
		Size = UseMemoResult1,
		ScrollingEnabled = NoUseIsSpatialResult,
		onChangeCanvasPosition = JoinResult.onChangeCanvasPosition,
		onScrollingFrameRefCallback = UseResult1,
		itemSizeBinding = UseCollectionSizeBindingsModuleResult,
		items = JoinResult.items,
		totalItemsOnCanvas = Smallest,
		numColumns = NumColumns,
		columnGap = ColumnGap,
		renderItem = JoinResult.renderItem,
		sideMargin = SideMargin,
		numItemsToRenderOffScreen = JoinResult.numItemsToRenderOffScreen,
		onReachedThresholdFromEnd = JoinResult.onReachedThresholdFromEnd,
		thresholdFromEnd = JoinResult.thresholdFromEnd,
		onViewableItemsChanged = JoinResult.onViewableItemsChanged,
		AutomaticSize = JoinResult.AutomaticSize,
		spacingMetricsBinding = if FFlagCollectionViewMathChanges then UseMemoResult else nil,
		onScrollingFrameAbsoluteSizeChanged = if FFlagCollectionViewMathChanges then UseResult else nil
	})
	
	return ReactModule.createElement("Frame", {
		ref = JoinResult.containerRef,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = JoinResult.Position,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = JoinResult.LayoutOrder,
		[ReactModule.Tag] = if JoinResult.testId then `data-testid={JoinResult.testId}` else nil
	}, {
		BackgroundMural = JoinResult.backgroundMuralUrl and ReactModule.createElement(CollectionBackgroundMuralModule, {
			ZIndex = -1,
			backgroundMuralUrl = JoinResult.backgroundMuralUrl,
			containerSizeBinding = UseCollectionSizeBindingsModuleResult2
		}) or nil,
		CollectionContent = ReactModule.createElement("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			[ReactModule.Change.AbsoluteSize] = UseCollectionSizeBindingsModuleResult3,
			ref = UseCollectionSizeBindingsModuleResult4
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = if JoinResult.backgroundMuralUrl == nil then nil else UDim.new(0, Size500),
				PaddingLeft = if SideMargin > 0 then UDim.new(0, SideMargin) else nil,
				PaddingRight = if SideMargin > 0 then UDim.new(0, SideMargin) else nil
			}),
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, if IsNotTitleMatch or JoinResult.headerComponent then Size400 else 0)
			}),
			CollectionHeader = if JoinResult.headerComponent then JoinResult.headerComponent else MaybeForceDarkThemeModule(ReactModule.createElement(CollectionHeaderModule, {
				LayoutOrder = 1,
				title = JoinResult.title,
				subtitle = JoinResult.subtitle,
				tooltipInfoText = JoinResult.tooltipInfoText,
				onActivateInfoIcon = JoinResult.onActivateInfoIcon,
				tooltipSupportsVR = JoinResult.tooltipSupportsVR,
				tooltipSupportsTenFootUi = JoinResult.tooltipSupportsTenFootUi,
				hideButton = #JoinResult.items < 1 or (HideHeaderButton or not IsNotTitleMatch),
				onActivate = JoinResult.onActivateHeader,
				onActivateSubtitle = JoinResult.onActivateSubtitle,
				buttonText = JoinResult.headerButtonText,
				titleColor = if HasBackgroundMuralUrl then White100 else nil,
				subtitleColor = if HasBackgroundMuralUrl then White100 else nil,
				hideSubtitleChevron = if FFlagLuaAppHideCarouselSubtitleChevron then JoinResult.hideSubtitleChevron else nil
			}), HasBackgroundMuralUrl),
			Items = ReactModule.createElement("Frame", {
				Size = if JoinResult.enableHoverOverflow then UseCollectionSizeBindingsModuleResult:map(function(p2): UDim2
					return UDim2.new(1, 0, 0, p2.Y)
				end) else UDim2.new(1, 0, 0, 0),
				AutomaticSize = if JoinResult.enableHoverOverflow then nil else Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				[ReactModule.Tag] = if JoinResult.collectionItemSize and not JoinResult.enableHoverOverflow then CompositionTags.Utility.ClipAtMaxWidth else nil
			}, {
				CarouselClip = if JoinResult.enableHoverOverflow then ReactModule.createElement("Frame", {
					Size = UseCarouselScrollingBindingModuleResult:map(function(p2): UDim2
						-- upvalues: ScaledColumnGap (copy)
						return UDim2.new(1, if p2 then 0 else ScaledColumnGap * 2, 1, 1000)
					end),
					Position = UseCarouselScrollingBindingModuleResult:map(function(p2): UDim2
						-- upvalues: ScaledColumnGap (copy)
						return UDim2.new(0, if p2 then 0 else -ScaledColumnGap, 0, -500)
					end),
					BackgroundTransparency = 1,
					[ReactModule.Tag] = if JoinResult.collectionItemSize then CompositionTags.Utility.ClipAtMaxWidth else nil
				}, { ScrollingItems = Element }) else nil,
				ScrollingItems = if JoinResult.enableHoverOverflow then nil else Element,
				ScrollButtons = if IsUseLastInputResultMatch then ReactModule.createElement(CarouselScrollButtonsModule, {
					ZIndex = 10,
					handleScrollLeft = UseScrollButtonHandlersModuleResult,
					handleScrollRight = UseScrollButtonHandlersModuleResult2,
					leftScrollingEnabled = UseScrollButtonHandlersModuleResult3,
					rightScrollingEnabled = UseScrollButtonHandlersModuleResult4,
					Size = UDim2.new(1, 2 * SideMargin, 1, 0),
					Position = UDim2.new(0.5, 0, 0, 0),
					AnchorPoint = Vector2.new(0.5, 0),
					buttonOffsetFromEdge = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_200 else UseDesignTokensResult.Global.Size_100,
					onScrollButtonEnter = JoinResult.onScrollButtonEnter,
					onScrollButtonLeave = JoinResult.onScrollButtonLeave
				}) else nil
			})
		})
	})
end))