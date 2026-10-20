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
	hideSubtitleChevron = TModule.optional(TModule.boolean)
})
local config = {
	numColumns = 0,
	fractionalItemAmount = 0,
	columnGap = 0,
	sideMargin = 0
}

local function _(p1, _)
	return p1 == nil or p1
end

local _ = function(Pointer, _, p1, p2, p3)
	-- upvalues: ResponsiveModule (copy)
	return if p1 then if p2 == nil then Pointer == ResponsiveModule.Input.Pointer or p3 else p2 else false
end

return (ReactModule.memo(function(p1)
	-- upvalues: ValidatePropsFunction (copy), StrictInterfaceResult (copy), CryoModule (copy), config (copy), UseCollectionLayoutModule (copy), ArgCheckModule (copy), ReactModule (copy), UseLastInputFunction (copy), UsePreferredInputFunction (copy), UseIsSpatialFunction (copy), ResponsiveModule (copy), UseCollectionSizeBindingsModule (copy), UseScrollButtonHandlersModule (copy), UseCarouselScrollingBindingModule (copy), UseDesignTokensFunction (copy), ScrollingRowOfCollectionItemsModule (copy), CollectionBackgroundMuralModule (copy), MaybeForceDarkThemeModule (copy), CollectionHeaderModule (copy), CompositionTags (copy), CarouselScrollButtonsModule (copy)
	ValidatePropsFunction(StrictInterfaceResult, p1)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local SideMargin: number = JoinResult.sideMargin
	local UseCollectionLayoutModuleResult = UseCollectionLayoutModule(p1.collectionItemSize)
	local NumColumns = p1.numColumns or UseCollectionLayoutModuleResult.itemsPerRow
	local ColumnGap = p1.columnGap or UseCollectionLayoutModuleResult.gutter
	local CarouselPeek = if p1.collectionItemSize then UseCollectionLayoutModuleResult.carouselPeek or 0 else nil
	ArgCheckModule.assert(NumColumns >= 1)
	ArgCheckModule.assert(SideMargin >= 0)
	ArgCheckModule.assert(JoinResult.fractionalItemAmount >= 0)
	ArgCheckModule.assert(ColumnGap >= 0)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), JoinResult (copy)
		UseRefResult.current = Current
		
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
	local NoScrollingEnabledOverride = ScrollingEnabledOverride == nil or ScrollingEnabledOverride
	local Smallest = math.min(JoinResult.maxItemsToShow or #JoinResult.items, #JoinResult.items)
	
	if not NoScrollingEnabledOverride then
		Smallest = math.min(NumColumns, Smallest)
	end
	ArgCheckModule.assert(Smallest >= 0)
	local UseCollectionSizeBindingsModuleResult, UseCollectionSizeBindingsModuleResult2, UseCollectionSizeBindingsModuleResult3, UseCollectionSizeBindingsModuleResult4 = UseCollectionSizeBindingsModule(NumColumns, ColumnGap, SideMargin, if NoScrollingEnabledOverride and NumColumns < Smallest then JoinResult.fractionalItemAmount else 0, JoinResult.getItemHeight, JoinResult.onContainerSizeChanged, CarouselPeek)
	local ShouldShowScrollButtonsOverride = JoinResult.shouldShowScrollButtonsOverride
	local IsUseLastInputResultMatch = if NoScrollingEnabledOverride then if ShouldShowScrollButtonsOverride == nil then UseLastInputResult == ResponsiveModule.Input.Pointer or UseIsSpatialResult else ShouldShowScrollButtonsOverride else false
	local UseScrollButtonHandlersModuleResult, UseScrollButtonHandlersModuleResult2, UseScrollButtonHandlersModuleResult3, UseScrollButtonHandlersModuleResult4 = UseScrollButtonHandlersModule(UseRefResult, Smallest, IsUseLastInputResultMatch, NumColumns, UseCollectionSizeBindingsModuleResult, ColumnGap, nil)
	local UseCarouselScrollingBindingModuleResult = UseCarouselScrollingBindingModule(UseRefResult, JoinResult.enableHoverOverflow == true)
	local ScaledColumnGap = ColumnGap * 0.5
	local UseMemoResult = ReactModule.useMemo(function()
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
	local UseMemoResult1 = ReactModule.useMemo(function()
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
	local Size400 = UseDesignTokensResult.Size.Size_400
	local Size500 = UseDesignTokensResult.Size.Size_500
	local White100 = UseDesignTokensResult.Color.Extended.White.White_100
	local HasBackgroundMuralUrl = JoinResult.backgroundMuralUrl ~= nil
	local IsNotTitleMatch: boolean = JoinResult.title and JoinResult.title ~= ""
	local Element = ReactModule.createElement(ScrollingRowOfCollectionItemsModule, {
		Position = UseMemoResult1,
		Size = UseMemoResult,
		ScrollingEnabled = NoScrollingEnabledOverride,
		onChangeCanvasPosition = JoinResult.onChangeCanvasPosition,
		onScrollingFrameRefCallback = UseResult,
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
		AutomaticSize = JoinResult.AutomaticSize
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
				hideSubtitleChevron = JoinResult.hideSubtitleChevron
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
					buttonOffsetFromEdge = UseDesignTokensResult.Size.Size_200,
					onScrollButtonEnter = JoinResult.onScrollButtonEnter,
					onScrollButtonLeave = JoinResult.onScrollButtonLeave
				}) else nil
			})
		})
	})
end))