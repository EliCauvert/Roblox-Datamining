local sduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local parent = sduiSharedContent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local useAnimateScrollViewToSelection = require(parent.AppBlox).useAnimateScrollViewToSelection
local appNavBarModule = require(parent.AppNavBar)
local useNavBarPlacement = appNavBarModule.useNavBarPlacement
local useLastInputMode = require(parent.FocusNavigationUtils).useLastInputMode
local responsiveModule = require(parent.Responsive)
local usePreferredInput = responsiveModule.usePreferredInput
local appCommonLibModule = require(parent.AppCommonLib)
local scrollMovementDirection = require(parent.RobloxAppEnums).ScrollMovementDirection
local _ = require(parent.SduiCompat)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local discoveryTypesModule = require(parent.DiscoveryTypes)
local collectionViewsModule = require(parent.CollectionViews)
local collectionLayoutStoreProvider = collectionViewsModule.CollectionLayoutStoreProvider
local collectionLayoutStoreContext = collectionViewsModule.CollectionLayoutStoreContext
local sduiPoolStore = sduiCoreSystemModule.SduiPoolStore
local sduiFeedContextModule = require(sduiSharedContent.Components.SduiFeedContext)
local sduiStickyHeaderModule = require(sduiSharedContent.Components.SduiStickyHeader)
local pullToRefreshSpinner = require(parent.AppPageShell).PullToRefreshSpinner
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local tutilsModule = require(parent.tutils)
local useVerticalScrolledToEndThresholdModule = require(sduiSharedContent.Components.useVerticalScrolledToEndThreshold)
local useProgressiveRowCapModule = require(sduiSharedContent.Components.useProgressiveRowCap)
local useProgressiveItemCapOnScrollModule = require(sduiSharedContent.Components.useProgressiveItemCapOnScroll)
local buildSduiFeedChildrenModule = require(sduiSharedContent.Components.buildSduiFeedChildren)
local sduiFeedImpressionsDetectorModule = require(sduiSharedContent.Components.SduiFeedImpressionsDetector)
local backToTopButtonModule = require(sduiSharedContent.Components.BackToTopButton)
local scrollDetector = require(parent.ScrollTelemetry).ScrollDetector
local createScrollIntervalPerformanceTracker = require(parent.IntervalPerformanceTracker).createScrollIntervalPerformanceTracker
local viewportVideoAutoplaySync = require(parent.VideoUtils).ViewportVideoAutoplaySync
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppSduiHomeFriendCarousel = sharedFlagsModule.FFlagLuaAppSduiHomeFriendCarousel
local fFlagSduiSrpScrollAway = sharedFlagsModule.FFlagSduiSrpScrollAway
local fFlagSduiVerticalFeedProgressiveFillOnScroll = sharedFlagsModule.FFlagSduiVerticalFeedProgressiveFillOnScroll
local sduiVerticalFeedScrollInitialNumRows = game:DefineFastInt("SduiVerticalFeedScrollInitialNumRows", 4)
local sduiVerticalFeedScrollLoadNumRows = game:DefineFastInt("SduiVerticalFeedScrollLoadNumRows", 3)
local sduiVerticalFeedScrollPreloadDistancePx = game:DefineFastInt("SduiVerticalFeedScrollPreloadDistancePx", 2000)
local sduiVerticalFeedScrollUnderfillDebounceMs = game:DefineFastInt("SduiVerticalFeedScrollUnderfillDebounceMs", 50)
local sduiEnableBackToTop = game:DefineFastFlag("SduiEnableBackToTop", false)
local fFlagSduiVerticalFeedPageShellSupport = sharedFlagsModule.FFlagSduiVerticalFeedPageShellSupport
local fFlagSduiPageCanvasCollectionLayout = sharedFlagsModule.FFlagSduiPageCanvasCollectionLayout
local fFlagLuaAppSduiVideoThumbnail = sharedFlagsModule.FFlagLuaAppSduiVideoThumbnail
local fFlagLuaAppMediaGalleryGamepadSupport = sharedFlagsModule.FFlagLuaAppMediaGalleryGamepadSupport
local fFlagLuaAppOneByTwoHoverIdleAutoplay = sharedFlagsModule.FFlagLuaAppOneByTwoHoverIdleAutoplay
local fFlagAppPageShellScrollToTopFocus = sharedFlagsModule.FFlagAppPageShellScrollToTopFocus
local fFlagLuaAppsDefaultSelection = sharedFlagsModule.FFlagLuaAppsDefaultSelection
local fFlagSduiVerticalFeedScrollTelemetry = sharedFlagsModule.FFlagSduiVerticalFeedScrollTelemetry
local fFlagSduiIndividualFeedItemSpacing = sharedFlagsModule.FFlagSduiIndividualFeedItemSpacing
local fFlagSduiSamePoolFeedItemSpacing = sharedFlagsModule.FFlagSduiSamePoolFeedItemSpacing
local var1 = if fFlagSduiVerticalFeedProgressiveFillOnScroll then signalsModule.createSignal(nil) else nil
local var2 = if fFlagSduiVerticalFeedProgressiveFillOnScroll then table.freeze({}) else nil

