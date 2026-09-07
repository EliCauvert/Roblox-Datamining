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
local useVerticalScrolledToEndThresholdModule = require(sduiSharedContent.Components.useVerticalScrolledToEndThreshold)
local useProgressiveRowCapModule = require(sduiSharedContent.Components.useProgressiveRowCap)
local buildSduiFeedChildrenModule = require(sduiSharedContent.Components.buildSduiFeedChildren)
local sduiFeedImpressionsDetectorModule = require(sduiSharedContent.Components.SduiFeedImpressionsDetector)
local backToTopButtonModule = require(sduiSharedContent.Components.BackToTopButton)
local scrollDetector = require(parent.ScrollTelemetry).ScrollDetector
local viewportVideoAutoplaySync = require(parent.VideoUtils).ViewportVideoAutoplaySync
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppSduiStickyHeaderScrollAway = sharedFlagsModule.FFlagLuaAppSduiStickyHeaderScrollAway
local fFlagSduiPoolBackedFeed = sharedFlagsModule.FFlagSduiPoolBackedFeed
local fFlagSduiSrpScrollAway = sharedFlagsModule.FFlagSduiSrpScrollAway
local sduiEnableBackToTop = game:DefineFastFlag("SduiEnableBackToTop", false)
local sduiVerticalFeedBottomSpacerLayoutOrderConstant = game:DefineFastFlag("SduiVerticalFeedBottomSpacerLayoutOrderConstant", false)
local fFlagLuaAppSduiVideoThumbnail = sharedFlagsModule.FFlagLuaAppSduiVideoThumbnail

local function PoolStoreLayoutStoreWiring(p1)
	-- upvalues: reactModule (ref), collectionLayoutStoreContext (ref), sduiPoolStore (ref)
	local var1 = reactModule.useContext(collectionLayoutStoreContext)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), sduiPoolStore (copy), p1 (ref)
		if var1 == nil then
			return
		end
		local sduiPoolStore_1 = sduiPoolStore.getSduiPoolStore(p1.configKey)
		sduiPoolStore_1.setLayoutStore(var1)
		
		return function()
			-- upvalues: sduiPoolStore_1 (ref)
			sduiPoolStore_1.setLayoutStore(nil)
		end
	end, { p1.configKey, var1 })
	
	return nil
end

