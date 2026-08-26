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
	local var3, var4 = reactModule.useState(nil)
	local var5 = reactModule.useRef(nil)
	var5.current = var3
	local var6 = if not fFlagLuaAppCompositionAlways then if fFlagLuaAppLayoutParamsInContext then signalsReactModule.useSignalState(reactModule.useCallback(function(p2)
		-- upvalues: sduiContext (ref), p2 (ref)
		return sduiContext.getPageLayoutConfig(p2.collectionItemSize)(p2)
	end, { p1.collectionItemSize, sduiContext.getPageLayoutConfig })) else useCollectionLayoutParams(p1.collectionItemSize or collectionItemSize.Small, var3, false, if p1.layoutOverrides then cryoModule.Dictionary.join(p1.layoutOverrides, {
		overrideLoadMoreThreshold = 1e999,
		sideMargin = p1.pageSideMargin
	}) else {
		overrideLoadMoreThreshold = 1e999,
		sideMargin = p1.pageSideMargin
	}) else nil
	local _ = nil
	
	if fFlagSduiPoolBackedFeed then
		var3 = 0
		
		if var4 then
			for i, v in var4 do
				if not v.isBlank then
					var3 += 1
				end
			end
		end
	else
		var3 = if var4 then #var4 else 0
	end
	local var7 = useCollectionLayout(p1.collectionItemSize)
	local var8 = if fFlagLuaAppCompositionAlways_1 then var7.itemsPerRow else var6.numColumns
	local var9 = nil
	local var10 = nil
	
	if fFlagSduiPoolBackedFeed then
		var9 = if fFlagLuaAppCompositionAlways_1 then var7.gutter elseif var6 then var6.columnGap else 0
		var10 = if fFlagLuaAppCompositionAlways_1 then var7.verticalGap elseif var6 then var6.verticalPadding else 0
	end
	local var11, var12 = useCollectionAnalyticsContext(p1.analyticsContext, findAnalyticsField("componentType", p1.analyticsContext.analyticsData or t) or sduiBuilder.getComponentType(p1.componentConfig, sduiContext), var8, var3, sduiContext, p1.startRow, p1.componentConfig.__isClientBinding)
	local var13 = reactModule.useRef({})
	local var14, var15 = useCollectionImpressionsSignal(p1.scrollViewPositionChangedSignal)
	local var16 = reactModule.useCallback(function(_, _)
		-- upvalues: p1 (ref), var15 (ref)
		if p1.onCollectionViewabilityChanged then
			p1.onCollectionViewabilityChanged()
		end
		if var15 then
			var15()
		end
	end, { var15, p1.onCollectionViewabilityChanged })
	local impressionsTag = p1.impressionsTag or getImpressionsTagModule(p1.index, var12.current, sduiContext, p1.debugName)
	local var17 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref), var11 (ref), sduiParseHelpers (copy), sduiContext (ref), sduiErrors (copy), impressionsTag (ref), p2 (ref), var12 (ref), reportUnifiedLoggingImpressions (copy), var13 (ref), fFlagSduiEdpStoreImpressionsLogging (copy), sendLegacyGameImpressionsForSduiModule (copy)
		if var4 == nil or #var4 == 0 then
			if p2 and #p2 > 0 then
				sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogImpressions, {
					componentType = "CollectionGrid",
					name = impressionsTag,
					message = `Failed to log impressions. No configs. indexes: {table.concat(p2, ",")} analytics: {if var11 then sduiParseHelpers.stringifyValue(var11.analyticsData) else nil}`
				}, sduiContext.appPage)
			end
			return
		else
			assert(var4, "itemConfigs must exist")
			
			if (p2.impressionEventName or not var12.current or var12.current.contentType ~= "Game") and not p2.sendGameImpressions then
				reportUnifiedLoggingImpressions(sduiContext, p2, var13.current, var12.current, p2.startRow, p2.impressionEventName, p2.skipItemImpressionsLog, if fFlagSduiEdpStoreImpressionsLogging then impressionsTag else nil)
				
				return
			elseif var12.current and var12.current.contentType == "Game" then
				sendLegacyGameImpressionsForSduiModule(p2, var13.current, var4, var11, var12.current, p2.startRow, sduiContext, p2.sendGameImpressions, var12.current.itemsPerRow, impressionsTag)
			end
			reportUnifiedLoggingImpressions(sduiContext, p2, var13.current, var12.current)
		end
	end, {
		var4, p2.startRow, sduiContext, var12, var13, var11, p2.sendGameImpressions,
		impressionsTag, p2.impressionEventName, p2.skipItemImpressionsLog
	})
	reactModule.useLayoutEffect(function()
		-- upvalues: p2 (ref), var17 (ref)
		if p2.setLogImpressions then
			p2.setLogImpressions(var17)
		end
	end, { var17, p2.setLogImpressions })
	local scale = useTokens().Config.UI.Scale
	local t_1 = {
		disableRelativeGap = true,
		collectionItemSize = if fFlagLuaAppCompositionAlways_1 then p2.collectionItemSize else nil,
		verticalScrollingFrameRef = p2.verticalScrollingFrameRef,
		containerRef = var4,
		getItemHeight = reactModule.useCallback(function(p3)
			-- upvalues: p3 (ref), scale (ref)
			return p3 * p3.itemHeightFromWidth.Scale + p3.itemHeightFromWidth.Offset * scale
		end, { p2.itemHeightFromWidth, scale }),
		items = var4,
		renderItem = reactModule.useCallback(function(p3, p4, p5, _)
			-- upvalues: fFlagSduiPoolBackedFeed (copy), reactModule (copy), sduiContext (ref), sduiErrors (copy), impressionsTag (ref), findAnalyticsField (copy), t (copy), sduiBuilder (copy), var13 (ref), sduiCollectionAnalyticsBuilder (copy), getSduiComponentWrapper (copy), var11 (ref), p3 (ref), sduiCollectionItemModule (copy), var9 (write), var10 (write)
			if fFlagSduiPoolBackedFeed and p3 and p3.isBlank then
				return reactModule.createElement("Frame", { BackgroundTransparency = 1, LayoutOrder = p4 }), "blank"
			elseif not p3 then
				sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilItem, {
					componentType = "CollectionGrid",
					name = impressionsTag,
					message = `Nil item in SduiCollectionGrid.renderItem at index {p4}`
				}, sduiContext.appPage)
				
				return reactModule.createElement(reactModule.Fragment), "nil"
			end
			local componentType = findAnalyticsField("componentType", p3.analyticsData or t) or sduiBuilder.getComponentType(p3, sduiContext)
			
			if not componentType then
				sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilComponentType, {
					componentType = "CollectionGrid",
					name = impressionsTag,
					message = `Nil componentType in CollectionGrid.renderItem at index {p4}`
				}, sduiContext.appPage)
				
				return reactModule.createElement(reactModule.Fragment), "nil"
			end
			local uDim2
			local t_1 = {
				itemPosition = p4,
				itemComponentType = componentType,
				componentType = componentType,
				topicContentsIndex = if fFlagSduiPoolBackedFeed then p3.realIndex else nil
			}
			var13.current[p4] = sduiCollectionAnalyticsBuilder.buildAndValidateItemAnalyticsData(sduiContext, p3.analyticsData, nil, t_1, componentType)
			local createElement = reactModule.createElement
			createElement = createElement(getSduiComponentWrapper(p3), {
				componentConfig = p3,
				sduiContext = sduiContext,
				parentAnalyticsContext = if p3.__isClientBinding then nil else var11,
				extraLocalProps = {
					scrollViewPositionChangedSignal = p3.scrollViewPositionChangedSignal,
					verticalScrollingFrameRef = p3.verticalScrollingFrameRef,
					index = p4,
					selectionOrder = if p3.disableSelectionOrder or not p3.selectionOrderBase then nil else p3.selectionOrderBase + p4
				},
				debugName = `{componentType}_{p4}`,
				localAnalyticsData = t_1
			})
			local createElement_1 = reactModule.createElement
			local t_2 = {
				index = p4,
				impressionsTag = impressionsTag,
				size = p5,
				zIndex = -p4
			}
			
			if fFlagSduiPoolBackedFeed and p3.spanOverride ~= nil then
				local spanOverride = p3.spanOverride
				local var18 = var9
				local var19 = var10
				local colSpan = spanOverride.colSpan or 1
				local rowSpan = spanOverride.rowSpan or 1
				uDim2 = UDim2.new(colSpan, var18 * (colSpan - 1), rowSpan, var19 * (rowSpan - 1))
			else
				uDim2 = nil
			end
			t_2.innerWrapperSize = uDim2
			
			return createElement_1(sduiCollectionItemModule, t_2, { Item = createElement }), componentType or "unknown"
		end, {
			sduiContext, p2.analyticsContext, p2.scrollViewPositionChangedSignal,
			p2.verticalScrollingFrameRef, var11, impressionsTag, p2.index,
			p2.disableSelectionOrder, p2.selectionOrderBase,
			if fFlagSduiPoolBackedFeed then var9 else nil,
			if fFlagSduiPoolBackedFeed then var10 else nil
		}),
		numColumns = if fFlagLuaAppCompositionAlways_1 then nil else var6.numColumns,
		columnGap = if fFlagLuaAppCompositionAlways_1 then nil else var6.columnGap,
		sideMargin = if fFlagLuaAppCompositionAlways_1 then nil else var6.sideMargin,
		onViewableItemsChanged = var16,
		LayoutOrder = layoutOrder,
		verticalPadding = if fFlagLuaAppCompositionAlways_1 then nil else var6.verticalPadding,
		headerComponent = reactModule.useMemo(function()
			-- upvalues: p2 (ref), reactModule (copy), var11 (ref)
			return if p2.headerComponent then reactModule.cloneElement(p2.headerComponent, { parentAnalyticsContext = var11 }) else nil
		end, { var11, p2.headerComponent }),
		testId = if p2.testId then p2.testId else "--sdui-collection-grid",
		onReachedThresholdFromEnd = p2.onReachedThresholdFromEnd,
		thresholdRowsFromBottom = p2.thresholdRowsFromBottom,
		maxNumRows = if fFlagSduiCollectionGridMaxNumRows then p2.maxNumRows else nil
	}
	
	return reactModule.createElement(reactModule.Fragment, nil, cryoModule.Dictionary.join(reactModule.useMemo(function()
		-- upvalues: p2 (ref), reactModule (copy), var11 (ref)
		local t = nil
		
		if p2.children then
			t = {}
			
			for i, v in p2.children do
				t[i] = reactModule.cloneElement(v, { parentAnalyticsContext = var11 })
			end
		end
		return t
	end, { var11, p2.children }) or t, {
		CollectionGrid = if fFlagSduiCollectionGridRevealRows and (p2.initialFeedVisibleRows ~= nil or p2.visibleRowsPerReveal ~= nil) and (p2.setDisplayedRowCount ~= nil and p2.revealRowsComponent ~= nil) then reactModule.createElement(sduiCollectionGridRevealRowsModule, {
			gridProps = t_1,
			sduiContext = p2.sduiContext,
			analyticsContext = p2.analyticsContext,
			itemCount = #var4,
			itemsPerRow = var8,
			maxNumRows = p2.maxNumRows,
			initialFeedVisibleRows = p2.initialFeedVisibleRows,
			visibleRowsPerReveal = p2.visibleRowsPerReveal,
			startRow = p2.startRow,
			setDisplayedRowCount = p2.setDisplayedRowCount,
			revealRowsComponent = p2.revealRowsComponent,
			containerFrame = var3,
			setContainerFrame = var4
		}) else reactModule.createElement(collectionGrid, t_1),
		ImpressionDetector = if p2.disableImpressionsDetector then nil else reactModule.createElement(waitForPropWrapper, {
			waitForProp = p2.startRow,
			maxUpdatesToDelay = p2.numUpdatesToDelayImpressions,
			wrappedComponent = if p2.shouldUseFrameBoundsForImpressions then reactModule.createElement(frameBoundsImpressionsTracker, {
				parentRef = var5,
				pageContext = sduiContext.routeName or sduiContext.appPage,
				impressionsTag = impressionsTag,
				scrollViewPositionChangedSignal = var14,
				sendImpressions = var17,
				dataUpdatedTimestamp = p2.sduiContext.dataUpdatedTimestamp
			}) else reactModule.createElement(screenSizeImpressionsTracker, {
				parentRef = var5,
				pageContext = sduiContext.routeName or sduiContext.appPage,
				impressionsTag = impressionsTag,
				scrollViewPositionChangedSignal = var14,
				sendImpressions = var17,
				dataUpdatedTimestamp = p2.sduiContext.dataUpdatedTimestamp
			})
		}),
		FocusNavActions = reactModule.useMemo(function()
			-- upvalues: p2 (ref), reactModule (copy), var11 (ref), var3 (ref)
			return if p2.focusNavActionsComponent then reactModule.cloneElement(p2.focusNavActionsComponent, {
				parentAnalyticsContext = var11,
				extraLocalProps = { guiObject = var3 }
			}) else nil
		end, { var11, p2.focusNavActionsComponent, var3 })
	}))
end)