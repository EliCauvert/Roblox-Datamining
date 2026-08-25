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
local sduiCollectionGridRevealRowsModule = require(serverDrivenUi.Content.Collections.SduiCollectionGridRevealRows)
local useCollectionAnalyticsContext = require(parent.SduiSharedContent).useCollectionAnalyticsContext
local fFlagLuaAppLayoutParamsInContext = require(parent.SharedFlags).FFlagLuaAppLayoutParamsInContext
local fFlagSduiCollectionGridMaxNumRows = require(parent.SharedFlags).FFlagSduiCollectionGridMaxNumRows
local fFlagLuaAppCompositionAlways = require(parent.SharedFlags).FFlagLuaAppCompositionAlways
local fFlagSduiEdpStoreImpressionsLogging = require(parent.SharedFlags).FFlagSduiEdpStoreImpressionsLogging
local fFlagSduiPoolBackedFeed = require(parent.SharedFlags).FFlagSduiPoolBackedFeed
local fFlagSduiCollectionGridRevealRows = require(parent.SharedFlags).FFlagSduiCollectionGridRevealRows

local function _(p1, p2, p3)
	local colSpan = p1.colSpan or 1
	local rowSpan = p1.rowSpan or 1
	
	return UDim2.new(colSpan, p2 * (colSpan - 1), rowSpan, p3 * (rowSpan - 1))
end

local t = {}

