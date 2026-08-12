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
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppSduiStickyHeaderScrollAway = sharedFlagsModule.FFlagLuaAppSduiStickyHeaderScrollAway
local fFlagSduiPoolBackedFeed = sharedFlagsModule.FFlagSduiPoolBackedFeed
local fFlagSduiSrpScrollAway = sharedFlagsModule.FFlagSduiSrpScrollAway
local sduiEnableBackToTop = game:DefineFastFlag("SduiEnableBackToTop", false)

local function PoolStoreLayoutStoreWiring(p0) --[[ line: 111 ]]
	-- upvalues: reactModule (ref), collectionLayoutStoreContext (ref), sduiPoolStore (ref)
	local var19 = reactModule.useContext(collectionLayoutStoreContext)
	reactModule.useEffect(function() --[[ line: 113 ]]
		-- upvalues: var19 (ref), sduiPoolStore (copy), p0 (ref)
		if var19 == nil then
			return
		end
		local sduiPoolStore_1 = sduiPoolStore.getSduiPoolStore(p0.configKey)
		sduiPoolStore_1.setLayoutStore(var19)
		
		return function() --[[ line: 119 ]]
			-- upvalues: sduiPoolStore_1 (ref)
			sduiPoolStore_1.setLayoutStore(nil)
		end
	end, { p0.configKey, var19 })
	
	return nil
end

