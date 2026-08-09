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
local signalsReactModule = require(parent.SignalsReact)
local _ = require(parent.SduiCompat)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local findAnalyticsField = sduiCoreSystemModule.findAnalyticsField
local getSduiComponentWrapper = sduiCoreSystemModule.getSduiComponentWrapper
local sduiBuilder = sduiCoreSystemModule.SduiBuilder
local sduiErrors = sduiCoreSystemModule.SduiErrors
local collectionViewsModule = require(parent.CollectionViews)
local collectionItemSize = collectionViewsModule.CollectionViewTypes.CollectionItemSize
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
local luaAppSduiVerticalFeedProgressiveLoad2 = game:DefineFastFlag("LuaAppSduiVerticalFeedProgressiveLoad2", false)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiVerticalFeedLayoutOrder = sharedFlagsModule.FFlagSduiVerticalFeedLayoutOrder
local fFlagLuaAppSduiBadgeDetailsComponents = sharedFlagsModule.FFlagLuaAppSduiBadgeDetailsComponents
local fFlagSduiFeedOptionalScrollingFrameFix = sharedFlagsModule.FFlagSduiFeedOptionalScrollingFrameFix
local fFlagLuaAppCompositionSduiEnabled = sharedFlagsModule.FFlagLuaAppCompositionSduiEnabled
local fFlagSduiPoolBackedFeed = sharedFlagsModule.FFlagSduiPoolBackedFeed
local fFlagSduiChartsSupport = sharedFlagsModule.FFlagSduiChartsSupport
local fFlagSduiFeedImpressions = sharedFlagsModule.FFlagSduiFeedImpressions
local fFlagSduiComponentList = sharedFlagsModule.FFlagSduiComponentList
local fFlagSduiFeedStartRowPerIndex = sharedFlagsModule.FFlagSduiFeedStartRowPerIndex
local fFlagSduiPlayButtonContextualMessageImpression = sharedFlagsModule.FFlagSduiPlayButtonContextualMessageImpression
local fFlagLuaAppSduiRouteName = sharedFlagsModule.FFlagLuaAppSduiRouteName
local t = {}

local function PoolStoreLayoutStoreWiring(p0) --[[ line: 121 ]]
	-- upvalues: reactModule (ref), collectionLayoutStoreContext (ref), sduiPoolStore (ref)
	local var20 = reactModule.useContext(collectionLayoutStoreContext)
	reactModule.useEffect(function() --[[ line: 123 ]]
		-- upvalues: var20 (ref), sduiPoolStore (copy), p0 (ref)
		if var20 == nil then
			return
		end
		local sduiPoolStore_1 = sduiPoolStore.getSduiPoolStore(p0.configKey)
		sduiPoolStore_1.setLayoutStore(var20)
		
		return function() --[[ line: 129 ]]
			-- upvalues: sduiPoolStore_1 (ref)
			sduiPoolStore_1.setLayoutStore(nil)
		end
	end, { p0.configKey, var20 })
	
	return nil
end

