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

local function ImpressionTaggedSduiItem(p1)
	-- upvalues: reactModule (ref), impressionsTagUtility (ref), getSduiComponentWrapper (ref)
	local var1 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), impressionsTagUtility (copy), var1 (ref)
		if p1.impressionsTag then
			impressionsTagUtility.AddTag(var1, p1.impressionsTag, p1.index)
			
			return function()
				-- upvalues: impressionsTagUtility (copy), var1 (copy), p1 (copy)
				impressionsTagUtility.RemoveTag(var1, p1.impressionsTag, p1.index)
			end
		end
	end, { p1.impressionsTag, p1.index })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ref = reactModule.useCallback(function(p2)
			-- upvalues: var1 (ref), p1 (ref), impressionsTagUtility (copy)
			var1.current = p2
			
			if p2 and p1.impressionsTag then
				impressionsTagUtility.AddTag(var1, p1.impressionsTag, p1.index)
			end
		end, { p1.impressionsTag, p1.index }),
		LayoutOrder = p1.index,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		Item = reactModule.createElement(getSduiComponentWrapper(p1.item), {
			componentConfig = p1.item,
			sduiContext = p1.sduiContext,
			parentAnalyticsContext = if p1.item.__isClientBinding then nil else p1.collectionAnalyticsContext,
			extraLocalProps = {
				index = p1.index,
				layoutOrder = p1.index,
				scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
				verticalScrollingFrameRef = p1.verticalScrollingFrameRef
			},
			debugName = if p1.debugName then `{p1.debugName}.Item_{p1.index}` else `Item_{p1.index}`,
			localAnalyticsData = p1.localAnalyticsData
		})
	})
end

local function resolveImpressionsTag(p1, p2, p3, p4, p5, p6)
	-- upvalues: sduiErrors (ref)
	local current = p1.current
	
	if not current then
		p6.dependencies.logger.reportError(sduiErrors.SduiErrorType.GetImpressionsTagMissingCollectionData, { name = p4 }, p6.appPage)
		
		return nil
	end
	local collectionComponentType = current.collectionComponentType
	
	if not collectionComponentType then
		p6.dependencies.logger.reportError(sduiErrors.SduiErrorType.GetImpressionsTagMissingCollectionComponentType, { name = p4 }, p6.appPage)
		collectionComponentType = p2
	end
	local collectionId = current.collectionId
	
	if collectionId == nil or collectionId == -1 then
		p6.dependencies.logger.reportError(sduiErrors.SduiErrorType.GetImpressionsTagMissingCollectionId, { name = p4 }, p6.appPage)
		
		return nil
	end
	return `{p4}_{collectionComponentType}_{p3}_{collectionId}_{p5}`
end

