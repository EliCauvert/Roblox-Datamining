local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local _ = require(parent.AppCommonLib)
local impressionsModule = require(parent.Impressions)
local frameBoundsImpressionsTracker = impressionsModule.FrameBoundsImpressionsTracker
local impressionsTagUtility = impressionsModule.ImpressionsTagUtility
local _ = require(parent.UnifiedLogging)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local findAnalyticsField = sduiCoreSystemModule.findAnalyticsField
local getSduiComponentWrapper = sduiCoreSystemModule.getSduiComponentWrapper
local reportUnifiedLoggingImpressions = sduiCoreSystemModule.reportUnifiedLoggingImpressions
local sduiBuilder = sduiCoreSystemModule.SduiBuilder
local sduiCollectionAnalyticsBuilder = sduiCoreSystemModule.SduiCollectionAnalyticsBuilder
local sduiErrors = sduiCoreSystemModule.SduiErrors
local sduiFeedContextModule = require(script.Parent.SduiFeedContext)
local sduiViewModule = require(script.Parent.SduiView)
local useCollectionAnalyticsContextModule = require(script.Parent.useCollectionAnalyticsContext)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppRespectClipAncestorImpressions = sharedFlagsModule.FFlagLuaAppRespectClipAncestorImpressions
local fFlagSduiCarouselUseNestedImpressionsFeedContext = sharedFlagsModule.FFlagSduiCarouselUseNestedImpressionsFeedContext
local sduiParseHelpers = sduiCoreSystemModule.SduiParseHelpers
local frozen = table.freeze({})

local function ImpressionTaggedSduiItem(p0)
	-- upvalues: reactModule (ref), impressionsTagUtility (ref), getSduiComponentWrapper (ref)
	local var10 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), impressionsTagUtility (copy), var10 (ref)
		if p0.impressionsTag then
			impressionsTagUtility.AddTag(var10, p0.impressionsTag, p0.index)
			
			return function()
				-- upvalues: impressionsTagUtility (copy), var10 (copy), p0 (copy)
				impressionsTagUtility.RemoveTag(var10, p0.impressionsTag, p0.index)
			end
		end
	end, { p0.impressionsTag, p0.index })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ref = reactModule.useCallback(function(p1)
			-- upvalues: var10 (ref), p0 (ref), impressionsTagUtility (copy)
			var10.current = p1
			
			if p1 and p0.impressionsTag then
				impressionsTagUtility.AddTag(var10, p0.impressionsTag, p0.index)
			end
		end, { p0.impressionsTag, p0.index }),
		LayoutOrder = p0.index,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		Item = reactModule.createElement(getSduiComponentWrapper(p0.item), {
			componentConfig = p0.item,
			sduiContext = p0.sduiContext,
			parentAnalyticsContext = if p0.item.__isClientBinding then nil else p0.collectionAnalyticsContext,
			extraLocalProps = {
				index = p0.index,
				layoutOrder = p0.index,
				scrollViewPositionChangedSignal = p0.scrollViewPositionChangedSignal,
				verticalScrollingFrameRef = p0.verticalScrollingFrameRef
			},
			debugName = if p0.debugName then `{p0.debugName}.Item_{p0.index}` else `Item_{p0.index}`,
			localAnalyticsData = p0.localAnalyticsData
		})
	})
end

local function resolveImpressionsTag(p2, p3, p4, p5, p6, p7)
	-- upvalues: sduiErrors (ref)
	local current = p2.current
	
	if not current then
		p7.dependencies.logger.reportError(sduiErrors.SduiErrorType.GetImpressionsTagMissingCollectionData, { name = p5 }, p7.appPage)
		
		return nil
	end
	local collectionComponentType = current.collectionComponentType
	
	if not collectionComponentType then
		p7.dependencies.logger.reportError(sduiErrors.SduiErrorType.GetImpressionsTagMissingCollectionComponentType, { name = p5 }, p7.appPage)
		collectionComponentType = p3
	end
	local collectionId = current.collectionId
	
	if collectionId == nil or collectionId == -1 then
		p7.dependencies.logger.reportError(sduiErrors.SduiErrorType.GetImpressionsTagMissingCollectionId, { name = p5 }, p7.appPage)
		
		return nil
	end
	return `{p5}_{collectionComponentType}_{p4}_{collectionId}_{p6}`
end

