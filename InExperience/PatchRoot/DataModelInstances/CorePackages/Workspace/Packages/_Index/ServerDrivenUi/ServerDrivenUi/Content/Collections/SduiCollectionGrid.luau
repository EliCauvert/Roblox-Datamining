local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local _ = require(parent.AppCommonLib)
local cryoModule = require(parent.Cryo)
local signalsReactModule = require(parent.SignalsReact)
local collectionViewsModule = require(parent.CollectionViews)
local collectionGrid = collectionViewsModule.CollectionGrid
local collectionItemSize = collectionViewsModule.CollectionViewTypes.CollectionItemSize
local useCollectionImpressionsSignal = collectionViewsModule.useCollectionImpressionsSignal
local useCollectionLayout = collectionViewsModule.useCollectionLayout
local useCollectionLayoutParams = collectionViewsModule.useCollectionLayoutParams
local waitForPropWrapper = require(parent.GameCollections).WaitForPropWrapper
local impressionsModule = require(parent.Impressions)
local frameBoundsImpressionsTracker = impressionsModule.FrameBoundsImpressionsTracker
local screenSizeImpressionsTracker = impressionsModule.ScreenSizeImpressionsTracker
local useTokens = require(parent.Foundation).Hooks.useTokens
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local findAnalyticsField = sduiCoreSystemModule.findAnalyticsField
local getImpressionsTagModule = require(serverDrivenUi.Analytics.getImpressionsTag)
local sendLegacyGameImpressionsForSduiModule = require(serverDrivenUi.Analytics.sendLegacyGameImpressionsForSdui)
local reportUnifiedLoggingImpressions = sduiCoreSystemModule.reportUnifiedLoggingImpressions
local sduiBuilder = sduiCoreSystemModule.SduiBuilder
local sduiCollectionAnalyticsBuilder = sduiCoreSystemModule.SduiCollectionAnalyticsBuilder
local sduiErrors = sduiCoreSystemModule.SduiErrors
local sduiParseHelpers = sduiCoreSystemModule.SduiParseHelpers
local getSduiComponentWrapper = sduiCoreSystemModule.getSduiComponentWrapper
local sduiCollectionItemModule = require(serverDrivenUi.Content.Collections.SduiCollectionItem)
local useCollectionAnalyticsContext = require(parent.SduiSharedContent).useCollectionAnalyticsContext
local fFlagLuaAppLayoutParamsInContext = require(parent.SharedFlags).FFlagLuaAppLayoutParamsInContext
local fFlagSduiCollectionGridMaxNumRows = require(parent.SharedFlags).FFlagSduiCollectionGridMaxNumRows
local fFlagLuaAppCompositionAlways = require(parent.SharedFlags).FFlagLuaAppCompositionAlways
local fFlagSduiEdpStoreImpressionsLogging = require(parent.SharedFlags).FFlagSduiEdpStoreImpressionsLogging
local fFlagSduiPoolBackedFeed = require(parent.SharedFlags).FFlagSduiPoolBackedFeed

local function _(p0, p1, p2)
	local colSpan = p0.colSpan or 1
	local rowSpan = p0.rowSpan or 1
	
	return UDim2.new(colSpan, p1 * (colSpan - 1), rowSpan, p2 * (rowSpan - 1))
end

local t = {}

