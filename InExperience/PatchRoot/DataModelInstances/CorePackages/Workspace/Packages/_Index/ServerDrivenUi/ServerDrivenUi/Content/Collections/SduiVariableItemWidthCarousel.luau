local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.AppCommonLib)
local SignalsReactModule = require(Parent.SignalsReact)
local CollectionViewsModule = require(Parent.CollectionViews)
local UseCollectionImpressionsSignalFunction = CollectionViewsModule.useCollectionImpressionsSignal
local UseCollectionLayoutParamsFunction = CollectionViewsModule.useCollectionLayoutParams
local VariableItemWidthCarousel = require(Parent.VariableItemWidthCarousel).VariableItemWidthCarousel
local WaitForPropWrapper = require(Parent.GameCollections).WaitForPropWrapper
local ImpressionsModule = require(Parent.Impressions)
local FrameBoundsImpressionsTracker = ImpressionsModule.FrameBoundsImpressionsTracker
local ScreenSizeImpressionsTracker = ImpressionsModule.ScreenSizeImpressionsTracker
local ScrollDetector = require(Parent.ScrollTelemetry).ScrollDetector
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local FindAnalyticsFieldFunction = SduiCoreSystemModule.findAnalyticsField
local GetSduiComponentWrapperFunction = SduiCoreSystemModule.getSduiComponentWrapper
local ReportUnifiedLoggingImpressionsFunction = SduiCoreSystemModule.reportUnifiedLoggingImpressions
local SduiBuilder = SduiCoreSystemModule.SduiBuilder
local SduiCollectionAnalyticsBuilder = SduiCoreSystemModule.SduiCollectionAnalyticsBuilder
local SduiComponentType = SduiCoreSystemModule.SduiComponentType
local SduiErrors = SduiCoreSystemModule.SduiErrors
local SduiParseHelpers = SduiCoreSystemModule.SduiParseHelpers
local SduiCollectionItemModule = require(ServerDrivenUi.Content.Collections.SduiCollectionItem)
local GetImpressionsTagModule = require(ServerDrivenUi.Analytics.getImpressionsTag)
local UseCollectionAnalyticsContextFunction = require(Parent.SduiSharedContent).useCollectionAnalyticsContext
local UseScrollTelemetryCallbackModule = require(ServerDrivenUi.Analytics.useScrollTelemetryCallback)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppCompositionAlways = SharedFlagsModule.FFlagLuaAppCompositionAlways
local FFlagLuaAppLayoutParamsInContext = SharedFlagsModule.FFlagLuaAppLayoutParamsInContext
local FFlagLuaAppRespectClipAncestorImpressions = SharedFlagsModule.FFlagLuaAppRespectClipAncestorImpressions
local FFlagLuaAppUseFrameBoundsImpressions = SharedFlagsModule.FFlagLuaAppUseFrameBoundsImpressions
local FFlagSduiOptionSelectorHeaderComponent = SharedFlagsModule.FFlagSduiOptionSelectorHeaderComponent
local FFlagSduiOptionSelectorAnchorTag = SharedFlagsModule.FFlagSduiOptionSelectorAnchorTag
local t = {}

