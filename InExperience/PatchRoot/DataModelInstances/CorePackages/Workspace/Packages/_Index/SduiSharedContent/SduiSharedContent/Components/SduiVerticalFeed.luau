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

local function useProgressiveRowCapWithScroll(p1, p2, p3, p4, p5, p6)
	-- upvalues: useProgressiveRowCapModule (ref), reactModule (ref), signalsModule (ref), var1 (ref), var2 (ref), fFlagSduiPoolBackedFeed (ref), tutilsModule (ref), signalsReactModule (ref), useProgressiveItemCapOnScrollModule (ref), sduiVerticalFeedScrollInitialNumRows (ref), sduiVerticalFeedScrollLoadNumRows (ref), sduiVerticalFeedScrollPreloadDistancePx (ref)
	local var3, var4 = useProgressiveRowCapModule(if p1 then #p1 else 0, p2, p3, p4)
	local var5, var6 = useProgressiveItemCapOnScrollModule(signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var1 (copy), p5 (ref), var2 (copy), p1 (ref), fFlagSduiPoolBackedFeed (copy), tutilsModule (copy)
		return signalsModule.createComputed(function(p7)
			-- upvalues: var1 (copy), p5 (copy), var2 (copy), p1 (copy), fFlagSduiPoolBackedFeed (copy)
			var1(p7)
			
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
							local var8 = numberOfRowsGetter(p7)
							var7 = if var8 > 0 then var8 else 1
						end
					end
					list[i] = var7
				end
			end
			return list
		end, tutilsModule.shallowEqual)
	end, { p1, p5 })), sduiVerticalFeedScrollInitialNumRows, sduiVerticalFeedScrollLoadNumRows, if p5 then p6 else nil, sduiVerticalFeedScrollPreloadDistancePx)
	
	if p5 then
		return math.min(var3, var5), var4 or var6
	end
	return var3, var4
end

