local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local _ = require(parent.AppCommonLib)
local cryoModule = require(parent.Cryo)
local signalsReactModule = require(parent.SignalsReact)
local collectionViewsModule = require(parent.CollectionViews)
local collectionCarousel = collectionViewsModule.CollectionCarousel
local collectionItemSize = collectionViewsModule.CollectionViewTypes.CollectionItemSize
local useCollectionImpressionsSignal = collectionViewsModule.useCollectionImpressionsSignal
local useCollectionLayoutParams = collectionViewsModule.useCollectionLayoutParams
local waitForPropWrapper = require(parent.GameCollections).WaitForPropWrapper
local impressionsModule = require(parent.Impressions)
local frameBoundsImpressionsTracker = impressionsModule.FrameBoundsImpressionsTracker
local screenSizeImpressionsTracker = impressionsModule.ScreenSizeImpressionsTracker
local hoverTileCoordinator = require(parent.GameTile).HoverTileCoordinator
local scrollDetector = require(parent.ScrollTelemetry).ScrollDetector
local useTokens = require(parent.Foundation).Hooks.useTokens
local _ = require(parent.VideoUtils)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local findAnalyticsField = sduiCoreSystemModule.findAnalyticsField
local getImpressionsTagModule = require(serverDrivenUi.Analytics.getImpressionsTag)
local sendLegacyGameImpressionsForSduiModule = require(serverDrivenUi.Analytics.sendLegacyGameImpressionsForSdui)
local reportUnifiedLoggingImpressions = sduiCoreSystemModule.reportUnifiedLoggingImpressions
local sduiBuilder = sduiCoreSystemModule.SduiBuilder
local sduiCollectionAnalyticsBuilder = sduiCoreSystemModule.SduiCollectionAnalyticsBuilder
local sduiErrors = sduiCoreSystemModule.SduiErrors
local sduiCollectionItemModule = require(serverDrivenUi.Content.Collections.SduiCollectionItem)
local sduiParseHelpers = sduiCoreSystemModule.SduiParseHelpers
local getSduiComponentWrapper = sduiCoreSystemModule.getSduiComponentWrapper
local useCollectionAnalyticsContext = require(parent.SduiSharedContent).useCollectionAnalyticsContext
local sduiFeedContext = require(parent.SduiSharedContent).SduiFeedContext
local useScrollTelemetryCallbackModule = require(serverDrivenUi.Analytics.useScrollTelemetryCallback)
local useUniformItemHeightModule = require(serverDrivenUi.Content.Collections.useUniformItemHeight)
local itemHeightModeModule = require(serverDrivenUi.Content.Collections.ItemHeightMode)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppLayoutParamsInContext = sharedFlagsModule.FFlagLuaAppLayoutParamsInContext
local fFlagLuaAppRespectClipAncestorImpressions = sharedFlagsModule.FFlagLuaAppRespectClipAncestorImpressions
local fFlagLuaAppCompositionAlways = sharedFlagsModule.FFlagLuaAppCompositionAlways
local fFlagLuaAppUseFrameBoundsImpressions = sharedFlagsModule.FFlagLuaAppUseFrameBoundsImpressions
local fFlagSduiCollectionCarouselOverrides = sharedFlagsModule.FFlagSduiCollectionCarouselOverrides
local fFlagSduiEdpStoreImpressionsLogging = sharedFlagsModule.FFlagSduiEdpStoreImpressionsLogging
local fFlagSduiCarouselUseNestedImpressionsFeedContext = sharedFlagsModule.FFlagSduiCarouselUseNestedImpressionsFeedContext
local fFlagLuaAppSduiVideoThumbnail = sharedFlagsModule.FFlagLuaAppSduiVideoThumbnail
local t = {}

