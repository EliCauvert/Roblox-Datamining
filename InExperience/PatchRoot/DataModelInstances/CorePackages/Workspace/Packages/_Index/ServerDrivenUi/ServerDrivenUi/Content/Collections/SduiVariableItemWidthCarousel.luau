local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local _ = require(parent.AppCommonLib)
local signalsReactModule = require(parent.SignalsReact)
local collectionViewsModule = require(parent.CollectionViews)
local useCollectionImpressionsSignal = collectionViewsModule.useCollectionImpressionsSignal
local useCollectionLayoutParams = collectionViewsModule.useCollectionLayoutParams
local variableItemWidthCarousel = require(parent.VariableItemWidthCarousel).VariableItemWidthCarousel
local waitForPropWrapper = require(parent.GameCollections).WaitForPropWrapper
local impressionsModule = require(parent.Impressions)
local frameBoundsImpressionsTracker = impressionsModule.FrameBoundsImpressionsTracker
local screenSizeImpressionsTracker = impressionsModule.ScreenSizeImpressionsTracker
local scrollDetector = require(parent.ScrollTelemetry).ScrollDetector
local useTokens = require(parent.Foundation).Hooks.useTokens
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local findAnalyticsField = sduiCoreSystemModule.findAnalyticsField
local getSduiComponentWrapper = sduiCoreSystemModule.getSduiComponentWrapper
local reportUnifiedLoggingImpressions = sduiCoreSystemModule.reportUnifiedLoggingImpressions
local sduiBuilder = sduiCoreSystemModule.SduiBuilder
local sduiCollectionAnalyticsBuilder = sduiCoreSystemModule.SduiCollectionAnalyticsBuilder
local sduiComponentType = sduiCoreSystemModule.SduiComponentType
local sduiErrors = sduiCoreSystemModule.SduiErrors
local sduiParseHelpers = sduiCoreSystemModule.SduiParseHelpers
local sduiCollectionItemModule = require(serverDrivenUi.Content.Collections.SduiCollectionItem)
local getImpressionsTagModule = require(serverDrivenUi.Analytics.getImpressionsTag)
local useCollectionAnalyticsContext = require(parent.SduiSharedContent).useCollectionAnalyticsContext
local useScrollTelemetryCallbackModule = require(serverDrivenUi.Analytics.useScrollTelemetryCallback)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppCompositionAlways = sharedFlagsModule.FFlagLuaAppCompositionAlways
local fFlagLuaAppLayoutParamsInContext = sharedFlagsModule.FFlagLuaAppLayoutParamsInContext
local fFlagLuaAppRespectClipAncestorImpressions = sharedFlagsModule.FFlagLuaAppRespectClipAncestorImpressions
local fFlagLuaAppUseFrameBoundsImpressions = sharedFlagsModule.FFlagLuaAppUseFrameBoundsImpressions
local t = {}

