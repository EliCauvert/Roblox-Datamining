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
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiPoolBackedFeed = sharedFlagsModule.FFlagSduiPoolBackedFeed
local fFlagSduiSrpScrollAway = sharedFlagsModule.FFlagSduiSrpScrollAway

local function PoolStoreLayoutStoreWiring(p0) --[[ line: 104 ]]
	-- upvalues: reactModule (ref), collectionLayoutStoreContext (ref), sduiPoolStore (ref)
	local var17 = reactModule.useContext(collectionLayoutStoreContext)
	reactModule.useEffect(function() --[[ line: 106 ]]
		-- upvalues: var17 (ref), sduiPoolStore (copy), p0 (ref)
		if var17 == nil then
			return
		end
		local sduiPoolStore_1 = sduiPoolStore.getSduiPoolStore(p0.configKey)
		sduiPoolStore_1.setLayoutStore(var17)
		
		return function() --[[ line: 112 ]]
			-- upvalues: sduiPoolStore_1 (ref)
			sduiPoolStore_1.setLayoutStore(nil)
		end
	end, { p0.configKey, var17 })
	
	return nil
end

return reactModule.memo(function(p1) --[[ line: 119 | named "SduiVerticalFeed" ]]
	-- upvalues: useTokens (ref), useNavBarPlacement (ref), appNavBarModule (ref), usePreferredInput (ref), responsiveModule (ref), reactModule (ref), appCommonLibModule (ref), fFlagSduiSrpScrollAway (ref), scrollMovementDirection (ref), useAnimateScrollViewToSelection (ref), useLastInputMode (ref), useProgressiveRowCapModule (ref), useVerticalScrolledToEndThresholdModule (ref), fFlagSduiPoolBackedFeed (ref), PoolStoreLayoutStoreWiring (ref), sduiFeedImpressionsDetectorModule (ref), buildSduiFeedChildrenModule (ref), sduiFeedContextModule (ref), collectionLayoutStoreProvider (ref), view (ref), sduiStickyHeaderModule (ref), pullToRefreshSpinnerModule (ref)
	local analyticsContext = p1.analyticsContext
	local sduiContext = p1.sduiContext
	local feedItems = p1.feedItems
	local debugName = p1.debugName
	local contentTag = p1.contentTag or p1.defaultContentTag
	local var20 = contentTag ~= nil and contentTag ~= ""
	local var21 = useTokens()
	local var22 = p1.stickyItems ~= nil
	local var23 = p1.onRefresh ~= nil
	local stickyContentTag = p1.stickyContentTag or p1.defaultStickyContentTag
	local stickyBackgroundStyle = p1.stickyBackgroundStyle or var21.Color.Surface.Surface_0
	local stickyPaddingTop = p1.stickyPaddingTop
	local stickyPaddingBottom = p1.stickyPaddingBottom
	local gapBetweenStickyItems = p1.gapBetweenStickyItems or var21.Gap.Medium
	local gapAfterStickyItems = p1.gapAfterStickyItems or var21.Gap.Medium
	local impressionsTag = p1.impressionsTag or (sduiContext.routeName or sduiContext.appPage)
	local selectionBehaviorLeft = p1.selectionBehaviorLeft or (if useNavBarPlacement() == appNavBarModule.Placement.Left then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop)
	local selectionBehaviorRight = p1.selectionBehaviorRight or Enum.SelectionBehavior.Stop
	local scrollBarThickness = p1.scrollBarThickness or (if usePreferredInput() == responsiveModule.Input.Pointer then 4 else 0)
	local var32, var33 = reactModule.useState(nil)
	local var34 = reactModule.useRef(nil)
	local var35 = reactModule.useRef(nil)
	
	if var35.current == nil then
		var35.current = appCommonLibModule.Signal.new()
	end
	local var36 = reactModule.useCallback(function() --[[ line: 158 ]]
		-- upvalues: var35 (ref)
		var35.current:fire()
	end, {})
	local var37 = if fFlagSduiSrpScrollAway then reactModule.useRef(0) else nil
	local var38 = if fFlagSduiSrpScrollAway then reactModule.useRef(scrollMovementDirection.Backward) else nil
	local var39 = if fFlagSduiSrpScrollAway then reactModule.useCallback(function(p2) --[[ line: 166 ]]
		-- upvalues: var36 (ref), p1 (ref), var37 (ref), scrollMovementDirection (copy), var38 (ref)
		var36()
		local onScrollDirectionChanged = p1.onScrollDirectionChanged
		
		if not onScrollDirectionChanged then return end
		local y = p2.CanvasPosition.Y
		
		if y < 0 then return end
		if y == var37.current then return end
		local var52 = if var37.current < y then scrollMovementDirection.Forward else scrollMovementDirection.Backward
		
		if var52 ~= var38.current then
			onScrollDirectionChanged(var52)
			var38.current = var52
		end
		var37.current = y
	end, { var36, p1.onScrollDirectionChanged }) else nil
	local var40 = reactModule.useMemo(function() --[[ line: 194 ]]
		-- upvalues: var35 (ref), var34 (ref)
		return {
			scrollViewPositionChangedSignal = var35.current,
			verticalScrollingFrameRef = var34
		}
	end, { var35, var34 })
	local gapBetweenFeedItems = p1.gapBetweenFeedItems or var21.Gap.Large
	local var42 = reactModule.useMemo(function() --[[ line: 203 ]]
		-- upvalues: var35 (ref), var34 (ref)
		return {
			scrollViewPositionChangedSignal = var35.current,
			verticalScrollingFrameRef = var34
		}
	end, { var35, var34 })
	local scrollingFrameRef = p1.scrollingFrameRef or var34
	reactModule.useEffect(function() --[[ line: 217 ]]
		-- upvalues: p1 (ref), fFlagSduiSrpScrollAway (copy), var37 (ref), var39 (ref), var36 (ref)
		if not p1.scrollingFrameRef or not p1.scrollingFrameRef.current then
			return nil
		end
		local current = p1.scrollingFrameRef.current
		
		if fFlagSduiSrpScrollAway then
			var37.current = current.CanvasPosition.Y
		end
		local var53 = if fFlagSduiSrpScrollAway then {
			current:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ line: 230 ]]
				-- upvalues: var39 (copy), current (ref)
				var39(current)
			end),
			current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(var36)
		} else {
			current:GetPropertyChangedSignal("CanvasPosition"):Connect(var36),
			current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(var36)
		}
		
		return function() --[[ line: 240 ]]
			-- upvalues: var53 (ref)
			for i, v in var53 do
				v:Disconnect()
			end
		end
	end, {
		p1.scrollingFrameRef,
		var36,
		if fFlagSduiSrpScrollAway then var39 else nil
	})
	useAnimateScrollViewToSelection(scrollingFrameRef, 0.4)
	local isNotCursor = useLastInputMode() ~= "Cursor"
	local thresholdFromEnd = p1.thresholdFromEnd or 600
	local var46, var47 = useProgressiveRowCapModule(if feedItems then #feedItems else 0, p1.initialNumToRender, p1.progressiveFillRate, p1.progressiveFillIntervalMs)
	useVerticalScrolledToEndThresholdModule(scrollingFrameRef, thresholdFromEnd, if var47 then nil else p1.onScrollToEnd)
	local var48 = reactModule.useMemo(function() --[[ line: 275 ]]
		-- upvalues: feedItems (ref), p1 (ref), reactModule (copy), gapBetweenFeedItems (ref), var22 (ref), gapAfterStickyItems (ref), fFlagSduiPoolBackedFeed (copy), sduiContext (ref), PoolStoreLayoutStoreWiring (copy), impressionsTag (ref), sduiFeedImpressionsDetectorModule (copy), scrollingFrameRef (ref), var35 (ref), buildSduiFeedChildrenModule (copy), debugName (ref), selectionBehaviorLeft (ref), selectionBehaviorRight (ref), var42 (ref), var46 (ref)
		if feedItems == nil then
			return nil
		end
		local t = {
			BottomSpacer = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1e999,
				Size = UDim2.new(1, 0, 0, p1.pageBottomPadding or 80)
			}),
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, gapBetweenFeedItems)
			}),
			StickyGap = if var22 and gapAfterStickyItems and gapAfterStickyItems > 0 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Size = UDim2.new(1, 0, 0, math.max(0, gapAfterStickyItems - gapBetweenFeedItems))
			}) else nil,
			PoolStoreLayoutStoreWiring = if fFlagSduiPoolBackedFeed and sduiContext.configKey ~= nil then reactModule.createElement(PoolStoreLayoutStoreWiring, { configKey = sduiContext.configKey }) else nil,
			FeedImpressionsDetector = if impressionsTag and feedItems then reactModule.createElement(sduiFeedImpressionsDetectorModule, {
				sduiContext = sduiContext,
				feedItems = feedItems,
				parentRef = scrollingFrameRef,
				impressionsTag = impressionsTag,
				scrollViewPositionChangedSignal = var35.current
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
			extraLocalProps = var42,
			maxConfigs = var46
		}) do
			t[i] = v
		end
		return t
	end, {
		feedItems, debugName, var34, var35, sduiContext, analyticsContext,
		gapBetweenFeedItems, impressionsTag, selectionBehaviorLeft,
		selectionBehaviorRight, var22, gapAfterStickyItems, var42, var20,
		p1.pageBottomPadding, scrollingFrameRef, var46
	})
	
	if var40 then
		var48 = reactModule.createElement(sduiFeedContextModule.Provider, { value = var40 }, var48)
	end
	local var49 = reactModule.createElement(collectionLayoutStoreProvider, { container = var32 }, var48)
	local t = { ["size-full-0 auto-y"] = true }
	
	if var20 then
		t[contentTag] = true
	end
	local var51 = reactModule.createElement(view, { tag = t, LayoutOrder = p1.layoutOrder, ref = var33 }, var49)
	
	return if p1.scrollingFrameRef == nil then reactModule.createElement(view, {
		tag = "size-full",
		LayoutOrder = p1.layoutOrder,
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}
	}, {
		Sticky = if var22 then reactModule.createElement(sduiStickyHeaderModule, {
			zIndex = 2,
			stickyItems = p1.stickyItems,
			sduiContext = sduiContext,
			debugName = `{debugName}.StickyHeader`,
			contentTag = stickyContentTag,
			backgroundStyle = stickyBackgroundStyle,
			paddingTop = stickyPaddingTop,
			paddingBottom = stickyPaddingBottom,
			gapBetweenItems = gapBetweenStickyItems,
			extraLocalProps = var42,
			impressionsTag = impressionsTag,
			selectionBehaviorLeft = selectionBehaviorLeft,
			selectionBehaviorRight = selectionBehaviorRight
		}) else nil,
		RefreshSpinner = if var23 then reactModule.createElement(pullToRefreshSpinnerModule, {
			LayoutOrder = 2,
			onRefresh = p1.onRefresh,
			scrollingFrameRef = var34,
			appEventName = sduiContext.appPage
		}) else nil,
		Scroll = reactModule.createElement("ScrollingFrame", {
			LayoutOrder = 3,
			ref = var34,
			[reactModule.Change.CanvasPosition] = if fFlagSduiSrpScrollAway then var39 else var36,
			[reactModule.Change.CanvasSize] = var36,
			BackgroundColor3 = if p1.backgroundStyle then p1.backgroundStyle.Color3 else var21.Color.Surface.Surface_0.Color3,
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
			Content = var51
		})
	}) else var51
end)