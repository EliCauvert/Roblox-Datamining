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
local fFlagLuaAppSduiHomeFriendCarousel = sharedFlagsModule.FFlagLuaAppSduiHomeFriendCarousel
local fFlagSduiPoolBackedFeed = sharedFlagsModule.FFlagSduiPoolBackedFeed
local fFlagSduiSrpScrollAway = sharedFlagsModule.FFlagSduiSrpScrollAway
local sduiEnableBackToTop = game:DefineFastFlag("SduiEnableBackToTop", false)
local sduiVerticalFeedBottomSpacerLayoutOrderConstant = game:DefineFastFlag("SduiVerticalFeedBottomSpacerLayoutOrderConstant", false)
local fFlagLuaAppSduiVideoThumbnail = sharedFlagsModule.FFlagLuaAppSduiVideoThumbnail

local function PoolStoreLayoutStoreWiring(p0) --[[ line: 120 ]]
	-- upvalues: reactModule (ref), collectionLayoutStoreContext (ref), sduiPoolStore (ref)
	local var20 = reactModule.useContext(collectionLayoutStoreContext)
	reactModule.useEffect(function() --[[ line: 122 ]]
		-- upvalues: var20 (ref), sduiPoolStore (copy), p0 (ref)
		if var20 == nil then
			return
		end
		local sduiPoolStore_1 = sduiPoolStore.getSduiPoolStore(p0.configKey)
		sduiPoolStore_1.setLayoutStore(var20)
		
		return function() --[[ line: 128 ]]
			-- upvalues: sduiPoolStore_1 (ref)
			sduiPoolStore_1.setLayoutStore(nil)
		end
	end, { p0.configKey, var20 })
	
	return nil
end