return reactModule.memo(function(p1) --[[ line: 126 | named "SduiVerticalFeed" ]]
	-- upvalues: useTokens (ref), fFlagLuaAppSduiStickyHeaderScrollAway (ref), useNavBarPlacement (ref), appNavBarModule (ref), usePreferredInput (ref), responsiveModule (ref), reactModule (ref), appCommonLibModule (ref), fFlagSduiSrpScrollAway (ref), scrollMovementDirection (ref), sduiEnableBackToTop (ref), useAnimateScrollViewToSelection (ref), useLastInputMode (ref), useProgressiveRowCapModule (ref), useVerticalScrolledToEndThresholdModule (ref), backToTopButtonModule (ref), fFlagSduiPoolBackedFeed (ref), PoolStoreLayoutStoreWiring (ref), sduiFeedImpressionsDetectorModule (ref), buildSduiFeedChildrenModule (ref), sduiFeedContextModule (ref), collectionLayoutStoreProvider (ref), view (ref), sduiStickyHeaderModule (ref), pullToRefreshSpinnerModule (ref)
	local var24
	local analyticsContext = p1.analyticsContext
	local sduiContext = p1.sduiContext
	local feedItems = p1.feedItems
	local debugName = p1.debugName
	local contentTag = p1.contentTag or p1.defaultContentTag
	local var22 = contentTag ~= nil and contentTag ~= ""
	local var23 = useTokens()
	
	if fFlagLuaAppSduiStickyHeaderScrollAway then
		var24 = false
		
		if p1.stickyItems ~= nil then
			local _ = #p1.stickyItems > 0
		end
	else
		var24 = p1.stickyItems ~= nil
	end
	local var25 = p1.onRefresh ~= nil
	local stickyContentTag = p1.stickyContentTag or p1.defaultStickyContentTag
	local stickyBackgroundStyle = p1.stickyBackgroundStyle or var23.Color.Surface.Surface_0
	local var28 = if fFlagLuaAppSduiStickyHeaderScrollAway then p1.stickyPaddingTop or var23.Gap.Medium else p1.stickyPaddingTop
	local var29 = if fFlagLuaAppSduiStickyHeaderScrollAway then p1.stickyPaddingBottom or var23.Gap.Medium else p1.stickyPaddingBottom
	local gapBetweenStickyItems = p1.gapBetweenStickyItems or var23.Gap.Medium
	local gapAfterStickyItems = p1.gapAfterStickyItems or var23.Gap.Medium
	local impressionsTag = p1.impressionsTag or (sduiContext.routeName or sduiContext.appPage)
	local selectionBehaviorLeft = p1.selectionBehaviorLeft or (if useNavBarPlacement() == appNavBarModule.Placement.Left then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop)
	local selectionBehaviorRight = p1.selectionBehaviorRight or Enum.SelectionBehavior.Stop
	local scrollBarThickness = p1.scrollBarThickness or (if usePreferredInput() == responsiveModule.Input.Pointer then 4 else 0)
	local var36, var37 = reactModule.useState(nil)
	local var38 = reactModule.useRef(nil)
	local var39 = reactModule.useRef(nil)
	
	if var39.current == nil then
		var39.current = appCommonLibModule.Signal.new()
	end
	local var40 = reactModule.useCallback(function() --[[ line: 172 ]]
		-- upvalues: var39 (ref)
		var39.current:fire()
	end, {})
	local var41 = if fFlagSduiSrpScrollAway then reactModule.useRef(0) else nil
	local var42 = if fFlagSduiSrpScrollAway then reactModule.useRef(scrollMovementDirection.Backward) else nil
	local var43 = if fFlagSduiSrpScrollAway then reactModule.useCallback(function(p2) --[[ line: 180 ]]
		-- upvalues: var40 (ref), p1 (ref), var41 (ref), scrollMovementDirection (copy), var42 (ref)
		var40()
		local onScrollDirectionChanged = p1.onScrollDirectionChanged
		
		if not onScrollDirectionChanged then return end
		local y = p2.CanvasPosition.Y
		
		if y < 0 then return end
		if y == var41.current then return end
		local var60 = if var41.current < y then scrollMovementDirection.Forward else scrollMovementDirection.Backward
		
		if var60 ~= var42.current then
			onScrollDirectionChanged(var60)
			var42.current = var60
		end
		var41.current = y
	end, { var40, p1.onScrollDirectionChanged }) else nil
	local var44 = reactModule.useMemo(function() --[[ line: 208 ]]
		-- upvalues: var39 (ref), var38 (ref)
		return {
			scrollViewPositionChangedSignal = var39.current,
			verticalScrollingFrameRef = var38
		}
	end, { var39, var38 })
	local gapBetweenFeedItems = p1.gapBetweenFeedItems or var23.Gap.Large
	local var46 = reactModule.useMemo(function() --[[ line: 217 ]]
		-- upvalues: var39 (ref), var38 (ref)
		return {
			scrollViewPositionChangedSignal = var39.current,
			verticalScrollingFrameRef = var38
		}
	end, { var39, var38 })
	local scrollingFrameRef = p1.scrollingFrameRef or var38
	local var48 = nil
	local _ = nil
	
	if sduiEnableBackToTop then
		local var49, var50 = reactModule.useState(false)
		var48 = var49
		local var51 = var50
		reactModule.useEffect(function() --[[ line: 233 ]]
			-- upvalues: p1 (ref), scrollingFrameRef (ref), var51 (write)
			if not p1.enableBackToTop then return end
			local current = scrollingFrameRef.current
			
			if not current then return end
			local function updateIsScrollable() --[[ line: 242 ]]
				-- upvalues: current (ref), var51 (copy)
				local y = current.AbsoluteWindowSize.Y
				local y_1 = current.AbsoluteCanvasSize.Y
				
				if y < 0 then return end
				if y_1 < 0 then
					return
				end
				var51(y < y_1)
			end
			
			local list = {
				current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(updateIsScrollable),
				current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(updateIsScrollable)
			}
			local y = current.AbsoluteWindowSize.Y
			local y_1 = current.AbsoluteCanvasSize.Y
			
			if y >= 0 and y_1 >= 0 then
				var51(y < y_1)
			end
			return function() --[[ line: 260 ]]
				-- upvalues: list (ref)
				for i, v in list do
					v:Disconnect()
				end
			end
		end, { scrollingFrameRef, p1.enableBackToTop })
	end
	reactModule.useEffect(function() --[[ line: 268 ]]
		-- upvalues: p1 (ref), fFlagSduiSrpScrollAway (copy), var41 (ref), var43 (ref), var40 (ref)
		if not p1.scrollingFrameRef or not p1.scrollingFrameRef.current then
			return nil
		end
		local current = p1.scrollingFrameRef.current
		
		if fFlagSduiSrpScrollAway then
			var41.current = current.CanvasPosition.Y
		end
		local var63 = if fFlagSduiSrpScrollAway then {
			current:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ line: 281 ]]
				-- upvalues: var43 (copy), current (ref)
				var43(current)
			end),
			current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(var40)
		} else {
			current:GetPropertyChangedSignal("CanvasPosition"):Connect(var40),
			current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(var40)
		}
		
		return function() --[[ line: 291 ]]
			-- upvalues: var63 (ref)
			for i, v in var63 do
				v:Disconnect()
			end
		end
	end, {
		p1.scrollingFrameRef,
		var40,
		if fFlagSduiSrpScrollAway then var43 else nil
	})
	useAnimateScrollViewToSelection(scrollingFrameRef, 0.4)
	local isNotCursor = useLastInputMode() ~= "Cursor"
	local thresholdFromEnd = p1.thresholdFromEnd or 600
	local var54, var55 = useProgressiveRowCapModule(if feedItems then #feedItems else 0, p1.initialNumToRender, p1.progressiveFillRate, p1.progressiveFillIntervalMs)
	useVerticalScrolledToEndThresholdModule(scrollingFrameRef, thresholdFromEnd, if var55 then nil else p1.onScrollToEnd)
	local var56 = reactModule.useMemo(function() --[[ line: 326 ]]
		-- upvalues: feedItems (ref), p1 (ref), sduiEnableBackToTop (copy), var48 (write), reactModule (copy), backToTopButtonModule (copy), scrollingFrameRef (ref), sduiContext (ref), gapBetweenFeedItems (ref), var24 (ref), gapAfterStickyItems (ref), fFlagLuaAppSduiStickyHeaderScrollAway (copy), fFlagSduiPoolBackedFeed (copy), PoolStoreLayoutStoreWiring (copy), impressionsTag (ref), sduiFeedImpressionsDetectorModule (copy), var39 (ref), buildSduiFeedChildrenModule (copy), debugName (ref), selectionBehaviorLeft (ref), selectionBehaviorRight (ref), var46 (ref), var54 (ref)
		if feedItems == nil then
			return nil
		end
		local pageBottomPadding = p1.pageBottomPadding or 80
		local t = {
			BottomSpacer = if sduiEnableBackToTop and p1.enableBackToTop and var48 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1e999,
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
					scrollingFrameRef = scrollingFrameRef,
					pageContext = sduiContext.appPage
				})
			}) else reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1e999,
				Size = UDim2.new(1, 0, 0, pageBottomPadding)
			}),
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, gapBetweenFeedItems)
			}),
			StickyGap = if var24 and gapAfterStickyItems and gapAfterStickyItems > 0 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Size = UDim2.new(1, 0, 0, math.max(0, gapAfterStickyItems - gapBetweenFeedItems))
			}) else nil,
			NoStickyTopMargin = if fFlagLuaAppSduiStickyHeaderScrollAway and not var24 and (p1.feedTopMargin and p1.feedTopMargin > 0) then reactModule.createElement("Frame", {
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
				scrollViewPositionChangedSignal = var39.current
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
			extraLocalProps = var46,
			maxConfigs = var54
		}) do
			t[i] = v
		end
		return t
	end, {
		feedItems, debugName, var38, var39, sduiContext, analyticsContext,
		gapBetweenFeedItems, impressionsTag, selectionBehaviorLeft,
		selectionBehaviorRight, var24, gapAfterStickyItems,
		if fFlagLuaAppSduiStickyHeaderScrollAway then p1.feedTopMargin else nil, var46,
		var22, p1.pageBottomPadding,
		if sduiEnableBackToTop then p1.enableBackToTop else nil,
		if sduiEnableBackToTop then var48 else nil, scrollingFrameRef, var54
	})
	
	if var44 then
		var56 = reactModule.createElement(sduiFeedContextModule.Provider, { value = var44 }, var56)
	end
	local var57 = reactModule.createElement(collectionLayoutStoreProvider, { container = var36 }, var56)
	local t = { ["size-full-0 auto-y"] = true }
	
	if var22 then
		t[contentTag] = true
	end
	local var59 = reactModule.createElement(view, { tag = t, LayoutOrder = p1.layoutOrder, ref = var37 }, var57)
	
	return if p1.scrollingFrameRef == nil then reactModule.createElement(view, {
		tag = "size-full",
		LayoutOrder = p1.layoutOrder,
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}
	}, {
		Sticky = if var24 then reactModule.createElement(sduiStickyHeaderModule, {
			zIndex = 2,
			stickyItems = p1.stickyItems,
			sduiContext = sduiContext,
			debugName = `{debugName}.StickyHeader`,
			contentTag = stickyContentTag,
			backgroundStyle = stickyBackgroundStyle,
			paddingTop = var28,
			paddingBottom = var29,
			gapBetweenItems = gapBetweenStickyItems,
			extraLocalProps = var46,
			impressionsTag = impressionsTag,
			selectionBehaviorLeft = selectionBehaviorLeft,
			selectionBehaviorRight = selectionBehaviorRight
		}) else nil,
		RefreshSpinner = if var25 then reactModule.createElement(pullToRefreshSpinnerModule, {
			LayoutOrder = 2,
			onRefresh = p1.onRefresh,
			scrollingFrameRef = var38,
			appEventName = sduiContext.appPage
		}) else nil,
		Scroll = reactModule.createElement("ScrollingFrame", {
			LayoutOrder = 3,
			ref = var38,
			[reactModule.Change.CanvasPosition] = if fFlagSduiSrpScrollAway then var43 else var40,
			[reactModule.Change.CanvasSize] = var40,
			BackgroundColor3 = if p1.backgroundStyle then p1.backgroundStyle.Color3 else var23.Color.Surface.Surface_0.Color3,
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
			Content = var59
		})
	}) else var59
end)