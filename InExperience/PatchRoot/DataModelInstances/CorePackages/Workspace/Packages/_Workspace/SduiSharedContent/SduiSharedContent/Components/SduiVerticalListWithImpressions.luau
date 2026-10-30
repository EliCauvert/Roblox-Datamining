local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.AppCommonLib)
local ImpressionsModule = require(Parent.Impressions)
local FrameBoundsImpressionsTracker = ImpressionsModule.FrameBoundsImpressionsTracker
local ImpressionsTagUtility = ImpressionsModule.ImpressionsTagUtility
local _ = require(Parent.UnifiedLogging)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local FindAnalyticsFieldFunction = SduiCoreSystemModule.findAnalyticsField
local GetSduiComponentWrapperFunction = SduiCoreSystemModule.getSduiComponentWrapper
local ReportUnifiedLoggingImpressionsFunction = SduiCoreSystemModule.reportUnifiedLoggingImpressions
local SduiBuilder = SduiCoreSystemModule.SduiBuilder
local SduiCollectionAnalyticsBuilder = SduiCoreSystemModule.SduiCollectionAnalyticsBuilder
local SduiErrors = SduiCoreSystemModule.SduiErrors
local SduiFeedContextModule = require(script.Parent.SduiFeedContext)
local SduiViewModule = require(script.Parent.SduiView)
local UseCollectionAnalyticsContextModule = require(script.Parent.useCollectionAnalyticsContext)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppRespectClipAncestorImpressions = SharedFlagsModule.FFlagLuaAppRespectClipAncestorImpressions
local FFlagSduiCarouselUseNestedImpressionsFeedContext = SharedFlagsModule.FFlagSduiCarouselUseNestedImpressionsFeedContext
local SduiParseHelpers = SduiCoreSystemModule.SduiParseHelpers
local Frozen = table.freeze({})