return reactModule.memo(function(p1)
	-- upvalues: fFlagLuaAppCompositionAlways (ref), reactModule (ref), t (ref), fFlagLuaAppLayoutParamsInContext (ref), signalsReactModule (ref), useCollectionLayoutParams (ref), collectionItemSize (ref), cryoModule (ref), fFlagSduiPoolBackedFeed (ref), useCollectionLayout (ref), findAnalyticsField (ref), sduiBuilder (ref), useCollectionAnalyticsContext (ref), useCollectionImpressionsSignal (ref), getImpressionsTagModule (ref), sduiParseHelpers (ref), sduiErrors (ref), reportUnifiedLoggingImpressions (ref), fFlagSduiEdpStoreImpressionsLogging (ref), sendLegacyGameImpressionsForSduiModule (ref), useTokens (ref), sduiCollectionAnalyticsBuilder (ref), getSduiComponentWrapper (ref), sduiCollectionItemModule (ref), fFlagSduiCollectionGridMaxNumRows (ref), fFlagSduiCollectionGridRevealRows (ref), sduiCollectionGridRevealRowsModule (ref), collectionGrid (ref), waitForPropWrapper (ref), frameBoundsImpressionsTracker (ref), screenSizeImpressionsTracker (ref)
	local var1
	local fFlagLuaAppCompositionAlways_1 = fFlagLuaAppCompositionAlways or (p1.appCompositionEnabled or p1.sduiContext.appCompositionEnabled)
	local layoutOrder = p1.layoutOrder
	local sduiContext = p1.sduiContext
	local var2 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), t (copy)
		if p1.items == nil then
			return t
		end
		for i, v in p1.items do
			if p1.itemTemplateKey and v.templateKey == nil then
				v.templateKey = p1.itemTemplateKey
			end
		end
		return p1.items
	end, { p1.items, p1.itemTemplateKey })
	local var1, var2 = reactModule.useState(nil)
	local var3 = reactModule.useRef(nil)
	var3.current = var1
	local var4 = if not fFlagLuaAppCompositionAlways then if fFlagLuaAppLayoutParamsInContext then signalsReactModule.useSignalState(reactModule.useCallback(function(p1)
		-- upvalues: sduiContext (ref), p1 (ref)
		return sduiContext.getPageLayoutConfig(p1.collectionItemSize)(p1)
	end, { p1.collectionItemSize, sduiContext.getPageLayoutConfig })) else useCollectionLayoutParams(p1.collectionItemSize or collectionItemSize.Small, var1, false, if p1.layoutOverrides then cryoModule.Dictionary.join(p1.layoutOverrides, {
		overrideLoadMoreThreshold = 1e999,
		sideMargin = p1.pageSideMargin
	}) else {
		overrideLoadMoreThreshold = 1e999,
		sideMargin = p1.pageSideMargin
	}) else nil
	local _ = nil
	
	if fFlagSduiPoolBackedFeed then
		var1 = 0
		
		if var2 then
			for i, v in var2 do
				if not v.isBlank then
					var1 += 1
				end
			end
		end
	else
		var1 = if var2 then #var2 else 0
	end
	local var5 = useCollectionLayout(p1.collectionItemSize)
	local var6 = if fFlagLuaAppCompositionAlways_1 then var5.itemsPerRow else var4.numColumns
	local var7 = nil
	local var8 = nil
	
	if fFlagSduiPoolBackedFeed then
		var7 = if fFlagLuaAppCompositionAlways_1 then var5.gutter elseif var4 then var4.columnGap else 0
		var8 = if fFlagLuaAppCompositionAlways_1 then var5.verticalGap elseif var4 then var4.verticalPadding else 0
	end
	local var9, var10 = useCollectionAnalyticsContext(p1.analyticsContext, findAnalyticsField("componentType", p1.analyticsContext.analyticsData or t) or sduiBuilder.getComponentType(p1.componentConfig, sduiContext), var6, var1, sduiContext, p1.startRow, p1.componentConfig.__isClientBinding)
	local var11 = reactModule.useRef({})
	local var12, var13 = useCollectionImpressionsSignal(p1.scrollViewPositionChangedSignal)
	local var14 = reactModule.useCallback(function(_, _)
		-- upvalues: p1 (ref), var13 (ref)
		if p1.onCollectionViewabilityChanged then
			p1.onCollectionViewabilityChanged()
		end
		if var13 then
			var13()
		end
	end, { var13, p1.onCollectionViewabilityChanged })
	local impressionsTag = p1.impressionsTag or getImpressionsTagModule(p1.index, var10.current, sduiContext, p1.debugName)
	local var15 = reactModule.useCallback(function(p1)
		-- upvalues: var2 (ref), var9 (ref), sduiParseHelpers (copy), sduiContext (ref), sduiErrors (copy), impressionsTag (ref), p1 (ref), var10 (ref), reportUnifiedLoggingImpressions (copy), var11 (ref), fFlagSduiEdpStoreImpressionsLogging (copy), sendLegacyGameImpressionsForSduiModule (copy)
		if var2 == nil or #var2 == 0 then
			if p1 and #p1 > 0 then
				sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogImpressions, {
					componentType = "CollectionGrid",
					name = impressionsTag,
					message = `Failed to log impressions. No configs. indexes: {table.concat(p1, ",")} analytics: {if var9 then sduiParseHelpers.stringifyValue(var9.analyticsData) else nil}`
				}, sduiContext.appPage)
			end
			return
		else
			assert(var2, "itemConfigs must exist")
			
			if (p1.impressionEventName or not var10.current or var10.current.contentType ~= "Game") and not p1.sendGameImpressions then
				reportUnifiedLoggingImpressions(sduiContext, p1, var11.current, var10.current, p1.startRow, p1.impressionEventName, p1.skipItemImpressionsLog, if fFlagSduiEdpStoreImpressionsLogging then impressionsTag else nil)
				
				return
			elseif var10.current and var10.current.contentType == "Game" then
				sendLegacyGameImpressionsForSduiModule(p1, var11.current, var2, var9, var10.current, p1.startRow, sduiContext, p1.sendGameImpressions, var10.current.itemsPerRow, impressionsTag)
			end
			reportUnifiedLoggingImpressions(sduiContext, p1, var11.current, var10.current)
		end
	end, {
		var2, p1.startRow, sduiContext, var10, var11, var9, p1.sendGameImpressions,
		impressionsTag, p1.impressionEventName, p1.skipItemImpressionsLog
	})
	reactModule.useLayoutEffect(function()
		-- upvalues: p1 (ref), var15 (ref)
		if p1.setLogImpressions then
			p1.setLogImpressions(var15)
		end
	end, { var15, p1.setLogImpressions })
	local scale = useTokens().Config.UI.Scale
	local t_1 = {
		disableRelativeGap = true,
		collectionItemSize = if fFlagLuaAppCompositionAlways_1 then p1.collectionItemSize else nil,
		verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
		containerRef = var2,
		getItemHeight = reactModule.useCallback(function(p1)
			-- upvalues: p1 (ref), scale (ref)
			return p1 * p1.itemHeightFromWidth.Scale + p1.itemHeightFromWidth.Offset * scale
		end, { p1.itemHeightFromWidth, scale }),
		items = var2,
		renderItem = reactModule.useCallback(function(p1, p2, p3, _)
			-- upvalues: fFlagSduiPoolBackedFeed (copy), reactModule (copy), sduiContext (ref), sduiErrors (copy), impressionsTag (ref), findAnalyticsField (copy), t (copy), sduiBuilder (copy), var11 (ref), sduiCollectionAnalyticsBuilder (copy), getSduiComponentWrapper (copy), var9 (ref), p1 (ref), sduiCollectionItemModule (copy), var7 (write), var8 (write)
			if fFlagSduiPoolBackedFeed and p1 and p1.isBlank then
				return reactModule.createElement("Frame", { BackgroundTransparency = 1, LayoutOrder = p2 }), "blank"
			elseif not p1 then
				sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilItem, {
					componentType = "CollectionGrid",
					name = impressionsTag,
					message = `Nil item in SduiCollectionGrid.renderItem at index {p2}`
				}, sduiContext.appPage)
				
				return reactModule.createElement(reactModule.Fragment), "nil"
			end
			local componentType = findAnalyticsField("componentType", p1.analyticsData or t) or sduiBuilder.getComponentType(p1, sduiContext)
			
			if not componentType then
				sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilComponentType, {
					componentType = "CollectionGrid",
					name = impressionsTag,
					message = `Nil componentType in CollectionGrid.renderItem at index {p2}`
				}, sduiContext.appPage)
				
				return reactModule.createElement(reactModule.Fragment), "nil"
			end
			local uDim2
			local t_1 = {
				itemPosition = p2,
				itemComponentType = componentType,
				componentType = componentType,
				topicContentsIndex = if fFlagSduiPoolBackedFeed then p1.realIndex else nil
			}
			var11.current[p2] = sduiCollectionAnalyticsBuilder.buildAndValidateItemAnalyticsData(sduiContext, p1.analyticsData, nil, t_1, componentType)
			local createElement = reactModule.createElement
			createElement = createElement(getSduiComponentWrapper(p1), {
				componentConfig = p1,
				sduiContext = sduiContext,
				parentAnalyticsContext = if p1.__isClientBinding then nil else var9,
				extraLocalProps = {
					scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
					verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
					index = p2,
					selectionOrder = if p1.disableSelectionOrder or not p1.selectionOrderBase then nil else p1.selectionOrderBase + p2
				},
				debugName = `{componentType}_{p2}`,
				localAnalyticsData = t_1
			})
			local createElement_1 = reactModule.createElement
			local t_2 = {
				index = p2,
				impressionsTag = impressionsTag,
				size = p3,
				zIndex = -p2
			}
			
			if fFlagSduiPoolBackedFeed and p1.spanOverride ~= nil then
				local spanOverride = p1.spanOverride
				local var1 = var7
				local var2 = var8
				local colSpan = spanOverride.colSpan or 1
				local rowSpan = spanOverride.rowSpan or 1
				uDim2 = UDim2.new(colSpan, var1 * (colSpan - 1), rowSpan, var2 * (rowSpan - 1))
			else
				uDim2 = nil
			end
			t_2.innerWrapperSize = uDim2
			
			return createElement_1(sduiCollectionItemModule, t_2, { Item = createElement }), componentType or "unknown"
		end, {
			sduiContext, p1.analyticsContext, p1.scrollViewPositionChangedSignal,
			p1.verticalScrollingFrameRef, var9, impressionsTag, p1.index,
			p1.disableSelectionOrder, p1.selectionOrderBase,
			if fFlagSduiPoolBackedFeed then var7 else nil,
			if fFlagSduiPoolBackedFeed then var8 else nil
		}),
		numColumns = if fFlagLuaAppCompositionAlways_1 then nil else var4.numColumns,
		columnGap = if fFlagLuaAppCompositionAlways_1 then nil else var4.columnGap,
		sideMargin = if fFlagLuaAppCompositionAlways_1 then nil else var4.sideMargin,
		onViewableItemsChanged = var14,
		LayoutOrder = layoutOrder,
		verticalPadding = if fFlagLuaAppCompositionAlways_1 then nil else var4.verticalPadding,
		headerComponent = reactModule.useMemo(function()
			-- upvalues: p1 (ref), reactModule (copy), var9 (ref)
			return if p1.headerComponent then reactModule.cloneElement(p1.headerComponent, { parentAnalyticsContext = var9 }) else nil
		end, { var9, p1.headerComponent }),
		testId = if p1.testId then p1.testId else "--sdui-collection-grid",
		onReachedThresholdFromEnd = p1.onReachedThresholdFromEnd,
		thresholdRowsFromBottom = p1.thresholdRowsFromBottom,
		maxNumRows = if fFlagSduiCollectionGridMaxNumRows then p1.maxNumRows else nil
	}
	
	return reactModule.createElement(reactModule.Fragment, nil, cryoModule.Dictionary.join(reactModule.useMemo(function()
		-- upvalues: p1 (ref), reactModule (copy), var9 (ref)
		local t = nil
		
		if p1.children then
			t = {}
			
			for i, v in p1.children do
				t[i] = reactModule.cloneElement(v, { parentAnalyticsContext = var9 })
			end
		end
		return t
	end, { var9, p1.children }) or t, {
		CollectionGrid = if fFlagSduiCollectionGridRevealRows and (p1.initialFeedVisibleRows ~= nil or p1.visibleRowsPerReveal ~= nil) and (p1.setDisplayedRowCount ~= nil and p1.revealRowsComponent ~= nil) then reactModule.createElement(sduiCollectionGridRevealRowsModule, {
			gridProps = t_1,
			sduiContext = p1.sduiContext,
			analyticsContext = p1.analyticsContext,
			itemCount = #var2,
			itemsPerRow = var6,
			maxNumRows = p1.maxNumRows,
			initialFeedVisibleRows = p1.initialFeedVisibleRows,
			visibleRowsPerReveal = p1.visibleRowsPerReveal,
			startRow = p1.startRow,
			setDisplayedRowCount = p1.setDisplayedRowCount,
			revealRowsComponent = p1.revealRowsComponent,
			containerFrame = var1,
			setContainerFrame = var2
		}) else reactModule.createElement(collectionGrid, t_1),
		ImpressionDetector = if p1.disableImpressionsDetector then nil else reactModule.createElement(waitForPropWrapper, {
			waitForProp = p1.startRow,
			maxUpdatesToDelay = p1.numUpdatesToDelayImpressions,
			wrappedComponent = if p1.shouldUseFrameBoundsForImpressions then reactModule.createElement(frameBoundsImpressionsTracker, {
				parentRef = var3,
				pageContext = sduiContext.routeName or sduiContext.appPage,
				impressionsTag = impressionsTag,
				scrollViewPositionChangedSignal = var12,
				sendImpressions = var15,
				dataUpdatedTimestamp = p1.sduiContext.dataUpdatedTimestamp
			}) else reactModule.createElement(screenSizeImpressionsTracker, {
				parentRef = var3,
				pageContext = sduiContext.routeName or sduiContext.appPage,
				impressionsTag = impressionsTag,
				scrollViewPositionChangedSignal = var12,
				sendImpressions = var15,
				dataUpdatedTimestamp = p1.sduiContext.dataUpdatedTimestamp
			})
		}),
		FocusNavActions = reactModule.useMemo(function()
			-- upvalues: p1 (ref), reactModule (copy), var9 (ref), var1 (ref)
			return if p1.focusNavActionsComponent then reactModule.cloneElement(p1.focusNavActionsComponent, {
				parentAnalyticsContext = var9,
				extraLocalProps = { guiObject = var1 }
			}) else nil
		end, { var9, p1.focusNavActionsComponent, var1 })
	}))
end)