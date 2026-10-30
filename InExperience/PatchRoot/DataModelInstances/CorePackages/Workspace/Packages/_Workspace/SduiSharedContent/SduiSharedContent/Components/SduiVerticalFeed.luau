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
local ScrollMovementDirection = require(Parent.RobloxAppEnums).ScrollMovementDirection
local _ = require(Parent.SduiCompat)
local DiscoveryTypesModule = require(Parent.DiscoveryTypes)
local CollectionViewsModule = require(Parent.CollectionViews)
local CollectionLayoutStoreProvider = CollectionViewsModule.CollectionLayoutStoreProvider
local CollectionLayoutStoreContext = CollectionViewsModule.CollectionLayoutStoreContext
local SduiPoolStore = require(Parent.SduiCoreSystem).SduiPoolStore
local SduiFeedContextModule = require(SduiSharedContent.Components.SduiFeedContext)
local SduiStickyHeaderModule = require(SduiSharedContent.Components.SduiStickyHeader)
local PullToRefreshSpinner = require(Parent.AppPageShell).PullToRefreshSpinner
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local TutilsModule = require(Parent.tutils)
local UseVerticalScrolledToEndThresholdModule = require(SduiSharedContent.Components.useVerticalScrolledToEndThreshold)
local UseProgressiveRowCapModule = require(SduiSharedContent.Components.useProgressiveRowCap)
local UseProgressiveItemCapOnScrollModule = require(SduiSharedContent.Components.useProgressiveItemCapOnScroll)
local BuildSduiFeedChildrenModule = require(SduiSharedContent.Components.buildSduiFeedChildren)
local SduiFeedImpressionsDetectorModule = require(SduiSharedContent.Components.SduiFeedImpressionsDetector)
local BackToTopButtonModule = require(SduiSharedContent.Components.BackToTopButton)
local ScrollDetector = require(Parent.ScrollTelemetry).ScrollDetector
local CreateScrollIntervalPerformanceTrackerFunction = require(Parent.IntervalPerformanceTracker).createScrollIntervalPerformanceTracker
local ViewportVideoAutoplaySync = require(Parent.VideoUtils).ViewportVideoAutoplaySync
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppSduiHomeFriendCarousel = SharedFlagsModule.FFlagLuaAppSduiHomeFriendCarousel
local FFlagSduiSrpScrollAway = SharedFlagsModule.FFlagSduiSrpScrollAway
local FFlagSduiVerticalFeedProgressiveFillOnScroll = SharedFlagsModule.FFlagSduiVerticalFeedProgressiveFillOnScroll
local SduiVerticalFeedScrollInitialNumRows = game:DefineFastInt("SduiVerticalFeedScrollInitialNumRows", 4)
local SduiVerticalFeedScrollLoadNumRows = game:DefineFastInt("SduiVerticalFeedScrollLoadNumRows", 3)
local SduiVerticalFeedScrollPreloadDistancePx = game:DefineFastInt("SduiVerticalFeedScrollPreloadDistancePx", 2000)
local SduiVerticalFeedScrollUnderfillDebounceMs = game:DefineFastInt("SduiVerticalFeedScrollUnderfillDebounceMs", 50)
local SduiEnableBackToTop = game:DefineFastFlag("SduiEnableBackToTop", false)
local FFlagSduiVerticalFeedPageShellSupport = SharedFlagsModule.FFlagSduiVerticalFeedPageShellSupport
local FFlagSduiPageCanvasCollectionLayout = SharedFlagsModule.FFlagSduiPageCanvasCollectionLayout
local FFlagLuaAppSduiVideoThumbnail = SharedFlagsModule.FFlagLuaAppSduiVideoThumbnail
local FFlagLuaAppMediaGalleryGamepadSupport = SharedFlagsModule.FFlagLuaAppMediaGalleryGamepadSupport
local FFlagLuaAppOneByTwoHoverIdleAutoplay = SharedFlagsModule.FFlagLuaAppOneByTwoHoverIdleAutoplay
local FFlagLuaAppSduiSuppressVideoDetectorDuringScroll = SharedFlagsModule.FFlagLuaAppSduiSuppressVideoDetectorDuringScroll
local FFlagAppPageShellScrollToTopFocus = SharedFlagsModule.FFlagAppPageShellScrollToTopFocus
local FFlagLuaAppsDefaultSelection = SharedFlagsModule.FFlagLuaAppsDefaultSelection
local FFlagSduiVerticalFeedScrollTelemetry = SharedFlagsModule.FFlagSduiVerticalFeedScrollTelemetry
local FFlagSduiIndividualFeedItemSpacing = SharedFlagsModule.FFlagSduiIndividualFeedItemSpacing
local FFlagSduiSamePoolFeedItemSpacing = SharedFlagsModule.FFlagSduiSamePoolFeedItemSpacing
local Signal = if FFlagSduiVerticalFeedProgressiveFillOnScroll then SignalsModule.createSignal(nil) else nil
local Frozen = if FFlagSduiVerticalFeedProgressiveFillOnScroll then table.freeze({}) else nil

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

