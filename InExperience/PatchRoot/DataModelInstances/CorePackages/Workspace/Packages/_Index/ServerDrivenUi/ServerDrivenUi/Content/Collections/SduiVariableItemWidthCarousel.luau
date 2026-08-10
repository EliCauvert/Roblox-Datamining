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

return reactModule.memo(function(p0) --[[ line: 97 | named "SduiVariableItemWidthCarousel" ]]
	-- upvalues: fFlagLuaAppCompositionAlways (ref), t (ref), useTokens (ref), reactModule (ref), fFlagLuaAppLayoutParamsInContext (ref), signalsReactModule (ref), useCollectionLayoutParams (ref), findAnalyticsField (ref), sduiBuilder (ref), sduiComponentType (ref), useCollectionAnalyticsContext (ref), useCollectionImpressionsSignal (ref), getImpressionsTagModule (ref), sduiParseHelpers (ref), sduiErrors (ref), reportUnifiedLoggingImpressions (ref), useScrollTelemetryCallbackModule (ref), sduiCollectionAnalyticsBuilder (ref), getSduiComponentWrapper (ref), sduiCollectionItemModule (ref), variableItemWidthCarousel (ref), waitForPropWrapper (ref), fFlagLuaAppUseFrameBoundsImpressions (ref), frameBoundsImpressionsTracker (ref), screenSizeImpressionsTracker (ref), fFlagLuaAppRespectClipAncestorImpressions (ref), scrollDetector (ref)
	local sduiContext = p0.sduiContext
	local fFlagLuaAppCompositionAlways_1 = fFlagLuaAppCompositionAlways or (p0.appCompositionEnabled or sduiContext.appCompositionEnabled)
	local items = p0.items or t
	local itemsCount = #items
	local var14 = useTokens()
	local itemHeight = p0.itemHeight or var14.Size.Size_800
	local itemPadding = p0.itemPadding or var14.Padding.XSmall
	local var17, var18 = reactModule.useState(nil)
	local var19 = if p0.sideMargin ~= nil then if fFlagLuaAppCompositionAlways_1 then 0 else (if not fFlagLuaAppCompositionAlways then if fFlagLuaAppLayoutParamsInContext then signalsReactModule.useSignalState(reactModule.useCallback(function(p1) --[[ line: 123 ]]
		-- upvalues: sduiContext (ref)
		return sduiContext.getPageLayoutConfig("Small")(p1)
	end, { sduiContext.getPageLayoutConfig })) else useCollectionLayoutParams("Small", var17, false, { sideMargin = p0.pageSideMargin }) else nil).sideMargin else p0.sideMargin
	local var20, var21 = useCollectionAnalyticsContext(p0.analyticsContext, findAnalyticsField("componentType", p0.analyticsContext.analyticsData or t) or (sduiBuilder.getComponentType(p0.componentConfig, sduiContext) or sduiComponentType.VariableItemWidthCarousel), itemsCount, itemsCount, sduiContext, p0.startRow, p0.componentConfig.__isClientBinding)
	local var22 = reactModule.useRef({})
	local var23, var24 = reactModule.useState({})
	local var25 = reactModule.useRef(nil)
	local var26, var27 = useCollectionImpressionsSignal(p0.scrollViewPositionChangedSignal)
	local var28 = getImpressionsTagModule(p0.index, var21.current, sduiContext, p0.debugName)
	local var29 = reactModule.useCallback(function(p2, p3) --[[ line: 163 ]]
		-- upvalues: var24 (ref)
		local x = p3.AbsoluteSize.X
		
		if x <= 0 then
			return
		end
		var24(function(p4) --[[ line: 170 ]]
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
			ref = var18,
			LayoutOrder = p0.layoutOrder,
			Position = p0.position,
			title = p0.title or "",
			subtitle = p0.subtitle,
			calculateItemWidth = reactModule.useCallback(function(p5) --[[ line: 181 ]]
				-- upvalues: var23 (ref)
				return var23[p5] or 0
			end, { var23 }),
			scrollButtonsEnabled = p0.scrollButtonsEnabled,
			scrollSpeed = p0.scrollSpeed,
			items = items,
			itemHeight = itemHeight,
			itemPadding = itemPadding,
			onCanvasPositionChanged = var27,
			renderItem = reactModule.useCallback(function(p6, p7) --[[ line: 227 ]]
				-- upvalues: sduiContext (ref), sduiErrors (copy), var28 (ref), reactModule (copy), findAnalyticsField (copy), t (copy), sduiBuilder (copy), var22 (ref), sduiCollectionAnalyticsBuilder (copy), getSduiComponentWrapper (copy), var20 (ref), p0 (ref), sduiCollectionItemModule (copy), itemHeight (ref), var29 (ref)
				if not p6 then
					sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilItem, {
						componentType = "VariableItemWidthCarousel",
						name = var28,
						message = `Nil item in VariableItemWidthCarousel.renderItem at index {p7}`
					}, sduiContext.appPage)
					
					return reactModule.createElement(reactModule.Fragment)
				end
				local componentType = findAnalyticsField("componentType", p6.analyticsData or t) or sduiBuilder.getComponentType(p6, sduiContext)
				
				if componentType then
					local t_1 = {
						itemPosition = p7,
						itemComponentType = componentType,
						componentType = componentType
					}
					var22.current[p7] = sduiCollectionAnalyticsBuilder.buildAndValidateItemAnalyticsData(sduiContext, p6.analyticsData, nil, t_1, componentType)
					
					return reactModule.createElement(sduiCollectionItemModule, {
						index = p7,
						impressionsTag = var28,
						automaticSize = Enum.AutomaticSize.X,
						size = UDim2.new(0, 0, 0, itemHeight),
						onItemSizeChanged = var29
					}, {
						Item = reactModule.createElement(getSduiComponentWrapper(p6), {
							componentConfig = p6,
							sduiContext = sduiContext,
							parentAnalyticsContext = if p6.__isClientBinding then nil else var20,
							extraLocalProps = {
								index = p7,
								scrollViewPositionChangedSignal = p0.scrollViewPositionChangedSignal,
								verticalScrollingFrameRef = p0.verticalScrollingFrameRef,
								selectionOrder = if p0.selectionOrderBase then p0.selectionOrderBase + p7 else nil
							},
							debugName = `{componentType}_{p7}`,
							localAnalyticsData = t_1
						})
					})
				end
				sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilComponentType, {
					componentType = "VariableItemWidthCarousel",
					name = var28,
					message = `Nil componentType in VariableItemWidthCarousel.renderItem at index {p7}`
				}, sduiContext.appPage)
				
				return reactModule.createElement(reactModule.Fragment)
			end, {
				sduiContext, var20, var28, itemHeight, var29,
				p0.scrollViewPositionChangedSignal, p0.verticalScrollingFrameRef,
				p0.selectionOrderBase
			}),
			scrollingFrameRef = var25,
			sideMargin = var19
		}),
		ImpressionDetector = reactModule.createElement(waitForPropWrapper, {
			waitForProp = p0.startRow,
			maxUpdatesToDelay = p0.numUpdatesToDelayImpressions,
			wrappedComponent = reactModule.createElement(if fFlagLuaAppUseFrameBoundsImpressions or p0.shouldUseFrameBoundsForImpressions then frameBoundsImpressionsTracker else screenSizeImpressionsTracker, {
				parentRef = var25,
				pageContext = sduiContext.routeName or sduiContext.appPage,
				impressionsTag = var28,
				scrollViewPositionChangedSignal = var26,
				sendImpressions = reactModule.useCallback(function(p8) --[[ line: 186 ]]
					-- upvalues: itemsCount (ref), var20 (ref), sduiParseHelpers (copy), sduiContext (ref), sduiErrors (copy), var28 (ref), reportUnifiedLoggingImpressions (copy), var22 (ref), var21 (ref), p0 (ref)
					if itemsCount ~= 0 then
						reportUnifiedLoggingImpressions(sduiContext, p8, var22.current, var21.current, p0.startRow, p0.impressionEventName, p0.skipItemImpressionsLog)
						
						return
					elseif p8 and #p8 > 0 then
						sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogImpressions, {
							componentType = "VariableItemWidthCarousel",
							name = var28,
							message = `Failed to log impressions. No configs. indexes: {table.concat(p8, ",")} analytics: {if var20 then sduiParseHelpers.stringifyValue(var20.analyticsData) else nil}`
						}, sduiContext.appPage)
					end
				end, {
					itemsCount, sduiContext, var22, var21, p0.startRow, p0.impressionEventName,
					p0.skipItemImpressionsLog, var20, var28
				}),
				dataUpdatedTimestamp = p0.sduiContext.dataUpdatedTimestamp,
				respectClipAncestors = if fFlagLuaAppRespectClipAncestorImpressions then p0.respectClipAncestors else nil
			})
		}),
		ScrollDetector = reactModule.createElement(scrollDetector, {
			scrollingFrameRef = var25,
			sendScrollEvent = useScrollTelemetryCallbackModule(var25, var21, sduiContext)
		})
	})
end)