return reactModule.memo(function(p7)
	-- upvalues: fFlagLuaAppSduiVideoThumbnail (ref), useTokens (ref), fFlagLuaAppSduiStickyHeaderScrollAway (ref), useNavBarPlacement (ref), appNavBarModule (ref), usePreferredInput (ref), responsiveModule (ref), reactModule (ref), appCommonLibModule (ref), fFlagLuaAppSduiHomeFriendCarousel (ref), fFlagSduiSrpScrollAway (ref), scrollMovementDirection (ref), sduiEnableBackToTop (ref), useAnimateScrollViewToSelection (ref), useLastInputMode (ref), fFlagSduiVerticalFeedProgressiveFillOnScroll (ref), useProgressiveRowCapWithScroll (ref), useProgressiveRowCapModule (ref), useVerticalScrolledToEndThresholdModule (ref), sduiVerticalFeedBottomSpacerLayoutOrderConstant (ref), backToTopButtonModule (ref), fFlagSduiPoolBackedFeed (ref), PoolStoreLayoutStoreWiring (ref), sduiFeedImpressionsDetectorModule (ref), buildSduiFeedChildrenModule (ref), sduiFeedContextModule (ref), collectionLayoutStoreProvider (ref), view (ref), viewportVideoAutoplaySync (ref), scrollDetector (ref), sduiStickyHeaderModule (ref), pullToRefreshSpinnerModule (ref)
	local var7
	local analyticsContext = p7.analyticsContext
	local sduiContext = p7.sduiContext
	local var8 = if fFlagLuaAppSduiVideoThumbnail then sduiContext.videoPlaybackContext else nil
	local feedItems = p7.feedItems
	local debugName = p7.debugName
	local contentTag = p7.contentTag or p7.defaultContentTag
	local var9 = contentTag ~= nil and contentTag ~= ""
	local var10 = useTokens()
	
	if fFlagLuaAppSduiStickyHeaderScrollAway then
		var7 = false
		
		if p7.stickyItems ~= nil then
			local _ = #p7.stickyItems > 0
		end
	else
		var7 = p7.stickyItems ~= nil
	end
	local var11 = p7.onRefresh ~= nil
	local stickyContentTag = p7.stickyContentTag or p7.defaultStickyContentTag
	local stickyBackgroundStyle = p7.stickyBackgroundStyle or var10.Color.Surface.Surface_0
	local var12 = if fFlagLuaAppSduiStickyHeaderScrollAway then p7.stickyPaddingTop or var10.Gap.Medium else p7.stickyPaddingTop
	local var13 = if fFlagLuaAppSduiStickyHeaderScrollAway then p7.stickyPaddingBottom or var10.Gap.Medium else p7.stickyPaddingBottom
	local gapBetweenStickyItems = p7.gapBetweenStickyItems or var10.Gap.Medium
	local gapAfterStickyItems = p7.gapAfterStickyItems or var10.Gap.Medium
	local impressionsTag = p7.impressionsTag or (sduiContext.routeName or sduiContext.appPage)
	local selectionBehaviorLeft = p7.selectionBehaviorLeft or (if useNavBarPlacement() == appNavBarModule.Placement.Left then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop)
	local selectionBehaviorRight = p7.selectionBehaviorRight or Enum.SelectionBehavior.Stop
	local scrollBarThickness = p7.scrollBarThickness or (if usePreferredInput() == responsiveModule.Input.Pointer then 4 else 0)
	local var14, var15 = reactModule.useState(nil)
	local var16 = reactModule.useRef(nil)
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
			var19.current = appCommonLibModule.Signal.new()
		end
		var20 = reactModule.useCallback(function()
			-- upvalues: var19 (write), p7 (ref)
			if var19.current then
				var19.current:fire()
			end
			return if p7.onRefresh then p7.onRefresh() else nil
		end, { p7.onRefresh, var19 })
	end
	local var21 = if fFlagSduiSrpScrollAway then reactModule.useRef(0) else nil
	local var22 = if fFlagSduiSrpScrollAway then reactModule.useRef(scrollMovementDirection.Backward) else nil
	local var23 = if fFlagSduiSrpScrollAway then reactModule.useCallback(function(p8)
		-- upvalues: var18 (ref), p7 (ref), var21 (ref), scrollMovementDirection (copy), var22 (ref)
		var18()
		local onScrollDirectionChanged = p7.onScrollDirectionChanged
		
		if not onScrollDirectionChanged then return end
		local y = p8.CanvasPosition.Y
		
		if y < 0 then return end
		if y == var21.current then return end
		local var24 = if var21.current < y then scrollMovementDirection.Forward else scrollMovementDirection.Backward
		
		if var24 ~= var22.current then
			onScrollDirectionChanged(var24)
			var22.current = var24
		end
		var21.current = y
	end, { var18, p7.onScrollDirectionChanged }) else nil
	local var24 = reactModule.useMemo(function()
		-- upvalues: var17 (ref), var16 (ref)
		return {
			scrollViewPositionChangedSignal = var17.current,
			verticalScrollingFrameRef = var16
		}
	end, { var17, var16 })
	local gapBetweenFeedItems = p7.gapBetweenFeedItems or var10.Gap.Large
	local var25 = reactModule.useMemo(function()
		-- upvalues: var17 (ref), var16 (ref), fFlagLuaAppSduiHomeFriendCarousel (copy), var19 (write)
		return {
			scrollViewPositionChangedSignal = var17.current,
			verticalScrollingFrameRef = var16,
			refreshSignal = if fFlagLuaAppSduiHomeFriendCarousel then var19.current else nil
		}
	end, { var17, var16 })
	local scrollingFrameRef = p7.scrollingFrameRef or var16
	local var26 = nil
	local _ = nil
	
	if sduiEnableBackToTop then
		local var27, var28 = reactModule.useState(false)
		var26 = var27
		local var29 = var28
		reactModule.useEffect(function()
			-- upvalues: p7 (ref), scrollingFrameRef (ref), var29 (write)
			if not p7.enableBackToTop then return end
			local current = scrollingFrameRef.current
			
			if not current then return end
			local function updateIsScrollable()
				-- upvalues: current (ref), var29 (copy)
				local y = current.AbsoluteWindowSize.Y
				local y_1 = current.AbsoluteCanvasSize.Y
				
				if y < 0 then return end
				if y_1 < 0 then
					return
				end
				var29(y < y_1)
			end
			
			local list = {
				current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(updateIsScrollable),
				current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(updateIsScrollable)
			}
			local y = current.AbsoluteWindowSize.Y
			local y_1 = current.AbsoluteCanvasSize.Y
			
			if y >= 0 and y_1 >= 0 then
				var29(y < y_1)
			end
			return function()
				-- upvalues: list (ref)
				for i, v in list do
					v:Disconnect()
				end
			end
		end, { scrollingFrameRef, p7.enableBackToTop })
	end
	reactModule.useEffect(function()
		-- upvalues: p7 (ref), fFlagSduiSrpScrollAway (copy), var21 (ref), var23 (ref), var18 (ref)
		if not p7.scrollingFrameRef or not p7.scrollingFrameRef.current then
			return nil
		end
		local current = p7.scrollingFrameRef.current
		
		if fFlagSduiSrpScrollAway then
			var21.current = current.CanvasPosition.Y
		end
		local var30 = if fFlagSduiSrpScrollAway then {
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
			-- upvalues: var30 (ref)
			for i, v in var30 do
				v:Disconnect()
			end
		end
	end, {
		p7.scrollingFrameRef,
		var18,
		if fFlagSduiSrpScrollAway then var23 else nil
	})
	useAnimateScrollViewToSelection(scrollingFrameRef, 0.4)
	local isNotCursor = useLastInputMode() ~= "Cursor"
	local thresholdFromEnd = p7.thresholdFromEnd or 600
	local var31 = nil
	local var32 = nil
	local var33 = nil
	
	if fFlagLuaAppSduiVideoThumbnail then
		var31 = if var8 then var8.viewportVideoAutoplayController else nil
		var32 = reactModule.useCallback(function()
			-- upvalues: var31 (write)
			if var31 then
				var31:onScrollStart()
			end
		end, { var31 })
		var33 = reactModule.useCallback(function(p8)
			-- upvalues: var31 (write)
			if var31 then
				var31:onScrollSettled("Y", p8)
			end
		end, { var31 })
	end
	local var34, var35
	local _ = nil
	local _ = nil
	
	if fFlagSduiVerticalFeedProgressiveFillOnScroll then
		local var36, var37 = useProgressiveRowCapWithScroll(feedItems, p7.initialNumToRender, p7.progressiveFillRate, p7.progressiveFillIntervalMs, p7.progressiveFillOnScroll, scrollingFrameRef)
		var34 = var36
		var35 = var37
	else
		local var38, var39 = useProgressiveRowCapModule(if feedItems then #feedItems else 0, p7.initialNumToRender, p7.progressiveFillRate, p7.progressiveFillIntervalMs)
		var34 = var38
		var35 = var39
	end
	useVerticalScrolledToEndThresholdModule(scrollingFrameRef, thresholdFromEnd, if var35 then nil else p7.onScrollToEnd)
	local var40 = reactModule.useMemo(function()
		-- upvalues: feedItems (ref), p7 (ref), sduiEnableBackToTop (copy), var26 (write), reactModule (copy), sduiVerticalFeedBottomSpacerLayoutOrderConstant (copy), backToTopButtonModule (copy), scrollingFrameRef (ref), sduiContext (ref), gapBetweenFeedItems (ref), var7 (ref), gapAfterStickyItems (ref), fFlagLuaAppSduiStickyHeaderScrollAway (copy), fFlagSduiPoolBackedFeed (copy), PoolStoreLayoutStoreWiring (copy), impressionsTag (ref), sduiFeedImpressionsDetectorModule (copy), var17 (ref), buildSduiFeedChildrenModule (copy), debugName (ref), selectionBehaviorLeft (ref), selectionBehaviorRight (ref), var25 (ref), var34 (write)
		if feedItems == nil then
			return nil
		end
		local pageBottomPadding = p7.pageBottomPadding or 80
		local t = {
			BottomSpacer = if sduiEnableBackToTop and p7.enableBackToTop and var26 then reactModule.createElement("Frame", {
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
				Padding = UDim.new(0, gapBetweenFeedItems)
			}),
			StickyGap = if var7 and gapAfterStickyItems and gapAfterStickyItems > 0 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Size = UDim2.new(1, 0, 0, math.max(0, gapAfterStickyItems - gapBetweenFeedItems))
			}) else nil,
			NoStickyTopMargin = if fFlagLuaAppSduiStickyHeaderScrollAway and not var7 and (p7.feedTopMargin and p7.feedTopMargin > 0) then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Size = UDim2.new(1, 0, 0, math.max(0, p7.feedTopMargin - gapBetweenFeedItems))
			}) else nil,
			PoolStoreLayoutStoreWiring = if fFlagSduiPoolBackedFeed and sduiContext.configKey ~= nil then reactModule.createElement(PoolStoreLayoutStoreWiring, { configKey = sduiContext.configKey }) else nil,
			FeedImpressionsDetector = if impressionsTag and feedItems then reactModule.createElement(sduiFeedImpressionsDetectorModule, {
				sduiContext = sduiContext,
				feedItems = feedItems,
				parentRef = scrollingFrameRef,
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
			extraLocalProps = var25,
			maxConfigs = var34
		}) do
			t[i] = v
		end
		return t
	end, {
		feedItems, debugName, var16, var17, sduiContext, analyticsContext,
		gapBetweenFeedItems, impressionsTag, selectionBehaviorLeft,
		selectionBehaviorRight, var7, gapAfterStickyItems,
		if fFlagLuaAppSduiStickyHeaderScrollAway then p7.feedTopMargin else nil,
		var25, var9, p7.pageBottomPadding,
		if sduiEnableBackToTop then p7.enableBackToTop else nil,
		if sduiEnableBackToTop then var26 else nil, scrollingFrameRef, var34
	})
	
	if var24 then
		var40 = reactModule.createElement(sduiFeedContextModule.Provider, { value = var24 }, var40)
	end
	local var41 = reactModule.createElement(collectionLayoutStoreProvider, { container = var14 }, var40)
	local t = { ["size-full-0 auto-y"] = true }
	
	if var9 then
		t[contentTag] = true
	end
	local var42 = reactModule.createElement(view, { tag = t, LayoutOrder = p7.layoutOrder, ref = var15 }, var41)
	
	if fFlagLuaAppSduiVideoThumbnail then
		var42 = reactModule.createElement(reactModule.Fragment, nil, {
			Content = var42,
			ViewportVideoAutoplaySync = if var31 then reactModule.createElement(viewportVideoAutoplaySync, {
				viewportAutoplayController = var31,
				scrollingFrameRef = scrollingFrameRef
			}) else nil,
			ScrollDetector = if var31 then reactModule.createElement(scrollDetector, {
				scrollingFrameRef = scrollingFrameRef,
				onScrollStart = var32,
				onScrollSettled = var33
			}) else nil
		})
	end
	return if p7.scrollingFrameRef == nil then reactModule.createElement(view, {
		tag = "size-full",
		LayoutOrder = p7.layoutOrder,
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}
	}, {
		Sticky = if var7 then reactModule.createElement(sduiStickyHeaderModule, {
			zIndex = 2,
			stickyItems = p7.stickyItems,
			sduiContext = sduiContext,
			debugName = `{debugName}.StickyHeader`,
			contentTag = stickyContentTag,
			backgroundStyle = stickyBackgroundStyle,
			paddingTop = var12,
			paddingBottom = var13,
			gapBetweenItems = gapBetweenStickyItems,
			extraLocalProps = var25,
			impressionsTag = impressionsTag,
			selectionBehaviorLeft = selectionBehaviorLeft,
			selectionBehaviorRight = selectionBehaviorRight
		}) else nil,
		RefreshSpinner = if var11 then reactModule.createElement(pullToRefreshSpinnerModule, {
			LayoutOrder = 2,
			onRefresh = if fFlagLuaAppSduiHomeFriendCarousel then var20 else p7.onRefresh,
			scrollingFrameRef = var16,
			appEventName = sduiContext.appPage
		}) else nil,
		Scroll = reactModule.createElement("ScrollingFrame", {
			LayoutOrder = 3,
			ref = var16,
			[reactModule.Change.CanvasPosition] = if fFlagSduiSrpScrollAway then var23 else var18,
			[reactModule.Change.CanvasSize] = var18,
			BackgroundColor3 = if p7.backgroundStyle then p7.backgroundStyle.Color3 else var10.Color.Surface.Surface_0.Color3,
			BackgroundTransparency = if p7.backgroundStyle then p7.backgroundStyle.Transparency else nil,
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
			Content = var42
		})
	}) else var42
end)