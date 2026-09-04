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
local pullToRefreshSpinnerModule = require(sduiSharedContent.Components.PullToRefreshSpinner)
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
	-- upvalues: fFlagLuaAppSduiVideoThumbnail (ref), useTokens (ref), fFlagLuaAppSduiStickyHeaderScrollAway (ref), useNavBarPlacement (ref), appNavBarModule (ref), usePreferredInput (ref), responsiveModule (ref), reactModule (ref), fFlagSduiVerticalFeedProgressiveFillOnScroll (ref), appCommonLibModule (ref), fFlagLuaAppSduiHomeFriendCarousel (ref), fFlagSduiSrpScrollAway (ref), scrollMovementDirection (ref), sduiEnableBackToTop (ref), useAnimateScrollViewToSelection (ref), useLastInputMode (ref), useProgressiveRowCapWithScroll (ref), sduiVerticalFeedScrollUnderfillDebounceMs (ref), useProgressiveRowCapModule (ref), useVerticalScrolledToEndThresholdModule (ref), sduiVerticalFeedBottomSpacerLayoutOrderConstant (ref), backToTopButtonModule (ref), fFlagSduiPoolBackedFeed (ref), PoolStoreLayoutStoreWiring (ref), sduiFeedImpressionsDetectorModule (ref), buildSduiFeedChildrenModule (ref), sduiFeedContextModule (ref), collectionLayoutStoreProvider (ref), view (ref), viewportVideoAutoplaySync (ref), scrollDetector (ref), sduiStickyHeaderModule (ref), pullToRefreshSpinnerModule (ref)
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
	local var17 = if fFlagSduiVerticalFeedProgressiveFillOnScroll then reactModule.useRef(nil) else nil
	local var18 = reactModule.useRef(nil)
	
	if var18.current == nil then
		var18.current = appCommonLibModule.Signal.new()
	end
	local var19 = reactModule.useCallback(function()
		-- upvalues: var18 (ref)
		var18.current:fire()
	end, {})
	local var20 = nil
	local var21 = nil
	
	if fFlagLuaAppSduiHomeFriendCarousel then
		var20 = reactModule.useRef(nil)
		
		if var20.current == nil then
			var20.current = appCommonLibModule.Signal.new()
		end
		var21 = reactModule.useCallback(function()
			-- upvalues: var20 (write), p9 (ref)
			if var20.current then
				var20.current:fire()
			end
			return if p9.onRefresh then p9.onRefresh() else nil
		end, { p9.onRefresh, var20 })
	end
	local var22 = if fFlagSduiSrpScrollAway then reactModule.useRef(0) else nil
	local var23 = if fFlagSduiSrpScrollAway then reactModule.useRef(scrollMovementDirection.Backward) else nil
	local var24 = if fFlagSduiSrpScrollAway then reactModule.useCallback(function(p10)
		-- upvalues: var19 (ref), p9 (ref), var22 (ref), scrollMovementDirection (copy), var23 (ref)
		var19()
		local onScrollDirectionChanged = p9.onScrollDirectionChanged
		
		if not onScrollDirectionChanged then return end
		local y = p10.CanvasPosition.Y
		
		if y < 0 then return end
		if y == var22.current then return end
		local var25 = if var22.current < y then scrollMovementDirection.Forward else scrollMovementDirection.Backward
		
		if var25 ~= var23.current then
			onScrollDirectionChanged(var25)
			var23.current = var25
		end
		var22.current = y
	end, { var19, p9.onScrollDirectionChanged }) else nil
	local var25 = reactModule.useMemo(function()
		-- upvalues: var18 (ref), var16 (ref)
		return {
			scrollViewPositionChangedSignal = var18.current,
			verticalScrollingFrameRef = var16
		}
	end, { var18, var16 })
	local gapBetweenFeedItems = p9.gapBetweenFeedItems or var10.Gap.Large
	local var26 = reactModule.useMemo(function()
		-- upvalues: var18 (ref), var16 (ref), fFlagLuaAppSduiHomeFriendCarousel (copy), var20 (write)
		return {
			scrollViewPositionChangedSignal = var18.current,
			verticalScrollingFrameRef = var16,
			refreshSignal = if fFlagLuaAppSduiHomeFriendCarousel then var20.current else nil
		}
	end, { var18, var16 })
	local scrollingFrameRef = p9.scrollingFrameRef or var16
	local var27 = nil
	local _ = nil
	
	if sduiEnableBackToTop then
		local var28, var29 = reactModule.useState(false)
		var27 = var28
		local var30 = var29
		reactModule.useEffect(function()
			-- upvalues: p9 (ref), scrollingFrameRef (ref), var30 (write)
			if not p9.enableBackToTop then return end
			local current = scrollingFrameRef.current
			
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
		end, { scrollingFrameRef, p9.enableBackToTop })
	end
	reactModule.useEffect(function()
		-- upvalues: p9 (ref), fFlagSduiSrpScrollAway (copy), var22 (ref), var24 (ref), var19 (ref)
		if not p9.scrollingFrameRef or not p9.scrollingFrameRef.current then
			return nil
		end
		local current = p9.scrollingFrameRef.current
		
		if fFlagSduiSrpScrollAway then
			var22.current = current.CanvasPosition.Y
		end
		local var31 = if fFlagSduiSrpScrollAway then {
			current:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
				-- upvalues: var24 (copy), current (ref)
				var24(current)
			end),
			current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(var19)
		} else {
			current:GetPropertyChangedSignal("CanvasPosition"):Connect(var19),
			current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(var19)
		}
		
		return function()
			-- upvalues: var31 (ref)
			for i, v in var31 do
				v:Disconnect()
			end
		end
	end, {
		p9.scrollingFrameRef,
		var19,
		if fFlagSduiSrpScrollAway then var24 else nil
	})
	useAnimateScrollViewToSelection(scrollingFrameRef, 0.4)
	local isNotCursor = useLastInputMode() ~= "Cursor"
	local thresholdFromEnd = p9.thresholdFromEnd or 600
	local var32 = nil
	local var33 = nil
	local var34 = nil
	
	if fFlagLuaAppSduiVideoThumbnail then
		var32 = if var8 then var8.viewportVideoAutoplayController else nil
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
		local var37, var38 = useProgressiveRowCapWithScroll(feedItems, p9.initialNumToRender, p9.progressiveFillRate, p9.progressiveFillIntervalMs, p9.progressiveFillOnScroll, scrollingFrameRef, var17, sduiVerticalFeedScrollUnderfillDebounceMs)
		var35 = var37
		var36 = var38
	else
		local var39, var40 = useProgressiveRowCapModule(if feedItems then #feedItems else 0, p9.initialNumToRender, p9.progressiveFillRate, p9.progressiveFillIntervalMs)
		var35 = var39
		var36 = var40
	end
	useVerticalScrolledToEndThresholdModule(scrollingFrameRef, thresholdFromEnd, if var36 then nil else p9.onScrollToEnd)
	local var41 = reactModule.useMemo(function()
		-- upvalues: feedItems (ref), p9 (ref), sduiEnableBackToTop (copy), var27 (write), reactModule (copy), sduiVerticalFeedBottomSpacerLayoutOrderConstant (copy), backToTopButtonModule (copy), scrollingFrameRef (ref), sduiContext (ref), gapBetweenFeedItems (ref), fFlagSduiVerticalFeedProgressiveFillOnScroll (copy), var17 (ref), var7 (ref), gapAfterStickyItems (ref), fFlagLuaAppSduiStickyHeaderScrollAway (copy), fFlagSduiPoolBackedFeed (copy), PoolStoreLayoutStoreWiring (copy), impressionsTag (ref), sduiFeedImpressionsDetectorModule (copy), var18 (ref), buildSduiFeedChildrenModule (copy), debugName (ref), selectionBehaviorLeft (ref), selectionBehaviorRight (ref), var26 (ref), var35 (write)
		if feedItems == nil then
			return nil
		end
		local pageBottomPadding = p9.pageBottomPadding or 80
		local t = {
			BottomSpacer = if sduiEnableBackToTop and p9.enableBackToTop and var27 then reactModule.createElement("Frame", {
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
					scrollingFrameRef = scrollingFrameRef,
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
				ref = if fFlagSduiVerticalFeedProgressiveFillOnScroll then var17 else nil
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
				parentRef = scrollingFrameRef,
				impressionsTag = impressionsTag,
				scrollViewPositionChangedSignal = var18.current
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
			maxConfigs = var35
		}) do
			t[i] = v
		end
		return t
	end, {
		feedItems, debugName, var16, var18, sduiContext, analyticsContext,
		gapBetweenFeedItems, impressionsTag, selectionBehaviorLeft,
		selectionBehaviorRight, var7, gapAfterStickyItems,
		if fFlagLuaAppSduiStickyHeaderScrollAway then p9.feedTopMargin else nil,
		var26, var9, p9.pageBottomPadding,
		if sduiEnableBackToTop then p9.enableBackToTop else nil,
		if sduiEnableBackToTop then var27 else nil, scrollingFrameRef, var35
	})
	
	if var25 then
		var41 = reactModule.createElement(sduiFeedContextModule.Provider, { value = var25 }, var41)
	end
	local var42 = reactModule.createElement(collectionLayoutStoreProvider, { container = var14 }, var41)
	local t = { ["size-full-0 auto-y"] = true }
	
	if var9 then
		t[contentTag] = true
	end
	local var43 = reactModule.createElement(view, { tag = t, LayoutOrder = p9.layoutOrder, ref = var15 }, var42)
	
	if fFlagLuaAppSduiVideoThumbnail then
		var43 = reactModule.createElement(reactModule.Fragment, nil, {
			Content = var43,
			ViewportVideoAutoplaySync = if var32 then reactModule.createElement(viewportVideoAutoplaySync, {
				viewportAutoplayController = var32,
				scrollingFrameRef = scrollingFrameRef
			}) else nil,
			ScrollDetector = if var32 then reactModule.createElement(scrollDetector, {
				scrollingFrameRef = scrollingFrameRef,
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
			extraLocalProps = var26,
			impressionsTag = impressionsTag,
			selectionBehaviorLeft = selectionBehaviorLeft,
			selectionBehaviorRight = selectionBehaviorRight
		}) else nil,
		RefreshSpinner = if var11 then reactModule.createElement(pullToRefreshSpinnerModule, {
			LayoutOrder = 2,
			onRefresh = if fFlagLuaAppSduiHomeFriendCarousel then var21 else p9.onRefresh,
			scrollingFrameRef = var16,
			appEventName = sduiContext.appPage
		}) else nil,
		Scroll = reactModule.createElement("ScrollingFrame", {
			LayoutOrder = 3,
			ref = var16,
			[reactModule.Change.CanvasPosition] = if fFlagSduiSrpScrollAway then var24 else var19,
			[reactModule.Change.CanvasSize] = var19,
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
			Content = var43
		})
	}) else var43
end)