return reactModule.memo(function(p1) --[[ line: 136 | named "SduiVerticalFeed" ]]
	-- upvalues: fFlagLuaAppCompositionSduiEnabled (ref), useTokens (ref), fFlagSduiChartsSupport (ref), fFlagSduiFeedImpressions (ref), useNavBarPlacement (ref), fFlagLuaAppSduiRouteName (ref), appNavBarModule (ref), usePreferredInput (ref), responsiveModule (ref), reactModule (ref), appCommonLibModule (ref), fFlagSduiPlayButtonContextualMessageImpression (ref), signalsReactModule (ref), collectionItemSize (ref), fFlagSduiFeedStartRowPerIndex (ref), fFlagSduiFeedOptionalScrollingFrameFix (ref), useAnimateScrollViewToSelection (ref), useLastInputMode (ref), luaAppSduiVerticalFeedProgressiveLoad2 (ref), useProgressiveRowCapModule (ref), useVerticalScrolledToEndThresholdModule (ref), fFlagSduiPoolBackedFeed (ref), PoolStoreLayoutStoreWiring (ref), sduiFeedImpressionsDetectorModule (ref), buildSduiFeedChildrenModule (ref), findAnalyticsField (ref), t (ref), sduiBuilder (ref), sduiErrors (ref), fFlagSduiComponentList (ref), getSduiComponentWrapper (ref), fFlagSduiVerticalFeedLayoutOrder (ref), sduiFeedContextModule (ref), collectionLayoutStoreProvider (ref), view (ref), fFlagLuaAppSduiBadgeDetailsComponents (ref), sduiStickyHeaderModule (ref), pullToRefreshSpinnerModule (ref)
	local var34
	local analyticsContext = p1.analyticsContext
	local sduiContext = p1.sduiContext
	local feedItems = p1.feedItems
	local debugName = p1.debugName
	local contentTag = fFlagLuaAppCompositionSduiEnabled and (p1.contentTag or p1.defaultContentTag)
	local var23 = fFlagLuaAppCompositionSduiEnabled and (contentTag ~= nil and contentTag ~= "")
	local var24 = useTokens()
	local var25 = nil
	local var26 = nil
	local stickyBackgroundStyle = nil
	local stickyPaddingTop = nil
	local stickyPaddingBottom = nil
	local gapBetweenStickyItems = nil
	local stickyContentTag = nil
	local gapAfterStickyItems = nil
	local _ = nil
	local impressionsTag = nil
	local selectionBehaviorLeft = nil
	local selectionBehaviorRight = nil
	
	if fFlagSduiChartsSupport or fFlagSduiFeedImpressions then
		var25 = p1.stickyItems ~= nil
		var26 = p1.onRefresh ~= nil
		stickyContentTag = p1.stickyContentTag or p1.defaultStickyContentTag
		stickyBackgroundStyle = p1.stickyBackgroundStyle or var24.Color.Surface.Surface_0
		stickyPaddingTop = p1.stickyPaddingTop
		stickyPaddingBottom = p1.stickyPaddingBottom
		gapBetweenStickyItems = p1.gapBetweenStickyItems or var24.Gap.Medium
		gapAfterStickyItems = p1.gapAfterStickyItems or var24.Gap.Medium
		impressionsTag = p1.impressionsTag or (if fFlagLuaAppSduiRouteName then sduiContext.routeName or sduiContext.appPage else sduiContext.appPage)
		selectionBehaviorLeft = p1.selectionBehaviorLeft or (if useNavBarPlacement() == appNavBarModule.Placement.Left then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop)
		selectionBehaviorRight = p1.selectionBehaviorRight or Enum.SelectionBehavior.Stop
		var34 = p1.scrollBarThickness or (if usePreferredInput() == responsiveModule.Input.Pointer then 4 else 0)
	else
		var34 = 0
	end
	local var35 = nil
	local var36 = nil
	
	if fFlagLuaAppCompositionSduiEnabled then
		local var37, var38 = reactModule.useState(nil)
		var35 = var37
		var36 = var38
	end
	local var39 = reactModule.useRef(nil)
	local var40 = reactModule.useRef(nil)
	
	if var40.current == nil then
		var40.current = appCommonLibModule.Signal.new()
	end
	local var44
	local var41 = reactModule.useCallback(function() --[[ line: 195 ]]
		-- upvalues: var40 (ref)
		var40.current:fire()
	end, {})
	local var42 = if fFlagSduiPlayButtonContextualMessageImpression then reactModule.useMemo(function() --[[ line: 200 ]]
		-- upvalues: var40 (ref), var39 (ref)
		return {
			scrollViewPositionChangedSignal = var40.current,
			verticalScrollingFrameRef = var39
		}
	end, { var40, var39 }) else nil
	local sideMargin = nil
	local _ = nil
	
	if fFlagLuaAppCompositionSduiEnabled then
		var44 = p1.gapBetweenFeedItems or var24.Gap.Large
	else
		local var43 = signalsReactModule.useSignalState(sduiContext.getPageLayoutConfig(collectionItemSize.Small))
		sideMargin = var43.sideMargin
		var44 = p1.gapBetweenFeedItems or var43.verticalPadding
	end
	local var45 = if fFlagSduiChartsSupport or fFlagSduiFeedImpressions then reactModule.useMemo(function() --[[ line: 220 ]]
		-- upvalues: var40 (ref), var39 (ref), fFlagSduiFeedStartRowPerIndex (copy)
		return {
			scrollViewPositionChangedSignal = var40.current,
			verticalScrollingFrameRef = var39,
			startRow = if fFlagSduiFeedStartRowPerIndex then nil else 1
		}
	end, { var40, var39 }) else nil
	local var46 = if fFlagSduiFeedOptionalScrollingFrameFix then p1.scrollingFrameRef or var39 else var39
	
	if fFlagSduiFeedOptionalScrollingFrameFix then
		reactModule.useEffect(function() --[[ line: 241 ]]
			-- upvalues: p1 (ref), var41 (ref)
			if p1.scrollingFrameRef and p1.scrollingFrameRef.current then
				local current = p1.scrollingFrameRef.current
				local list = {
					current:GetPropertyChangedSignal("CanvasPosition"):Connect(var41),
					current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(var41)
				}
				
				return function() --[[ line: 252 ]]
					-- upvalues: list (ref)
					for i, v in list do
						v:Disconnect()
					end
				end
			end
			return nil
		end, { p1.scrollingFrameRef, var41 })
	end
	useAnimateScrollViewToSelection(var46, 0.4)
	local isNotCursor = useLastInputMode() ~= "Cursor"
	local thresholdFromEnd = p1.thresholdFromEnd or 600
	local var49 = nil
	local var50 = nil
	
	if luaAppSduiVerticalFeedProgressiveLoad2 then
		local var51, var52 = useProgressiveRowCapModule(if feedItems then #feedItems else 0, p1.initialNumToRender, p1.progressiveFillRate, p1.progressiveFillIntervalMs)
		var49 = var51
		var50 = var52
	end
	useVerticalScrolledToEndThresholdModule(var46, thresholdFromEnd, if luaAppSduiVerticalFeedProgressiveLoad2 and var50 then nil else p1.onScrollToEnd)
	
	local var53 = function() --[[ line: 286 ]]
		-- upvalues: feedItems (ref), fFlagSduiFeedOptionalScrollingFrameFix (copy), p1 (ref), fFlagLuaAppCompositionSduiEnabled (copy), reactModule (copy), var44 (write), fFlagSduiChartsSupport (copy), fFlagSduiFeedImpressions (copy), var25 (write), gapAfterStickyItems (write), fFlagSduiPoolBackedFeed (copy), sduiContext (ref), PoolStoreLayoutStoreWiring (copy), impressionsTag (write), sduiFeedImpressionsDetectorModule (copy), var46 (ref), var40 (ref), buildSduiFeedChildrenModule (copy), debugName (ref), selectionBehaviorLeft (write), selectionBehaviorRight (write), var45 (write), luaAppSduiVerticalFeedProgressiveLoad2 (copy), var49 (write), findAnalyticsField (copy), t (copy), sduiBuilder (copy), sduiErrors (copy), fFlagSduiComponentList (copy), getSduiComponentWrapper (copy), fFlagSduiVerticalFeedLayoutOrder (copy), var39 (ref), sideMargin (write), analyticsContext (ref)
		if feedItems == nil then
			return nil
		end
		local var57 = if fFlagSduiFeedOptionalScrollingFrameFix then p1.pageBottomPadding or 80 else 80
		local t_1 = {
			UIPadding = if not fFlagLuaAppCompositionSduiEnabled then reactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, var57) }) else nil,
			BottomSpacer = if fFlagLuaAppCompositionSduiEnabled then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1e999,
				Size = UDim2.new(1, 0, 0, var57)
			}) else nil,
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, var44)
			}),
			StickyGap = if (fFlagSduiChartsSupport or fFlagSduiFeedImpressions) and (var25 and gapAfterStickyItems) and gapAfterStickyItems > 0 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Size = UDim2.new(1, 0, 0, math.max(0, gapAfterStickyItems - var44))
			}) else nil,
			PoolStoreLayoutStoreWiring = if fFlagSduiPoolBackedFeed and sduiContext.configKey ~= nil then reactModule.createElement(PoolStoreLayoutStoreWiring, { configKey = sduiContext.configKey }) else nil,
			FeedImpressionsDetector = if fFlagSduiFeedImpressions and impressionsTag and feedItems then reactModule.createElement(sduiFeedImpressionsDetectorModule, {
				sduiContext = sduiContext,
				feedItems = feedItems,
				parentRef = var46,
				impressionsTag = impressionsTag,
				scrollViewPositionChangedSignal = var40.current
			}) else nil
		}
		
		if fFlagSduiChartsSupport or fFlagSduiFeedImpressions then
			for i, v in buildSduiFeedChildrenModule({
				componentType = "VerticalFeed",
				configs = feedItems,
				sduiContext = sduiContext,
				debugName = debugName,
				impressionsTag = impressionsTag,
				selectionBehaviorLeft = selectionBehaviorLeft,
				selectionBehaviorRight = selectionBehaviorRight,
				extraLocalProps = var45,
				maxConfigs = if luaAppSduiVerticalFeedProgressiveLoad2 then var49 else nil
			}) do
				t_1[i] = v
			end
			return t_1
		else
			for i, v in feedItems do
				local componentType = findAnalyticsField("componentType", v.analyticsData or t) or sduiBuilder.getComponentType(v, sduiContext)
				
				if componentType then
					local t_2 = {
						feedItemPosition = i,
						itemComponentType = componentType,
						componentType = componentType
					}
					local var61 = if fFlagSduiComponentList then `feedItem{i}_{componentType}` else `feedItem{i}`
					local var62 = getSduiComponentWrapper(v)
					local var63 = nil
					
					if fFlagSduiVerticalFeedLayoutOrder then
						var63 = if v.props and v.props.layoutOrder ~= nil then v.props.layoutOrder else i
					end
					t_1[var61] = reactModule.createElement(var62, {
						debugName = var61,
						componentConfig = v,
						sduiContext = sduiContext,
						localAnalyticsData = t_2,
						extraLocalProps = {
							startRow = 1,
							scrollViewPositionChangedSignal = var40.current,
							verticalScrollingFrameRef = var39,
							pageSideMargin = if fFlagLuaAppCompositionSduiEnabled then nil else sideMargin,
							layoutOrder = var63
						},
						parentAnalyticsContext = if v.__isClientBinding then nil else analyticsContext
					})
				else
					sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilComponentType, {
						componentType = "VerticalFeed",
						name = debugName,
						message = `Nil componentType in VerticalFeed at feedItem index {i}`
					}, sduiContext.appPage)
				end
			end
			return t_1
		end
	end
	
	var53 = reactModule.useMemo(var53, {
		feedItems, debugName, var39, var40, sduiContext, sideMargin, analyticsContext,
		var44,
		if fFlagSduiChartsSupport or fFlagSduiFeedImpressions then impressionsTag else nil,
		if fFlagSduiChartsSupport or fFlagSduiFeedImpressions then selectionBehaviorLeft else nil,
		if fFlagSduiChartsSupport or fFlagSduiFeedImpressions then selectionBehaviorRight else nil,
		if fFlagSduiChartsSupport or fFlagSduiFeedImpressions then var25 else nil,
		if fFlagSduiChartsSupport or fFlagSduiFeedImpressions then gapAfterStickyItems else nil,
		if fFlagSduiChartsSupport or fFlagSduiFeedImpressions then var45 else nil,
		if fFlagLuaAppCompositionSduiEnabled then var23 else nil,
		if fFlagLuaAppCompositionSduiEnabled then p1.pageBottomPadding else nil,
		if fFlagSduiFeedImpressions then var46 else nil,
		if luaAppSduiVerticalFeedProgressiveLoad2 then var49 else nil
	})
	
	if fFlagSduiPlayButtonContextualMessageImpression and var42 then
		var53 = reactModule.createElement(sduiFeedContextModule.Provider, { value = var42 }, var53)
	end
	if fFlagLuaAppCompositionSduiEnabled then
		local var54 = reactModule.createElement(collectionLayoutStoreProvider, { container = var35 }, var53)
		local t_1 = { ["size-full-0 auto-y"] = true }
		
		if var23 then
			t_1[contentTag] = true
		end
		var53 = reactModule.createElement(view, { tag = t_1, LayoutOrder = p1.layoutOrder, ref = var36 }, var54)
		
		if p1.scrollingFrameRef ~= nil then
			return var53
		end
	elseif fFlagSduiFeedOptionalScrollingFrameFix and p1.scrollingFrameRef ~= nil then
		return reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = p1.layoutOrder }, var53)
	end
	local createElement = reactModule.createElement
	createElement = createElement("ScrollingFrame", {
		LayoutOrder = if fFlagSduiChartsSupport or fFlagSduiFeedImpressions then 3 else p1.layoutOrder,
		ref = var39,
		[reactModule.Change.CanvasPosition] = var41,
		[reactModule.Change.CanvasSize] = var41,
		BackgroundColor3 = if fFlagLuaAppSduiBadgeDetailsComponents and p1.backgroundStyle then p1.backgroundStyle.Color3 else var24.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = if fFlagLuaAppSduiBadgeDetailsComponents and p1.backgroundStyle then p1.backgroundStyle.Transparency else nil,
		Size = if fFlagSduiChartsSupport or fFlagSduiFeedImpressions then UDim2.fromScale(1, 0) else UDim2.new(1, 0, 1, 0),
		CanvasSize = UDim2.new(1, 0, 0, 0),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		BorderSizePixel = 0,
		ScrollBarThickness = var34,
		ElasticBehavior = Enum.ElasticBehavior.Always,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		Selectable = false,
		ScrollingEnabled = not isNotCursor,
		ClipsDescendants = false
	}, if fFlagSduiChartsSupport or fFlagSduiFeedImpressions then {
		FlexFill = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
		Content = var53
	} else var53)
	
	return if fFlagSduiChartsSupport or fFlagSduiFeedImpressions then reactModule.createElement(view, {
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
			paddingTop = stickyPaddingTop,
			paddingBottom = stickyPaddingBottom,
			gapBetweenItems = gapBetweenStickyItems,
			extraLocalProps = var45,
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
		Scroll = createElement
	}) else createElement
end)