return reactModule.memo(function(p1)
	-- upvalues: frozen (ref), reactModule (ref), sduiFeedContextModule (ref), fFlagSduiCarouselUseNestedImpressionsFeedContext (ref), findAnalyticsField (ref), sduiBuilder (ref), useCollectionAnalyticsContextModule (ref), resolveImpressionsTag (ref), sduiParseHelpers (ref), sduiErrors (ref), reportUnifiedLoggingImpressions (ref), sduiCollectionAnalyticsBuilder (ref), ImpressionTaggedSduiItem (ref), getSduiComponentWrapper (ref), sduiViewModule (ref), frameBoundsImpressionsTracker (ref), fFlagLuaAppRespectClipAncestorImpressions (ref)
	local sduiContext = p1.sduiContext
	local items = p1.items or frozen
	local itemsCount = #items
	local var1 = reactModule.useContext(sduiFeedContextModule)
	local scrollViewPositionChangedSignal = var1.scrollViewPositionChangedSignal or p1.scrollViewPositionChangedSignal
	local verticalScrollingFrameRef = var1.verticalScrollingFrameRef or p1.verticalScrollingFrameRef
	local var2 = reactModule.useRef(nil)
	local var3 = (if fFlagSduiCarouselUseNestedImpressionsFeedContext then var1.impressionsParentScrollingFrameRef else nil) or var2
	local componentType = findAnalyticsField("componentType", p1.analyticsContext.analyticsData or frozen) or sduiBuilder.getComponentType(p1.componentConfig, sduiContext)
	local var4, var5 = useCollectionAnalyticsContextModule(p1.analyticsContext, componentType, 1, itemsCount, sduiContext, p1.startRow, p1.componentConfig.__isClientBinding)
	local var6 = reactModule.useRef({})
	local routeName = sduiContext.routeName or sduiContext.appPage
	local var7 = resolveImpressionsTag(var5, componentType, routeName, p1.debugName, p1.index or 0, sduiContext)
	local var8 = reactModule.useMemo(function()
		-- upvalues: items (ref), sduiContext (ref), sduiErrors (copy), componentType (ref), var7 (ref), findAnalyticsField (copy), frozen (copy), sduiBuilder (copy), sduiCollectionAnalyticsBuilder (copy), reactModule (copy), ImpressionTaggedSduiItem (copy), p1 (ref), var4 (ref), scrollViewPositionChangedSignal (ref), verticalScrollingFrameRef (ref), var6 (ref)
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
						debugName = p1.debugName,
						impressionsTag = var7,
						sduiContext = sduiContext,
						collectionAnalyticsContext = var4,
						localAnalyticsData = t_2,
						scrollViewPositionChangedSignal = scrollViewPositionChangedSignal,
						verticalScrollingFrameRef = verticalScrollingFrameRef
					})
				else
					sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilComponentType, {
						componentType = componentType,
						name = var7,
						message = `Nil componentType in SduiVerticalListWithImpressions at index {i}`
					}, sduiContext.appPage)
				end
			else
				sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilItem, {
					componentType = componentType,
					name = var7,
					message = `Nil item in SduiVerticalListWithImpressions at index {i}`
				}, sduiContext.appPage)
			end
		end
		var6.current = t_1
		
		return t
	end, {
		items, sduiContext, var4, componentType, scrollViewPositionChangedSignal,
		verticalScrollingFrameRef, var7, p1.debugName
	})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Content = if p1.view then reactModule.createElement(getSduiComponentWrapper(p1.view), {
			componentConfig = p1.view,
			sduiContext = sduiContext,
			parentAnalyticsContext = if p1.view.__isClientBinding then nil else var4,
			debugName = if p1.debugName then `{p1.debugName}.View` else "View",
			extraLocalProps = {
				containerRef = var2,
				children = var8,
				layoutOrder = p1.layoutOrder
			}
		}) else reactModule.createElement(sduiViewModule, { containerRef = var2, layoutOrder = p1.layoutOrder }, var8),
		ImpressionDetector = if var7 then reactModule.createElement(frameBoundsImpressionsTracker, {
			parentRef = var3,
			pageContext = routeName,
			impressionsTag = var7,
			scrollViewPositionChangedSignal = scrollViewPositionChangedSignal,
			sendImpressions = reactModule.useCallback(function(p2)
				-- upvalues: items (ref), var4 (ref), sduiParseHelpers (copy), sduiContext (ref), sduiErrors (copy), componentType (ref), var7 (ref), reportUnifiedLoggingImpressions (copy), var6 (ref), var5 (ref), p1 (ref)
				if #items ~= 0 then
					reportUnifiedLoggingImpressions(sduiContext, p2, var6.current, var5.current, p1.startRow, p1.impressionEventName, p1.skipItemImpressionsLog, var7)
					
					return
				elseif p2 and #p2 > 0 then
					sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogImpressions, {
						componentType = componentType,
						name = var7,
						message = `Failed to log impressions. No configs. indexes: {table.concat(p2, ",")} analytics: {if var4 then sduiParseHelpers.stringifyValue(var4.analyticsData) else nil}`
					}, sduiContext.appPage)
				end
			end, {
				items, sduiContext, var6, var5, var4, componentType, var7, p1.startRow,
				p1.impressionEventName, p1.skipItemImpressionsLog
			}),
			dataUpdatedTimestamp = sduiContext.dataUpdatedTimestamp,
			respectClipAncestors = if fFlagLuaAppRespectClipAncestorImpressions then p1.respectClipAncestors else nil
		}) else nil
	})
end)