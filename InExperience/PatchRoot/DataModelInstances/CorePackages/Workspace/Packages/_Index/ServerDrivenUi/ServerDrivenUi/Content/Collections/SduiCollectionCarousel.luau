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
local t = {}

return reactModule.memo(function(p0) --[[ line: 133 | named "SduiCollectionCarousel" ]]
	-- upvalues: fFlagLuaAppCompositionAlways (ref), reactModule (ref), cryoModule (ref), fFlagLuaAppLayoutParamsInContext (ref), signalsReactModule (ref), useCollectionLayoutParams (ref), collectionItemSize (ref), findAnalyticsField (ref), t (ref), sduiBuilder (ref), useCollectionAnalyticsContext (ref), useCollectionImpressionsSignal (ref), getImpressionsTagModule (ref), sduiParseHelpers (ref), sduiErrors (ref), reportUnifiedLoggingImpressions (ref), fFlagSduiEdpStoreImpressionsLogging (ref), sendLegacyGameImpressionsForSduiModule (ref), useTokens (ref), itemHeightModeModule (ref), useUniformItemHeightModule (ref), sduiCollectionAnalyticsBuilder (ref), getSduiComponentWrapper (ref), sduiCollectionItemModule (ref), hoverTileCoordinator (ref), useScrollTelemetryCallbackModule (ref), collectionCarousel (ref), fFlagSduiCollectionCarouselOverrides (ref), waitForPropWrapper (ref), fFlagLuaAppUseFrameBoundsImpressions (ref), frameBoundsImpressionsTracker (ref), fFlagLuaAppRespectClipAncestorImpressions (ref), screenSizeImpressionsTracker (ref), scrollDetector (ref)
	local fFlagLuaAppCompositionAlways_1 = fFlagLuaAppCompositionAlways or (p0.appCompositionEnabled or p0.sduiContext.appCompositionEnabled)
	local layoutOrder = p0.layoutOrder
	local sduiContext = p0.sduiContext
	local var16 = reactModule.useMemo(function() --[[ line: 142 ]]
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
	local var17, var18 = reactModule.useState(nil)
	local var19 = reactModule.useRef(nil)
	local var20 = if p0.layoutOverrides then cryoModule.Dictionary.join(p0.layoutOverrides, { sideMargin = p0.pageSideMargin }) else { sideMargin = p0.pageSideMargin }
	local var21 = nil
	
	if not fFlagLuaAppCompositionAlways then
		var21 = if fFlagLuaAppLayoutParamsInContext then signalsReactModule.useSignalState(reactModule.useCallback(function(p1) --[[ line: 183 ]]
			-- upvalues: sduiContext (ref), p0 (ref)
			return sduiContext.getPageLayoutConfig(p0.collectionItemSize)(p1)
		end, { p0.collectionItemSize, sduiContext.getPageLayoutConfig })) else useCollectionLayoutParams(p0.collectionItemSize or collectionItemSize.Small, var17, false, var20)
	end
	local var32
	local var22 = if var16 then #var16 else 0
	local var23, var24 = useCollectionAnalyticsContext(p0.analyticsContext, findAnalyticsField("componentType", p0.analyticsContext.analyticsData or t) or sduiBuilder.getComponentType(p0.componentConfig, sduiContext), var22, var22, sduiContext, p0.startRow, p0.componentConfig.__isClientBinding)
	local var25 = reactModule.useRef({})
	local var26, var27 = useCollectionImpressionsSignal(p0.scrollViewPositionChangedSignal)
	local var28 = getImpressionsTagModule(p0.index, var24.current, sduiContext, p0.debugName)
	local var29 = reactModule.useCallback(function(p2) --[[ line: 229 ]]
		-- upvalues: var16 (ref), var23 (ref), sduiParseHelpers (copy), sduiContext (ref), sduiErrors (copy), var28 (ref), p0 (ref), var24 (ref), reportUnifiedLoggingImpressions (copy), var25 (ref), fFlagSduiEdpStoreImpressionsLogging (copy), sendLegacyGameImpressionsForSduiModule (copy)
		if var16 == nil or #var16 == 0 then
			if p2 and #p2 > 0 then
				sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogImpressions, {
					componentType = "CollectionCarousel",
					name = var28,
					message = `Failed to log impressions. No configs. indexes: {table.concat(p2, ",")} analytics: {if var23 then sduiParseHelpers.stringifyValue(var23.analyticsData) else nil}`
				}, sduiContext.appPage)
			end
			return
		else
			assert(var16, "itemConfigs must exist")
			
			if p0.impressionEventName or not var24.current or var24.current.contentType ~= "Game" then
				reportUnifiedLoggingImpressions(sduiContext, p2, var25.current, var24.current, p0.startRow, p0.impressionEventName, p0.skipItemImpressionsLog, if fFlagSduiEdpStoreImpressionsLogging then var28 else nil)
				
				return
			elseif var24.current and var24.current.contentType == "Game" then
				sendLegacyGameImpressionsForSduiModule(p2, var25.current, var16, var23, var24.current, p0.startRow, sduiContext, nil, nil, var28)
			end
			reportUnifiedLoggingImpressions(sduiContext, p2, var25.current, var24.current, p0.startRow)
		end
	end, {
		var16, p0.startRow, sduiContext, var24, var25, var23, var28,
		p0.impressionEventName, p0.skipItemImpressionsLog
	})
	local scale = useTokens().Config.UI.Scale
	local var30 = p0.itemHeightMode == itemHeightModeModule.Uniform
	local var31 = useUniformItemHeightModule(var30)
	local onItemSizeChanged = var31.onItemSizeChanged
	
	if var31 then
		var32 = var31.measuredMaxHeight ~= nil
		var32 = nil
	else
		var32 = false
	end
	local itemHeightFromWidth = nil
	
	if var30 then
		local measuredMaxHeight = var31.measuredMaxHeight
		
		if measuredMaxHeight and measuredMaxHeight > 0 then
			itemHeightFromWidth = UDim.new(0, measuredMaxHeight / scale)
		end
	elseif p0.itemHeightMode ~= itemHeightModeModule.Auto then
		itemHeightFromWidth = p0.itemHeightFromWidth
	end
	local var33 = itemHeightFromWidth == nil and #var16 > 0
	
	return reactModule.createElement(reactModule.Fragment, nil, cryoModule.Dictionary.join(reactModule.useMemo(function() --[[ line: 438 ]]
		-- upvalues: p0 (ref), reactModule (copy), var23 (ref)
		local t = nil
		
		if p0.children then
			t = {}
			
			for i, v in p0.children do
				t[i] = reactModule.cloneElement(v, { parentAnalyticsContext = var23 })
			end
		end
		return t
	end, { var23, p0.children }) or t, {
		CollectionCarousel = reactModule.createElement(collectionCarousel, {
			collectionItemSize = if fFlagLuaAppCompositionAlways_1 then p0.collectionItemSize else nil,
			onReachedThresholdFromEnd = p0.onScrollToEnd,
			thresholdFromEnd = p0.scrollThresholdFromEnd,
			containerRef = var18,
			scrollingFrameRef = var19,
			getItemHeight = reactModule.useCallback(function(p3) --[[ line: 323 ]]
				-- upvalues: var30 (ref), var31 (ref), itemHeightFromWidth (write), scale (ref)
				if var30 then
					local measuredMaxHeight = var31.measuredMaxHeight
					
					return if measuredMaxHeight and measuredMaxHeight > 0 then measuredMaxHeight else 0
				end
				return if itemHeightFromWidth then p3 * itemHeightFromWidth.Scale + itemHeightFromWidth.Offset * scale else 0
			end, {
				var30,
				itemHeightFromWidth,
				var31.measuredMaxHeight,
				scale
			}),
			items = var16,
			renderItem = reactModule.useCallback(function(p4, p5, p6, _) --[[ line: 346 ]]
				-- upvalues: sduiContext (ref), sduiErrors (copy), var28 (ref), reactModule (copy), findAnalyticsField (copy), t (copy), sduiBuilder (copy), var25 (ref), sduiCollectionAnalyticsBuilder (copy), getSduiComponentWrapper (copy), var23 (ref), p0 (ref), var30 (ref), var32 (ref), sduiCollectionItemModule (copy), var33 (ref), onItemSizeChanged (ref), var31 (ref)
				if not p4 then
					sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilItem, {
						componentType = "CollectionCarousel",
						name = var28,
						message = `Nil item in CollectionCarousel.renderItem at index {p5}`
					}, sduiContext.appPage)
					
					return reactModule.createElement(reactModule.Fragment), "nil"
				end
				local componentType = findAnalyticsField("componentType", p4.analyticsData or t) or sduiBuilder.getComponentType(p4, sduiContext)
				
				if not componentType then
					sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilComponentType, {
						componentType = "CollectionCarousel",
						name = var28,
						message = `Nil componentType in CollectionCarousel.renderItem at index {p5}`
					}, sduiContext.appPage)
					
					return reactModule.createElement(reactModule.Fragment), "nil"
				end
				local t_1 = {
					itemPosition = p5,
					itemComponentType = componentType,
					componentType = componentType
				}
				var25.current[p5] = sduiCollectionAnalyticsBuilder.buildAndValidateItemAnalyticsData(sduiContext, p4.analyticsData, nil, t_1, componentType)
				local createElement = reactModule.createElement
				createElement = createElement(getSduiComponentWrapper(p4), {
					componentConfig = p4,
					sduiContext = sduiContext,
					parentAnalyticsContext = if p4.__isClientBinding then nil else var23,
					extraLocalProps = {
						scrollViewPositionChangedSignal = p0.scrollViewPositionChangedSignal,
						verticalScrollingFrameRef = p0.verticalScrollingFrameRef,
						index = p5,
						selectionOrder = if p0.disableSelectionOrder or not p0.selectionOrderBase then nil else p0.selectionOrderBase + p5,
						size = if var30 and var32 then UDim2.new(1, 0, 1, 0) else nil
					},
					debugName = `{componentType}_{p5}`,
					localAnalyticsData = t_1
				})
				
				return reactModule.createElement(sduiCollectionItemModule, {
					index = p5,
					impressionsTag = var28,
					automaticSize = if var33 or var30 then Enum.AutomaticSize.Y else nil,
					size = p6,
					onItemSizeChanged = if var30 then onItemSizeChanged else nil,
					minHeightBinding = if var30 then var31.measuredMaxHeightBinding else nil
				}, { Item = createElement }), componentType or "unknown"
			end, {
				sduiContext, p0.analyticsContext, p0.scrollViewPositionChangedSignal,
				p0.verticalScrollingFrameRef, var23, var33, var28, p0.index,
				p0.disableSelectionOrder, p0.selectionOrderBase, var30, onItemSizeChanged,
				var32, var31.measuredMaxHeightBinding
			}),
			numColumns = if fFlagLuaAppCompositionAlways_1 then if fFlagSduiCollectionCarouselOverrides then p0.numColumnsOverride else nil else var21.numColumns,
			fractionalItemAmount = if fFlagLuaAppCompositionAlways_1 then nil else var21.fractionalItemAmount,
			columnGap = if fFlagLuaAppCompositionAlways_1 then nil else var21.columnGap,
			sideMargin = if fFlagLuaAppCompositionAlways_1 then nil else var21.sideMargin,
			onViewableItemsChanged = var27,
			onChangeCanvasPosition = var27,
			LayoutOrder = layoutOrder,
			scrollingEnabledOverride = p0.scrollingEnabledOverride,
			AutomaticSize = if var33 or var30 then Enum.AutomaticSize.Y else nil,
			headerComponent = reactModule.useMemo(function() --[[ line: 461 ]]
				-- upvalues: p0 (ref), reactModule (copy), var23 (ref), fFlagLuaAppCompositionAlways_1 (ref)
				return if p0.headerComponent then reactModule.cloneElement(p0.headerComponent, {
					parentAnalyticsContext = var23,
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
				var23, p0.headerComponent, fFlagLuaAppCompositionAlways_1,
				p0.scrollViewPositionChangedSignal, p0.verticalScrollingFrameRef, p0.startRow,
				p0.numUpdatesToDelayImpressions, p0.index
			}),
			backgroundMuralUrl = p0.backgroundMuralUrl,
			onScrollButtonEnter = reactModule.useCallback(function() --[[ line: 454 ]]
				-- upvalues: hoverTileCoordinator (copy)
				hoverTileCoordinator.default:reset()
			end, {}),
			numItemsToRenderOffScreen = p0.numItemsToRenderOffScreen,
			enableHoverOverflow = p0.enableHoverOverflow,
			testId = if p0.testId then p0.testId else "--sdui-collection-carousel"
		}),
		ImpressionDetector = reactModule.createElement(waitForPropWrapper, {
			waitForProp = p0.startRow,
			maxUpdatesToDelay = p0.numUpdatesToDelayImpressions,
			wrappedComponent = if fFlagLuaAppUseFrameBoundsImpressions or p0.shouldUseFrameBoundsForImpressions then reactModule.createElement(frameBoundsImpressionsTracker, {
				parentRef = var19,
				pageContext = sduiContext.routeName or sduiContext.appPage,
				impressionsTag = var28,
				scrollViewPositionChangedSignal = var26,
				sendImpressions = var29,
				dataUpdatedTimestamp = p0.sduiContext.dataUpdatedTimestamp,
				respectClipAncestors = if fFlagLuaAppRespectClipAncestorImpressions then p0.respectClipAncestors else nil
			}) else reactModule.createElement(screenSizeImpressionsTracker, {
				parentRef = var19,
				pageContext = sduiContext.routeName or sduiContext.appPage,
				impressionsTag = var28,
				scrollViewPositionChangedSignal = var26,
				sendImpressions = var29,
				dataUpdatedTimestamp = p0.sduiContext.dataUpdatedTimestamp
			})
		}),
		ScrollDetector = reactModule.createElement(scrollDetector, {
			scrollingFrameRef = var19,
			sendScrollEvent = useScrollTelemetryCallbackModule(var19, var24, sduiContext)
		}),
		FocusNavActions = reactModule.useMemo(function() --[[ line: 492 ]]
			-- upvalues: p0 (ref), reactModule (copy), var23 (ref), var17 (ref)
			return if p0.focusNavActionsComponent then reactModule.cloneElement(p0.focusNavActionsComponent, {
				parentAnalyticsContext = var23,
				extraLocalProps = { guiObject = var17 }
			}) else nil
		end, { var23, p0.focusNavActionsComponent, var17 })
	}))
end)