local function _(p1, p2): number
	local NumberOfRowsGetterFunction = p1.numberOfRowsGetter
	
	if NumberOfRowsGetterFunction ~= nil then
		local NumberOfRowsGetterResult: number = NumberOfRowsGetterFunction(p2)
		
		if NumberOfRowsGetterResult > 0 then
			return NumberOfRowsGetterResult
		end
	end
	return 1
end

local function useProgressiveRowCapWithScroll(FeedItems, InitialNumToRender, ProgressiveFillRate, ProgressiveFillIntervalMs, ProgressiveFillOnScroll, ScrollingFrameRef, UseRefResult, SduiVerticalFeedScrollUnderfillDebounceMs)
	-- upvalues: UseProgressiveRowCapModule (copy), ReactModule (copy), SignalsModule (copy), Signal (copy), Frozen (copy), TutilsModule (copy), SignalsReactModule (copy), UseProgressiveItemCapOnScrollModule (copy), SduiVerticalFeedScrollInitialNumRows (copy), SduiVerticalFeedScrollLoadNumRows (copy), SduiVerticalFeedScrollPreloadDistancePx (copy)
	local UseProgressiveRowCapModuleResult, UseProgressiveRowCapModuleResult2 = UseProgressiveRowCapModule(if FeedItems then #FeedItems else 0, InitialNumToRender, ProgressiveFillRate, ProgressiveFillIntervalMs)
	local UseProgressiveItemCapOnScrollModuleResult, UseProgressiveItemCapOnScrollModuleResult2 = UseProgressiveItemCapOnScrollModule(SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), Signal (upval), ProgressiveFillOnScroll (copy), Frozen (upval), FeedItems (copy), TutilsModule (upval)
		return SignalsModule.createComputed(function(p1)
			-- upvalues: Signal (upval), ProgressiveFillOnScroll (upval), Frozen (upval), FeedItems (upval)
			Signal(p1)
			
			if not ProgressiveFillOnScroll then
				return Frozen
			end
			local Buffer = table.create(if FeedItems then #FeedItems else 0)
			
			if FeedItems then
				for i, feedItem in FeedItems do
					local NumberOfRowsGetterFunction = feedItem.numberOfRowsGetter
					local v1 = nil
					
					if NumberOfRowsGetterFunction ~= nil then
						local NumberOfRowsGetterResult: number = NumberOfRowsGetterFunction(p1)
						
						if NumberOfRowsGetterResult > 0 then
							v1 = NumberOfRowsGetterResult
							Buffer[i] = v1
							continue
						end
					end
					v1 = 1
				end
			end
			return Buffer
		end, TutilsModule.shallowEqual)
	end, { FeedItems, ProgressiveFillOnScroll }))), SduiVerticalFeedScrollInitialNumRows, SduiVerticalFeedScrollLoadNumRows, if ProgressiveFillOnScroll then ScrollingFrameRef else nil, if ProgressiveFillOnScroll then UseRefResult else nil, SduiVerticalFeedScrollPreloadDistancePx, SduiVerticalFeedScrollUnderfillDebounceMs)
	
	if ProgressiveFillOnScroll then
		return math.min(UseProgressiveRowCapModuleResult, UseProgressiveItemCapOnScrollModuleResult), UseProgressiveRowCapModuleResult2 or UseProgressiveItemCapOnScrollModuleResult2
	else
		return UseProgressiveRowCapModuleResult, UseProgressiveRowCapModuleResult2
	end
end