return reactModule.memo(function(p3)
	-- upvalues: fFlagLuaAppCompositionAlways (ref), reactModule (ref), t (ref), fFlagLuaAppLayoutParamsInContext (ref), signalsReactModule (ref), useCollectionLayoutParams (ref), collectionItemSize (ref), cryoModule (ref), fFlagSduiPoolBackedFeed (ref), useCollectionLayout (ref), findAnalyticsField (ref), sduiBuilder (ref), useCollectionAnalyticsContext (ref), useCollectionImpressionsSignal (ref), getImpressionsTagModule (ref), sduiParseHelpers (ref), sduiErrors (ref), reportUnifiedLoggingImpressions (ref), fFlagSduiEdpStoreImpressionsLogging (ref), sendLegacyGameImpressionsForSduiModule (ref), useTokens (ref), sduiCollectionAnalyticsBuilder (ref), getSduiComponentWrapper (ref), sduiCollectionItemModule (ref), collectionGrid (ref), fFlagSduiCollectionGridMaxNumRows (ref), waitForPropWrapper (ref), frameBoundsImpressionsTracker (ref), screenSizeImpressionsTracker (ref)
	local var19
	local fFlagLuaAppCompositionAlways_1 = fFlagLuaAppCompositionAlways or (p3.appCompositionEnabled or p3.sduiContext.appCompositionEnabled)
	local layoutOrder = p3.layoutOrder
	local sduiContext = p3.sduiContext
	local var14 = reactModule.useMemo(function()
		-- upvalues: p3 (ref), t (copy)
		if p3.items == nil then
			return t
		end
		for i, v in p3.items do
			if p3.itemTemplateKey and v.templateKey == nil then
				v.templateKey = p3.itemTemplateKey
			end
		end
		return p3.items
	end, { p3.items, p3.itemTemplateKey })
	local var15, var16 = reactModule.useState(nil)
	local var17 = reactModule.useRef(nil)
	var17.current = var15
	local var18 = if not fFlagLuaAppCompositionAlways then if fFlagLuaAppLayoutParamsInContext then signalsReactModule.useSignalState(reactModule.useCallback(function(p4)
		-- upvalues: sduiContext (ref), p3 (ref)
		return sduiContext.getPageLayoutConfig(p3.collectionItemSize)(p4)
	end, { p3.collectionItemSize, sduiContext.getPageLayoutConfig })) else useCollectionLayoutParams(p3.collectionItemSize or collectionItemSize.Small, var15, false, if p3.layoutOverrides then cryoModule.Dictionary.join(p3.layoutOverrides, {
		overrideLoadMoreThreshold = 1e999,
		sideMargin = p3.pageSideMargin
	}) else {
		overrideLoadMoreThreshold = 1e999,
		sideMargin = p3.pageSideMargin
	}) else nil
	local _ = nil
	
	if fFlagSduiPoolBackedFeed then
		var19 = 0
		
		if var14 then
			for i, v in var14 do
				if not v.isBlank then
					var19 += 1
				end
			end
		end
	else
		var19 = if var14 then #var14 else 0
	end
	local var20 = useCollectionLayout(p3.collectionItemSize)
	local var21 = if fFlagLuaAppCompositionAlways_1 then var20.itemsPerRow else var18.numColumns
	local var22 = nil
	local var23 = nil
	
	if fFlagSduiPoolBackedFeed then
		var22 = if fFlagLuaAppCompositionAlways_1 then var20.gutter elseif var18 then var18.columnGap else 0
		var23 = if fFlagLuaAppCompositionAlways_1 then var20.verticalGap elseif var18 then var18.verticalPadding else 0
	end
	local var24, var25 = useCollectionAnalyticsContext(p3.analyticsContext, findAnalyticsField("componentType", p3.analyticsContext.analyticsData or t) or sduiBuilder.getComponentType(p3.componentConfig, sduiContext), var21, var19, sduiContext, p3.startRow, p3.componentConfig.__isClientBinding)
	local var26 = reactModule.useRef({})
	local var27, var28 = useCollectionImpressionsSignal(p3.scrollViewPositionChangedSignal)
	local var29 = reactModule.useCallback(function(_, _)
		-- upvalues: p3 (ref), var28 (ref)
		if p3.onCollectionViewabilityChanged then
			p3.onCollectionViewabilityChanged()
		end
		if var28 then
			var28()
		end
	end, { var28, p3.onCollectionViewabilityChanged })
	local impressionsTag = p3.impressionsTag or getImpressionsTagModule(p3.index, var25.current, sduiContext, p3.debugName)
	local var31 = reactModule.useCallback(function(p5)
		-- upvalues: var14 (ref), var24 (ref), sduiParseHelpers (copy), sduiContext (ref), sduiErrors (copy), impressionsTag (ref), p3 (ref), var25 (ref), reportUnifiedLoggingImpressions (copy), var26 (ref), fFlagSduiEdpStoreImpressionsLogging (copy), sendLegacyGameImpressionsForSduiModule (copy)
		if var14 == nil or #var14 == 0 then
			if p5 and #p5 > 0 then
				sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogImpressions, {
					componentType = "CollectionGrid",
					name = impressionsTag,
					message = `Failed to log impressions. No configs. indexes: {table.concat(p5, ",")} analytics: {if var24 then sduiParseHelpers.stringifyValue(var24.analyticsData) else nil}`
				}, sduiContext.appPage)
			end
			return
		else
			assert(var14, "itemConfigs must exist")
			
			if (p3.impressionEventName or not var25.current or var25.current.contentType ~= "Game") and not p3.sendGameImpressions then
				reportUnifiedLoggingImpressions(sduiContext, p5, var26.current, var25.current, p3.startRow, p3.impressionEventName, p3.skipItemImpressionsLog, if fFlagSduiEdpStoreImpressionsLogging then impressionsTag else nil)
				
				return
			elseif var25.current and var25.current.contentType == "Game" then
				sendLegacyGameImpressionsForSduiModule(p5, var26.current, var14, var24, var25.current, p3.startRow, sduiContext, p3.sendGameImpressions, var25.current.itemsPerRow, impressionsTag)
			end
			reportUnifiedLoggingImpressions(sduiContext, p5, var26.current, var25.current)
		end
	end, {
		var14, p3.startRow, sduiContext, var25, var26, var24, p3.sendGameImpressions,
		impressionsTag, p3.impressionEventName, p3.skipItemImpressionsLog
	})
	reactModule.useLayoutEffect(function()
		-- upvalues: p3 (ref), var31 (ref)
		if p3.setLogImpressions then
			p3.setLogImpressions(var31)
		end
	end, { var31, p3.setLogImpressions })
	local scale = useTokens().Config.UI.Scale
	
	return reactModule.createElement(reactModule.Fragment, nil, cryoModule.Dictionary.join(reactModule.useMemo(function()
		-- upvalues: p3 (ref), reactModule (copy), var24 (ref)
		local t = nil
		
		if p3.children then
			t = {}
			
			for i, v in p3.children do
				t[i] = reactModule.cloneElement(v, { parentAnalyticsContext = var24 })
			end
		end
		return t
	end, { var24, p3.children }) or t, {
		CollectionGrid = reactModule.createElement(collectionGrid, {
			disableRelativeGap = true,
			collectionItemSize = if fFlagLuaAppCompositionAlways_1 then p3.collectionItemSize else nil,
			verticalScrollingFrameRef = p3.verticalScrollingFrameRef,
			containerRef = var16,
			getItemHeight = reactModule.useCallback(function(p6)
				-- upvalues: p3 (ref), scale (ref)
				return p6 * p3.itemHeightFromWidth.Scale + p3.itemHeightFromWidth.Offset * scale
			end, { p3.itemHeightFromWidth, scale }),
			items = var14,
			renderItem = reactModule.useCallback(function(p7, p8, p9, _)
				-- upvalues: fFlagSduiPoolBackedFeed (copy), reactModule (copy), sduiContext (ref), sduiErrors (copy), impressionsTag (ref), findAnalyticsField (copy), t (copy), sduiBuilder (copy), var26 (ref), sduiCollectionAnalyticsBuilder (copy), getSduiComponentWrapper (copy), var24 (ref), p3 (ref), sduiCollectionItemModule (copy), var22 (write), var23 (write)
				if fFlagSduiPoolBackedFeed and p7 and p7.isBlank then
					return reactModule.createElement("Frame", { BackgroundTransparency = 1, LayoutOrder = p8 }), "blank"
				elseif not p7 then
					sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilItem, {
						componentType = "CollectionGrid",
						name = impressionsTag,
						message = `Nil item in SduiCollectionGrid.renderItem at index {p8}`
					}, sduiContext.appPage)
					
					return reactModule.createElement(reactModule.Fragment), "nil"
				end
				local componentType = findAnalyticsField("componentType", p7.analyticsData or t) or sduiBuilder.getComponentType(p7, sduiContext)
				
				if not componentType then
					sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilComponentType, {
						componentType = "CollectionGrid",
						name = impressionsTag,
						message = `Nil componentType in CollectionGrid.renderItem at index {p8}`
					}, sduiContext.appPage)
					
					return reactModule.createElement(reactModule.Fragment), "nil"
				end
				local uDim2
				local t_1 = {
					itemPosition = p8,
					itemComponentType = componentType,
					componentType = componentType,
					topicContentsIndex = if fFlagSduiPoolBackedFeed then p7.realIndex else nil
				}
				var26.current[p8] = sduiCollectionAnalyticsBuilder.buildAndValidateItemAnalyticsData(sduiContext, p7.analyticsData, nil, t_1, componentType)
				local createElement = reactModule.createElement
				createElement = createElement(getSduiComponentWrapper(p7), {
					componentConfig = p7,
					sduiContext = sduiContext,
					parentAnalyticsContext = if p7.__isClientBinding then nil else var24,
					extraLocalProps = {
						scrollViewPositionChangedSignal = p3.scrollViewPositionChangedSignal,
						verticalScrollingFrameRef = p3.verticalScrollingFrameRef,
						index = p8,
						selectionOrder = if p3.disableSelectionOrder or not p3.selectionOrderBase then nil else p3.selectionOrderBase + p8
					},
					debugName = `{componentType}_{p8}`,
					localAnalyticsData = t_1
				})
				local createElement_1 = reactModule.createElement
				local t_2 = {
					index = p8,
					impressionsTag = impressionsTag,
					size = p9,
					zIndex = -p8
				}
				
				if fFlagSduiPoolBackedFeed and p7.spanOverride ~= nil then
					local spanOverride = p7.spanOverride
					local var37 = var22
					local var38 = var23
					local colSpan = spanOverride.colSpan or 1
					local rowSpan = spanOverride.rowSpan or 1
					uDim2 = UDim2.new(colSpan, var37 * (colSpan - 1), rowSpan, var38 * (rowSpan - 1))
				else
					uDim2 = nil
				end
				t_2.innerWrapperSize = uDim2
				
				return createElement_1(sduiCollectionItemModule, t_2, { Item = createElement }), componentType or "unknown"
			end, {
				sduiContext, p3.analyticsContext, p3.scrollViewPositionChangedSignal,
				p3.verticalScrollingFrameRef, var24, impressionsTag, p3.index,
				p3.disableSelectionOrder, p3.selectionOrderBase,
				if fFlagSduiPoolBackedFeed then var22 else nil,
				if fFlagSduiPoolBackedFeed then var23 else nil
			}),
			numColumns = if fFlagLuaAppCompositionAlways_1 then nil else var18.numColumns,
			columnGap = if fFlagLuaAppCompositionAlways_1 then nil else var18.columnGap,
			sideMargin = if fFlagLuaAppCompositionAlways_1 then nil else var18.sideMargin,
			onViewableItemsChanged = var29,
			LayoutOrder = layoutOrder,
			verticalPadding = if fFlagLuaAppCompositionAlways_1 then nil else var18.verticalPadding,
			headerComponent = reactModule.useMemo(function()
				-- upvalues: p3 (ref), reactModule (copy), var24 (ref)
				return if p3.headerComponent then reactModule.cloneElement(p3.headerComponent, { parentAnalyticsContext = var24 }) else nil
			end, { var24, p3.headerComponent }),
			testId = if p3.testId then p3.testId else "--sdui-collection-grid",
			onReachedThresholdFromEnd = p3.onReachedThresholdFromEnd,
			thresholdRowsFromBottom = p3.thresholdRowsFromBottom,
			maxNumRows = if fFlagSduiCollectionGridMaxNumRows then p3.maxNumRows else nil
		}),
		ImpressionDetector = if p3.disableImpressionsDetector then nil else reactModule.createElement(waitForPropWrapper, {
			waitForProp = p3.startRow,
			maxUpdatesToDelay = p3.numUpdatesToDelayImpressions,
			wrappedComponent = if p3.shouldUseFrameBoundsForImpressions then reactModule.createElement(frameBoundsImpressionsTracker, {
				parentRef = var17,
				pageContext = sduiContext.routeName or sduiContext.appPage,
				impressionsTag = impressionsTag,
				scrollViewPositionChangedSignal = var27,
				sendImpressions = var31,
				dataUpdatedTimestamp = p3.sduiContext.dataUpdatedTimestamp
			}) else reactModule.createElement(screenSizeImpressionsTracker, {
				parentRef = var17,
				pageContext = sduiContext.routeName or sduiContext.appPage,
				impressionsTag = impressionsTag,
				scrollViewPositionChangedSignal = var27,
				sendImpressions = var31,
				dataUpdatedTimestamp = p3.sduiContext.dataUpdatedTimestamp
			})
		}),
		FocusNavActions = reactModule.useMemo(function()
			-- upvalues: p3 (ref), reactModule (copy), var24 (ref), var15 (ref)
			return if p3.focusNavActionsComponent then reactModule.cloneElement(p3.focusNavActionsComponent, {
				parentAnalyticsContext = var24,
				extraLocalProps = { guiObject = var15 }
			}) else nil
		end, { var24, p3.focusNavActionsComponent, var15 })
	}))
end)