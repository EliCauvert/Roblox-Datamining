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
local viewportVideoAutoplaySync = require(parent.VideoUtils).ViewportVideoAutoplaySync
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppSduiStickyHeaderScrollAway = sharedFlagsModule.FFlagLuaAppSduiStickyHeaderScrollAway
local fFlagLuaAppSduiHomeFriendCarousel = sharedFlagsModule.FFlagLuaAppSduiHomeFriendCarousel
local fFlagSduiPoolBackedFeed = sharedFlagsModule.FFlagSduiPoolBackedFeed
local fFlagSduiSrpScrollAway = sharedFlagsModule.FFlagSduiSrpScrollAway
local fFlagSduiVerticalFeedProgressiveFillOnScroll = sharedFlagsModule.FFlagSduiVerticalFeedProgressiveFillOnScroll
local sduiVerticalFeedScrollInitialNumRows = game:DefineFastInt("SduiVerticalFeedScrollInitialNumRows", 4)
local sduiVerticalFeedScrollLoadNumRows = game:DefineFastInt("SduiVerticalFeedScrollLoadNumRows", 3)
local sduiVerticalFeedScrollPreloadDistancePx = game:DefineFastInt("SduiVerticalFeedScrollPreloadDistancePx", 2000)
local sduiVerticalFeedScrollUnderfillDebounceMs = game:DefineFastInt("SduiVerticalFeedScrollUnderfillDebounceMs", 50)
local sduiEnableBackToTop = game:DefineFastFlag("SduiEnableBackToTop", false)
local sduiVerticalFeedBottomSpacerLayoutOrderConstant = game:DefineFastFlag("SduiVerticalFeedBottomSpacerLayoutOrderConstant", false)
local sduiVerticalFeedPageShellSupport = game:DefineFastFlag("SduiVerticalFeedPageShellSupport", false)
local fFlagLuaAppSduiVideoThumbnail = sharedFlagsModule.FFlagLuaAppSduiVideoThumbnail
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
	-- upvalues: fFlagSduiPoolBackedFeed (ref)
	if fFlagSduiPoolBackedFeed then
		local numberOfRowsGetter = p1.numberOfRowsGetter
		
		if numberOfRowsGetter ~= nil then
			local var3 = numberOfRowsGetter(p2)
			
			return if var3 > 0 then var3 else 1
		end
	end
end