return ReactModule.memo(function(p1)
	-- upvalues: FFlagLuaAppSduiVideoThumbnail (copy), FFlagLuaAppOneByTwoHoverIdleAutoplay (copy), UseTokensFunction (copy), UseNavBarPlacementFunction (copy), AppNavBarModule (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), ReactModule (copy), FFlagSduiVerticalFeedPageShellSupport (copy), FFlagSduiVerticalFeedProgressiveFillOnScroll (copy), AppCommonLibModule (copy), FFlagLuaAppSduiHomeFriendCarousel (copy), FFlagSduiSrpScrollAway (copy), ScrollMovementDirection (copy), FFlagSduiSamePoolFeedItemSpacing (copy), SduiEnableBackToTop (copy), FFlagSduiVerticalFeedScrollTelemetry (copy), CreateScrollIntervalPerformanceTrackerFunction (copy), UseAnimateScrollViewToSelectionFunction (copy), FFlagLuaAppMediaGalleryGamepadSupport (copy), UseLastInputModeFunction (copy), FFlagLuaAppSduiSuppressVideoDetectorDuringScroll (copy), useProgressiveRowCapWithScroll (copy), SduiVerticalFeedScrollUnderfillDebounceMs (copy), UseProgressiveRowCapModule (copy), UseVerticalScrolledToEndThresholdModule (copy), BackToTopButtonModule (copy), FFlagSduiIndividualFeedItemSpacing (copy), PoolStoreLayoutStoreWiring (copy), SduiFeedImpressionsDetectorModule (copy), BuildSduiFeedChildrenModule (copy), FFlagAppPageShellScrollToTopFocus (copy), DiscoveryTypesModule (copy), FFlagLuaAppsDefaultSelection (copy), SduiFeedContextModule (copy), FFlagSduiPageCanvasCollectionLayout (copy), CollectionLayoutStoreProvider (copy), View (copy), ViewportVideoAutoplaySync (copy), ScrollDetector (copy), SduiStickyHeaderModule (copy), PullToRefreshSpinner (copy)
	local AnalyticsContext = p1.analyticsContext
	local SduiContext = p1.sduiContext
	local VideoPlaybackContext = if FFlagLuaAppSduiVideoThumbnail or FFlagLuaAppOneByTwoHoverIdleAutoplay then SduiContext.videoPlaybackContext else nil
	local FeedItems = p1.feedItems
	local DebugName = p1.debugName
	local ContentTag = p1.contentTag or p1.defaultContentTag
	local IsNotContentTagMatch: boolean = ContentTag ~= nil and ContentTag ~= ""
	local UseTokensResult = UseTokensFunction()
	local v1: boolean = p1.stickyItems ~= nil and #p1.stickyItems > 0
	local HasOnRefresh = p1.onRefresh ~= nil
	local StickyContentTag = p1.stickyContentTag or p1.defaultStickyContentTag
	local StickyBackgroundStyle = p1.stickyBackgroundStyle or UseTokensResult.Color.Surface.Surface_0
	local StickyPaddingTop = p1.stickyPaddingTop or UseTokensResult.Gap.Medium
	local StickyPaddingBottom = p1.stickyPaddingBottom or UseTokensResult.Gap.Medium
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
	local ScrollingFrameRef = if FFlagSduiVerticalFeedPageShellSupport then p1.scrollingFrameRef or UseRefResult else nil
	local UseRefResult1 = if FFlagSduiVerticalFeedProgressiveFillOnScroll then ReactModule.useRef(nil) else nil
	local UseRefResult2 = ReactModule.useRef(nil)
	
	if UseRefResult2.current == nil then
		UseRefResult2.current = AppCommonLibModule.Signal.new()
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult2 (copy)
		UseRefResult2.current:fire()
	end, {})
	local UseRefResult3 = nil
	local UseResult1 = nil
	
	if FFlagLuaAppSduiHomeFriendCarousel then
		UseRefResult3 = ReactModule.useRef(nil)
		
		if UseRefResult3.current == nil then
			UseRefResult3.current = if FFlagSduiVerticalFeedPageShellSupport and p1.refreshSignal then p1.refreshSignal else AppCommonLibModule.Signal.new()
		end
		UseResult1 = ReactModule.useCallback(function()
			-- upvalues: UseRefResult3 (ref), p1 (copy)
			if UseRefResult3.current then
				UseRefResult3.current:fire()
			end
			return if p1.onRefresh then p1.onRefresh() else nil
		end, { p1.onRefresh, UseRefResult3 })
	end
	local UseRefResult4 = if FFlagSduiSrpScrollAway then ReactModule.useRef(0) else nil
	local UseRefResult5 = if FFlagSduiSrpScrollAway then ReactModule.useRef(ScrollMovementDirection.Backward) else nil
	local UseResult2 = if FFlagSduiSrpScrollAway then ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: UseResult (copy), p1 (copy), UseRefResult4 (copy), ScrollMovementDirection (upval), UseRefResult5 (copy)
		UseResult()
		local OnScrollDirectionChangedFunction: (any) -> () = p1.onScrollDirectionChanged
		
		if not OnScrollDirectionChangedFunction then return end
		local Y: number = ScrollFrame.CanvasPosition.Y
		
		if Y < 0 then return end
		if Y == UseRefResult4.current then return end
		local Forward = if Y > UseRefResult4.current then ScrollMovementDirection.Forward else ScrollMovementDirection.Backward
		
		if Forward ~= UseRefResult5.current then
			OnScrollDirectionChangedFunction(Forward)
			UseRefResult5.current = Forward
		end
		UseRefResult4.current = Y
	end, { UseResult, p1.onScrollDirectionChanged }) else nil
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseRefResult2 (copy), FFlagSduiVerticalFeedPageShellSupport (upval), ScrollingFrameRef (ref), UseRefResult (copy)
		return {
			scrollViewPositionChangedSignal = UseRefResult2.current,
			verticalScrollingFrameRef = if FFlagSduiVerticalFeedPageShellSupport then ScrollingFrameRef else UseRefResult
		}
	end, {
		UseRefResult2,
		UseRefResult,
		if FFlagSduiVerticalFeedPageShellSupport then ScrollingFrameRef else nil
	})
	local GapBetweenFeedItems = p1.gapBetweenFeedItems or UseTokensResult.Gap.Large
	local SamePoolFeedItemGap = if FFlagSduiSamePoolFeedItemSpacing then p1.samePoolFeedItemGap or UseTokensResult.Gap.Large else nil
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseRefResult2 (copy), FFlagSduiVerticalFeedPageShellSupport (upval), ScrollingFrameRef (ref), UseRefResult (copy), FFlagLuaAppSduiHomeFriendCarousel (upval), UseRefResult3 (ref)
		return {
			scrollViewPositionChangedSignal = UseRefResult2.current,
			verticalScrollingFrameRef = if FFlagSduiVerticalFeedPageShellSupport then ScrollingFrameRef else UseRefResult,
			refreshSignal = if FFlagLuaAppSduiHomeFriendCarousel then UseRefResult3.current else nil
		}
	end, {
		UseRefResult2,
		if FFlagSduiVerticalFeedPageShellSupport then ScrollingFrameRef else UseRefResult
	})
	
	if not FFlagSduiVerticalFeedPageShellSupport then
		ScrollingFrameRef = p1.scrollingFrameRef or UseRefResult
	end
	local v2 = nil
	local UseStateResult2_1 = nil
	
	if SduiEnableBackToTop then
		v2, UseStateResult2_1 = ReactModule.useState(false)
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), ScrollingFrameRef (ref), UseStateResult2_1 (ref)
			if not p1.enableBackToTop then return end
			local Current = ScrollingFrameRef.current
			
			if not Current then return end
			local function updateIsScrollable()
				-- upvalues: Current (copy), UseStateResult2_1 (upval)
				local Y: number = Current.AbsoluteWindowSize.Y
				local Y1: number = Current.AbsoluteCanvasSize.Y
				
				if Y < 0 then return end
				if Y1 >= 0 then
					UseStateResult2_1(Y < Y1)
					
					return
				end
			end
			
			local Connections = {
				Current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(updateIsScrollable),
				Current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(updateIsScrollable)
			}
			local Y: number = Current.AbsoluteWindowSize.Y
			local Y1: number = Current.AbsoluteCanvasSize.Y
			
			if Y >= 0 and Y1 >= 0 then
				UseStateResult2_1(Y < Y1)
			end
			return function()
				-- upvalues: Connections (copy)
				for _, connection in Connections do
					connection:Disconnect()
				end
			end
		end, { ScrollingFrameRef, p1.enableBackToTop })
	end
	if FFlagSduiVerticalFeedScrollTelemetry then
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), ScrollingFrameRef (ref), CreateScrollIntervalPerformanceTrackerFunction (upval)
			local ScrollPerformanceIntervalName = p1.scrollPerformanceIntervalName
			local Current = ScrollingFrameRef.current
			
			if ScrollPerformanceIntervalName == nil or Current == nil then return end
			local ScrollIntervalPerformanceTracker = CreateScrollIntervalPerformanceTrackerFunction(ScrollPerformanceIntervalName, Current)
			local Connection = Current:GetPropertyChangedSignal("CanvasPosition"):Connect(ScrollIntervalPerformanceTracker.onScrollTick)
			
			return function()
				-- upvalues: Connection (copy), ScrollIntervalPerformanceTracker (copy)
				Connection:Disconnect()
				ScrollIntervalPerformanceTracker.cleanup()
			end
		end, { ScrollingFrameRef, p1.scrollPerformanceIntervalName })
	end
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), FFlagSduiSrpScrollAway (upval), UseRefResult4 (copy), UseResult2 (copy), UseResult (copy)
		if not p1.scrollingFrameRef or not p1.scrollingFrameRef.current then
			return nil
		end
		local Current = p1.scrollingFrameRef.current
		
		if FFlagSduiSrpScrollAway then
			UseRefResult4.current = Current.CanvasPosition.Y
		end
		local List = if FFlagSduiSrpScrollAway then {
			Current:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
				-- upvalues: UseResult2 (upval), Current (copy)
				UseResult2(Current)
			end),
			Current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(UseResult)
		} else {
			Current:GetPropertyChangedSignal("CanvasPosition"):Connect(UseResult),
			Current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(UseResult)
		}
		
		return function()
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, {
		p1.scrollingFrameRef,
		UseResult,
		if FFlagSduiSrpScrollAway then UseResult2 else nil
	})
	UseAnimateScrollViewToSelectionFunction(if FFlagSduiVerticalFeedPageShellSupport and p1.scrollToSelectionAnimationManagedByParent then nil else ScrollingFrameRef, 0.4, if FFlagLuaAppMediaGalleryGamepadSupport then p1.scrollToSelectionRevealOnly else nil)
	local IsNotCursor = UseLastInputModeFunction() ~= "Cursor"
	local ThresholdFromEnd = p1.thresholdFromEnd or 600
	local ViewportVideoAutoplayController = nil
	local UseResult3 = nil
	local UseResult4 = nil
	
	if FFlagLuaAppSduiVideoThumbnail or FFlagLuaAppOneByTwoHoverIdleAutoplay then
		ViewportVideoAutoplayController = if VideoPlaybackContext then VideoPlaybackContext.viewportVideoAutoplayController else nil
		UseResult3 = ReactModule.useCallback(function()
			-- upvalues: ViewportVideoAutoplayController (ref), FFlagLuaAppSduiSuppressVideoDetectorDuringScroll (upval)
			if ViewportVideoAutoplayController then
				ViewportVideoAutoplayController:onScrollStart()
				
				if FFlagLuaAppSduiSuppressVideoDetectorDuringScroll and ViewportVideoAutoplayController.suppressDetectorsDuringScroll then
					ViewportVideoAutoplayController.setDetectorsUnmounted(true)
				end
			end
		end, { ViewportVideoAutoplayController })
		UseResult4 = ReactModule.useCallback(function(p2)
			-- upvalues: ViewportVideoAutoplayController (ref), FFlagLuaAppSduiSuppressVideoDetectorDuringScroll (upval)
			if ViewportVideoAutoplayController then
				if FFlagLuaAppSduiSuppressVideoDetectorDuringScroll and ViewportVideoAutoplayController.suppressDetectorsDuringScroll then
					ViewportVideoAutoplayController.setDetectorsUnmounted(false)
				end
				ViewportVideoAutoplayController:onScrollSettled("Y", p2)
			end
		end, { ViewportVideoAutoplayController })
	end
	local UseProgressiveRowCapWithScrollResult = nil
	local UseProgressiveRowCapWithScrollResult2 = nil
	
	if FFlagSduiVerticalFeedProgressiveFillOnScroll then
		UseProgressiveRowCapWithScrollResult, UseProgressiveRowCapWithScrollResult2 = useProgressiveRowCapWithScroll(FeedItems, p1.initialNumToRender, p1.progressiveFillRate, p1.progressiveFillIntervalMs, p1.progressiveFillOnScroll, ScrollingFrameRef, UseRefResult1, SduiVerticalFeedScrollUnderfillDebounceMs)
	else
		UseProgressiveRowCapWithScrollResult, UseProgressiveRowCapWithScrollResult2 = UseProgressiveRowCapModule(if FeedItems then #FeedItems else 0, p1.initialNumToRender, p1.progressiveFillRate, p1.progressiveFillIntervalMs)
	end
	UseVerticalScrolledToEndThresholdModule(ScrollingFrameRef, ThresholdFromEnd, if UseProgressiveRowCapWithScrollResult2 then nil else p1.onScrollToEnd)
	local Element = ReactModule.useMemo(function()
		-- upvalues: FeedItems (copy), p1 (copy), SduiEnableBackToTop (upval), v2 (ref), ReactModule (upval), BackToTopButtonModule (upval), ScrollingFrameRef (ref), SduiContext (copy), FFlagSduiIndividualFeedItemSpacing (upval), GapBetweenFeedItems (copy), FFlagSduiVerticalFeedProgressiveFillOnScroll (upval), UseRefResult1 (copy), v1 (copy), GapAfterStickyItems (copy), PoolStoreLayoutStoreWiring (upval), ImpressionsTag (copy), SduiFeedImpressionsDetectorModule (upval), UseRefResult2 (copy), BuildSduiFeedChildrenModule (upval), DebugName (copy), SelectionBehaviorLeft (copy), SelectionBehaviorRight (copy), UseMemoResult1 (copy), FFlagAppPageShellScrollToTopFocus (upval), DiscoveryTypesModule (upval), FFlagLuaAppsDefaultSelection (upval), UseProgressiveRowCapWithScrollResult (ref), FFlagSduiSamePoolFeedItemSpacing (upval), SamePoolFeedItemGap (copy)
		if FeedItems == nil then
			return nil
		end
		local PageBottomPadding = p1.pageBottomPadding or 80
		local config = {
			BottomSpacer = if SduiEnableBackToTop and p1.enableBackToTop and v2 then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1000000,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 0)
				}),
				Spacer = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, PageBottomPadding)
				}),
				BackToTop = ReactModule.createElement(BackToTopButtonModule, {
					layoutOrder = 2,
					scrollingFrameRef = ScrollingFrameRef,
					pageContext = SduiContext.appPage
				})
			}) else ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1000000,
				Size = UDim2.new(1, 0, 0, PageBottomPadding)
			}),
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, if FFlagSduiIndividualFeedItemSpacing then 0 else GapBetweenFeedItems),
				ref = if FFlagSduiVerticalFeedProgressiveFillOnScroll then UseRefResult1 else nil
			}),
			StickyGap = if v1 and GapAfterStickyItems and GapAfterStickyItems > 0 then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Size = UDim2.new(1, 0, 0, if FFlagSduiIndividualFeedItemSpacing then math.max(GapAfterStickyItems, GapBetweenFeedItems) else math.max(0, GapAfterStickyItems - GapBetweenFeedItems))
			}) else nil,
			NoStickyTopMargin = if v1 or not p1.feedTopMargin or p1.feedTopMargin <= 0 then nil else ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Size = UDim2.new(1, 0, 0, if FFlagSduiIndividualFeedItemSpacing then math.max(p1.feedTopMargin, GapBetweenFeedItems) else math.max(0, p1.feedTopMargin - GapBetweenFeedItems))
			}),
			PoolStoreLayoutStoreWiring = if SduiContext.configKey == nil then nil else ReactModule.createElement(PoolStoreLayoutStoreWiring, { configKey = SduiContext.configKey }),
			FeedImpressionsDetector = if ImpressionsTag and FeedItems then ReactModule.createElement(SduiFeedImpressionsDetectorModule, {
				sduiContext = SduiContext,
				feedItems = FeedItems,
				parentRef = ScrollingFrameRef,
				impressionsTag = ImpressionsTag,
				scrollViewPositionChangedSignal = UseRefResult2.current
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
			selectionOrderBase = if FFlagAppPageShellScrollToTopFocus then DiscoveryTypesModule.Constants.SORT_SELECTION_ORDER_BASE else nil,
			defaultFocusRef = if FFlagAppPageShellScrollToTopFocus and FFlagLuaAppsDefaultSelection then p1.defaultFocusRef else nil,
			maxConfigs = UseProgressiveRowCapWithScrollResult,
			gapBetweenFeedItems = if FFlagSduiIndividualFeedItemSpacing then GapBetweenFeedItems else nil,
			gapAfterFirstFeedItem = if FFlagSduiIndividualFeedItemSpacing then p1.gapAfterFirstFeedItem else nil,
			samePoolFeedItemGap = if FFlagSduiSamePoolFeedItemSpacing then SamePoolFeedItemGap else nil
		}) do
			config[i] = value
		end
		return config
	end, {
		FeedItems, DebugName, UseRefResult, UseRefResult2, SduiContext,
		AnalyticsContext, GapBetweenFeedItems,
		if FFlagSduiIndividualFeedItemSpacing then p1.gapAfterFirstFeedItem else nil,
		if FFlagSduiSamePoolFeedItemSpacing then SamePoolFeedItemGap else nil,
		ImpressionsTag, SelectionBehaviorLeft, SelectionBehaviorRight, v1,
		GapAfterStickyItems, p1.feedTopMargin, UseMemoResult1, IsNotContentTagMatch,
		p1.pageBottomPadding,
		if SduiEnableBackToTop then p1.enableBackToTop else nil,
		if SduiEnableBackToTop then v2 else nil, ScrollingFrameRef,
		UseProgressiveRowCapWithScrollResult,
		if FFlagAppPageShellScrollToTopFocus and FFlagLuaAppsDefaultSelection then p1.defaultFocusRef else nil
	})
	
	if UseMemoResult then
		Element = ReactModule.createElement(SduiFeedContextModule.Provider, { value = UseMemoResult }, Element)
	end
	if not FFlagSduiPageCanvasCollectionLayout or not p1.disableCollectionLayoutStoreProvider then
		Element = ReactModule.createElement(CollectionLayoutStoreProvider, { container = UseStateResult }, Element)
	end
	local Tag = { ["size-full-0 auto-y"] = true }
	
	if IsNotContentTagMatch then
		Tag[ContentTag] = true
	end
	local Element1 = ReactModule.createElement(View, {
		tag = Tag,
		LayoutOrder = p1.layoutOrder,
		ref = UseStateResult2
	}, Element)
	
	if FFlagLuaAppSduiVideoThumbnail or FFlagLuaAppOneByTwoHoverIdleAutoplay then
		Element1 = ReactModule.createElement(ReactModule.Fragment, nil, {
			Content = Element1,
			ViewportVideoAutoplaySync = if ViewportVideoAutoplayController then ReactModule.createElement(ViewportVideoAutoplaySync, {
				viewportAutoplayController = ViewportVideoAutoplayController,
				scrollingFrameRef = ScrollingFrameRef
			}) else nil,
			ScrollDetector = if ViewportVideoAutoplayController then ReactModule.createElement(ScrollDetector, {
				scrollingFrameRef = ScrollingFrameRef,
				onScrollStart = UseResult3,
				onScrollSettled = UseResult4
			}) else nil
		})
	end
	return if p1.scrollingFrameRef == nil then ReactModule.createElement(View, {
		tag = "size-full",
		LayoutOrder = p1.layoutOrder,
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}
	}, {
		Sticky = if v1 then ReactModule.createElement(SduiStickyHeaderModule, {
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
		RefreshSpinner = if HasOnRefresh then ReactModule.createElement(PullToRefreshSpinner, {
			LayoutOrder = 2,
			onRefresh = if FFlagLuaAppSduiHomeFriendCarousel then UseResult1 else p1.onRefresh,
			scrollingFrameRef = UseRefResult,
			appEventName = SduiContext.appPage
		}) else nil,
		Scroll = ReactModule.createElement("ScrollingFrame", {
			LayoutOrder = 3,
			ref = UseRefResult,
			[ReactModule.Change.CanvasPosition] = if FFlagSduiSrpScrollAway then UseResult2 else UseResult,
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