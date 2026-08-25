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

return reactModule.memo(function(p0)
	-- upvalues: fFlagLuaAppCompositionAlways (ref), fFlagLuaAppSduiVideoThumbnail (ref), reactModule (ref), cryoModule (ref), fFlagLuaAppLayoutParamsInContext (ref), signalsReactModule (ref), useCollectionLayoutParams (ref), collectionItemSize (ref), findAnalyticsField (ref), t (ref), sduiBuilder (ref), useCollectionAnalyticsContext (ref), useCollectionImpressionsSignal (ref), fFlagSduiCarouselUseNestedImpressionsFeedContext (ref), getImpressionsTagModule (ref), sduiParseHelpers (ref), sduiErrors (ref), reportUnifiedLoggingImpressions (ref), fFlagSduiEdpStoreImpressionsLogging (ref), sendLegacyGameImpressionsForSduiModule (ref), useTokens (ref), itemHeightModeModule (ref), useUniformItemHeightModule (ref), sduiCollectionAnalyticsBuilder (ref), getSduiComponentWrapper (ref), sduiCollectionItemModule (ref), hoverTileCoordinator (ref), useScrollTelemetryCallbackModule (ref), collectionCarousel (ref), fFlagSduiCollectionCarouselOverrides (ref), sduiFeedContext (ref), waitForPropWrapper (ref), fFlagLuaAppUseFrameBoundsImpressions (ref), frameBoundsImpressionsTracker (ref), fFlagLuaAppRespectClipAncestorImpressions (ref), screenSizeImpressionsTracker (ref), scrollDetector (ref)
	local fFlagLuaAppCompositionAlways_1 = fFlagLuaAppCompositionAlways or (p0.appCompositionEnabled or p0.sduiContext.appCompositionEnabled)
	local layoutOrder = p0.layoutOrder
	local sduiContext = p0.sduiContext
	local var16 = if fFlagLuaAppSduiVideoThumbnail then sduiContext.videoPlaybackContext else nil
	local var17 = reactModule.useMemo(function()
		-- upvalues: p0 (ref)
		if not p0.items then
			return {}
		end
		for i, v in p0.items do
			if p0.itemTemplateKey and v.templateKey == nil then
				v.templateKey = p0.itemTemplateKey
			end
		end
		if not p0.maxItemsToShow or p0.maxItemsToShow >= #p0.items then
			return p0.items
		end
		local t = {}
		
		for i_1, v_1 in p0.items do
			if i_1 ~= p0.maxItemsToShow + 1 then
				table.insert(t, v_1)
				continue
			end
			if not p0.overflowItem then break end
			table.insert(t, p0.overflowItem)
			
			return t
		end
		return t
	end, {
		p0.items,
		p0.itemTemplateKey,
		p0.maxItemsToShow,
		p0.overflowItem
	})
	local var18, var19 = reactModule.useState(nil)
	local var20 = reactModule.useRef(nil)
	local var21 = nil
	local var22 = nil
	
	if fFlagLuaAppSduiVideoThumbnail then
		local var23 = if var16 then var16.viewportVideoAutoplayController else nil
		var21 = reactModule.useCallback(function()
			-- upvalues: var23 (ref)
			if var23 then
				var23:onScrollStart()
			end
		end, { var23 })
		var22 = reactModule.useCallback(function(p1)
			-- upvalues: var23 (ref), var20 (ref)
			if var23 then
				var23:onScrollSettled("X", p1, { current = var20.current })
			end
		end, { var23, var20 })
	end
	local var24 = if p0.layoutOverrides then cryoModule.Dictionary.join(p0.layoutOverrides, { sideMargin = p0.pageSideMargin }) else { sideMargin = p0.pageSideMargin }
	local var25 = nil
	
	if not fFlagLuaAppCompositionAlways then
		var25 = if fFlagLuaAppLayoutParamsInContext then signalsReactModule.useSignalState(reactModule.useCallback(function(p2)
			-- upvalues: sduiContext (ref), p0 (ref)
			return sduiContext.getPageLayoutConfig(p0.collectionItemSize)(p2)
		end, { p0.collectionItemSize, sduiContext.getPageLayoutConfig })) else useCollectionLayoutParams(p0.collectionItemSize or collectionItemSize.Small, var18, false, var24)
	end
	local var37
	local var26 = if var17 then #var17 else 0
	local var27, var28 = useCollectionAnalyticsContext(p0.analyticsContext, findAnalyticsField("componentType", p0.analyticsContext.analyticsData or t) or sduiBuilder.getComponentType(p0.componentConfig, sduiContext), var26, var26, sduiContext, p0.startRow, p0.componentConfig.__isClientBinding)
	local var29 = reactModule.useRef({})
	local var30, var31 = useCollectionImpressionsSignal(p0.scrollViewPositionChangedSignal)
	local var32 = if fFlagSduiCarouselUseNestedImpressionsFeedContext then reactModule.useMemo(function()
		-- upvalues: var30 (ref), p0 (ref), var20 (ref)
		return {
			scrollViewPositionChangedSignal = var30,
			verticalScrollingFrameRef = p0.verticalScrollingFrameRef,
			impressionsParentScrollingFrameRef = var20
		}
	end, { var30, p0.verticalScrollingFrameRef, var20 }) else nil
	local var33 = getImpressionsTagModule(p0.index, var28.current, sduiContext, p0.debugName)
	local var34 = reactModule.useCallback(function(p3)
		-- upvalues: var17 (ref), var27 (ref), sduiParseHelpers (copy), sduiContext (ref), sduiErrors (copy), var33 (ref), p0 (ref), var28 (ref), reportUnifiedLoggingImpressions (copy), var29 (ref), fFlagSduiEdpStoreImpressionsLogging (copy), sendLegacyGameImpressionsForSduiModule (copy)
		if var17 == nil or #var17 == 0 then
			if p3 and #p3 > 0 then
				sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogImpressions, {
					componentType = "CollectionCarousel",
					name = var33,
					message = `Failed to log impressions. No configs. indexes: {table.concat(p3, ",")} analytics: {if var27 then sduiParseHelpers.stringifyValue(var27.analyticsData) else nil}`
				}, sduiContext.appPage)
			end
			return
		else
			assert(var17, "itemConfigs must exist")
			
			if p0.impressionEventName or not var28.current or var28.current.contentType ~= "Game" then
				reportUnifiedLoggingImpressions(sduiContext, p3, var29.current, var28.current, p0.startRow, p0.impressionEventName, p0.skipItemImpressionsLog, if fFlagSduiEdpStoreImpressionsLogging then var33 else nil)
				
				return
			elseif var28.current and var28.current.contentType == "Game" then
				sendLegacyGameImpressionsForSduiModule(p3, var29.current, var17, var27, var28.current, p0.startRow, sduiContext, nil, nil, var33)
			end
			reportUnifiedLoggingImpressions(sduiContext, p3, var29.current, var28.current, p0.startRow)
		end
	end, {
		var17, p0.startRow, sduiContext, var28, var29, var27, var33,
		p0.impressionEventName, p0.skipItemImpressionsLog
	})
	local scale = useTokens().Config.UI.Scale
	local var35 = p0.itemHeightMode == itemHeightModeModule.Uniform
	local var36 = useUniformItemHeightModule(var35)
	local onItemSizeChanged = var36.onItemSizeChanged
	
	if var36 then
		var37 = var36.measuredMaxHeight ~= nil
		var37 = nil
	else
		var37 = false
	end
	local itemHeightFromWidth = nil
	
	if var35 then
		local measuredMaxHeight = var36.measuredMaxHeight
		
		if measuredMaxHeight and measuredMaxHeight > 0 then
			itemHeightFromWidth = UDim.new(0, measuredMaxHeight / scale)
		end
	elseif p0.itemHeightMode ~= itemHeightModeModule.Auto then
		itemHeightFromWidth = p0.itemHeightFromWidth
	end
	local var38 = itemHeightFromWidth == nil and #var17 > 0
	local var39 = reactModule.useCallback(function(p4)
		-- upvalues: var35 (ref), var36 (ref), itemHeightFromWidth (write), scale (ref)
		if var35 then
			local measuredMaxHeight = var36.measuredMaxHeight
			
			return if measuredMaxHeight and measuredMaxHeight > 0 then measuredMaxHeight else 0
		end
		return if itemHeightFromWidth then p4 * itemHeightFromWidth.Scale + itemHeightFromWidth.Offset * scale else 0
	end, {
		var35,
		itemHeightFromWidth,
		var36.measuredMaxHeight,
		scale
	})
	local var40 = reactModule.useCallback(function(p5, p6, p7, _)
		-- upvalues: sduiContext (ref), sduiErrors (copy), var33 (ref), reactModule (copy), findAnalyticsField (copy), t (copy), sduiBuilder (copy), var29 (ref), sduiCollectionAnalyticsBuilder (copy), getSduiComponentWrapper (copy), var27 (ref), p0 (ref), var35 (ref), var37 (ref), sduiCollectionItemModule (copy), var38 (ref), onItemSizeChanged (ref), var36 (ref)
		if not p5 then
			sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilItem, {
				componentType = "CollectionCarousel",
				name = var33,
				message = `Nil item in CollectionCarousel.renderItem at index {p6}`
			}, sduiContext.appPage)
			
			return reactModule.createElement(reactModule.Fragment), "nil"
		end
		local componentType = findAnalyticsField("componentType", p5.analyticsData or t) or sduiBuilder.getComponentType(p5, sduiContext)
		
		if not componentType then
			sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilComponentType, {
				componentType = "CollectionCarousel",
				name = var33,
				message = `Nil componentType in CollectionCarousel.renderItem at index {p6}`
			}, sduiContext.appPage)
			
			return reactModule.createElement(reactModule.Fragment), "nil"
		end
		local t_1 = {
			itemPosition = p6,
			itemComponentType = componentType,
			componentType = componentType
		}
		var29.current[p6] = sduiCollectionAnalyticsBuilder.buildAndValidateItemAnalyticsData(sduiContext, p5.analyticsData, nil, t_1, componentType)
		local createElement = reactModule.createElement
		createElement = createElement(getSduiComponentWrapper(p5), {
			componentConfig = p5,
			sduiContext = sduiContext,
			parentAnalyticsContext = if p5.__isClientBinding then nil else var27,
			extraLocalProps = {
				scrollViewPositionChangedSignal = p0.scrollViewPositionChangedSignal,
				verticalScrollingFrameRef = p0.verticalScrollingFrameRef,
				index = p6,
				selectionOrder = if p0.disableSelectionOrder or not p0.selectionOrderBase then nil else p0.selectionOrderBase + p6,
				size = if var35 and var37 then UDim2.new(1, 0, 1, 0) else nil
			},
			debugName = `{componentType}_{p6}`,
			localAnalyticsData = t_1
		})
		
		return reactModule.createElement(sduiCollectionItemModule, {
			index = p6,
			impressionsTag = var33,
			automaticSize = if var38 or var35 then Enum.AutomaticSize.Y else nil,
			size = p7,
			onItemSizeChanged = if var35 then onItemSizeChanged else nil,
			minHeightBinding = if var35 then var36.measuredMaxHeightBinding else nil
		}, { Item = createElement }), componentType or "unknown"
	end, {
		sduiContext, p0.analyticsContext, p0.scrollViewPositionChangedSignal,
		p0.verticalScrollingFrameRef, var27, var38, var33, p0.index,
		p0.disableSelectionOrder, p0.selectionOrderBase, var35, onItemSizeChanged,
		var37, var36.measuredMaxHeightBinding
	})
	local var41 = reactModule.useMemo(function()
		-- upvalues: p0 (ref), reactModule (copy), var27 (ref)
		local t = nil
		
		if p0.children then
			t = {}
			
			for i, v in p0.children do
				t[i] = reactModule.cloneElement(v, { parentAnalyticsContext = var27 })
			end
		end
		return t
	end, { var27, p0.children })
	local var42 = reactModule.useCallback(function()
		-- upvalues: hoverTileCoordinator (copy)
		hoverTileCoordinator.default:reset()
	end, {})
	local var43 = useScrollTelemetryCallbackModule(var20, var28, sduiContext)
	local var44 = reactModule.useMemo(function()
		-- upvalues: p0 (ref), reactModule (copy), var27 (ref), fFlagLuaAppCompositionAlways_1 (ref)
		return if p0.headerComponent then reactModule.cloneElement(p0.headerComponent, {
			parentAnalyticsContext = var27,
			extraLocalProps = {
				sideMargin = 0,
				appCompositionEnabled = fFlagLuaAppCompositionAlways_1,
				scrollViewPositionChangedSignal = p0.scrollViewPositionChangedSignal,
				verticalScrollingFrameRef = p0.verticalScrollingFrameRef,
				startRow = p0.startRow,
				numUpdatesToDelayImpressions = p0.numUpdatesToDelayImpressions,
				index = p0.index
			}
		}) else nil
	end, {
		var27, p0.headerComponent, fFlagLuaAppCompositionAlways_1,
		p0.scrollViewPositionChangedSignal, p0.verticalScrollingFrameRef, p0.startRow,
		p0.numUpdatesToDelayImpressions, p0.index
	})
	local var45 = reactModule.useMemo(function()
		-- upvalues: p0 (ref), reactModule (copy), var27 (ref), var18 (ref)
		return if p0.focusNavActionsComponent then reactModule.cloneElement(p0.focusNavActionsComponent, {
			parentAnalyticsContext = var27,
			extraLocalProps = { guiObject = var18 }
		}) else nil
	end, { var27, p0.focusNavActionsComponent, var18 })
	local createElement = reactModule.createElement
	createElement = createElement(collectionCarousel, {
		collectionItemSize = if fFlagLuaAppCompositionAlways_1 then p0.collectionItemSize else nil,
		onReachedThresholdFromEnd = p0.onScrollToEnd,
		thresholdFromEnd = p0.scrollThresholdFromEnd,
		containerRef = var19,
		scrollingFrameRef = var20,
		getItemHeight = var39,
		items = var17,
		renderItem = var40,
		numColumns = if fFlagLuaAppCompositionAlways_1 then if fFlagSduiCollectionCarouselOverrides then p0.numColumnsOverride else nil else var25.numColumns,
		fractionalItemAmount = if fFlagLuaAppCompositionAlways_1 then nil else var25.fractionalItemAmount,
		columnGap = if fFlagLuaAppCompositionAlways_1 then nil else var25.columnGap,
		sideMargin = if fFlagLuaAppCompositionAlways_1 then nil else var25.sideMargin,
		onViewableItemsChanged = var31,
		onChangeCanvasPosition = var31,
		LayoutOrder = layoutOrder,
		scrollingEnabledOverride = p0.scrollingEnabledOverride,
		AutomaticSize = if var38 or var35 then Enum.AutomaticSize.Y else nil,
		headerComponent = var44,
		backgroundMuralUrl = p0.backgroundMuralUrl,
		onScrollButtonEnter = var42,
		numItemsToRenderOffScreen = p0.numItemsToRenderOffScreen,
		enableHoverOverflow = p0.enableHoverOverflow,
		testId = if p0.testId then p0.testId else "--sdui-collection-carousel"
	})
	
	return reactModule.createElement(reactModule.Fragment, nil, cryoModule.Dictionary.join(var41 or t, {
		CollectionCarousel = if fFlagSduiCarouselUseNestedImpressionsFeedContext and var32 then reactModule.createElement(sduiFeedContext.Provider, { value = var32 }, createElement) else createElement,
		ImpressionDetector = reactModule.createElement(waitForPropWrapper, {
			waitForProp = p0.startRow,
			maxUpdatesToDelay = p0.numUpdatesToDelayImpressions,
			wrappedComponent = if fFlagLuaAppUseFrameBoundsImpressions or p0.shouldUseFrameBoundsForImpressions then reactModule.createElement(frameBoundsImpressionsTracker, {
				parentRef = var20,
				pageContext = sduiContext.routeName or sduiContext.appPage,
				impressionsTag = var33,
				scrollViewPositionChangedSignal = var30,
				sendImpressions = var34,
				dataUpdatedTimestamp = p0.sduiContext.dataUpdatedTimestamp,
				respectClipAncestors = if fFlagLuaAppRespectClipAncestorImpressions then p0.respectClipAncestors else nil
			}) else reactModule.createElement(screenSizeImpressionsTracker, {
				parentRef = var20,
				pageContext = sduiContext.routeName or sduiContext.appPage,
				impressionsTag = var33,
				scrollViewPositionChangedSignal = var30,
				sendImpressions = var34,
				dataUpdatedTimestamp = p0.sduiContext.dataUpdatedTimestamp
			})
		}),
		ScrollDetector = reactModule.createElement(scrollDetector, {
			scrollingFrameRef = var20,
			sendScrollEvent = var43,
			onScrollStart = if fFlagLuaAppSduiVideoThumbnail then var21 else nil,
			onScrollSettled = if fFlagLuaAppSduiVideoThumbnail then var22 else nil
		}),
		FocusNavActions = var45
	}))
end)