return reactModule.memo(function(p8)
	-- upvalues: frozen (ref), reactModule (ref), sduiFeedContextModule (ref), fFlagSduiCarouselUseNestedImpressionsFeedContext (ref), findAnalyticsField (ref), sduiBuilder (ref), useCollectionAnalyticsContextModule (ref), resolveImpressionsTag (ref), sduiParseHelpers (ref), sduiErrors (ref), reportUnifiedLoggingImpressions (ref), sduiCollectionAnalyticsBuilder (ref), ImpressionTaggedSduiItem (ref), getSduiComponentWrapper (ref), sduiViewModule (ref), frameBoundsImpressionsTracker (ref), fFlagLuaAppRespectClipAncestorImpressions (ref)
	local sduiContext = p8.sduiContext
	local items = p8.items or frozen
	local itemsCount = #items
	local var13 = reactModule.useContext(sduiFeedContextModule)
	local scrollViewPositionChangedSignal = var13.scrollViewPositionChangedSignal or p8.scrollViewPositionChangedSignal
	local verticalScrollingFrameRef = var13.verticalScrollingFrameRef or p8.verticalScrollingFrameRef
	local var16 = reactModule.useRef(nil)
	local var17 = (if fFlagSduiCarouselUseNestedImpressionsFeedContext then var13.impressionsParentScrollingFrameRef else nil) or var16
	local componentType = findAnalyticsField("componentType", p8.analyticsContext.analyticsData or frozen) or sduiBuilder.getComponentType(p8.componentConfig, sduiContext)
	local var19, var20 = useCollectionAnalyticsContextModule(p8.analyticsContext, componentType, 1, itemsCount, sduiContext, p8.startRow, p8.componentConfig.__isClientBinding)
	local var21 = reactModule.useRef({})
	local routeName = sduiContext.routeName or sduiContext.appPage
	local var23 = resolveImpressionsTag(var20, componentType, routeName, p8.debugName, p8.index or 0, sduiContext)
	local var24 = reactModule.useMemo(function()
		-- upvalues: items (ref), sduiContext (ref), sduiErrors (copy), componentType (ref), var23 (ref), findAnalyticsField (copy), frozen (copy), sduiBuilder (copy), sduiCollectionAnalyticsBuilder (copy), reactModule (copy), ImpressionTaggedSduiItem (copy), p8 (ref), var19 (ref), scrollViewPositionChangedSignal (ref), verticalScrollingFrameRef (ref), var21 (ref)
		local t = {}
		local t_1 = {}
		
		for i, v in items do
			if v then
				local componentType_1 = findAnalyticsField("componentType", v.analyticsData or frozen) or sduiBuilder.getComponentType(v, sduiContext)
				
				if componentType_1 then
					local t_2 = {
						itemPosition = i,
						itemComponentType = componentType_1,
						componentType = componentType_1
					}
					t_1[i] = sduiCollectionAnalyticsBuilder.buildAndValidateItemAnalyticsData(sduiContext, v.analyticsData, nil, t_2, componentType_1)
					t[`Item_{i}`] = reactModule.createElement(ImpressionTaggedSduiItem, {
						item = v,
						index = i,
						debugName = p8.debugName,
						impressionsTag = var23,
						sduiContext = sduiContext,
						collectionAnalyticsContext = var19,
						localAnalyticsData = t_2,
						scrollViewPositionChangedSignal = scrollViewPositionChangedSignal,
						verticalScrollingFrameRef = verticalScrollingFrameRef
					})
				else
					sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilComponentType, {
						componentType = componentType,
						name = var23,
						message = `Nil componentType in SduiVerticalListWithImpressions at index {i}`
					}, sduiContext.appPage)
				end
			else
				sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilItem, {
					componentType = componentType,
					name = var23,
					message = `Nil item in SduiVerticalListWithImpressions at index {i}`
				}, sduiContext.appPage)
			end
		end
		var21.current = t_1
		
		return t
	end, {
		items, sduiContext, var19, componentType, scrollViewPositionChangedSignal,
		verticalScrollingFrameRef, var23, p8.debugName
	})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Content = if p8.view then reactModule.createElement(getSduiComponentWrapper(p8.view), {
			componentConfig = p8.view,
			sduiContext = sduiContext,
			parentAnalyticsContext = if p8.view.__isClientBinding then nil else var19,
			debugName = if p8.debugName then `{p8.debugName}.View` else "View",
			extraLocalProps = {
				containerRef = var16,
				children = var24,
				layoutOrder = p8.layoutOrder
			}
		}) else reactModule.createElement(sduiViewModule, { containerRef = var16, layoutOrder = p8.layoutOrder }, var24),
		ImpressionDetector = if var23 then reactModule.createElement(frameBoundsImpressionsTracker, {
			parentRef = var17,
			pageContext = routeName,
			impressionsTag = var23,
			scrollViewPositionChangedSignal = scrollViewPositionChangedSignal,
			sendImpressions = reactModule.useCallback(function(p9)
				-- upvalues: items (ref), var19 (ref), sduiParseHelpers (copy), sduiContext (ref), sduiErrors (copy), componentType (ref), var23 (ref), reportUnifiedLoggingImpressions (copy), var21 (ref), var20 (ref), p8 (ref)
				if #items ~= 0 then
					reportUnifiedLoggingImpressions(sduiContext, p9, var21.current, var20.current, p8.startRow, p8.impressionEventName, p8.skipItemImpressionsLog, var23)
					
					return
				elseif p9 and #p9 > 0 then
					sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogImpressions, {
						componentType = componentType,
						name = var23,
						message = `Failed to log impressions. No configs. indexes: {table.concat(p9, ",")} analytics: {if var19 then sduiParseHelpers.stringifyValue(var19.analyticsData) else nil}`
					}, sduiContext.appPage)
				end
			end, {
				items, sduiContext, var21, var20, var19, componentType, var23, p8.startRow,
				p8.impressionEventName, p8.skipItemImpressionsLog
			}),
			dataUpdatedTimestamp = sduiContext.dataUpdatedTimestamp,
			respectClipAncestors = if fFlagLuaAppRespectClipAncestorImpressions then p8.respectClipAncestors else nil
		}) else nil
	})
end)