return reactModule.memo(function(p1) --[[ line: 135 | named "SduiVerticalFeed" ]]
	-- upvalues: fFlagLuaAppSduiVideoThumbnail (ref), useTokens (ref), fFlagLuaAppSduiStickyHeaderScrollAway (ref), useNavBarPlacement (ref), appNavBarModule (ref), usePreferredInput (ref), responsiveModule (ref), reactModule (ref), appCommonLibModule (ref), fFlagLuaAppSduiHomeFriendCarousel (ref), fFlagSduiSrpScrollAway (ref), scrollMovementDirection (ref), sduiEnableBackToTop (ref), useAnimateScrollViewToSelection (ref), useLastInputMode (ref), useProgressiveRowCapModule (ref), useVerticalScrolledToEndThresholdModule (ref), sduiVerticalFeedBottomSpacerLayoutOrderConstant (ref), backToTopButtonModule (ref), fFlagSduiPoolBackedFeed (ref), PoolStoreLayoutStoreWiring (ref), sduiFeedImpressionsDetectorModule (ref), buildSduiFeedChildrenModule (ref), sduiFeedContextModule (ref), collectionLayoutStoreProvider (ref), view (ref), viewportVideoAutoplaySync (ref), scrollDetector (ref), sduiStickyHeaderModule (ref), pullToRefreshSpinnerModule (ref)
	local var26
	local analyticsContext = p1.analyticsContext
	local sduiContext = p1.sduiContext
	local var22 = if fFlagLuaAppSduiVideoThumbnail then sduiContext.videoPlaybackContext else nil
	local feedItems = p1.feedItems
	local debugName = p1.debugName
	local contentTag = p1.contentTag or p1.defaultContentTag
	local var24 = contentTag ~= nil and contentTag ~= ""
	local var25 = useTokens()
	
	if fFlagLuaAppSduiStickyHeaderScrollAway then
		var26 = false
		
		if p1.stickyItems ~= nil then
			local _ = #p1.stickyItems > 0
		end
	else
		var26 = p1.stickyItems ~= nil
	end
	local var27 = p1.onRefresh ~= nil
	local stickyContentTag = p1.stickyContentTag or p1.defaultStickyContentTag
	local stickyBackgroundStyle = p1.stickyBackgroundStyle or var25.Color.Surface.Surface_0
	local var30 = if fFlagLuaAppSduiStickyHeaderScrollAway then p1.stickyPaddingTop or var25.Gap.Medium else p1.stickyPaddingTop
	local var31 = if fFlagLuaAppSduiStickyHeaderScrollAway then p1.stickyPaddingBottom or var25.Gap.Medium else p1.stickyPaddingBottom
	local gapBetweenStickyItems = p1.gapBetweenStickyItems or var25.Gap.Medium
	local gapAfterStickyItems = p1.gapAfterStickyItems or var25.Gap.Medium
	local impressionsTag = p1.impressionsTag or (sduiContext.routeName or sduiContext.appPage)
	local selectionBehaviorLeft = p1.selectionBehaviorLeft or (if useNavBarPlacement() == appNavBarModule.Placement.Left then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop)
	local selectionBehaviorRight = p1.selectionBehaviorRight or Enum.SelectionBehavior.Stop
	local scrollBarThickness = p1.scrollBarThickness or (if usePreferredInput() == responsiveModule.Input.Pointer then 4 else 0)
	local var38, var39 = reactModule.useState(nil)
	local var40 = reactModule.useRef(nil)
	local var41 = reactModule.useRef(nil)
	
	if var41.current == nil then
		var41.current = appCommonLibModule.Signal.new()
	end
	local var42 = reactModule.useCallback(function() --[[ line: 184 ]]
		-- upvalues: var41 (ref)
		var41.current:fire()
	end, {})
	local var43 = nil
	local var44 = nil
	
	if fFlagLuaAppSduiHomeFriendCarousel then
		var43 = reactModule.useRef(nil)
		
		if var43.current == nil then
			var43.current = appCommonLibModule.Signal.new()
		end
		var44 = reactModule.useCallback(function() --[[ line: 196 ]]
			-- upvalues: var43 (write), p1 (ref)
			if var43.current then
				var43.current:fire()
			end
			return if p1.onRefresh then p1.onRefresh() else nil
		end, { p1.onRefresh, var43 })
	end
	local var45 = if fFlagSduiSrpScrollAway then reactModule.useRef(0) else nil
	local var46 = if fFlagSduiSrpScrollAway then reactModule.useRef(scrollMovementDirection.Backward) else nil
	local var47 = if fFlagSduiSrpScrollAway then reactModule.useCallback(function(p2) --[[ line: 215 ]]
		-- upvalues: var42 (ref), p1 (ref), var45 (ref), scrollMovementDirection (copy), var46 (ref)
		var42()
		local onScrollDirectionChanged = p1.onScrollDirectionChanged
		
		if not onScrollDirectionChanged then return end
		local y = p2.CanvasPosition.Y
		
		if y < 0 then return end
		if y == var45.current then return end
		local var67 = if var45.current < y then scrollMovementDirection.Forward else scrollMovementDirection.Backward
		
		if var67 ~= var46.current then
			onScrollDirectionChanged(var67)
			var46.current = var67
		end
		var45.current = y
	end, { var42, p1.onScrollDirectionChanged }) else nil
	local var48 = reactModule.useMemo(function() --[[ line: 243 ]]
		-- upvalues: var41 (ref), var40 (ref)
		return {
			scrollViewPositionChangedSignal = var41.current,
			verticalScrollingFrameRef = var40
		}
	end, { var41, var40 })
	local gapBetweenFeedItems = p1.gapBetweenFeedItems or var25.Gap.Large
	local var50 = reactModule.useMemo(function() --[[ line: 253 ]]
		-- upvalues: var41 (ref), var40 (ref), fFlagLuaAppSduiHomeFriendCarousel (copy), var43 (write)
		return {
			scrollViewPositionChangedSignal = var41.current,
			verticalScrollingFrameRef = var40,
			refreshSignal = if fFlagLuaAppSduiHomeFriendCarousel then var43.current else nil
		}
	end, { var41, var40 })
	local scrollingFrameRef = p1.scrollingFrameRef or var40
	local var52 = nil
	local _ = nil
	
	if sduiEnableBackToTop then
		local var53, var54 = reactModule.useState(false)
		var52 = var53
		local var55 = var54
		reactModule.useEffect(function() --[[ line: 275 ]]
			-- upvalues: p1 (ref), scrollingFrameRef (ref), var55 (write)
			if not p1.enableBackToTop then return end
			local current = scrollingFrameRef.current
			
			if not current then return end
			local function updateIsScrollable() --[[ line: 284 ]]
				-- upvalues: current (ref), var55 (copy)
				local y = current.AbsoluteWindowSize.Y
				local y_1 = current.AbsoluteCanvasSize.Y
				
				if y < 0 then return end
				if y_1 < 0 then
					return
				end
				var55(y < y_1)
			end
			
			local list = {
				current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(updateIsScrollable),
				current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(updateIsScrollable)
			}
			local y = current.AbsoluteWindowSize.Y
			local y_1 = current.AbsoluteCanvasSize.Y
			
			if y >= 0 and y_1 >= 0 then
				var55(y < y_1)
			end
			return function() --[[ line: 302 ]]
				-- upvalues: list (ref)
				for i, v in list do
					v:Disconnect()
				end
			end
		end, { scrollingFrameRef, p1.enableBackToTop })
	end
	reactModule.useEffect(function() --[[ line: 310 ]]
		-- upvalues: p1 (ref), fFlagSduiSrpScrollAway (copy), var45 (ref), var47 (ref), var42 (ref)
		if not p1.scrollingFrameRef or not p1.scrollingFrameRef.current then
			return nil
		end
		local current = p1.scrollingFrameRef.current
		
		if fFlagSduiSrpScrollAway then
			var45.current = current.CanvasPosition.Y
		end
		local var70 = if fFlagSduiSrpScrollAway then {
			current:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ line: 323 ]]
				-- upvalues: var47 (copy), current (ref)
				var47(current)
			end),
			current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(var42)
		} else {
			current:GetPropertyChangedSignal("CanvasPosition"):Connect(var42),
			current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(var42)
		}
		
		return function() --[[ line: 333 ]]
			-- upvalues: var70 (ref)
			for i, v in var70 do
				v:Disconnect()
			end
		end
	end, {
		p1.scrollingFrameRef,
		var42,
		if fFlagSduiSrpScrollAway then var47 else nil
	})
	useAnimateScrollViewToSelection(scrollingFrameRef, 0.4)
	local isNotCursor = useLastInputMode() ~= "Cursor"
	local thresholdFromEnd = p1.thresholdFromEnd or 600
	local var58 = nil
	local var59 = nil
	local var60 = nil
	
	if fFlagLuaAppSduiVideoThumbnail then
		var58 = if var22 then var22.viewportVideoAutoplayController else nil
		var59 = reactModule.useCallback(function() --[[ line: 360 ]]
			-- upvalues: var58 (write)
			if var58 then
				var58:onScrollStart()
			end
		end, { var58 })
		var60 = reactModule.useCallback(function(p3) --[[ line: 365 ]]
			-- upvalues: var58 (write)
			if var58 then
				var58:onScrollSettled("Y", p3)
			end
		end, { var58 })
	end
	local var61, var62 = useProgressiveRowCapModule(if feedItems then #feedItems else 0, p1.initialNumToRender, p1.progressiveFillRate, p1.progressiveFillIntervalMs)
	useVerticalScrolledToEndThresholdModule(scrollingFrameRef, thresholdFromEnd, if var62 then nil else p1.onScrollToEnd)
	local var63 = reactModule.useMemo(function() --[[ line: 388 ]]
		-- upvalues: feedItems (ref), p1 (ref), sduiEnableBackToTop (copy), var52 (write), reactModule (copy), sduiVerticalFeedBottomSpacerLayoutOrderConstant (copy), backToTopButtonModule (copy), scrollingFrameRef (ref), sduiContext (ref), gapBetweenFeedItems (ref), var26 (ref), gapAfterStickyItems (ref), fFlagLuaAppSduiStickyHeaderScrollAway (copy), fFlagSduiPoolBackedFeed (copy), PoolStoreLayoutStoreWiring (copy), impressionsTag (ref), sduiFeedImpressionsDetectorModule (copy), var41 (ref), buildSduiFeedChildrenModule (copy), debugName (ref), selectionBehaviorLeft (ref), selectionBehaviorRight (ref), var50 (ref), var61 (ref)
		if feedItems == nil then
			return nil
		end
		local pageBottomPadding = p1.pageBottomPadding or 80
		local t = {
			BottomSpacer = if sduiEnableBackToTop and p1.enableBackToTop and var52 then reactModule.createElement("Frame", {
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
			StickyGap = if var26 and gapAfterStickyItems and gapAfterStickyItems > 0 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Size = UDim2.new(1, 0, 0, math.max(0, gapAfterStickyItems - gapBetweenFeedItems))
			}) else nil,
			NoStickyTopMargin = if fFlagLuaAppSduiStickyHeaderScrollAway and not var26 and (p1.feedTopMargin and p1.feedTopMargin > 0) then reactModule.createElement("Frame", {
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
				scrollViewPositionChangedSignal = var41.current
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
			extraLocalProps = var50,
			maxConfigs = var61
		}) do
			t[i] = v
		end
		return t
	end, {
		feedItems, debugName, var40, var41, sduiContext, analyticsContext,
		gapBetweenFeedItems, impressionsTag, selectionBehaviorLeft,
		selectionBehaviorRight, var26, gapAfterStickyItems,
		if fFlagLuaAppSduiStickyHeaderScrollAway then p1.feedTopMargin else nil, var50,
		var24, p1.pageBottomPadding,
		if sduiEnableBackToTop then p1.enableBackToTop else nil,
		if sduiEnableBackToTop then var52 else nil, scrollingFrameRef, var61
	})
	
	if var48 then
		var63 = reactModule.createElement(sduiFeedContextModule.Provider, { value = var48 }, var63)
	end
	local var64 = reactModule.createElement(collectionLayoutStoreProvider, { container = var38 }, var63)
	local t = { ["size-full-0 auto-y"] = true }
	
	if var24 then
		t[contentTag] = true
	end
	local var66 = reactModule.createElement(view, { tag = t, LayoutOrder = p1.layoutOrder, ref = var39 }, var64)
	
	if fFlagLuaAppSduiVideoThumbnail then
		var66 = reactModule.createElement(reactModule.Fragment, nil, {
			Content = var66,
			ViewportVideoAutoplaySync = if var58 then reactModule.createElement(viewportVideoAutoplaySync, {
				viewportAutoplayController = var58,
				scrollingFrameRef = scrollingFrameRef
			}) else nil,
			ScrollDetector = if var58 then reactModule.createElement(scrollDetector, {
				scrollingFrameRef = scrollingFrameRef,
				onScrollStart = var59,
				onScrollSettled = var60
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
		Sticky = if var26 then reactModule.createElement(sduiStickyHeaderModule, {
			zIndex = 2,
			stickyItems = p1.stickyItems,
			sduiContext = sduiContext,
			debugName = `{debugName}.StickyHeader`,
			contentTag = stickyContentTag,
			backgroundStyle = stickyBackgroundStyle,
			paddingTop = var30,
			paddingBottom = var31,
			gapBetweenItems = gapBetweenStickyItems,
			extraLocalProps = var50,
			impressionsTag = impressionsTag,
			selectionBehaviorLeft = selectionBehaviorLeft,
			selectionBehaviorRight = selectionBehaviorRight
		}) else nil,
		RefreshSpinner = if var27 then reactModule.createElement(pullToRefreshSpinnerModule, {
			LayoutOrder = 2,
			onRefresh = if fFlagLuaAppSduiHomeFriendCarousel then var44 else p1.onRefresh,
			scrollingFrameRef = var40,
			appEventName = sduiContext.appPage
		}) else nil,
		Scroll = reactModule.createElement("ScrollingFrame", {
			LayoutOrder = 3,
			ref = var40,
			[reactModule.Change.CanvasPosition] = if fFlagSduiSrpScrollAway then var47 else var42,
			[reactModule.Change.CanvasSize] = var42,
			BackgroundColor3 = if p1.backgroundStyle then p1.backgroundStyle.Color3 else var25.Color.Surface.Surface_0.Color3,
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
			Content = var66
		})
	}) else var66
end)