return reactModule.memo(function(p1)
	-- upvalues: fFlagLuaAppSduiVideoThumbnail (ref), useTokens (ref), fFlagLuaAppSduiStickyHeaderScrollAway (ref), useNavBarPlacement (ref), appNavBarModule (ref), usePreferredInput (ref), responsiveModule (ref), reactModule (ref), appCommonLibModule (ref), fFlagSduiSrpScrollAway (ref), scrollMovementDirection (ref), sduiEnableBackToTop (ref), useAnimateScrollViewToSelection (ref), useLastInputMode (ref), useProgressiveRowCapModule (ref), useVerticalScrolledToEndThresholdModule (ref), sduiVerticalFeedBottomSpacerLayoutOrderConstant (ref), backToTopButtonModule (ref), fFlagSduiPoolBackedFeed (ref), PoolStoreLayoutStoreWiring (ref), sduiFeedImpressionsDetectorModule (ref), buildSduiFeedChildrenModule (ref), sduiFeedContextModule (ref), collectionLayoutStoreProvider (ref), view (ref), viewportVideoAutoplaySync (ref), scrollDetector (ref), sduiStickyHeaderModule (ref), pullToRefreshSpinnerModule (ref)
	local var1
	local analyticsContext = p1.analyticsContext
	local sduiContext = p1.sduiContext
	local var2 = if fFlagLuaAppSduiVideoThumbnail then sduiContext.videoPlaybackContext else nil
	local feedItems = p1.feedItems
	local debugName = p1.debugName
	local contentTag = p1.contentTag or p1.defaultContentTag
	local var3 = contentTag ~= nil and contentTag ~= ""
	local var4 = useTokens()
	
	if fFlagLuaAppSduiStickyHeaderScrollAway then
		var1 = false
		
		if p1.stickyItems ~= nil then
			local _ = #p1.stickyItems > 0
		end
	else
		var1 = p1.stickyItems ~= nil
	end
	local var5 = p1.onRefresh ~= nil
	local stickyContentTag = p1.stickyContentTag or p1.defaultStickyContentTag
	local stickyBackgroundStyle = p1.stickyBackgroundStyle or var4.Color.Surface.Surface_0
	local var6 = if fFlagLuaAppSduiStickyHeaderScrollAway then p1.stickyPaddingTop or var4.Gap.Medium else p1.stickyPaddingTop
	local var7 = if fFlagLuaAppSduiStickyHeaderScrollAway then p1.stickyPaddingBottom or var4.Gap.Medium else p1.stickyPaddingBottom
	local gapBetweenStickyItems = p1.gapBetweenStickyItems or var4.Gap.Medium
	local gapAfterStickyItems = p1.gapAfterStickyItems or var4.Gap.Medium
	local impressionsTag = p1.impressionsTag or (sduiContext.routeName or sduiContext.appPage)
	local selectionBehaviorLeft = p1.selectionBehaviorLeft or (if useNavBarPlacement() == appNavBarModule.Placement.Left then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop)
	local selectionBehaviorRight = p1.selectionBehaviorRight or Enum.SelectionBehavior.Stop
	local scrollBarThickness = p1.scrollBarThickness or (if usePreferredInput() == responsiveModule.Input.Pointer then 4 else 0)
	local var8, var9 = reactModule.useState(nil)
	local var10 = reactModule.useRef(nil)
	local var11 = reactModule.useRef(nil)
	
	if var11.current == nil then
		var11.current = appCommonLibModule.Signal.new()
	end
	local var12 = reactModule.useCallback(function()
		-- upvalues: var11 (ref)
		var11.current:fire()
	end, {})
	local var13 = if fFlagSduiSrpScrollAway then reactModule.useRef(0) else nil
	local var14 = if fFlagSduiSrpScrollAway then reactModule.useRef(scrollMovementDirection.Backward) else nil
	local var15 = if fFlagSduiSrpScrollAway then reactModule.useCallback(function(p2)
		-- upvalues: var12 (ref), p1 (ref), var13 (ref), scrollMovementDirection (copy), var14 (ref)
		var12()
		local onScrollDirectionChanged = p1.onScrollDirectionChanged
		
		if not onScrollDirectionChanged then return end
		local y = p2.CanvasPosition.Y
		
		if y < 0 then return end
		if y == var13.current then return end
		local var16 = if var13.current < y then scrollMovementDirection.Forward else scrollMovementDirection.Backward
		
		if var16 ~= var14.current then
			onScrollDirectionChanged(var16)
			var14.current = var16
		end
		var13.current = y
	end, { var12, p1.onScrollDirectionChanged }) else nil
	local var16 = reactModule.useMemo(function()
		-- upvalues: var11 (ref), var10 (ref)
		return {
			scrollViewPositionChangedSignal = var11.current,
			verticalScrollingFrameRef = var10
		}
	end, { var11, var10 })
	local gapBetweenFeedItems = p1.gapBetweenFeedItems or var4.Gap.Large
	local var17 = reactModule.useMemo(function()
		-- upvalues: var11 (ref), var10 (ref)
		return {
			scrollViewPositionChangedSignal = var11.current,
			verticalScrollingFrameRef = var10
		}
	end, { var11, var10 })
	local scrollingFrameRef = p1.scrollingFrameRef or var10
	local var18 = nil
	local _ = nil
	
	if sduiEnableBackToTop then
		local var19, var20 = reactModule.useState(false)
		var18 = var19
		local var21 = var20
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), scrollingFrameRef (ref), var21 (write)
			if not p1.enableBackToTop then return end
			local current = scrollingFrameRef.current
			
			if not current then return end
			local function updateIsScrollable()
				-- upvalues: current (ref), var21 (copy)
				local y = current.AbsoluteWindowSize.Y
				local y_1 = current.AbsoluteCanvasSize.Y
				
				if y < 0 then return end
				if y_1 < 0 then
					return
				end
				var21(y < y_1)
			end
			
			local list = {
				current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(updateIsScrollable),
				current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(updateIsScrollable)
			}
			local y = current.AbsoluteWindowSize.Y
			local y_1 = current.AbsoluteCanvasSize.Y
			
			if y >= 0 and y_1 >= 0 then
				var21(y < y_1)
			end
			return function()
				-- upvalues: list (ref)
				for i, v in list do
					v:Disconnect()
				end
			end
		end, { scrollingFrameRef, p1.enableBackToTop })
	end
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), fFlagSduiSrpScrollAway (copy), var13 (ref), var15 (ref), var12 (ref)
		if not p1.scrollingFrameRef or not p1.scrollingFrameRef.current then
			return nil
		end
		local current = p1.scrollingFrameRef.current
		
		if fFlagSduiSrpScrollAway then
			var13.current = current.CanvasPosition.Y
		end
		local var22 = if fFlagSduiSrpScrollAway then {
			current:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
				-- upvalues: var15 (copy), current (ref)
				var15(current)
			end),
			current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(var12)
		} else {
			current:GetPropertyChangedSignal("CanvasPosition"):Connect(var12),
			current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(var12)
		}
		
		return function()
			-- upvalues: var22 (ref)
			for i, v in var22 do
				v:Disconnect()
			end
		end
	end, {
		p1.scrollingFrameRef,
		var12,
		if fFlagSduiSrpScrollAway then var15 else nil
	})
	useAnimateScrollViewToSelection(scrollingFrameRef, 0.4)
	local isNotCursor = useLastInputMode() ~= "Cursor"
	local thresholdFromEnd = p1.thresholdFromEnd or 600
	local var23 = nil
	local var24 = nil
	local var25 = nil
	
	if fFlagLuaAppSduiVideoThumbnail then
		var23 = if var2 then var2.viewportVideoAutoplayController else nil
		var24 = reactModule.useCallback(function()
			-- upvalues: var23 (write)
			if var23 then
				var23:onScrollStart()
			end
		end, { var23 })
		var25 = reactModule.useCallback(function(p2)
			-- upvalues: var23 (write)
			if var23 then
				var23:onScrollSettled("Y", p2)
			end
		end, { var23 })
	end
	local var26, var27 = useProgressiveRowCapModule(if feedItems then #feedItems else 0, p1.initialNumToRender, p1.progressiveFillRate, p1.progressiveFillIntervalMs)
	useVerticalScrolledToEndThresholdModule(scrollingFrameRef, thresholdFromEnd, if var27 then nil else p1.onScrollToEnd)
	local var28 = reactModule.useMemo(function()
		-- upvalues: feedItems (ref), p1 (ref), sduiEnableBackToTop (copy), var18 (write), reactModule (copy), sduiVerticalFeedBottomSpacerLayoutOrderConstant (copy), backToTopButtonModule (copy), scrollingFrameRef (ref), sduiContext (ref), gapBetweenFeedItems (ref), var1 (ref), gapAfterStickyItems (ref), fFlagLuaAppSduiStickyHeaderScrollAway (copy), fFlagSduiPoolBackedFeed (copy), PoolStoreLayoutStoreWiring (copy), impressionsTag (ref), sduiFeedImpressionsDetectorModule (copy), var11 (ref), buildSduiFeedChildrenModule (copy), debugName (ref), selectionBehaviorLeft (ref), selectionBehaviorRight (ref), var17 (ref), var26 (ref)
		if feedItems == nil then
			return nil
		end
		local pageBottomPadding = p1.pageBottomPadding or 80
		local t = {
			BottomSpacer = if sduiEnableBackToTop and p1.enableBackToTop and var18 then reactModule.createElement("Frame", {
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
			StickyGap = if var1 and gapAfterStickyItems and gapAfterStickyItems > 0 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Size = UDim2.new(1, 0, 0, math.max(0, gapAfterStickyItems - gapBetweenFeedItems))
			}) else nil,
			NoStickyTopMargin = if fFlagLuaAppSduiStickyHeaderScrollAway and not var1 and (p1.feedTopMargin and p1.feedTopMargin > 0) then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Size = UDim2.new(1, 0, 0, math.max(0, p1.feedTopMargin - gapBetweenFeedItems))
			}) else nil,
			PoolStoreLayoutStoreWiring = if fFlagSduiPoolBackedFeed and sduiContext.configKey ~= nil then reactModule.createElement(PoolStoreLayoutStoreWiring, { configKey = sduiContext.configKey }) else nil,
			FeedImpressionsDetector = if impressionsTag and feedItems then reactModule.createElement(sduiFeedImpressionsDetectorModule, {
				sduiContext = sduiContext,
				feedItems = feedItems,
				parentRef = scrollingFrameRef,
				impressionsTag = impressionsTag,
				scrollViewPositionChangedSignal = var11.current
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
			extraLocalProps = var17,
			maxConfigs = var26
		}) do
			t[i] = v
		end
		return t
	end, {
		feedItems, debugName, var10, var11, sduiContext, analyticsContext,
		gapBetweenFeedItems, impressionsTag, selectionBehaviorLeft,
		selectionBehaviorRight, var1, gapAfterStickyItems,
		if fFlagLuaAppSduiStickyHeaderScrollAway then p1.feedTopMargin else nil, var17,
		var3, p1.pageBottomPadding,
		if sduiEnableBackToTop then p1.enableBackToTop else nil,
		if sduiEnableBackToTop then var18 else nil, scrollingFrameRef, var26
	})
	
	if var16 then
		var28 = reactModule.createElement(sduiFeedContextModule.Provider, { value = var16 }, var28)
	end
	local var29 = reactModule.createElement(collectionLayoutStoreProvider, { container = var8 }, var28)
	local t = { ["size-full-0 auto-y"] = true }
	
	if var3 then
		t[contentTag] = true
	end
	local var30 = reactModule.createElement(view, { tag = t, LayoutOrder = p1.layoutOrder, ref = var9 }, var29)
	
	if fFlagLuaAppSduiVideoThumbnail then
		var30 = reactModule.createElement(reactModule.Fragment, nil, {
			Content = var30,
			ViewportVideoAutoplaySync = if var23 then reactModule.createElement(viewportVideoAutoplaySync, {
				viewportAutoplayController = var23,
				scrollingFrameRef = scrollingFrameRef
			}) else nil,
			ScrollDetector = if var23 then reactModule.createElement(scrollDetector, {
				scrollingFrameRef = scrollingFrameRef,
				onScrollStart = var24,
				onScrollSettled = var25
			}) else nil
		})
	end
	return if p1.scrollingFrameRef == nil then reactModule.createElement(view, {
		tag = "size-full",
		LayoutOrder = p1.layoutOrder,
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}
	}, {
		Sticky = if var1 then reactModule.createElement(sduiStickyHeaderModule, {
			zIndex = 2,
			stickyItems = p1.stickyItems,
			sduiContext = sduiContext,
			debugName = `{debugName}.StickyHeader`,
			contentTag = stickyContentTag,
			backgroundStyle = stickyBackgroundStyle,
			paddingTop = var6,
			paddingBottom = var7,
			gapBetweenItems = gapBetweenStickyItems,
			extraLocalProps = var17,
			impressionsTag = impressionsTag,
			selectionBehaviorLeft = selectionBehaviorLeft,
			selectionBehaviorRight = selectionBehaviorRight
		}) else nil,
		RefreshSpinner = if var5 then reactModule.createElement(pullToRefreshSpinnerModule, {
			LayoutOrder = 2,
			onRefresh = p1.onRefresh,
			scrollingFrameRef = var10,
			appEventName = sduiContext.appPage
		}) else nil,
		Scroll = reactModule.createElement("ScrollingFrame", {
			LayoutOrder = 3,
			ref = var10,
			[reactModule.Change.CanvasPosition] = if fFlagSduiSrpScrollAway then var15 else var12,
			[reactModule.Change.CanvasSize] = var12,
			BackgroundColor3 = if p1.backgroundStyle then p1.backgroundStyle.Color3 else var4.Color.Surface.Surface_0.Color3,
			BackgroundTransparency = if p1.backgroundStyle then p1.backgroundStyle.Transparency else nil,
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
			Content = var30
		})
	}) else var30
end)