return ReactModule.memo(function(p1)
	-- upvalues: FFlagLuaAppCompositionAlways (copy), t (copy), UseTokensFunction (copy), ReactModule (copy), FFlagLuaAppLayoutParamsInContext (copy), SignalsReactModule (copy), UseCollectionLayoutParamsFunction (copy), FindAnalyticsFieldFunction (copy), SduiBuilder (copy), SduiComponentType (copy), UseCollectionAnalyticsContextFunction (copy), UseCollectionImpressionsSignalFunction (copy), GetImpressionsTagModule (copy), SduiParseHelpers (copy), SduiErrors (copy), ReportUnifiedLoggingImpressionsFunction (copy), UseScrollTelemetryCallbackModule (copy), SduiCollectionAnalyticsBuilder (copy), GetSduiComponentWrapperFunction (copy), SduiCollectionItemModule (copy), FFlagSduiOptionSelectorAnchorTag (copy), VariableItemWidthCarousel (copy), FFlagSduiOptionSelectorHeaderComponent (copy), WaitForPropWrapper (copy), FFlagLuaAppUseFrameBoundsImpressions (copy), FrameBoundsImpressionsTracker (copy), ScreenSizeImpressionsTracker (copy), FFlagLuaAppRespectClipAncestorImpressions (copy), ScrollDetector (copy)
	local SduiContext = p1.sduiContext
	local FFlagLuaAppCompositionAlways1 = FFlagLuaAppCompositionAlways or (p1.appCompositionEnabled or SduiContext.appCompositionEnabled)
	local Items = p1.items or t
	local CountItems = #Items
	local UseTokensResult = UseTokensFunction()
	local ItemHeight = p1.itemHeight or UseTokensResult.Size.Size_800
	local ItemPadding = p1.itemPadding or UseTokensResult.Padding.XSmall
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local config = { sideMargin = p1.pageSideMargin }
	local UseSignalStateResult = if FFlagLuaAppCompositionAlways then nil elseif FFlagLuaAppLayoutParamsInContext then SignalsReactModule.useSignalState((ReactModule.useCallback(function(p2)
		-- upvalues: SduiContext (copy)
		return SduiContext.getPageLayoutConfig("Small")(p2)
	end, { SduiContext.getPageLayoutConfig }))) else UseCollectionLayoutParamsFunction("Small", UseStateResult, false, config)
	local SideMargin = if p1.sideMargin == nil then if FFlagLuaAppCompositionAlways1 then 0 else UseSignalStateResult.sideMargin else p1.sideMargin
	local UseCollectionAnalyticsContextResult, UseCollectionAnalyticsContextResult2 = UseCollectionAnalyticsContextFunction(p1.analyticsContext, FindAnalyticsFieldFunction("componentType", p1.analyticsContext.analyticsData or t) or (SduiBuilder.getComponentType(p1.componentConfig, SduiContext) or SduiComponentType.VariableItemWidthCarousel), CountItems, CountItems, SduiContext, p1.startRow, p1.componentConfig.__isClientBinding)
	local UseRefResult = ReactModule.useRef({})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState({})
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseCollectionImpressionsSignalResult, UseCollectionImpressionsSignalResult2 = UseCollectionImpressionsSignalFunction(p1.scrollViewPositionChangedSignal)
	local ImpressionsTagModule = GetImpressionsTagModule(p1.index, UseCollectionAnalyticsContextResult2.current, SduiContext, p1.debugName)
	local UseResult = ReactModule.useCallback(function(p2, Frame)
		-- upvalues: UseStateResult2_1 (copy)
		local X: number = Frame.AbsoluteSize.X
		
		if X > 0 then
			UseStateResult2_1(function(Tbl)
				-- upvalues: p2 (copy), X (copy)
				if Tbl[p2] == X then
					return Tbl
				else
					local Copy = table.clone(Tbl)
					Copy[p2] = X
					
					return Copy
				end
			end)
			
			return
		end
	end, {})
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Carousel = ReactModule.createElement(VariableItemWidthCarousel, {
			ref = UseStateResult2,
			LayoutOrder = p1.layoutOrder,
			Position = p1.position,
			title = p1.title or "",
			subtitle = p1.subtitle,
			headerComponent = if FFlagSduiOptionSelectorHeaderComponent then p1.headerComponent else nil,
			calculateItemWidth = ReactModule.useCallback(function(p2)
				-- upvalues: UseStateResult1 (copy)
				return UseStateResult1[p2] or 0
			end, { UseStateResult1 }),
			scrollButtonsEnabled = p1.scrollButtonsEnabled,
			scrollSpeed = p1.scrollSpeed,
			items = Items,
			itemHeight = ItemHeight,
			itemPadding = ItemPadding,
			onCanvasPositionChanged = UseCollectionImpressionsSignalResult2,
			renderItem = ReactModule.useCallback(function(ComponentConfig, Index)
				-- upvalues: SduiContext (copy), SduiErrors (upval), ImpressionsTagModule (copy), ReactModule (upval), FindAnalyticsFieldFunction (upval), t (upval), SduiBuilder (upval), UseRefResult (copy), SduiCollectionAnalyticsBuilder (upval), GetSduiComponentWrapperFunction (upval), UseCollectionAnalyticsContextResult (copy), p1 (copy), SduiCollectionItemModule (upval), ItemHeight (copy), UseResult (copy), FFlagSduiOptionSelectorAnchorTag (upval)
				if not ComponentConfig then
					SduiContext.dependencies.logger.reportError(SduiErrors.SduiErrorType.NilItem, {
						componentType = "VariableItemWidthCarousel",
						name = ImpressionsTagModule,
						message = `Nil item in VariableItemWidthCarousel.renderItem at index {Index}`
					}, SduiContext.appPage)
					
					return ReactModule.createElement(ReactModule.Fragment)
				end
				local ComponentType = FindAnalyticsFieldFunction("componentType", ComponentConfig.analyticsData or t) or SduiBuilder.getComponentType(ComponentConfig, SduiContext)
				
				if ComponentType then
					local LocalAnalyticsData = {
						itemPosition = Index,
						itemComponentType = ComponentType,
						componentType = ComponentType
					}
					UseRefResult.current[Index] = SduiCollectionAnalyticsBuilder.buildAndValidateItemAnalyticsData(SduiContext, ComponentConfig.analyticsData, nil, LocalAnalyticsData, ComponentType)
					
					return ReactModule.createElement(SduiCollectionItemModule, {
						index = Index,
						impressionsTag = ImpressionsTagModule,
						automaticSize = Enum.AutomaticSize.X,
						size = UDim2.new(0, 0, 0, ItemHeight),
						onItemSizeChanged = UseResult,
						tag = if FFlagSduiOptionSelectorAnchorTag and p1.itemTags then p1.itemTags[Index] else nil
					}, {
						Item = ReactModule.createElement(GetSduiComponentWrapperFunction(ComponentConfig), {
							componentConfig = ComponentConfig,
							sduiContext = SduiContext,
							parentAnalyticsContext = if ComponentConfig.__isClientBinding then nil else UseCollectionAnalyticsContextResult,
							extraLocalProps = {
								index = Index,
								scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
								verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
								selectionOrder = if p1.selectionOrderBase then p1.selectionOrderBase + Index else nil
							},
							debugName = `{ComponentType}_{Index}`,
							localAnalyticsData = LocalAnalyticsData
						})
					})
				else
					SduiContext.dependencies.logger.reportError(SduiErrors.SduiErrorType.NilComponentType, {
						componentType = "VariableItemWidthCarousel",
						name = ImpressionsTagModule,
						message = `Nil componentType in VariableItemWidthCarousel.renderItem at index {Index}`
					}, SduiContext.appPage)
					
					return ReactModule.createElement(ReactModule.Fragment)
				end
			end, {
				SduiContext, UseCollectionAnalyticsContextResult, ImpressionsTagModule,
				ItemHeight, UseResult, p1.scrollViewPositionChangedSignal,
				p1.verticalScrollingFrameRef, p1.selectionOrderBase,
				if FFlagSduiOptionSelectorAnchorTag then p1.itemTags else nil
			}),
			scrollingFrameRef = UseRefResult1,
			sideMargin = SideMargin
		}),
		ImpressionDetector = ReactModule.createElement(WaitForPropWrapper, {
			waitForProp = p1.startRow,
			maxUpdatesToDelay = p1.numUpdatesToDelayImpressions,
			wrappedComponent = ReactModule.createElement(if FFlagLuaAppUseFrameBoundsImpressions or p1.shouldUseFrameBoundsForImpressions then FrameBoundsImpressionsTracker else ScreenSizeImpressionsTracker, {
				parentRef = UseRefResult1,
				pageContext = SduiContext.routeName or SduiContext.appPage,
				impressionsTag = ImpressionsTagModule,
				scrollViewPositionChangedSignal = UseCollectionImpressionsSignalResult,
				sendImpressions = ReactModule.useCallback(function(List)
					-- upvalues: CountItems (copy), UseCollectionAnalyticsContextResult (copy), SduiParseHelpers (upval), SduiContext (copy), SduiErrors (upval), ImpressionsTagModule (copy), ReportUnifiedLoggingImpressionsFunction (upval), UseRefResult (copy), UseCollectionAnalyticsContextResult2 (copy), p1 (copy)
					if CountItems ~= 0 then
						ReportUnifiedLoggingImpressionsFunction(SduiContext, List, UseRefResult.current, UseCollectionAnalyticsContextResult2.current, p1.startRow, p1.impressionEventName, p1.skipItemImpressionsLog)
						
						return
					end
					if List and #List > 0 then
						SduiContext.dependencies.logger.reportError(SduiErrors.SduiErrorType.FailedToLogImpressions, {
							componentType = "VariableItemWidthCarousel",
							name = ImpressionsTagModule,
							message = `Failed to log impressions. No configs. indexes: {table.concat(List, ",")} analytics: {if UseCollectionAnalyticsContextResult then SduiParseHelpers.stringifyValue(UseCollectionAnalyticsContextResult.analyticsData) else nil}`
						}, SduiContext.appPage)
					end
				end, {
					CountItems, SduiContext, UseRefResult, UseCollectionAnalyticsContextResult2,
					p1.startRow, p1.impressionEventName, p1.skipItemImpressionsLog,
					UseCollectionAnalyticsContextResult, ImpressionsTagModule
				}),
				dataUpdatedTimestamp = p1.sduiContext.dataUpdatedTimestamp,
				respectClipAncestors = if FFlagLuaAppRespectClipAncestorImpressions then p1.respectClipAncestors else nil
			})
		}),
		ScrollDetector = ReactModule.createElement(ScrollDetector, {
			scrollingFrameRef = UseRefResult1,
			sendScrollEvent = UseScrollTelemetryCallbackModule(UseRefResult1, UseCollectionAnalyticsContextResult2, SduiContext)
		})
	})
end)