local function PoolStoreLayoutStoreWiring(p1)
	-- upvalues: reactModule (ref), collectionLayoutStoreContext (ref), sduiPoolStore (ref)
	local var3 = reactModule.useContext(collectionLayoutStoreContext)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), sduiPoolStore (copy), p1 (ref)
		if var3 == nil then
			return
		end
		local sduiPoolStore_1 = sduiPoolStore.getSduiPoolStore(p1.configKey)
		sduiPoolStore_1.setLayoutStore(var3)
		
		return function()
			-- upvalues: sduiPoolStore_1 (ref)
			sduiPoolStore_1.setLayoutStore(nil)
		end
	end, { p1.configKey, var3 })
	
	return nil
end

local function _(p1, p2)
	local numberOfRowsGetter = p1.numberOfRowsGetter
	
	if numberOfRowsGetter ~= nil then
		local var3 = numberOfRowsGetter(p2)
		
		return if var3 > 0 then var3 else 1
	end
end

local function useProgressiveRowCapWithScroll(p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: useProgressiveRowCapModule (ref), reactModule (ref), signalsModule (ref), var1 (ref), var2 (ref), tutilsModule (ref), signalsReactModule (ref), useProgressiveItemCapOnScrollModule (ref), sduiVerticalFeedScrollInitialNumRows (ref), sduiVerticalFeedScrollLoadNumRows (ref), sduiVerticalFeedScrollPreloadDistancePx (ref)
	local var3, var4 = useProgressiveRowCapModule(if p1 then #p1 else 0, p2, p3, p4)
	local var5, var6 = useProgressiveItemCapOnScrollModule(signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var1 (copy), p5 (ref), var2 (copy), p1 (ref), tutilsModule (copy)
		return signalsModule.createComputed(function(p9)
			-- upvalues: var1 (copy), p5 (copy), var2 (copy), p1 (copy)
			var1(p9)
			
			if not p5 then
				return var2
			end
			local list = table.create(if p1 then #p1 else 0)
			
			if p1 then
				for i, v in p1 do
					local var7
					local numberOfRowsGetter = v.numberOfRowsGetter
					
					if numberOfRowsGetter ~= nil then
						local var8 = numberOfRowsGetter(p9)
						var7 = if var8 > 0 then var8 else 1
					end
					list[i] = var7
				end
			end
			return list
		end, tutilsModule.shallowEqual)
	end, { p1, p5 })), sduiVerticalFeedScrollInitialNumRows, sduiVerticalFeedScrollLoadNumRows, if p5 then p6 else nil, if p5 then p7 else nil, sduiVerticalFeedScrollPreloadDistancePx, p8)
	
	if p5 then
		return math.min(var3, var5), var4 or var6
	end
	return var3, var4
end

return reactModule.memo(function(p9)
	-- upvalues: fFlagLuaAppSduiVideoThumbnail (ref), fFlagLuaAppOneByTwoHoverIdleAutoplay (ref), useTokens (ref), useNavBarPlacement (ref), appNavBarModule (ref), usePreferredInput (ref), responsiveModule (ref), reactModule (ref), fFlagSduiVerticalFeedPageShellSupport (ref), fFlagSduiVerticalFeedProgressiveFillOnScroll (ref), appCommonLibModule (ref), fFlagLuaAppSduiHomeFriendCarousel (ref), fFlagSduiSrpScrollAway (ref), scrollMovementDirection (ref), fFlagSduiSamePoolFeedItemSpacing (ref), sduiEnableBackToTop (ref), fFlagSduiVerticalFeedScrollTelemetry (ref), createScrollIntervalPerformanceTracker (ref), useAnimateScrollViewToSelection (ref), fFlagLuaAppMediaGalleryGamepadSupport (ref), useLastInputMode (ref), useProgressiveRowCapWithScroll (ref), sduiVerticalFeedScrollUnderfillDebounceMs (ref), useProgressiveRowCapModule (ref), useVerticalScrolledToEndThresholdModule (ref), backToTopButtonModule (ref), fFlagSduiIndividualFeedItemSpacing (ref), PoolStoreLayoutStoreWiring (ref), sduiFeedImpressionsDetectorModule (ref), buildSduiFeedChildrenModule (ref), fFlagAppPageShellScrollToTopFocus (ref), discoveryTypesModule (ref), fFlagLuaAppsDefaultSelection (ref), sduiFeedContextModule (ref), fFlagSduiPageCanvasCollectionLayout (ref), collectionLayoutStoreProvider (ref), view (ref), viewportVideoAutoplaySync (ref), scrollDetector (ref), sduiStickyHeaderModule (ref), pullToRefreshSpinner (ref)
	local analyticsContext = p9.analyticsContext
	local sduiContext = p9.sduiContext
	local var7 = if fFlagLuaAppSduiVideoThumbnail or fFlagLuaAppOneByTwoHoverIdleAutoplay then sduiContext.videoPlaybackContext else nil
	local feedItems = p9.feedItems
	local debugName = p9.debugName
	local contentTag = p9.contentTag or p9.defaultContentTag
	local var8 = contentTag ~= nil and contentTag ~= ""
	local var9 = useTokens()
	local var10 = p9.stickyItems ~= nil and #p9.stickyItems > 0
	local var11 = p9.onRefresh ~= nil
	local stickyContentTag = p9.stickyContentTag or p9.defaultStickyContentTag
	local stickyBackgroundStyle = p9.stickyBackgroundStyle or var9.Color.Surface.Surface_0
	local stickyPaddingTop = p9.stickyPaddingTop or var9.Gap.Medium
	local stickyPaddingBottom = p9.stickyPaddingBottom or var9.Gap.Medium
	local gapBetweenStickyItems = p9.gapBetweenStickyItems or var9.Gap.Medium
	local gapAfterStickyItems = p9.gapAfterStickyItems or var9.Gap.Medium
	local impressionsTag = p9.impressionsTag or (sduiContext.routeName or sduiContext.appPage)
	local selectionBehaviorLeft = p9.selectionBehaviorLeft or (if useNavBarPlacement() == appNavBarModule.Placement.Left then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop)
	local selectionBehaviorRight = p9.selectionBehaviorRight or Enum.SelectionBehavior.Stop
	local scrollBarThickness = p9.scrollBarThickness or (if usePreferredInput() == responsiveModule.Input.Pointer then 4 else 0)
	local var12, var13 = reactModule.useState(nil)
	local var14 = reactModule.useRef(nil)
	local var15 = if fFlagSduiVerticalFeedPageShellSupport then p9.scrollingFrameRef or var14 else nil
	local var16 = if fFlagSduiVerticalFeedProgressiveFillOnScroll then reactModule.useRef(nil) else nil
	local var17 = reactModule.useRef(nil)
	
	if var17.current == nil then
		var17.current = appCommonLibModule.Signal.new()
	end
	local var18 = reactModule.useCallback(function()
		-- upvalues: var17 (ref)
		var17.current:fire()
	end, {})
	local var19 = nil
	local var20 = nil
	
	if fFlagLuaAppSduiHomeFriendCarousel then
		var19 = reactModule.useRef(nil)
		
		if var19.current == nil then
			var19.current = if fFlagSduiVerticalFeedPageShellSupport and p9.refreshSignal then p9.refreshSignal else appCommonLibModule.Signal.new()
		end
		var20 = reactModule.useCallback(function()
			-- upvalues: var19 (write), p9 (ref)
			if var19.current then
				var19.current:fire()
			end
			return if p9.onRefresh then p9.onRefresh() else nil
		end, { p9.onRefresh, var19 })
	end
	local var21 = if fFlagSduiSrpScrollAway then reactModule.useRef(0) else nil
	local var22 = if fFlagSduiSrpScrollAway then reactModule.useRef(scrollMovementDirection.Backward) else nil
	local var23 = if fFlagSduiSrpScrollAway then reactModule.useCallback(function(p10)
		-- upvalues: var18 (ref), p9 (ref), var21 (ref), scrollMovementDirection (copy), var22 (ref)
		var18()
		local onScrollDirectionChanged = p9.onScrollDirectionChanged
		
		if not onScrollDirectionChanged then return end
		local y = p10.CanvasPosition.Y
		
		if y < 0 then return end
		if y == var21.current then return end
		local var24 = if var21.current < y then scrollMovementDirection.Forward else scrollMovementDirection.Backward
		
		if var24 ~= var22.current then
			onScrollDirectionChanged(var24)
			var22.current = var24
		end
		var21.current = y
	end, { var18, p9.onScrollDirectionChanged }) else nil
	local var24 = reactModule.useMemo(function()
		-- upvalues: var17 (ref), fFlagSduiVerticalFeedPageShellSupport (copy), var15 (write), var14 (ref)
		return {
			scrollViewPositionChangedSignal = var17.current,
			verticalScrollingFrameRef = if fFlagSduiVerticalFeedPageShellSupport then var15 else var14
		}
	end, {
		var17,
		var14,
		if fFlagSduiVerticalFeedPageShellSupport then var15 else nil
	})
	local gapBetweenFeedItems = p9.gapBetweenFeedItems or var9.Gap.Large
	local var25 = if fFlagSduiSamePoolFeedItemSpacing then p9.samePoolFeedItemGap or var9.Gap.Large else nil
	local var26 = reactModule.useMemo(function()
		-- upvalues: var17 (ref), fFlagSduiVerticalFeedPageShellSupport (copy), var15 (write), var14 (ref), fFlagLuaAppSduiHomeFriendCarousel (copy), var19 (write)
		return {
			scrollViewPositionChangedSignal = var17.current,
			verticalScrollingFrameRef = if fFlagSduiVerticalFeedPageShellSupport then var15 else var14,
			refreshSignal = if fFlagLuaAppSduiHomeFriendCarousel then var19.current else nil
		}
	end, {
		var17,
		if fFlagSduiVerticalFeedPageShellSupport then var15 else var14
	})
	
	if not fFlagSduiVerticalFeedPageShellSupport then
		var15 = p9.scrollingFrameRef or var14
	end
	local var27 = nil
	local _ = nil
	
	if sduiEnableBackToTop then
		local var28, var29 = reactModule.useState(false)
		var27 = var28
		local var30 = var29
		reactModule.useEffect(function()
			-- upvalues: p9 (ref), var15 (write), var30 (write)
			if not p9.enableBackToTop then return end
			local current = var15.current
			
			if not current then return end
			local function updateIsScrollable()
				-- upvalues: current (ref), var30 (copy)
				local y = current.AbsoluteWindowSize.Y
				local y_1 = current.AbsoluteCanvasSize.Y
				
				if y < 0 then return end
				if y_1 < 0 then
					return
				end
				var30(y < y_1)
			end
			
			local list = {
				current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(updateIsScrollable),
				current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(updateIsScrollable)
			}
			local y = current.AbsoluteWindowSize.Y
			local y_1 = current.AbsoluteCanvasSize.Y
			
			if y >= 0 and y_1 >= 0 then
				var30(y < y_1)
			end
			return function()
				-- upvalues: list (ref)
				for i, v in list do
					v:Disconnect()
				end
			end
		end, { var15, p9.enableBackToTop })
	end
	if fFlagSduiVerticalFeedScrollTelemetry then
		reactModule.useEffect(function()
			-- upvalues: p9 (ref), var15 (write), createScrollIntervalPerformanceTracker (copy)
			local scrollPerformanceIntervalName = p9.scrollPerformanceIntervalName
			local current = var15.current
			
			if scrollPerformanceIntervalName == nil or current == nil then
				return
			end
			local var31 = createScrollIntervalPerformanceTracker(scrollPerformanceIntervalName, current)
			local var32 = current:GetPropertyChangedSignal("CanvasPosition"):Connect(var31.onScrollTick)
			
			return function()
				-- upvalues: var32 (ref), var31 (ref)
				var32:Disconnect()
				var31.cleanup()
			end
		end, { var15, p9.scrollPerformanceIntervalName })
	end
	reactModule.useEffect(function()
		-- upvalues: p9 (ref), fFlagSduiSrpScrollAway (copy), var21 (ref), var23 (ref), var18 (ref)
		if not p9.scrollingFrameRef or not p9.scrollingFrameRef.current then
			return nil
		end
		local current = p9.scrollingFrameRef.current
		
		if fFlagSduiSrpScrollAway then
			var21.current = current.CanvasPosition.Y
		end
		local var31 = if fFlagSduiSrpScrollAway then {
			current:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
				-- upvalues: var23 (copy), current (ref)
				var23(current)
			end),
			current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(var18)
		} else {
			current:GetPropertyChangedSignal("CanvasPosition"):Connect(var18),
			current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(var18)
		}
		
		return function()
			-- upvalues: var31 (ref)
			for i, v in var31 do
				v:Disconnect()
			end
		end
	end, {
		p9.scrollingFrameRef,
		var18,
		if fFlagSduiSrpScrollAway then var23 else nil
	})
	useAnimateScrollViewToSelection(if fFlagSduiVerticalFeedPageShellSupport and p9.scrollToSelectionAnimationManagedByParent then nil else var15, 0.4, if fFlagLuaAppMediaGalleryGamepadSupport then p9.scrollToSelectionRevealOnly else nil)
	local isNotCursor = useLastInputMode() ~= "Cursor"
	local thresholdFromEnd = p9.thresholdFromEnd or 600
	local var32 = nil
	local var33 = nil
	local var34 = nil
	
	if fFlagLuaAppSduiVideoThumbnail or fFlagLuaAppOneByTwoHoverIdleAutoplay then
		var32 = if var7 then var7.viewportVideoAutoplayController else nil
		var33 = reactModule.useCallback(function()
			-- upvalues: var32 (write)
			if var32 then
				var32:onScrollStart()
			end
		end, { var32 })
		var34 = reactModule.useCallback(function(p10)
			-- upvalues: var32 (write)
			if var32 then
				var32:onScrollSettled("Y", p10)
			end
		end, { var32 })
	end
	local var35, var36
	local _ = nil
	local _ = nil
	
	if fFlagSduiVerticalFeedProgressiveFillOnScroll then
		local var37, var38 = useProgressiveRowCapWithScroll(feedItems, p9.initialNumToRender, p9.progressiveFillRate, p9.progressiveFillIntervalMs, p9.progressiveFillOnScroll, var15, var16, sduiVerticalFeedScrollUnderfillDebounceMs)
		var35 = var37
		var36 = var38
	else
		local var39, var40 = useProgressiveRowCapModule(if feedItems then #feedItems else 0, p9.initialNumToRender, p9.progressiveFillRate, p9.progressiveFillIntervalMs)
		var35 = var39
		var36 = var40
	end
	useVerticalScrolledToEndThresholdModule(var15, thresholdFromEnd, if var36 then nil else p9.onScrollToEnd)
	
	local var41 = function()
		-- upvalues: feedItems (ref), p9 (ref), sduiEnableBackToTop (copy), var27 (write), reactModule (copy), backToTopButtonModule (copy), var15 (write), sduiContext (ref), fFlagSduiIndividualFeedItemSpacing (copy), gapBetweenFeedItems (ref), fFlagSduiVerticalFeedProgressiveFillOnScroll (copy), var16 (ref), var10 (ref), gapAfterStickyItems (ref), PoolStoreLayoutStoreWiring (copy), impressionsTag (ref), sduiFeedImpressionsDetectorModule (copy), var17 (ref), buildSduiFeedChildrenModule (copy), debugName (ref), selectionBehaviorLeft (ref), selectionBehaviorRight (ref), var26 (ref), fFlagAppPageShellScrollToTopFocus (copy), discoveryTypesModule (copy), fFlagLuaAppsDefaultSelection (copy), var35 (write), fFlagSduiSamePoolFeedItemSpacing (copy), var25 (ref)
		if feedItems == nil then
			return nil
		end
		local pageBottomPadding = p9.pageBottomPadding or 80
		local t = {
			BottomSpacer = if sduiEnableBackToTop and p9.enableBackToTop and var27 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1000000,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 0)
				}),
				Spacer = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, pageBottomPadding)
				}),
				BackToTop = reactModule.createElement(backToTopButtonModule, {
					layoutOrder = 2,
					scrollingFrameRef = var15,
					pageContext = sduiContext.appPage
				})
			}) else reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1000000,
				Size = UDim2.new(1, 0, 0, pageBottomPadding)
			}),
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, if fFlagSduiIndividualFeedItemSpacing then 0 else gapBetweenFeedItems),
				ref = if fFlagSduiVerticalFeedProgressiveFillOnScroll then var16 else nil
			}),
			StickyGap = if var10 and gapAfterStickyItems and gapAfterStickyItems > 0 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Size = UDim2.new(1, 0, 0, if fFlagSduiIndividualFeedItemSpacing then math.max(gapAfterStickyItems, gapBetweenFeedItems) else math.max(0, gapAfterStickyItems - gapBetweenFeedItems))
			}) else nil,
			NoStickyTopMargin = if var10 or not p9.feedTopMargin or p9.feedTopMargin <= 0 then nil else reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Size = UDim2.new(1, 0, 0, if fFlagSduiIndividualFeedItemSpacing then math.max(p9.feedTopMargin, gapBetweenFeedItems) else math.max(0, p9.feedTopMargin - gapBetweenFeedItems))
			}),
			PoolStoreLayoutStoreWiring = if sduiContext.configKey ~= nil then nil else reactModule.createElement(PoolStoreLayoutStoreWiring, { configKey = sduiContext.configKey }),
			FeedImpressionsDetector = if impressionsTag and feedItems then reactModule.createElement(sduiFeedImpressionsDetectorModule, {
				sduiContext = sduiContext,
				feedItems = feedItems,
				parentRef = var15,
				impressionsTag = impressionsTag,
				scrollViewPositionChangedSignal = var17.current
			}) else nil
		}
		
		for i, v in buildSduiFeedChildrenModule({
			componentType = "VerticalFeed",
			configs = feedItems,
			sduiContext = sduiContext,
			debugName = debugName,
			impressionsTag = impressionsTag,
			selectionBehaviorLeft = selectionBehaviorLeft,
			selectionBehaviorRight = selectionBehaviorRight,
			extraLocalProps = var26,
			selectionOrderBase = if fFlagAppPageShellScrollToTopFocus then discoveryTypesModule.Constants.SORT_SELECTION_ORDER_BASE else nil,
			defaultFocusRef = if fFlagAppPageShellScrollToTopFocus and fFlagLuaAppsDefaultSelection then p9.defaultFocusRef else nil,
			maxConfigs = var35,
			gapBetweenFeedItems = if fFlagSduiIndividualFeedItemSpacing then gapBetweenFeedItems else nil,
			gapAfterFirstFeedItem = if fFlagSduiIndividualFeedItemSpacing then p9.gapAfterFirstFeedItem else nil,
			samePoolFeedItemGap = if fFlagSduiSamePoolFeedItemSpacing then var25 else nil
		}) do
			t[i] = v
		end
		return t
	end
	
	var41 = reactModule.useMemo(var41, {
		feedItems, debugName, var14, var17, sduiContext, analyticsContext,
		gapBetweenFeedItems,
		if fFlagSduiIndividualFeedItemSpacing then p9.gapAfterFirstFeedItem else nil,
		if fFlagSduiSamePoolFeedItemSpacing then var25 else nil, impressionsTag,
		selectionBehaviorLeft, selectionBehaviorRight, var10, gapAfterStickyItems,
		p9.feedTopMargin, var26, var8, p9.pageBottomPadding,
		if sduiEnableBackToTop then p9.enableBackToTop else nil,
		if sduiEnableBackToTop then var27 else nil, var15, var35,
		if fFlagAppPageShellScrollToTopFocus and fFlagLuaAppsDefaultSelection then p9.defaultFocusRef else nil
	})
	
	if var24 then
		var41 = reactModule.createElement(sduiFeedContextModule.Provider, { value = var24 }, var41)
	end
	if not fFlagSduiPageCanvasCollectionLayout or not p9.disableCollectionLayoutStoreProvider then
		var41 = reactModule.createElement(collectionLayoutStoreProvider, { container = var12 }, var41)
	end
	local t = { ["size-full-0 auto-y"] = true }
	
	if var8 then
		t[contentTag] = true
	end
	var41 = reactModule.createElement(view, { tag = t, LayoutOrder = p9.layoutOrder, ref = var13 }, var41)
	
	if fFlagLuaAppSduiVideoThumbnail or fFlagLuaAppOneByTwoHoverIdleAutoplay then
		var41 = reactModule.createElement(reactModule.Fragment, nil, {
			Content = var41,
			ViewportVideoAutoplaySync = if var32 then reactModule.createElement(viewportVideoAutoplaySync, {
				viewportAutoplayController = var32,
				scrollingFrameRef = var15
			}) else nil,
			ScrollDetector = if var32 then reactModule.createElement(scrollDetector, {
				scrollingFrameRef = var15,
				onScrollStart = var33,
				onScrollSettled = var34
			}) else nil
		})
	end
	return if p9.scrollingFrameRef == nil then reactModule.createElement(view, {
		tag = "size-full",
		LayoutOrder = p9.layoutOrder,
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}
	}, {
		Sticky = if var10 then reactModule.createElement(sduiStickyHeaderModule, {
			zIndex = 2,
			stickyItems = p9.stickyItems,
			sduiContext = sduiContext,
			debugName = `{debugName}.StickyHeader`,
			contentTag = stickyContentTag,
			backgroundStyle = stickyBackgroundStyle,
			paddingTop = stickyPaddingTop,
			paddingBottom = stickyPaddingBottom,
			gapBetweenItems = gapBetweenStickyItems,
			extraLocalProps = var26,
			impressionsTag = impressionsTag,
			selectionBehaviorLeft = selectionBehaviorLeft,
			selectionBehaviorRight = selectionBehaviorRight
		}) else nil,
		RefreshSpinner = if var11 then reactModule.createElement(pullToRefreshSpinner, {
			LayoutOrder = 2,
			onRefresh = if fFlagLuaAppSduiHomeFriendCarousel then var20 else p9.onRefresh,
			scrollingFrameRef = var14,
			appEventName = sduiContext.appPage
		}) else nil,
		Scroll = reactModule.createElement("ScrollingFrame", {
			LayoutOrder = 3,
			ref = var14,
			[reactModule.Change.CanvasPosition] = if fFlagSduiSrpScrollAway then var23 else var18,
			[reactModule.Change.CanvasSize] = var18,
			BackgroundColor3 = if p9.backgroundStyle then p9.backgroundStyle.Color3 else var9.Color.Surface.Surface_0.Color3,
			BackgroundTransparency = if p9.backgroundStyle then p9.backgroundStyle.Transparency else nil,
			Size = UDim2.fromScale(1, 0),
			CanvasSize = UDim2.new(1, 0, 0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			BorderSizePixel = 0,
			ScrollBarThickness = scrollBarThickness,
			ElasticBehavior = Enum.ElasticBehavior.Always,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			Selectable = false,
			ScrollingEnabled = not isNotCursor,
			ClipsDescendants = false
		}, {
			FlexFill = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
			Content = var41
		})
	}) else var41
end)