return reactModule.memo(function(p1)
	-- upvalues: fFlagLuaAppCompositionAlways (ref), t (ref), useTokens (ref), reactModule (ref), fFlagLuaAppLayoutParamsInContext (ref), signalsReactModule (ref), useCollectionLayoutParams (ref), findAnalyticsField (ref), sduiBuilder (ref), sduiComponentType (ref), useCollectionAnalyticsContext (ref), useCollectionImpressionsSignal (ref), getImpressionsTagModule (ref), sduiParseHelpers (ref), sduiErrors (ref), reportUnifiedLoggingImpressions (ref), useScrollTelemetryCallbackModule (ref), sduiCollectionAnalyticsBuilder (ref), getSduiComponentWrapper (ref), sduiCollectionItemModule (ref), variableItemWidthCarousel (ref), waitForPropWrapper (ref), fFlagLuaAppUseFrameBoundsImpressions (ref), frameBoundsImpressionsTracker (ref), screenSizeImpressionsTracker (ref), fFlagLuaAppRespectClipAncestorImpressions (ref), scrollDetector (ref)
	local sduiContext = p1.sduiContext
	local fFlagLuaAppCompositionAlways_1 = fFlagLuaAppCompositionAlways or (p1.appCompositionEnabled or sduiContext.appCompositionEnabled)
	local items = p1.items or t
	local itemsCount = #items
	local var1 = useTokens()
	local itemHeight = p1.itemHeight or var1.Size.Size_800
	local itemPadding = p1.itemPadding or var1.Padding.XSmall
	local var2, var3 = reactModule.useState(nil)
	local var4 = if p1.sideMargin ~= nil then if fFlagLuaAppCompositionAlways_1 then 0 else (if not fFlagLuaAppCompositionAlways then if fFlagLuaAppLayoutParamsInContext then signalsReactModule.useSignalState(reactModule.useCallback(function(p2)
		-- upvalues: sduiContext (ref)
		return sduiContext.getPageLayoutConfig("Small")(p2)
	end, { sduiContext.getPageLayoutConfig })) else useCollectionLayoutParams("Small", var2, false, { sideMargin = p1.pageSideMargin }) else nil).sideMargin else p1.sideMargin
	local var5, var6 = useCollectionAnalyticsContext(p1.analyticsContext, findAnalyticsField("componentType", p1.analyticsContext.analyticsData or t) or (sduiBuilder.getComponentType(p1.componentConfig, sduiContext) or sduiComponentType.VariableItemWidthCarousel), itemsCount, itemsCount, sduiContext, p1.startRow, p1.componentConfig.__isClientBinding)
	local var7 = reactModule.useRef({})
	local var8, var9 = reactModule.useState({})
	local var10 = reactModule.useRef(nil)
	local var11, var12 = useCollectionImpressionsSignal(p1.scrollViewPositionChangedSignal)
	local var13 = getImpressionsTagModule(p1.index, var6.current, sduiContext, p1.debugName)
	local var14 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var9 (ref)
		local x = p3.AbsoluteSize.X
		
		if x <= 0 then
			return
		end
		var9(function(p4)
			-- upvalues: p2 (ref), x (ref)
			if p4[p2] == x then
				return p4
			end
			local cloned = table.clone(p4)
			cloned[p2] = x
			
			return cloned
		end)
	end, {})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Carousel = reactModule.createElement(variableItemWidthCarousel, {
			ref = var3,
			LayoutOrder = p1.layoutOrder,
			Position = p1.position,
			title = p1.title or "",
			subtitle = p1.subtitle,
			calculateItemWidth = reactModule.useCallback(function(p2)
				-- upvalues: var8 (ref)
				return var8[p2] or 0
			end, { var8 }),
			scrollButtonsEnabled = p1.scrollButtonsEnabled,
			scrollSpeed = p1.scrollSpeed,
			items = items,
			itemHeight = itemHeight,
			itemPadding = itemPadding,
			onCanvasPositionChanged = var12,
			renderItem = reactModule.useCallback(function(p2, p3)
				-- upvalues: sduiContext (ref), sduiErrors (copy), var13 (ref), reactModule (copy), findAnalyticsField (copy), t (copy), sduiBuilder (copy), var7 (ref), sduiCollectionAnalyticsBuilder (copy), getSduiComponentWrapper (copy), var5 (ref), p1 (ref), sduiCollectionItemModule (copy), itemHeight (ref), var14 (ref)
				if not p2 then
					sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilItem, {
						componentType = "VariableItemWidthCarousel",
						name = var13,
						message = `Nil item in VariableItemWidthCarousel.renderItem at index {p3}`
					}, sduiContext.appPage)
					
					return reactModule.createElement(reactModule.Fragment)
				end
				local componentType = findAnalyticsField("componentType", p2.analyticsData or t) or sduiBuilder.getComponentType(p2, sduiContext)
				
				if componentType then
					local t_1 = {
						itemPosition = p3,
						itemComponentType = componentType,
						componentType = componentType
					}
					var7.current[p3] = sduiCollectionAnalyticsBuilder.buildAndValidateItemAnalyticsData(sduiContext, p2.analyticsData, nil, t_1, componentType)
					
					return reactModule.createElement(sduiCollectionItemModule, {
						index = p3,
						impressionsTag = var13,
						automaticSize = Enum.AutomaticSize.X,
						size = UDim2.new(0, 0, 0, itemHeight),
						onItemSizeChanged = var14
					}, {
						Item = reactModule.createElement(getSduiComponentWrapper(p2), {
							componentConfig = p2,
							sduiContext = sduiContext,
							parentAnalyticsContext = if p2.__isClientBinding then nil else var5,
							extraLocalProps = {
								index = p3,
								scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
								verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
								selectionOrder = if p1.selectionOrderBase then p1.selectionOrderBase + p3 else nil
							},
							debugName = `{componentType}_{p3}`,
							localAnalyticsData = t_1
						})
					})
				end
				sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilComponentType, {
					componentType = "VariableItemWidthCarousel",
					name = var13,
					message = `Nil componentType in VariableItemWidthCarousel.renderItem at index {p3}`
				}, sduiContext.appPage)
				
				return reactModule.createElement(reactModule.Fragment)
			end, {
				sduiContext, var5, var13, itemHeight, var14,
				p1.scrollViewPositionChangedSignal, p1.verticalScrollingFrameRef,
				p1.selectionOrderBase
			}),
			scrollingFrameRef = var10,
			sideMargin = var4
		}),
		ImpressionDetector = reactModule.createElement(waitForPropWrapper, {
			waitForProp = p1.startRow,
			maxUpdatesToDelay = p1.numUpdatesToDelayImpressions,
			wrappedComponent = reactModule.createElement(if fFlagLuaAppUseFrameBoundsImpressions or p1.shouldUseFrameBoundsForImpressions then frameBoundsImpressionsTracker else screenSizeImpressionsTracker, {
				parentRef = var10,
				pageContext = sduiContext.routeName or sduiContext.appPage,
				impressionsTag = var13,
				scrollViewPositionChangedSignal = var11,
				sendImpressions = reactModule.useCallback(function(p2)
					-- upvalues: itemsCount (ref), var5 (ref), sduiParseHelpers (copy), sduiContext (ref), sduiErrors (copy), var13 (ref), reportUnifiedLoggingImpressions (copy), var7 (ref), var6 (ref), p1 (ref)
					if itemsCount ~= 0 then
						reportUnifiedLoggingImpressions(sduiContext, p2, var7.current, var6.current, p1.startRow, p1.impressionEventName, p1.skipItemImpressionsLog)
						
						return
					elseif p2 and #p2 > 0 then
						sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogImpressions, {
							componentType = "VariableItemWidthCarousel",
							name = var13,
							message = `Failed to log impressions. No configs. indexes: {table.concat(p2, ",")} analytics: {if var5 then sduiParseHelpers.stringifyValue(var5.analyticsData) else nil}`
						}, sduiContext.appPage)
					end
				end, {
					itemsCount, sduiContext, var7, var6, p1.startRow, p1.impressionEventName,
					p1.skipItemImpressionsLog, var5, var13
				}),
				dataUpdatedTimestamp = p1.sduiContext.dataUpdatedTimestamp,
				respectClipAncestors = if fFlagLuaAppRespectClipAncestorImpressions then p1.respectClipAncestors else nil
			})
		}),
		ScrollDetector = reactModule.createElement(scrollDetector, {
			scrollingFrameRef = var10,
			sendScrollEvent = useScrollTelemetryCallbackModule(var10, var6, sduiContext)
		})
	})
end)