local function useProgressiveRowCapWithScroll(p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: useProgressiveRowCapModule (ref), reactModule (ref), signalsModule (ref), var1 (ref), var2 (ref), fFlagSduiPoolBackedFeed (ref), tutilsModule (ref), signalsReactModule (ref), useProgressiveItemCapOnScrollModule (ref), sduiVerticalFeedScrollInitialNumRows (ref), sduiVerticalFeedScrollLoadNumRows (ref), sduiVerticalFeedScrollPreloadDistancePx (ref)
	local var3, var4 = useProgressiveRowCapModule(if p1 then #p1 else 0, p2, p3, p4)
	local var5, var6 = useProgressiveItemCapOnScrollModule(signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var1 (copy), p5 (ref), var2 (copy), p1 (ref), fFlagSduiPoolBackedFeed (copy), tutilsModule (copy)
		return signalsModule.createComputed(function(p9)
			-- upvalues: var1 (copy), p5 (copy), var2 (copy), p1 (copy), fFlagSduiPoolBackedFeed (copy)
			var1(p9)
			
			if not p5 then
				return var2
			end
			local list = table.create(if p1 then #p1 else 0)
			
			if p1 then
				for i, v in p1 do
					local var7
					if fFlagSduiPoolBackedFeed then
						local numberOfRowsGetter = v.numberOfRowsGetter
						
						if numberOfRowsGetter ~= nil then
							local var8 = numberOfRowsGetter(p9)
							var7 = if var8 > 0 then var8 else 1
						end
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
	-- upvalues: fFlagLuaAppSduiVideoThumbnail (ref), useTokens (ref), fFlagLuaAppSduiStickyHeaderScrollAway (ref), useNavBarPlacement (ref), appNavBarModule (ref), usePreferredInput (ref), responsiveModule (ref), reactModule (ref), sduiVerticalFeedPageShellSupport (ref), fFlagSduiVerticalFeedProgressiveFillOnScroll (ref), appCommonLibModule (ref), fFlagLuaAppSduiHomeFriendCarousel (ref), fFlagSduiSrpScrollAway (ref), scrollMovementDirection (ref), sduiEnableBackToTop (ref), useAnimateScrollViewToSelection (ref), useLastInputMode (ref), useProgressiveRowCapWithScroll (ref), sduiVerticalFeedScrollUnderfillDebounceMs (ref), useProgressiveRowCapModule (ref), useVerticalScrolledToEndThresholdModule (ref), sduiVerticalFeedBottomSpacerLayoutOrderConstant (ref), backToTopButtonModule (ref), fFlagSduiPoolBackedFeed (ref), PoolStoreLayoutStoreWiring (ref), sduiFeedImpressionsDetectorModule (ref), buildSduiFeedChildrenModule (ref), sduiFeedContextModule (ref), collectionLayoutStoreProvider (ref), view (ref), viewportVideoAutoplaySync (ref), scrollDetector (ref), sduiStickyHeaderModule (ref), pullToRefreshSpinner (ref)
	local var7
	local analyticsContext = p9.analyticsContext
	local sduiContext = p9.sduiContext
	local var8 = if fFlagLuaAppSduiVideoThumbnail then sduiContext.videoPlaybackContext else nil
	local feedItems = p9.feedItems
	local debugName = p9.debugName
	local contentTag = p9.contentTag or p9.defaultContentTag
	local var9 = contentTag ~= nil and contentTag ~= ""
	local var10 = useTokens()
	
	if fFlagLuaAppSduiStickyHeaderScrollAway then
		var7 = false
		
		if p9.stickyItems ~= nil then
			local _ = #p9.stickyItems > 0
		end
	else
		var7 = p9.stickyItems ~= nil
	end
	local var11 = p9.onRefresh ~= nil
	local stickyContentTag = p9.stickyContentTag or p9.defaultStickyContentTag
	local stickyBackgroundStyle = p9.stickyBackgroundStyle or var10.Color.Surface.Surface_0
	local var12 = if fFlagLuaAppSduiStickyHeaderScrollAway then p9.stickyPaddingTop or var10.Gap.Medium else p9.stickyPaddingTop
	local var13 = if fFlagLuaAppSduiStickyHeaderScrollAway then p9.stickyPaddingBottom or var10.Gap.Medium else p9.stickyPaddingBottom
	local gapBetweenStickyItems = p9.gapBetweenStickyItems or var10.Gap.Medium
	local gapAfterStickyItems = p9.gapAfterStickyItems or var10.Gap.Medium
	local impressionsTag = p9.impressionsTag or (sduiContext.routeName or sduiContext.appPage)
	local selectionBehaviorLeft = p9.selectionBehaviorLeft or (if useNavBarPlacement() == appNavBarModule.Placement.Left then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop)
	local selectionBehaviorRight = p9.selectionBehaviorRight or Enum.SelectionBehavior.Stop
	local scrollBarThickness = p9.scrollBarThickness or (if usePreferredInput() == responsiveModule.Input.Pointer then 4 else 0)
	local var14, var15 = reactModule.useState(nil)
	local var16 = reactModule.useRef(nil)
	local var17 = if sduiVerticalFeedPageShellSupport then p9.scrollingFrameRef or var16 else nil
	local var18 = if fFlagSduiVerticalFeedProgressiveFillOnScroll then reactModule.useRef(nil) else nil
	local var19 = reactModule.useRef(nil)
	
	if var19.current == nil then
		var19.current = appCommonLibModule.Signal.new()
	end
	local var20 = reactModule.useCallback(function()
		-- upvalues: var19 (ref)
		var19.current:fire()
	end, {})
	local var21 = nil
	local var22 = nil
	
	if fFlagLuaAppSduiHomeFriendCarousel then
		var21 = reactModule.useRef(nil)
		
		if var21.current == nil then
			var21.current = if sduiVerticalFeedPageShellSupport and p9.refreshSignal then p9.refreshSignal else appCommonLibModule.Signal.new()
		end
		var22 = reactModule.useCallback(function()
			-- upvalues: var21 (write), p9 (ref)
			if var21.current then
				var21.current:fire()
			end
			return if p9.onRefresh then p9.onRefresh() else nil
		end, { p9.onRefresh, var21 })
	end
	local var23 = if fFlagSduiSrpScrollAway then reactModule.useRef(0) else nil
	local var24 = if fFlagSduiSrpScrollAway then reactModule.useRef(scrollMovementDirection.Backward) else nil
	local var25 = if fFlagSduiSrpScrollAway then reactModule.useCallback(function(p10)
		-- upvalues: var20 (ref), p9 (ref), var23 (ref), scrollMovementDirection (copy), var24 (ref)
		var20()
		local onScrollDirectionChanged = p9.onScrollDirectionChanged
		
		if not onScrollDirectionChanged then return end
		local y = p10.CanvasPosition.Y
		
		if y < 0 then return end
		if y == var23.current then return end
		local var26 = if var23.current < y then scrollMovementDirection.Forward else scrollMovementDirection.Backward
		
		if var26 ~= var24.current then
			onScrollDirectionChanged(var26)
			var24.current = var26
		end
		var23.current = y
	end, { var20, p9.onScrollDirectionChanged }) else nil
	local var26 = reactModule.useMemo(function()
		-- upvalues: var19 (ref), sduiVerticalFeedPageShellSupport (copy), var17 (write), var16 (ref)
		return {
			scrollViewPositionChangedSignal = var19.current,
			verticalScrollingFrameRef = if sduiVerticalFeedPageShellSupport then var17 else var16
		}
	end, {
		var19,
		var16,
		if sduiVerticalFeedPageShellSupport then var17 else nil
	})
	local gapBetweenFeedItems = p9.gapBetweenFeedItems or var10.Gap.Large
	local var27 = reactModule.useMemo(function()
		-- upvalues: var19 (ref), sduiVerticalFeedPageShellSupport (copy), var17 (write), var16 (ref), fFlagLuaAppSduiHomeFriendCarousel (copy), var21 (write)
		return {
			scrollViewPositionChangedSignal = var19.current,
			verticalScrollingFrameRef = if sduiVerticalFeedPageShellSupport then var17 else var16,
			refreshSignal = if fFlagLuaAppSduiHomeFriendCarousel then var21.current else nil
		}
	end, {
		var19,
		if sduiVerticalFeedPageShellSupport then var17 else var16
	})
	
	if not sduiVerticalFeedPageShellSupport then
		var17 = p9.scrollingFrameRef or var16
	end
	local var28 = nil
	local _ = nil
	
	if sduiEnableBackToTop then
		local var29, var30 = reactModule.useState(false)
		var28 = var29
		local var31 = var30
		reactModule.useEffect(function()
			-- upvalues: p9 (ref), var17 (write), var31 (write)
			if not p9.enableBackToTop then return end
			local current = var17.current
			
			if not current then return end
			local function updateIsScrollable()
				-- upvalues: current (ref), var31 (copy)
				local y = current.AbsoluteWindowSize.Y
				local y_1 = current.AbsoluteCanvasSize.Y
				
				if y < 0 then return end
				if y_1 < 0 then
					return
				end
				var31(y < y_1)
			end
			
			local list = {
				current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(updateIsScrollable),
				current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(updateIsScrollable)
			}
			local y = current.AbsoluteWindowSize.Y
			local y_1 = current.AbsoluteCanvasSize.Y
			
			if y >= 0 and y_1 >= 0 then
				var31(y < y_1)
			end
			return function()
				-- upvalues: list (ref)
				for i, v in list do
					v:Disconnect()
				end
			end
		end, { var17, p9.enableBackToTop })
	end
	reactModule.useEffect(function()
		-- upvalues: p9 (ref), fFlagSduiSrpScrollAway (copy), var23 (ref), var25 (ref), var20 (ref)
		if not p9.scrollingFrameRef or not p9.scrollingFrameRef.current then
			return nil
		end
		local current = p9.scrollingFrameRef.current
		
		if fFlagSduiSrpScrollAway then
			var23.current = current.CanvasPosition.Y
		end
		local var32 = if fFlagSduiSrpScrollAway then {
			current:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
				-- upvalues: var25 (copy), current (ref)
				var25(current)
			end),
			current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(var20)
		} else {
			current:GetPropertyChangedSignal("CanvasPosition"):Connect(var20),
			current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(var20)
		}
		
		return function()
			-- upvalues: var32 (ref)
			for i, v in var32 do
				v:Disconnect()
			end
		end
	end, {
		p9.scrollingFrameRef,
		var20,
		if fFlagSduiSrpScrollAway then var25 else nil
	})
	useAnimateScrollViewToSelection(var17, 0.4)
	local isNotCursor = useLastInputMode() ~= "Cursor"
	local thresholdFromEnd = p9.thresholdFromEnd or 600
	local var33 = nil
	local var34 = nil
	local var35 = nil
	
	if fFlagLuaAppSduiVideoThumbnail then
		var33 = if var8 then var8.viewportVideoAutoplayController else nil
		var34 = reactModule.useCallback(function()
			-- upvalues: var33 (write)
			if var33 then
				var33:onScrollStart()
			end
		end, { var33 })
		var35 = reactModule.useCallback(function(p10)
			-- upvalues: var33 (write)
			if var33 then
				var33:onScrollSettled("Y", p10)
			end
		end, { var33 })
	end
	local var36, var37
	local _ = nil
	local _ = nil
	
	if fFlagSduiVerticalFeedProgressiveFillOnScroll then
		local var38, var39 = useProgressiveRowCapWithScroll(feedItems, p9.initialNumToRender, p9.progressiveFillRate, p9.progressiveFillIntervalMs, p9.progressiveFillOnScroll, var17, var18, sduiVerticalFeedScrollUnderfillDebounceMs)
		var36 = var38
		var37 = var39
	else
		local var40, var41 = useProgressiveRowCapModule(if feedItems then #feedItems else 0, p9.initialNumToRender, p9.progressiveFillRate, p9.progressiveFillIntervalMs)
		var36 = var40
		var37 = var41
	end
	useVerticalScrolledToEndThresholdModule(var17, thresholdFromEnd, if var37 then nil else p9.onScrollToEnd)
	local var42 = reactModule.useMemo(function()
		-- upvalues: feedItems (ref), p9 (ref), sduiEnableBackToTop (copy), var28 (write), reactModule (copy), sduiVerticalFeedBottomSpacerLayoutOrderConstant (copy), backToTopButtonModule (copy), var17 (write), sduiContext (ref), gapBetweenFeedItems (ref), fFlagSduiVerticalFeedProgressiveFillOnScroll (copy), var18 (ref), var7 (ref), gapAfterStickyItems (ref), fFlagLuaAppSduiStickyHeaderScrollAway (copy), fFlagSduiPoolBackedFeed (copy), PoolStoreLayoutStoreWiring (copy), impressionsTag (ref), sduiFeedImpressionsDetectorModule (copy), var19 (ref), buildSduiFeedChildrenModule (copy), debugName (ref), selectionBehaviorLeft (ref), selectionBehaviorRight (ref), var27 (ref), var36 (write)
		if feedItems == nil then
			return nil
		end
		local pageBottomPadding = p9.pageBottomPadding or 80
		local t = {
			BottomSpacer = if sduiEnableBackToTop and p9.enableBackToTop and var28 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				LayoutOrder = if sduiVerticalFeedBottomSpacerLayoutOrderConstant then 1000000 else 1e999
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
					scrollingFrameRef = var17,
					pageContext = sduiContext.appPage
				})
			}) else reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, pageBottomPadding),
				LayoutOrder = if sduiVerticalFeedBottomSpacerLayoutOrderConstant then 1000000 else 1e999
			}),
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, gapBetweenFeedItems),
				ref = if fFlagSduiVerticalFeedProgressiveFillOnScroll then var18 else nil
			}),
			StickyGap = if var7 and gapAfterStickyItems and gapAfterStickyItems > 0 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Size = UDim2.new(1, 0, 0, math.max(0, gapAfterStickyItems - gapBetweenFeedItems))
			}) else nil,
			NoStickyTopMargin = if fFlagLuaAppSduiStickyHeaderScrollAway and not var7 and (p9.feedTopMargin and p9.feedTopMargin > 0) then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Size = UDim2.new(1, 0, 0, math.max(0, p9.feedTopMargin - gapBetweenFeedItems))
			}) else nil,
			PoolStoreLayoutStoreWiring = if fFlagSduiPoolBackedFeed and sduiContext.configKey ~= nil then reactModule.createElement(PoolStoreLayoutStoreWiring, { configKey = sduiContext.configKey }) else nil,
			FeedImpressionsDetector = if impressionsTag and feedItems then reactModule.createElement(sduiFeedImpressionsDetectorModule, {
				sduiContext = sduiContext,
				feedItems = feedItems,
				parentRef = var17,
				impressionsTag = impressionsTag,
				scrollViewPositionChangedSignal = var19.current
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
			extraLocalProps = var27,
			maxConfigs = var36
		}) do
			t[i] = v
		end
		return t
	end, {
		feedItems, debugName, var16, var19, sduiContext, analyticsContext,
		gapBetweenFeedItems, impressionsTag, selectionBehaviorLeft,
		selectionBehaviorRight, var7, gapAfterStickyItems,
		if fFlagLuaAppSduiStickyHeaderScrollAway then p9.feedTopMargin else nil,
		var27, var9, p9.pageBottomPadding,
		if sduiEnableBackToTop then p9.enableBackToTop else nil,
		if sduiEnableBackToTop then var28 else nil, var17, var36
	})
	
	if var26 then
		var42 = reactModule.createElement(sduiFeedContextModule.Provider, { value = var26 }, var42)
	end
	local var43 = reactModule.createElement(collectionLayoutStoreProvider, { container = var14 }, var42)
	local t = { ["size-full-0 auto-y"] = true }
	
	if var9 then
		t[contentTag] = true
	end
	local var44 = reactModule.createElement(view, { tag = t, LayoutOrder = p9.layoutOrder, ref = var15 }, var43)
	
	if fFlagLuaAppSduiVideoThumbnail then
		var44 = reactModule.createElement(reactModule.Fragment, nil, {
			Content = var44,
			ViewportVideoAutoplaySync = if var33 then reactModule.createElement(viewportVideoAutoplaySync, {
				viewportAutoplayController = var33,
				scrollingFrameRef = var17
			}) else nil,
			ScrollDetector = if var33 then reactModule.createElement(scrollDetector, {
				scrollingFrameRef = var17,
				onScrollStart = var34,
				onScrollSettled = var35
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
		Sticky = if var7 then reactModule.createElement(sduiStickyHeaderModule, {
			zIndex = 2,
			stickyItems = p9.stickyItems,
			sduiContext = sduiContext,
			debugName = `{debugName}.StickyHeader`,
			contentTag = stickyContentTag,
			backgroundStyle = stickyBackgroundStyle,
			paddingTop = var12,
			paddingBottom = var13,
			gapBetweenItems = gapBetweenStickyItems,
			extraLocalProps = var27,
			impressionsTag = impressionsTag,
			selectionBehaviorLeft = selectionBehaviorLeft,
			selectionBehaviorRight = selectionBehaviorRight
		}) else nil,
		RefreshSpinner = if var11 then reactModule.createElement(pullToRefreshSpinner, {
			LayoutOrder = 2,
			onRefresh = if fFlagLuaAppSduiHomeFriendCarousel then var22 else p9.onRefresh,
			scrollingFrameRef = var16,
			appEventName = sduiContext.appPage
		}) else nil,
		Scroll = reactModule.createElement("ScrollingFrame", {
			LayoutOrder = 3,
			ref = var16,
			[reactModule.Change.CanvasPosition] = if fFlagSduiSrpScrollAway then var25 else var20,
			[reactModule.Change.CanvasSize] = var20,
			BackgroundColor3 = if p9.backgroundStyle then p9.backgroundStyle.Color3 else var10.Color.Surface.Surface_0.Color3,
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
			Content = var44
		})
	}) else var44
end)