return reactModule.memo(function(p1)
	-- upvalues: fFlagLuaAppCompositionAlways (ref), fFlagLuaAppSduiVideoThumbnail (ref), reactModule (ref), cryoModule (ref), fFlagLuaAppLayoutParamsInContext (ref), signalsReactModule (ref), useCollectionLayoutParams (ref), collectionItemSize (ref), findAnalyticsField (ref), t (ref), sduiBuilder (ref), useCollectionAnalyticsContext (ref), useCollectionImpressionsSignal (ref), fFlagSduiCarouselUseNestedImpressionsFeedContext (ref), getImpressionsTagModule (ref), sduiParseHelpers (ref), sduiErrors (ref), reportUnifiedLoggingImpressions (ref), fFlagSduiEdpStoreImpressionsLogging (ref), sendLegacyGameImpressionsForSduiModule (ref), useTokens (ref), itemHeightModeModule (ref), useUniformItemHeightModule (ref), sduiCollectionAnalyticsBuilder (ref), getSduiComponentWrapper (ref), sduiCollectionItemModule (ref), hoverTileCoordinator (ref), useScrollTelemetryCallbackModule (ref), collectionCarousel (ref), fFlagSduiCollectionCarouselOverrides (ref), sduiFeedContext (ref), waitForPropWrapper (ref), fFlagLuaAppUseFrameBoundsImpressions (ref), frameBoundsImpressionsTracker (ref), fFlagLuaAppRespectClipAncestorImpressions (ref), screenSizeImpressionsTracker (ref), scrollDetector (ref)
	local fFlagLuaAppCompositionAlways_1 = fFlagLuaAppCompositionAlways or (p1.appCompositionEnabled or p1.sduiContext.appCompositionEnabled)
	local layoutOrder = p1.layoutOrder
	local sduiContext = p1.sduiContext
	local var1 = if fFlagLuaAppSduiVideoThumbnail then sduiContext.videoPlaybackContext else nil
	local var2 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		if not p1.items then
			return {}
		end
		for i, v in p1.items do
			if p1.itemTemplateKey and v.templateKey == nil then
				v.templateKey = p1.itemTemplateKey
			end
		end
		if not p1.maxItemsToShow or p1.maxItemsToShow >= #p1.items then
			return p1.items
		end
		local t = {}
		
		for i_1, v_1 in p1.items do
			if i_1 ~= p1.maxItemsToShow + 1 then
				table.insert(t, v_1)
				continue
			end
			if not p1.overflowItem then break end
			table.insert(t, p1.overflowItem)
			
			return t
		end
		return t
	end, {
		p1.items,
		p1.itemTemplateKey,
		p1.maxItemsToShow,
		p1.overflowItem
	})
	local var3, var4 = reactModule.useState(nil)
	local var5 = reactModule.useRef(nil)
	local var6 = nil
	local var7 = nil
	
	if fFlagLuaAppSduiVideoThumbnail then
		local var8 = if var1 then var1.viewportVideoAutoplayController else nil
		var6 = reactModule.useCallback(function()
			-- upvalues: var8 (ref)
			if var8 then
				var8:onScrollStart()
			end
		end, { var8 })
		var7 = reactModule.useCallback(function(p2)
			-- upvalues: var8 (ref), var5 (ref)
			if var8 then
				var8:onScrollSettled("X", p2, { current = var5.current })
			end
		end, { var8, var5 })
	end
	local var9 = if p1.layoutOverrides then cryoModule.Dictionary.join(p1.layoutOverrides, { sideMargin = p1.pageSideMargin }) else { sideMargin = p1.pageSideMargin }
	local var10 = nil
	
	if not fFlagLuaAppCompositionAlways then
		var10 = if fFlagLuaAppLayoutParamsInContext then signalsReactModule.useSignalState(reactModule.useCallback(function(p2)
			-- upvalues: sduiContext (ref), p1 (ref)
			return sduiContext.getPageLayoutConfig(p1.collectionItemSize)(p2)
		end, { p1.collectionItemSize, sduiContext.getPageLayoutConfig })) else useCollectionLayoutParams(p1.collectionItemSize or collectionItemSize.Small, var3, false, var9)
	end
	local var11
	local var12 = if var2 then #var2 else 0
	local var13, var14 = useCollectionAnalyticsContext(p1.analyticsContext, findAnalyticsField("componentType", p1.analyticsContext.analyticsData or t) or sduiBuilder.getComponentType(p1.componentConfig, sduiContext), var12, var12, sduiContext, p1.startRow, p1.componentConfig.__isClientBinding)
	local var15 = reactModule.useRef({})
	local var16, var17 = useCollectionImpressionsSignal(p1.scrollViewPositionChangedSignal)
	local var18 = if fFlagSduiCarouselUseNestedImpressionsFeedContext then reactModule.useMemo(function()
		-- upvalues: var16 (ref), p1 (ref), var5 (ref)
		return {
			scrollViewPositionChangedSignal = var16,
			verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
			impressionsParentScrollingFrameRef = var5
		}
	end, { var16, p1.verticalScrollingFrameRef, var5 }) else nil
	local var19 = getImpressionsTagModule(p1.index, var14.current, sduiContext, p1.debugName)
	local var20 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), var13 (ref), sduiParseHelpers (copy), sduiContext (ref), sduiErrors (copy), var19 (ref), p1 (ref), var14 (ref), reportUnifiedLoggingImpressions (copy), var15 (ref), fFlagSduiEdpStoreImpressionsLogging (copy), sendLegacyGameImpressionsForSduiModule (copy)
		if var2 == nil or #var2 == 0 then
			if p2 and #p2 > 0 then
				sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogImpressions, {
					componentType = "CollectionCarousel",
					name = var19,
					message = `Failed to log impressions. No configs. indexes: {table.concat(p2, ",")} analytics: {if var13 then sduiParseHelpers.stringifyValue(var13.analyticsData) else nil}`
				}, sduiContext.appPage)
			end
			return
		else
			assert(var2, "itemConfigs must exist")
			
			if p1.impressionEventName or not var14.current or var14.current.contentType ~= "Game" then
				reportUnifiedLoggingImpressions(sduiContext, p2, var15.current, var14.current, p1.startRow, p1.impressionEventName, p1.skipItemImpressionsLog, if fFlagSduiEdpStoreImpressionsLogging then var19 else nil)
				
				return
			elseif var14.current and var14.current.contentType == "Game" then
				sendLegacyGameImpressionsForSduiModule(p2, var15.current, var2, var13, var14.current, p1.startRow, sduiContext, nil, nil, var19)
			end
			reportUnifiedLoggingImpressions(sduiContext, p2, var15.current, var14.current, p1.startRow)
		end
	end, {
		var2, p1.startRow, sduiContext, var14, var15, var13, var19,
		p1.impressionEventName, p1.skipItemImpressionsLog
	})
	local scale = useTokens().Config.UI.Scale
	local var21 = p1.itemHeightMode == itemHeightModeModule.Uniform
	local var22 = useUniformItemHeightModule(var21)
	local onItemSizeChanged = var22.onItemSizeChanged
	
	if var22 then
		var11 = var22.measuredMaxHeight ~= nil
		var11 = nil
	else
		var11 = false
	end
	local itemHeightFromWidth = nil
	
	if var21 then
		local measuredMaxHeight = var22.measuredMaxHeight
		
		if measuredMaxHeight and measuredMaxHeight > 0 then
			itemHeightFromWidth = UDim.new(0, measuredMaxHeight / scale)
		end
	elseif p1.itemHeightMode ~= itemHeightModeModule.Auto then
		itemHeightFromWidth = p1.itemHeightFromWidth
	end
	local var23 = itemHeightFromWidth == nil and #var2 > 0
	local var24 = reactModule.useCallback(function(p3)
		-- upvalues: var21 (ref), var22 (ref), itemHeightFromWidth (write), scale (ref)
		if var21 then
			local measuredMaxHeight = var22.measuredMaxHeight
			
			return if measuredMaxHeight and measuredMaxHeight > 0 then measuredMaxHeight else 0
		end
		return if itemHeightFromWidth then p3 * itemHeightFromWidth.Scale + itemHeightFromWidth.Offset * scale else 0
	end, {
		var21,
		itemHeightFromWidth,
		var22.measuredMaxHeight,
		scale
	})
	local var25 = reactModule.useCallback(function(p3, p4, p5, _)
		-- upvalues: sduiContext (ref), sduiErrors (copy), var19 (ref), reactModule (copy), findAnalyticsField (copy), t (copy), sduiBuilder (copy), var15 (ref), sduiCollectionAnalyticsBuilder (copy), getSduiComponentWrapper (copy), var13 (ref), p1 (ref), var21 (ref), var11 (ref), sduiCollectionItemModule (copy), var23 (ref), onItemSizeChanged (ref), var22 (ref)
		if not p3 then
			sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilItem, {
				componentType = "CollectionCarousel",
				name = var19,
				message = `Nil item in CollectionCarousel.renderItem at index {p4}`
			}, sduiContext.appPage)
			
			return reactModule.createElement(reactModule.Fragment), "nil"
		end
		local componentType = findAnalyticsField("componentType", p3.analyticsData or t) or sduiBuilder.getComponentType(p3, sduiContext)
		
		if not componentType then
			sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilComponentType, {
				componentType = "CollectionCarousel",
				name = var19,
				message = `Nil componentType in CollectionCarousel.renderItem at index {p4}`
			}, sduiContext.appPage)
			
			return reactModule.createElement(reactModule.Fragment), "nil"
		end
		local t_1 = {
			itemPosition = p4,
			itemComponentType = componentType,
			componentType = componentType
		}
		var15.current[p4] = sduiCollectionAnalyticsBuilder.buildAndValidateItemAnalyticsData(sduiContext, p3.analyticsData, nil, t_1, componentType)
		local createElement = reactModule.createElement
		createElement = createElement(getSduiComponentWrapper(p3), {
			componentConfig = p3,
			sduiContext = sduiContext,
			parentAnalyticsContext = if p3.__isClientBinding then nil else var13,
			extraLocalProps = {
				scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
				verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
				index = p4,
				selectionOrder = if p1.disableSelectionOrder or not p1.selectionOrderBase then nil else p1.selectionOrderBase + p4,
				size = if var21 and var11 then UDim2.new(1, 0, 1, 0) else nil
			},
			debugName = `{componentType}_{p4}`,
			localAnalyticsData = t_1
		})
		
		return reactModule.createElement(sduiCollectionItemModule, {
			index = p4,
			impressionsTag = var19,
			automaticSize = if var23 or var21 then Enum.AutomaticSize.Y else nil,
			size = p5,
			onItemSizeChanged = if var21 then onItemSizeChanged else nil,
			minHeightBinding = if var21 then var22.measuredMaxHeightBinding else nil
		}, { Item = createElement }), componentType or "unknown"
	end, {
		sduiContext, p1.analyticsContext, p1.scrollViewPositionChangedSignal,
		p1.verticalScrollingFrameRef, var13, var23, var19, p1.index,
		p1.disableSelectionOrder, p1.selectionOrderBase, var21, onItemSizeChanged,
		var11, var22.measuredMaxHeightBinding
	})
	local var26 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), reactModule (copy), var13 (ref)
		local t = nil
		
		if p1.children then
			t = {}
			
			for i, v in p1.children do
				t[i] = reactModule.cloneElement(v, { parentAnalyticsContext = var13 })
			end
		end
		return t
	end, { var13, p1.children })
	local var27 = reactModule.useCallback(function()
		-- upvalues: hoverTileCoordinator (copy)
		hoverTileCoordinator.default:reset()
	end, {})
	local var28 = useScrollTelemetryCallbackModule(var5, var14, sduiContext)
	local var29 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), reactModule (copy), var13 (ref), fFlagLuaAppCompositionAlways_1 (ref)
		return if p1.headerComponent then reactModule.cloneElement(p1.headerComponent, {
			parentAnalyticsContext = var13,
			extraLocalProps = {
				sideMargin = 0,
				appCompositionEnabled = fFlagLuaAppCompositionAlways_1,
				scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
				verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
				startRow = p1.startRow,
				numUpdatesToDelayImpressions = p1.numUpdatesToDelayImpressions,
				index = p1.index
			}
		}) else nil
	end, {
		var13, p1.headerComponent, fFlagLuaAppCompositionAlways_1,
		p1.scrollViewPositionChangedSignal, p1.verticalScrollingFrameRef, p1.startRow,
		p1.numUpdatesToDelayImpressions, p1.index
	})
	local var30 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), reactModule (copy), var13 (ref), var3 (ref)
		return if p1.focusNavActionsComponent then reactModule.cloneElement(p1.focusNavActionsComponent, {
			parentAnalyticsContext = var13,
			extraLocalProps = { guiObject = var3 }
		}) else nil
	end, { var13, p1.focusNavActionsComponent, var3 })
	local createElement = reactModule.createElement
	createElement = createElement(collectionCarousel, {
		collectionItemSize = if fFlagLuaAppCompositionAlways_1 then p1.collectionItemSize else nil,
		onReachedThresholdFromEnd = p1.onScrollToEnd,
		thresholdFromEnd = p1.scrollThresholdFromEnd,
		containerRef = var4,
		scrollingFrameRef = var5,
		getItemHeight = var24,
		items = var2,
		renderItem = var25,
		numColumns = if fFlagLuaAppCompositionAlways_1 then if fFlagSduiCollectionCarouselOverrides then p1.numColumnsOverride else nil else var10.numColumns,
		fractionalItemAmount = if fFlagLuaAppCompositionAlways_1 then nil else var10.fractionalItemAmount,
		columnGap = if fFlagLuaAppCompositionAlways_1 then nil else var10.columnGap,
		sideMargin = if fFlagLuaAppCompositionAlways_1 then nil else var10.sideMargin,
		onViewableItemsChanged = var17,
		onChangeCanvasPosition = var17,
		LayoutOrder = layoutOrder,
		scrollingEnabledOverride = p1.scrollingEnabledOverride,
		AutomaticSize = if var23 or var21 then Enum.AutomaticSize.Y else nil,
		headerComponent = var29,
		backgroundMuralUrl = p1.backgroundMuralUrl,
		onScrollButtonEnter = var27,
		numItemsToRenderOffScreen = p1.numItemsToRenderOffScreen,
		enableHoverOverflow = p1.enableHoverOverflow,
		testId = if p1.testId then p1.testId else "--sdui-collection-carousel"
	})
	
	return reactModule.createElement(reactModule.Fragment, nil, cryoModule.Dictionary.join(var26 or t, {
		CollectionCarousel = if fFlagSduiCarouselUseNestedImpressionsFeedContext and var18 then reactModule.createElement(sduiFeedContext.Provider, { value = var18 }, createElement) else createElement,
		ImpressionDetector = reactModule.createElement(waitForPropWrapper, {
			waitForProp = p1.startRow,
			maxUpdatesToDelay = p1.numUpdatesToDelayImpressions,
			wrappedComponent = if fFlagLuaAppUseFrameBoundsImpressions or p1.shouldUseFrameBoundsForImpressions then reactModule.createElement(frameBoundsImpressionsTracker, {
				parentRef = var5,
				pageContext = sduiContext.routeName or sduiContext.appPage,
				impressionsTag = var19,
				scrollViewPositionChangedSignal = var16,
				sendImpressions = var20,
				dataUpdatedTimestamp = p1.sduiContext.dataUpdatedTimestamp,
				respectClipAncestors = if fFlagLuaAppRespectClipAncestorImpressions then p1.respectClipAncestors else nil
			}) else reactModule.createElement(screenSizeImpressionsTracker, {
				parentRef = var5,
				pageContext = sduiContext.routeName or sduiContext.appPage,
				impressionsTag = var19,
				scrollViewPositionChangedSignal = var16,
				sendImpressions = var20,
				dataUpdatedTimestamp = p1.sduiContext.dataUpdatedTimestamp
			})
		}),
		ScrollDetector = reactModule.createElement(scrollDetector, {
			scrollingFrameRef = var5,
			sendScrollEvent = var28,
			onScrollStart = if fFlagLuaAppSduiVideoThumbnail then var6 else nil,
			onScrollSettled = if fFlagLuaAppSduiVideoThumbnail then var7 else nil
		}),
		FocusNavActions = var30
	}))
end)