local function ImpressionTaggedSduiItem(p1)
	-- upvalues: ReactModule (copy), ImpressionsTagUtility (copy), GetSduiComponentWrapperFunction (copy)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), ImpressionsTagUtility (upval), UseRefResult (copy)
		if not p1.impressionsTag then return end
		ImpressionsTagUtility.AddTag(UseRefResult, p1.impressionsTag, p1.index)
		
		return function()
			-- upvalues: ImpressionsTagUtility (upval), UseRefResult (upval), p1 (upval)
			ImpressionsTagUtility.RemoveTag(UseRefResult, p1.impressionsTag, p1.index)
		end
	end, { p1.impressionsTag, p1.index })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ref = ReactModule.useCallback(function(Current)
			-- upvalues: UseRefResult (copy), p1 (copy), ImpressionsTagUtility (upval)
			UseRefResult.current = Current
			
			if Current and p1.impressionsTag then
				ImpressionsTagUtility.AddTag(UseRefResult, p1.impressionsTag, p1.index)
			end
		end, { p1.impressionsTag, p1.index }),
		LayoutOrder = p1.index,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		Item = ReactModule.createElement(GetSduiComponentWrapperFunction(p1.item), {
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

local function resolveImpressionsTag(p1, ComponentType, RouteName, Name, Index, SduiContext): string?
	-- upvalues: SduiErrors (copy)
	local Current = p1.current
	
	if not Current then
		SduiContext.dependencies.logger.reportError(SduiErrors.SduiErrorType.GetImpressionsTagMissingCollectionData, { name = Name }, SduiContext.appPage)
		
		return nil
	end
	local CollectionComponentType = Current.collectionComponentType
	
	if not CollectionComponentType then
		SduiContext.dependencies.logger.reportError(SduiErrors.SduiErrorType.GetImpressionsTagMissingCollectionComponentType, { name = Name }, SduiContext.appPage)
		CollectionComponentType = ComponentType
	end
	local CollectionId = Current.collectionId
	
	if CollectionId == nil or CollectionId == -1 then
		SduiContext.dependencies.logger.reportError(SduiErrors.SduiErrorType.GetImpressionsTagMissingCollectionId, { name = Name }, SduiContext.appPage)
		
		return nil
	else
		return `{Name}_{CollectionComponentType}_{RouteName}_{CollectionId}_{Index}`
	end
end

return ReactModule.memo(function(p1)
	-- upvalues: Frozen (copy), ReactModule (copy), SduiFeedContextModule (copy), FFlagSduiCarouselUseNestedImpressionsFeedContext (copy), FindAnalyticsFieldFunction (copy), SduiBuilder (copy), UseCollectionAnalyticsContextModule (copy), resolveImpressionsTag (copy), SduiParseHelpers (copy), SduiErrors (copy), ReportUnifiedLoggingImpressionsFunction (copy), SduiCollectionAnalyticsBuilder (copy), ImpressionTaggedSduiItem (copy), GetSduiComponentWrapperFunction (copy), SduiViewModule (copy), FrameBoundsImpressionsTracker (copy), FFlagLuaAppRespectClipAncestorImpressions (copy)
	local SduiContext = p1.sduiContext
	local Items = p1.items or Frozen
	local CountItems = #Items
	local UseContextResult = ReactModule.useContext(SduiFeedContextModule)
	local ScrollViewPositionChangedSignal = UseContextResult.scrollViewPositionChangedSignal or p1.scrollViewPositionChangedSignal
	local VerticalScrollingFrameRef = UseContextResult.verticalScrollingFrameRef or p1.verticalScrollingFrameRef
	local UseRefResult = ReactModule.useRef(nil)
	local ImpressionsParentScrollingFrameRef = (if FFlagSduiCarouselUseNestedImpressionsFeedContext then UseContextResult.impressionsParentScrollingFrameRef else nil) or UseRefResult
	local ComponentType = FindAnalyticsFieldFunction("componentType", p1.analyticsContext.analyticsData or Frozen) or SduiBuilder.getComponentType(p1.componentConfig, SduiContext)
	local UseCollectionAnalyticsContextModuleResult, UseCollectionAnalyticsContextModuleResult2 = UseCollectionAnalyticsContextModule(p1.analyticsContext, ComponentType, 1, CountItems, SduiContext, p1.startRow, p1.componentConfig.__isClientBinding)
	local UseRefResult1 = ReactModule.useRef({})
	local RouteName = SduiContext.routeName or SduiContext.appPage
	local ResolveImpressionsTagResult = resolveImpressionsTag(UseCollectionAnalyticsContextModuleResult2, ComponentType, RouteName, p1.debugName, p1.index or 0, SduiContext)
	local UseResult = ReactModule.useCallback(function(List)
		-- upvalues: Items (copy), UseCollectionAnalyticsContextModuleResult (copy), SduiParseHelpers (upval), SduiContext (copy), SduiErrors (upval), ComponentType (copy), ResolveImpressionsTagResult (copy), ReportUnifiedLoggingImpressionsFunction (upval), UseRefResult1 (copy), UseCollectionAnalyticsContextModuleResult2 (copy), p1 (copy)
		if #Items ~= 0 then
			ReportUnifiedLoggingImpressionsFunction(SduiContext, List, UseRefResult1.current, UseCollectionAnalyticsContextModuleResult2.current, p1.startRow, p1.impressionEventName, p1.skipItemImpressionsLog, ResolveImpressionsTagResult)
			
			return
		end
		if List and #List > 0 then
			SduiContext.dependencies.logger.reportError(SduiErrors.SduiErrorType.FailedToLogImpressions, {
				componentType = ComponentType,
				name = ResolveImpressionsTagResult,
				message = `Failed to log impressions. No configs. indexes: {table.concat(List, ",")} analytics: {if UseCollectionAnalyticsContextModuleResult then SduiParseHelpers.stringifyValue(UseCollectionAnalyticsContextModuleResult.analyticsData) else nil}`
			}, SduiContext.appPage)
		end
	end, {
		Items, SduiContext, UseRefResult1, UseCollectionAnalyticsContextModuleResult2,
		UseCollectionAnalyticsContextModuleResult, ComponentType,
		ResolveImpressionsTagResult, p1.startRow, p1.impressionEventName,
		p1.skipItemImpressionsLog
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Items (copy), SduiContext (copy), SduiErrors (upval), ComponentType (copy), ResolveImpressionsTagResult (copy), FindAnalyticsFieldFunction (upval), Frozen (upval), SduiBuilder (upval), SduiCollectionAnalyticsBuilder (upval), ReactModule (upval), ImpressionTaggedSduiItem (upval), p1 (copy), UseCollectionAnalyticsContextModuleResult (copy), ScrollViewPositionChangedSignal (copy), VerticalScrollingFrameRef (copy), UseRefResult1 (copy)
		local Elements = {}
		local Current = {}
		
		for Index, item in Items do
			if not item then
				SduiContext.dependencies.logger.reportError(SduiErrors.SduiErrorType.NilItem, {
					componentType = ComponentType,
					name = ResolveImpressionsTagResult,
					message = `Nil item in SduiVerticalListWithImpressions at index {Index}`
				}, SduiContext.appPage)
				continue
			end
			local ComponentType1 = FindAnalyticsFieldFunction("componentType", item.analyticsData or Frozen) or SduiBuilder.getComponentType(item, SduiContext)
			
			if ComponentType1 then
				local LocalAnalyticsData = {
					itemPosition = Index,
					itemComponentType = ComponentType1,
					componentType = ComponentType1
				}
				Current[Index] = SduiCollectionAnalyticsBuilder.buildAndValidateItemAnalyticsData(SduiContext, item.analyticsData, nil, LocalAnalyticsData, ComponentType1)
				Elements[`Item_{Index}`] = ReactModule.createElement(ImpressionTaggedSduiItem, {
					item = item,
					index = Index,
					debugName = p1.debugName,
					impressionsTag = ResolveImpressionsTagResult,
					sduiContext = SduiContext,
					collectionAnalyticsContext = UseCollectionAnalyticsContextModuleResult,
					localAnalyticsData = LocalAnalyticsData,
					scrollViewPositionChangedSignal = ScrollViewPositionChangedSignal,
					verticalScrollingFrameRef = VerticalScrollingFrameRef
				})
			else
				SduiContext.dependencies.logger.reportError(SduiErrors.SduiErrorType.NilComponentType, {
					componentType = ComponentType,
					name = ResolveImpressionsTagResult,
					message = `Nil componentType in SduiVerticalListWithImpressions at index {Index}`
				}, SduiContext.appPage)
			end
		end
		UseRefResult1.current = Current
		
		return Elements
	end, {
		Items, SduiContext, UseCollectionAnalyticsContextModuleResult, ComponentType,
		ScrollViewPositionChangedSignal, VerticalScrollingFrameRef,
		ResolveImpressionsTagResult, p1.debugName
	})
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Content = if p1.view then ReactModule.createElement(GetSduiComponentWrapperFunction(p1.view), {
			componentConfig = p1.view,
			sduiContext = SduiContext,
			parentAnalyticsContext = if p1.view.__isClientBinding then nil else UseCollectionAnalyticsContextModuleResult,
			debugName = if p1.debugName then `{p1.debugName}.View` else "View",
			extraLocalProps = {
				containerRef = UseRefResult,
				children = UseMemoResult,
				layoutOrder = p1.layoutOrder
			}
		}) else ReactModule.createElement(SduiViewModule, {
			containerRef = UseRefResult,
			layoutOrder = p1.layoutOrder
		}, UseMemoResult),
		ImpressionDetector = if ResolveImpressionsTagResult then ReactModule.createElement(FrameBoundsImpressionsTracker, {
			parentRef = ImpressionsParentScrollingFrameRef,
			pageContext = RouteName,
			impressionsTag = ResolveImpressionsTagResult,
			scrollViewPositionChangedSignal = ScrollViewPositionChangedSignal,
			sendImpressions = UseResult,
			dataUpdatedTimestamp = SduiContext.dataUpdatedTimestamp,
			respectClipAncestors = if FFlagLuaAppRespectClipAncestorImpressions then p1.respectClipAncestors else nil
		}) else nil
	})
end)