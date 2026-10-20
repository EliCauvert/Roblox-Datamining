local SduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local Parent = SduiSharedContent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseAnimateScrollViewToSelectionFunction = require(Parent.AppBlox).useAnimateScrollViewToSelection
local AppNavBarModule = require(Parent.AppNavBar)
local UseNavBarPlacementFunction = AppNavBarModule.useNavBarPlacement
local UseLastInputModeFunction = require(Parent.FocusNavigationUtils).useLastInputMode
local ResponsiveModule = require(Parent.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local AppCommonLibModule = require(Parent.AppCommonLib)
local _ = require(Parent.SduiCompat)
local CollectionViewsModule = require(Parent.CollectionViews)
local CollectionLayoutStoreProvider = CollectionViewsModule.CollectionLayoutStoreProvider
local CollectionLayoutStoreContext = CollectionViewsModule.CollectionLayoutStoreContext
local SduiPoolStore = require(Parent.SduiCoreSystem).SduiPoolStore
local SduiFeedContextModule = require(SduiSharedContent.Components.SduiFeedContext)
local SduiStickyHeaderModule = require(SduiSharedContent.Components.SduiStickyHeader)
local PullToRefreshSpinnerModule = require(SduiSharedContent.Components.PullToRefreshSpinner)
local UseVerticalScrolledToEndThresholdModule = require(SduiSharedContent.Components.useVerticalScrolledToEndThreshold)
local UseProgressiveRowCapModule = require(SduiSharedContent.Components.useProgressiveRowCap)
local BuildSduiFeedChildrenModule = require(SduiSharedContent.Components.buildSduiFeedChildren)
local SduiFeedImpressionsDetectorModule = require(SduiSharedContent.Components.SduiFeedImpressionsDetector)
local FFlagSduiPoolBackedFeed = require(Parent.SharedFlags).FFlagSduiPoolBackedFeed

local function PoolStoreLayoutStoreWiring(p1)
	-- upvalues: ReactModule (copy), CollectionLayoutStoreContext (copy), SduiPoolStore (copy)
	local UseContextResult = ReactModule.useContext(CollectionLayoutStoreContext)
	ReactModule.useEffect(function()
		-- upvalues: UseContextResult (copy), SduiPoolStore (upval), p1 (copy)
		if UseContextResult == nil then return end
		local SduiPoolStore1 = SduiPoolStore.getSduiPoolStore(p1.configKey)
		SduiPoolStore1.setLayoutStore(UseContextResult)
		
		return function()
			-- upvalues: SduiPoolStore1 (copy)
			SduiPoolStore1.setLayoutStore(nil)
		end
	end, { p1.configKey, UseContextResult })
	
	return nil
end

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UseNavBarPlacementFunction (copy), AppNavBarModule (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), ReactModule (copy), AppCommonLibModule (copy), UseAnimateScrollViewToSelectionFunction (copy), UseLastInputModeFunction (copy), UseProgressiveRowCapModule (copy), UseVerticalScrolledToEndThresholdModule (copy), FFlagSduiPoolBackedFeed (copy), PoolStoreLayoutStoreWiring (copy), SduiFeedImpressionsDetectorModule (copy), BuildSduiFeedChildrenModule (copy), SduiFeedContextModule (copy), CollectionLayoutStoreProvider (copy), View (copy), SduiStickyHeaderModule (copy), PullToRefreshSpinnerModule (copy)
	local AnalyticsContext = p1.analyticsContext
	local SduiContext = p1.sduiContext
	local FeedItems = p1.feedItems
	local DebugName = p1.debugName
	local ContentTag = p1.contentTag or p1.defaultContentTag
	local IsNotContentTagMatch: boolean = ContentTag ~= nil and ContentTag ~= ""
	local UseTokensResult = UseTokensFunction()
	local HasStickyItems = p1.stickyItems ~= nil
	local HasOnRefresh = p1.onRefresh ~= nil
	local StickyContentTag = p1.stickyContentTag or p1.defaultStickyContentTag
	local StickyBackgroundStyle = p1.stickyBackgroundStyle or UseTokensResult.Color.Surface.Surface_0
	local StickyPaddingTop = p1.stickyPaddingTop
	local StickyPaddingBottom = p1.stickyPaddingBottom
	local GapBetweenStickyItems = p1.gapBetweenStickyItems or UseTokensResult.Gap.Medium
	local GapAfterStickyItems = p1.gapAfterStickyItems or UseTokensResult.Gap.Medium
	local UseNavBarPlacementResult = UseNavBarPlacementFunction()
	local ImpressionsTag = p1.impressionsTag or (SduiContext.routeName or SduiContext.appPage)
	local SelectionBehaviorLeft = p1.selectionBehaviorLeft or (if UseNavBarPlacementResult == AppNavBarModule.Placement.Left then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop)
	local SelectionBehaviorRight = p1.selectionBehaviorRight or Enum.SelectionBehavior.Stop
	local UsePreferredInputResult = UsePreferredInputFunction()
	local ScrollBarThickness = p1.scrollBarThickness or (if UsePreferredInputResult == ResponsiveModule.Input.Pointer then 4 else 0)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	
	if UseRefResult1.current == nil then
		UseRefResult1.current = AppCommonLibModule.Signal.new()
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy)
		UseRefResult1.current:fire()
	end, {})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseRefResult1 (copy), UseRefResult (copy)
		return {
			scrollViewPositionChangedSignal = UseRefResult1.current,
			verticalScrollingFrameRef = UseRefResult
		}
	end, { UseRefResult1, UseRefResult })
	local GapBetweenFeedItems = p1.gapBetweenFeedItems or UseTokensResult.Gap.Large
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseRefResult1 (copy), UseRefResult (copy)
		return {
			scrollViewPositionChangedSignal = UseRefResult1.current,
			verticalScrollingFrameRef = UseRefResult
		}
	end, { UseRefResult1, UseRefResult })
	local ScrollingFrameRef = p1.scrollingFrameRef or UseRefResult
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseResult (copy)
		if p1.scrollingFrameRef and p1.scrollingFrameRef.current then
			local Current = p1.scrollingFrameRef.current
			local Connections = {
				Current:GetPropertyChangedSignal("CanvasPosition"):Connect(UseResult),
				Current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(UseResult)
			}
			
			return function()
				-- upvalues: Connections (copy)
				for _, connection in Connections do
					connection:Disconnect()
				end
			end
		else
			return nil
		end
	end, { p1.scrollingFrameRef, UseResult })
	UseAnimateScrollViewToSelectionFunction(ScrollingFrameRef, 0.4)
	local IsNotCursor = UseLastInputModeFunction() ~= "Cursor"
	local ThresholdFromEnd = p1.thresholdFromEnd or 600
	local UseProgressiveRowCapModuleResult, UseProgressiveRowCapModuleResult2 = UseProgressiveRowCapModule(if FeedItems then #FeedItems else 0, p1.initialNumToRender, p1.progressiveFillRate, p1.progressiveFillIntervalMs)
	UseVerticalScrolledToEndThresholdModule(ScrollingFrameRef, ThresholdFromEnd, if UseProgressiveRowCapModuleResult2 then nil else p1.onScrollToEnd)
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: FeedItems (copy), p1 (copy), ReactModule (upval), GapBetweenFeedItems (copy), HasStickyItems (copy), GapAfterStickyItems (copy), FFlagSduiPoolBackedFeed (upval), SduiContext (copy), PoolStoreLayoutStoreWiring (upval), ImpressionsTag (copy), SduiFeedImpressionsDetectorModule (upval), ScrollingFrameRef (copy), UseRefResult1 (copy), BuildSduiFeedChildrenModule (upval), DebugName (copy), SelectionBehaviorLeft (copy), SelectionBehaviorRight (copy), UseMemoResult1 (copy), UseProgressiveRowCapModuleResult (copy)
		if FeedItems == nil then
			return nil
		end
		local config = {
			BottomSpacer = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1e999,
				Size = UDim2.new(1, 0, 0, p1.pageBottomPadding or 80)
			}),
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, GapBetweenFeedItems)
			}),
			StickyGap = if HasStickyItems and GapAfterStickyItems and GapAfterStickyItems > 0 then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Size = UDim2.new(1, 0, 0, (math.max(0, GapAfterStickyItems - GapBetweenFeedItems)))
			}) else nil,
			PoolStoreLayoutStoreWiring = if FFlagSduiPoolBackedFeed and SduiContext.configKey ~= nil then ReactModule.createElement(PoolStoreLayoutStoreWiring, { configKey = SduiContext.configKey }) else nil,
			FeedImpressionsDetector = if ImpressionsTag and FeedItems then ReactModule.createElement(SduiFeedImpressionsDetectorModule, {
				sduiContext = SduiContext,
				feedItems = FeedItems,
				parentRef = ScrollingFrameRef,
				impressionsTag = ImpressionsTag,
				scrollViewPositionChangedSignal = UseRefResult1.current
			}) else nil
		}
		
		for i, value in BuildSduiFeedChildrenModule({
			componentType = "VerticalFeed",
			configs = FeedItems,
			sduiContext = SduiContext,
			debugName = DebugName,
			impressionsTag = ImpressionsTag,
			selectionBehaviorLeft = SelectionBehaviorLeft,
			selectionBehaviorRight = SelectionBehaviorRight,
			extraLocalProps = UseMemoResult1,
			maxConfigs = UseProgressiveRowCapModuleResult
		}) do
			config[i] = value
		end
		return config
	end, {
		FeedItems, DebugName, UseRefResult, UseRefResult1, SduiContext,
		AnalyticsContext, GapBetweenFeedItems, ImpressionsTag, SelectionBehaviorLeft,
		SelectionBehaviorRight, HasStickyItems, GapAfterStickyItems, UseMemoResult1,
		IsNotContentTagMatch, p1.pageBottomPadding, ScrollingFrameRef,
		UseProgressiveRowCapModuleResult
	})
	
	if UseMemoResult then
		UseMemoResult2 = ReactModule.createElement(SduiFeedContextModule.Provider, { value = UseMemoResult }, UseMemoResult2)
	end
	local Element = ReactModule.createElement(CollectionLayoutStoreProvider, { container = UseStateResult }, UseMemoResult2)
	local Tag = { ["size-full-0 auto-y"] = true }
	
	if IsNotContentTagMatch then
		Tag[ContentTag] = true
	end
	local Element1 = ReactModule.createElement(View, {
		tag = Tag,
		LayoutOrder = p1.layoutOrder,
		ref = UseStateResult2
	}, Element)
	
	return if p1.scrollingFrameRef == nil then ReactModule.createElement(View, {
		tag = "size-full",
		LayoutOrder = p1.layoutOrder,
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}
	}, {
		Sticky = if HasStickyItems then ReactModule.createElement(SduiStickyHeaderModule, {
			zIndex = 2,
			stickyItems = p1.stickyItems,
			sduiContext = SduiContext,
			debugName = `{DebugName}.StickyHeader`,
			contentTag = StickyContentTag,
			backgroundStyle = StickyBackgroundStyle,
			paddingTop = StickyPaddingTop,
			paddingBottom = StickyPaddingBottom,
			gapBetweenItems = GapBetweenStickyItems,
			extraLocalProps = UseMemoResult1,
			impressionsTag = ImpressionsTag,
			selectionBehaviorLeft = SelectionBehaviorLeft,
			selectionBehaviorRight = SelectionBehaviorRight
		}) else nil,
		RefreshSpinner = if HasOnRefresh then ReactModule.createElement(PullToRefreshSpinnerModule, {
			LayoutOrder = 2,
			onRefresh = p1.onRefresh,
			scrollingFrameRef = UseRefResult,
			appEventName = SduiContext.appPage
		}) else nil,
		Scroll = ReactModule.createElement("ScrollingFrame", {
			LayoutOrder = 3,
			ref = UseRefResult,
			[ReactModule.Change.CanvasPosition] = UseResult,
			[ReactModule.Change.CanvasSize] = UseResult,
			BackgroundColor3 = if p1.backgroundStyle then p1.backgroundStyle.Color3 else UseTokensResult.Color.Surface.Surface_0.Color3,
			BackgroundTransparency = if p1.backgroundStyle then p1.backgroundStyle.Transparency else nil,
			Size = UDim2.fromScale(1, 0),
			CanvasSize = UDim2.new(1, 0, 0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			BorderSizePixel = 0,
			ScrollBarThickness = ScrollBarThickness,
			ElasticBehavior = Enum.ElasticBehavior.Always,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			Selectable = false,
			ScrollingEnabled = not IsNotCursor,
			ClipsDescendants = false
		}, {
			FlexFill = ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
			Content = Element1
		})
	}) else Element1
end)