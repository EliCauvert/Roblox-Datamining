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
local sduiVerticalFeedBottomSpacerLayoutOrderConstant = game:DefineFastFlag("SduiVerticalFeedBottomSpacerLayoutOrderConstant", false)

local function PoolStoreLayoutStoreWiring(p0) --[[ line: 114 ]]
	-- upvalues: reactModule (ref), collectionLayoutStoreContext (ref), sduiPoolStore (ref)
	local var20 = reactModule.useContext(collectionLayoutStoreContext)
	reactModule.useEffect(function() --[[ line: 116 ]]
		-- upvalues: var20 (ref), sduiPoolStore (copy), p0 (ref)
		if var20 == nil then
			return
		end
		local sduiPoolStore_1 = sduiPoolStore.getSduiPoolStore(p0.configKey)
		sduiPoolStore_1.setLayoutStore(var20)
		
		return function() --[[ line: 122 ]]
			-- upvalues: sduiPoolStore_1 (ref)
			sduiPoolStore_1.setLayoutStore(nil)
		end
	end, { p0.configKey, var20 })
	
	return nil
end

return reactModule.memo(function(p1) --[[ line: 129 | named "SduiVerticalFeed" ]]
	-- upvalues: useTokens (ref), fFlagLuaAppSduiStickyHeaderScrollAway (ref), useNavBarPlacement (ref), appNavBarModule (ref), usePreferredInput (ref), responsiveModule (ref), reactModule (ref), appCommonLibModule (ref), fFlagSduiSrpScrollAway (ref), scrollMovementDirection (ref), sduiEnableBackToTop (ref), useAnimateScrollViewToSelection (ref), useLastInputMode (ref), useProgressiveRowCapModule (ref), useVerticalScrolledToEndThresholdModule (ref), sduiVerticalFeedBottomSpacerLayoutOrderConstant (ref), backToTopButtonModule (ref), fFlagSduiPoolBackedFeed (ref), PoolStoreLayoutStoreWiring (ref), sduiFeedImpressionsDetectorModule (ref), buildSduiFeedChildrenModule (ref), sduiFeedContextModule (ref), collectionLayoutStoreProvider (ref), view (ref), sduiStickyHeaderModule (ref), pullToRefreshSpinnerModule (ref)
	local var25
	local analyticsContext = p1.analyticsContext
	local sduiContext = p1.sduiContext
	local feedItems = p1.feedItems
	local debugName = p1.debugName
	local contentTag = p1.contentTag or p1.defaultContentTag
	local var23 = contentTag ~= nil and contentTag ~= ""
	local var24 = useTokens()
	
	if fFlagLuaAppSduiStickyHeaderScrollAway then
		var25 = false
		
		if p1.stickyItems ~= nil then
			local _ = #p1.stickyItems > 0
		end
	else
		var25 = p1.stickyItems ~= nil
	end
	local var26 = p1.onRefresh ~= nil
	local stickyContentTag = p1.stickyContentTag or p1.defaultStickyContentTag
	local stickyBackgroundStyle = p1.stickyBackgroundStyle or var24.Color.Surface.Surface_0
	local var29 = if fFlagLuaAppSduiStickyHeaderScrollAway then p1.stickyPaddingTop or var24.Gap.Medium else p1.stickyPaddingTop
	local var30 = if fFlagLuaAppSduiStickyHeaderScrollAway then p1.stickyPaddingBottom or var24.Gap.Medium else p1.stickyPaddingBottom
	local gapBetweenStickyItems = p1.gapBetweenStickyItems or var24.Gap.Medium
	local gapAfterStickyItems = p1.gapAfterStickyItems or var24.Gap.Medium
	local impressionsTag = p1.impressionsTag or (sduiContext.routeName or sduiContext.appPage)
	local selectionBehaviorLeft = p1.selectionBehaviorLeft or (if useNavBarPlacement() == appNavBarModule.Placement.Left then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop)
	local selectionBehaviorRight = p1.selectionBehaviorRight or Enum.SelectionBehavior.Stop
	local scrollBarThickness = p1.scrollBarThickness or (if usePreferredInput() == responsiveModule.Input.Pointer then 4 else 0)
	local var37, var38 = reactModule.useState(nil)
	local var39 = reactModule.useRef(nil)
	local var40 = reactModule.useRef(nil)
	
	if var40.current == nil then
		var40.current = appCommonLibModule.Signal.new()
	end
	local var41 = reactModule.useCallback(function() --[[ line: 175 ]]
		-- upvalues: var40 (ref)
		var40.current:fire()
	end, {})
	local var42 = if fFlagSduiSrpScrollAway then reactModule.useRef(0) else nil
	local var43 = if fFlagSduiSrpScrollAway then reactModule.useRef(scrollMovementDirection.Backward) else nil
	local var44 = if fFlagSduiSrpScrollAway then reactModule.useCallback(function(p2) --[[ line: 183 ]]
		-- upvalues: var41 (ref), p1 (ref), var42 (ref), scrollMovementDirection (copy), var43 (ref)
		var41()
		local onScrollDirectionChanged = p1.onScrollDirectionChanged
		
		if not onScrollDirectionChanged then return end
		local y = p2.CanvasPosition.Y
		
		if y < 0 then return end
		if y == var42.current then return end
		local var61 = if var42.current < y then scrollMovementDirection.Forward else scrollMovementDirection.Backward
		
		if var61 ~= var43.current then
			onScrollDirectionChanged(var61)
			var43.current = var61
		end
		var42.current = y
	end, { var41, p1.onScrollDirectionChanged }) else nil
	local var45 = reactModule.useMemo(function() --[[ line: 211 ]]
		-- upvalues: var40 (ref), var39 (ref)
		return {
			scrollViewPositionChangedSignal = var40.current,
			verticalScrollingFrameRef = var39
		}
	end, { var40, var39 })
	local gapBetweenFeedItems = p1.gapBetweenFeedItems or var24.Gap.Large
	local var47 = reactModule.useMemo(function() --[[ line: 220 ]]
		-- upvalues: var40 (ref), var39 (ref)
		return {
			scrollViewPositionChangedSignal = var40.current,
			verticalScrollingFrameRef = var39
		}
	end, { var40, var39 })
	local scrollingFrameRef = p1.scrollingFrameRef or var39
	local var49 = nil
	local _ = nil
	
	if sduiEnableBackToTop then
		local var50, var51 = reactModule.useState(false)
		var49 = var50
		local var52 = var51
		reactModule.useEffect(function() --[[ line: 236 ]]
			-- upvalues: p1 (ref), scrollingFrameRef (ref), var52 (write)
			if not p1.enableBackToTop then return end
			local current = scrollingFrameRef.current
			
			if not current then return end
			local function updateIsScrollable() --[[ line: 245 ]]
				-- upvalues: current (ref), var52 (copy)
				local y = current.AbsoluteWindowSize.Y
				local y_1 = current.AbsoluteCanvasSize.Y
				
				if y < 0 then return end
				if y_1 < 0 then
					return
				end
				var52(y < y_1)
			end
			
			local list = {
				current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(updateIsScrollable),
				current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(updateIsScrollable)
			}
			local y = current.AbsoluteWindowSize.Y
			local y_1 = current.AbsoluteCanvasSize.Y
			
			if y >= 0 and y_1 >= 0 then
				var52(y < y_1)
			end
			return function() --[[ line: 263 ]]
				-- upvalues: list (ref)
				for i, v in list do
					v:Disconnect()
				end
			end
		end, { scrollingFrameRef, p1.enableBackToTop })
	end
	reactModule.useEffect(function() --[[ line: 271 ]]
		-- upvalues: p1 (ref), fFlagSduiSrpScrollAway (copy), var42 (ref), var44 (ref), var41 (ref)
		if not p1.scrollingFrameRef or not p1.scrollingFrameRef.current then
			return nil
		end
		local current = p1.scrollingFrameRef.current
		
		if fFlagSduiSrpScrollAway then
			var42.current = current.CanvasPosition.Y
		end
		local var64 = if fFlagSduiSrpScrollAway then {
			current:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ line: 284 ]]
				-- upvalues: var44 (copy), current (ref)
				var44(current)
			end),
			current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(var41)
		} else {
			current:GetPropertyChangedSignal("CanvasPosition"):Connect(var41),
			current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(var41)
		}
		
		return function() --[[ line: 294 ]]
			-- upvalues: var64 (ref)
			for i, v in var64 do
				v:Disconnect()
			end
		end
	end, {
		p1.scrollingFrameRef,
		var41,
		if fFlagSduiSrpScrollAway then var44 else nil
	})
	useAnimateScrollViewToSelection(scrollingFrameRef, 0.4)
	local isNotCursor = useLastInputMode() ~= "Cursor"
	local thresholdFromEnd = p1.thresholdFromEnd or 600
	local var55, var56 = useProgressiveRowCapModule(if feedItems then #feedItems else 0, p1.initialNumToRender, p1.progressiveFillRate, p1.progressiveFillIntervalMs)
	useVerticalScrolledToEndThresholdModule(scrollingFrameRef, thresholdFromEnd, if var56 then nil else p1.onScrollToEnd)
	local var57 = reactModule.useMemo(function() --[[ line: 329 ]]
		-- upvalues: feedItems (ref), p1 (ref), sduiEnableBackToTop (copy), var49 (write), reactModule (copy), sduiVerticalFeedBottomSpacerLayoutOrderConstant (copy), backToTopButtonModule (copy), scrollingFrameRef (ref), sduiContext (ref), gapBetweenFeedItems (ref), var25 (ref), gapAfterStickyItems (ref), fFlagLuaAppSduiStickyHeaderScrollAway (copy), fFlagSduiPoolBackedFeed (copy), PoolStoreLayoutStoreWiring (copy), impressionsTag (ref), sduiFeedImpressionsDetectorModule (copy), var40 (ref), buildSduiFeedChildrenModule (copy), debugName (ref), selectionBehaviorLeft (ref), selectionBehaviorRight (ref), var47 (ref), var55 (ref)
		if feedItems == nil then
			return nil
		end
		local pageBottomPadding = p1.pageBottomPadding or 80
		local t = {
			BottomSpacer = if sduiEnableBackToTop and p1.enableBackToTop and var49 then reactModule.createElement("Frame", {
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
			StickyGap = if var25 and gapAfterStickyItems and gapAfterStickyItems > 0 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Size = UDim2.new(1, 0, 0, math.max(0, gapAfterStickyItems - gapBetweenFeedItems))
			}) else nil,
			NoStickyTopMargin = if fFlagLuaAppSduiStickyHeaderScrollAway and not var25 and (p1.feedTopMargin and p1.feedTopMargin > 0) then reactModule.createElement("Frame", {
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
				scrollViewPositionChangedSignal = var40.current
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
			extraLocalProps = var47,
			maxConfigs = var55
		}) do
			t[i] = v
		end
		return t
	end, {
		feedItems, debugName, var39, var40, sduiContext, analyticsContext,
		gapBetweenFeedItems, impressionsTag, selectionBehaviorLeft,
		selectionBehaviorRight, var25, gapAfterStickyItems,
		if fFlagLuaAppSduiStickyHeaderScrollAway then p1.feedTopMargin else nil, var47,
		var23, p1.pageBottomPadding,
		if sduiEnableBackToTop then p1.enableBackToTop else nil,
		if sduiEnableBackToTop then var49 else nil, scrollingFrameRef, var55
	})
	
	if var45 then
		var57 = reactModule.createElement(sduiFeedContextModule.Provider, { value = var45 }, var57)
	end
	local var58 = reactModule.createElement(collectionLayoutStoreProvider, { container = var37 }, var57)
	local t = { ["size-full-0 auto-y"] = true }
	
	if var23 then
		t[contentTag] = true
	end
	local var60 = reactModule.createElement(view, { tag = t, LayoutOrder = p1.layoutOrder, ref = var38 }, var58)
	
	return if p1.scrollingFrameRef == nil then reactModule.createElement(view, {
		tag = "size-full",
		LayoutOrder = p1.layoutOrder,
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}
	}, {
		Sticky = if var25 then reactModule.createElement(sduiStickyHeaderModule, {
			zIndex = 2,
			stickyItems = p1.stickyItems,
			sduiContext = sduiContext,
			debugName = `{debugName}.StickyHeader`,
			contentTag = stickyContentTag,
			backgroundStyle = stickyBackgroundStyle,
			paddingTop = var29,
			paddingBottom = var30,
			gapBetweenItems = gapBetweenStickyItems,
			extraLocalProps = var47,
			impressionsTag = impressionsTag,
			selectionBehaviorLeft = selectionBehaviorLeft,
			selectionBehaviorRight = selectionBehaviorRight
		}) else nil,
		RefreshSpinner = if var26 then reactModule.createElement(pullToRefreshSpinnerModule, {
			LayoutOrder = 2,
			onRefresh = p1.onRefresh,
			scrollingFrameRef = var39,
			appEventName = sduiContext.appPage
		}) else nil,
		Scroll = reactModule.createElement("ScrollingFrame", {
			LayoutOrder = 3,
			ref = var39,
			[reactModule.Change.CanvasPosition] = if fFlagSduiSrpScrollAway then var44 else var41,
			[reactModule.Change.CanvasSize] = var41,
			BackgroundColor3 = if p1.backgroundStyle then p1.backgroundStyle.Color3 else var24.Color.Surface.Surface_0.Color3,
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
			Content = var60
		})
	}) else var60
end)