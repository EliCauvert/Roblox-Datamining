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
local usePreferredTextSizeLineBudget = require(parent.SduiSharedUtilities).usePreferredTextSizeLineBudget
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
local fFlagSduiFixSearchTelemetry = require(parent.SharedFlags).FFlagSduiFixSearchTelemetry
local fFlagSduiPreferredTextSizeLineBudgets = require(parent.SharedFlags).FFlagSduiPreferredTextSizeLineBudgets
local fFlagSduiCollectionGridRevealRows = require(parent.SharedFlags).FFlagSduiCollectionGridRevealRows
local fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor = require(parent.SharedFlags).FFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor

local function _(p1, p2, p3)
	local colSpan = p1.colSpan or 1
	local rowSpan = p1.rowSpan or 1
	
	return UDim2.new(colSpan, p2 * (colSpan - 1), rowSpan, p3 * (rowSpan - 1))
end

local t = {}

return reactModule.memo(function(p1)
	-- upvalues: fFlagLuaAppCompositionAlways (ref), reactModule (ref), t (ref), fFlagLuaAppLayoutParamsInContext (ref), signalsReactModule (ref), useCollectionLayoutParams (ref), collectionItemSize (ref), cryoModule (ref), useCollectionLayout (ref), findAnalyticsField (ref), sduiBuilder (ref), useCollectionAnalyticsContext (ref), useCollectionImpressionsSignal (ref), getImpressionsTagModule (ref), sduiParseHelpers (ref), sduiErrors (ref), reportUnifiedLoggingImpressions (ref), sendLegacyGameImpressionsForSduiModule (ref), useTokens (ref), fFlagSduiPreferredTextSizeLineBudgets (ref), usePreferredTextSizeLineBudget (ref), fFlagSduiFixSearchTelemetry (ref), sduiCollectionAnalyticsBuilder (ref), getSduiComponentWrapper (ref), fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor (ref), sduiCollectionItemModule (ref), fFlagSduiCollectionGridMaxNumRows (ref), fFlagSduiCollectionGridRevealRows (ref), sduiCollectionGridRevealRowsModule (ref), collectionGrid (ref), waitForPropWrapper (ref), frameBoundsImpressionsTracker (ref), screenSizeImpressionsTracker (ref)
	local fFlagLuaAppCompositionAlways_1 = fFlagLuaAppCompositionAlways or (p1.appCompositionEnabled or p1.sduiContext.appCompositionEnabled)
	local layoutOrder = p1.layoutOrder
	local sduiContext = p1.sduiContext
	local var1 = reactModule.useMemo(function()
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
	local var2, var3 = reactModule.useState(nil)
	local var4 = reactModule.useRef(nil)
	var4.current = var2
	local var5 = if not fFlagLuaAppCompositionAlways then if fFlagLuaAppLayoutParamsInContext then signalsReactModule.useSignalState(reactModule.useCallback(function(p2)
		-- upvalues: sduiContext (ref), p1 (ref)
		return sduiContext.getPageLayoutConfig(p1.collectionItemSize)(p2)
	end, { p1.collectionItemSize, sduiContext.getPageLayoutConfig })) else useCollectionLayoutParams(p1.collectionItemSize or collectionItemSize.Small, var2, false, if p1.layoutOverrides then cryoModule.Dictionary.join(p1.layoutOverrides, {
		overrideLoadMoreThreshold = 1e999,
		sideMargin = p1.pageSideMargin
	}) else {
		overrideLoadMoreThreshold = 1e999,
		sideMargin = p1.pageSideMargin
	}) else nil
	local var6 = 0
	
	if var1 then
		for i, v in var1 do
			if not v.isBlank then
				var6 += 1
			end
		end
	end
	local var7 = useCollectionLayout(p1.collectionItemSize)
	local var8 = if fFlagLuaAppCompositionAlways_1 then var7.itemsPerRow else var5.numColumns
	local var9 = if fFlagLuaAppCompositionAlways_1 then var7.gutter elseif var5 then var5.columnGap else 0
	local var10 = if fFlagLuaAppCompositionAlways_1 then var7.verticalGap elseif var5 then var5.verticalPadding else 0
	local var11, var12 = useCollectionAnalyticsContext(p1.analyticsContext, findAnalyticsField("componentType", p1.analyticsContext.analyticsData or t) or sduiBuilder.getComponentType(p1.componentConfig, sduiContext), var8, var6, sduiContext, p1.startRow, p1.componentConfig.__isClientBinding)
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
		-- upvalues: var1 (ref), var11 (ref), sduiParseHelpers (copy), sduiContext (ref), sduiErrors (copy), impressionsTag (ref), p1 (ref), var12 (ref), reportUnifiedLoggingImpressions (copy), var13 (ref), sendLegacyGameImpressionsForSduiModule (copy)
		if var1 == nil or #var1 == 0 then
			if p2 and #p2 > 0 then
				sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogImpressions, {
					componentType = "CollectionGrid",
					name = impressionsTag,
					message = `Failed to log impressions. No configs. indexes: {table.concat(p2, ",")} analytics: {if var11 then sduiParseHelpers.stringifyValue(var11.analyticsData) else nil}`
				}, sduiContext.appPage)
			end
			return
		else
			assert(var1, "itemConfigs must exist")
			
			if (p1.impressionEventName or not var12.current or var12.current.contentType ~= "Game") and not p1.sendGameImpressions then
				reportUnifiedLoggingImpressions(sduiContext, p2, var13.current, var12.current, p1.startRow, p1.impressionEventName, p1.skipItemImpressionsLog, impressionsTag)
				
				return
			elseif var12.current and var12.current.contentType == "Game" then
				sendLegacyGameImpressionsForSduiModule(p2, var13.current, var1, var11, var12.current, p1.startRow, sduiContext, p1.sendGameImpressions, var12.current.itemsPerRow, impressionsTag)
			end
			reportUnifiedLoggingImpressions(sduiContext, p2, var13.current, var12.current)
		end
	end, {
		var1, p1.startRow, sduiContext, var12, var13, var11, p1.sendGameImpressions,
		impressionsTag, p1.impressionEventName, p1.skipItemImpressionsLog
	})
	reactModule.useLayoutEffect(function()
		-- upvalues: p1 (ref), var17 (ref)
		if p1.setLogImpressions then
			p1.setLogImpressions(var17)
		end
	end, { var17, p1.setLogImpressions })
	local scale = useTokens().Config.UI.Scale
	local var18 = if fFlagSduiPreferredTextSizeLineBudgets then usePreferredTextSizeLineBudget(p1.preferredTextSizeLineCount) else nil
	local t_1 = {
		disableRelativeGap = true,
		collectionItemSize = if fFlagLuaAppCompositionAlways_1 then p1.collectionItemSize else nil,
		verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
		containerRef = var3,
		getItemHeight = reactModule.useCallback(function(p3)
			-- upvalues: p1 (ref), scale (ref), var18 (write)
			return p3 * p1.itemHeightFromWidth.Scale + p1.itemHeightFromWidth.Offset * scale + (var18 or 0)
		end, {
			p1.itemHeightFromWidth,
			scale,
			if fFlagSduiPreferredTextSizeLineBudgets then var18 else nil
		}),
		items = var1,
		renderItem = reactModule.useCallback(function(p3, p4, p5, _)
			-- upvalues: reactModule (copy), sduiContext (ref), sduiErrors (copy), impressionsTag (ref), findAnalyticsField (copy), t (copy), sduiBuilder (copy), fFlagSduiFixSearchTelemetry (copy), var13 (ref), sduiCollectionAnalyticsBuilder (copy), getSduiComponentWrapper (copy), var11 (ref), p1 (ref), fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor (copy), var10 (ref), sduiCollectionItemModule (copy), var9 (ref)
			if p3 and p3.isBlank then
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
				topicContentsIndex = p3.realIndex,
				topicDataPosition = if fFlagSduiFixSearchTelemetry then p3.realIndex else nil
			}
			var13.current[p4] = sduiCollectionAnalyticsBuilder.buildAndValidateItemAnalyticsData(sduiContext, p3.analyticsData, nil, t_1, componentType)
			local createElement = reactModule.createElement
			createElement = createElement(getSduiComponentWrapper(p3), {
				componentConfig = p3,
				sduiContext = sduiContext,
				parentAnalyticsContext = if p3.__isClientBinding then nil else var11,
				extraLocalProps = {
					scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
					verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
					index = p4,
					selectionOrder = if p1.disableSelectionOrder or not p1.selectionOrderBase then nil else p1.selectionOrderBase + p4,
					alignmentType = if fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor and p3.spanOverride ~= nil then p3.spanOverride.alignmentType else nil,
					cellVerticalPadding = if fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor and p3.spanOverride ~= nil then var10 else nil
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
			
			if p3.spanOverride == nil then
				uDim2 = nil
			else
				local spanOverride = p3.spanOverride
				local var19 = var9
				local var20 = var10
				local colSpan = spanOverride.colSpan or 1
				local rowSpan = spanOverride.rowSpan or 1
				uDim2 = UDim2.new(colSpan, var19 * (colSpan - 1), rowSpan, var20 * (rowSpan - 1))
			end
			t_2.innerWrapperSize = uDim2
			
			return createElement_1(sduiCollectionItemModule, t_2, { Item = createElement }), componentType or "unknown"
		end, {
			sduiContext, p1.analyticsContext, p1.scrollViewPositionChangedSignal,
			p1.verticalScrollingFrameRef, var11, impressionsTag, p1.index,
			p1.disableSelectionOrder, p1.selectionOrderBase, var9, var10
		}),
		numColumns = if fFlagLuaAppCompositionAlways_1 then nil else var5.numColumns,
		columnGap = if fFlagLuaAppCompositionAlways_1 then nil else var5.columnGap,
		sideMargin = if fFlagLuaAppCompositionAlways_1 then nil else var5.sideMargin,
		onViewableItemsChanged = var16,
		LayoutOrder = layoutOrder,
		verticalPadding = if fFlagLuaAppCompositionAlways_1 then nil else var5.verticalPadding,
		headerComponent = reactModule.useMemo(function()
			-- upvalues: p1 (ref), reactModule (copy), var11 (ref)
			return if p1.headerComponent then reactModule.cloneElement(p1.headerComponent, { parentAnalyticsContext = var11 }) else nil
		end, { var11, p1.headerComponent }),
		testId = if p1.testId then p1.testId else "--sdui-collection-grid",
		onReachedThresholdFromEnd = p1.onReachedThresholdFromEnd,
		thresholdRowsFromBottom = p1.thresholdRowsFromBottom,
		maxNumRows = if fFlagSduiCollectionGridMaxNumRows then p1.maxNumRows else nil
	}
	
	return reactModule.createElement(reactModule.Fragment, nil, cryoModule.Dictionary.join(reactModule.useMemo(function()
		-- upvalues: p1 (ref), reactModule (copy), var11 (ref)
		local t = nil
		
		if p1.children then
			t = {}
			
			for i, v in p1.children do
				t[i] = reactModule.cloneElement(v, { parentAnalyticsContext = var11 })
			end
		end
		return t
	end, { var11, p1.children }) or t, {
		CollectionGrid = if fFlagSduiCollectionGridRevealRows and (p1.initialFeedVisibleRows ~= nil or p1.visibleRowsPerReveal ~= nil) and (p1.setDisplayedRowCount ~= nil and p1.revealRowsComponent ~= nil) then reactModule.createElement(sduiCollectionGridRevealRowsModule, {
			gridProps = t_1,
			sduiContext = p1.sduiContext,
			analyticsContext = p1.analyticsContext,
			itemCount = #var1,
			itemsPerRow = var8,
			maxNumRows = p1.maxNumRows,
			initialFeedVisibleRows = p1.initialFeedVisibleRows,
			visibleRowsPerReveal = p1.visibleRowsPerReveal,
			startRow = p1.startRow,
			setDisplayedRowCount = p1.setDisplayedRowCount,
			revealRowsComponent = p1.revealRowsComponent,
			containerFrame = var2,
			setContainerFrame = var3
		}) else reactModule.createElement(collectionGrid, t_1),
		ImpressionDetector = if p1.disableImpressionsDetector then nil else reactModule.createElement(waitForPropWrapper, {
			waitForProp = p1.startRow,
			maxUpdatesToDelay = p1.numUpdatesToDelayImpressions,
			wrappedComponent = if p1.shouldUseFrameBoundsForImpressions then reactModule.createElement(frameBoundsImpressionsTracker, {
				parentRef = var4,
				pageContext = sduiContext.routeName or sduiContext.appPage,
				impressionsTag = impressionsTag,
				scrollViewPositionChangedSignal = var14,
				sendImpressions = var17,
				dataUpdatedTimestamp = p1.sduiContext.dataUpdatedTimestamp
			}) else reactModule.createElement(screenSizeImpressionsTracker, {
				parentRef = var4,
				pageContext = sduiContext.routeName or sduiContext.appPage,
				impressionsTag = impressionsTag,
				scrollViewPositionChangedSignal = var14,
				sendImpressions = var17,
				dataUpdatedTimestamp = p1.sduiContext.dataUpdatedTimestamp
			})
		}),
		FocusNavActions = reactModule.useMemo(function()
			-- upvalues: p1 (ref), reactModule (copy), var11 (ref), var2 (ref)
			return if p1.focusNavActionsComponent then reactModule.cloneElement(p1.focusNavActionsComponent, {
				parentAnalyticsContext = var11,
				extraLocalProps = { guiObject = var2 }
			}) else nil
		end, { var11, p1.focusNavActionsComponent, var2 })
	}))
end)