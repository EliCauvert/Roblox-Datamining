local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.AppCommonLib)
local CryoModule = require(Parent.Cryo)
local SignalsReactModule = require(Parent.SignalsReact)
local CollectionViewsModule = require(Parent.CollectionViews)
local CollectionCarousel = CollectionViewsModule.CollectionCarousel
local CollectionItemSize = CollectionViewsModule.CollectionViewTypes.CollectionItemSize
local UseCollectionImpressionsSignalFunction = CollectionViewsModule.useCollectionImpressionsSignal
local UseCollectionLayoutParamsFunction = CollectionViewsModule.useCollectionLayoutParams
local WaitForPropWrapper = require(Parent.GameCollections).WaitForPropWrapper
local ImpressionsModule = require(Parent.Impressions)
local FrameBoundsImpressionsTracker = ImpressionsModule.FrameBoundsImpressionsTracker
local ScreenSizeImpressionsTracker = ImpressionsModule.ScreenSizeImpressionsTracker
local HoverTileCoordinator = require(Parent.GameTile).HoverTileCoordinator
local ScrollDetector = require(Parent.ScrollTelemetry).ScrollDetector
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local FindAnalyticsFieldFunction = SduiCoreSystemModule.findAnalyticsField
local GetImpressionsTagModule = require(ServerDrivenUi.Analytics.getImpressionsTag)
local SendLegacyGameImpressionsForSduiModule = require(ServerDrivenUi.Analytics.sendLegacyGameImpressionsForSdui)
local ReportUnifiedLoggingImpressionsFunction = SduiCoreSystemModule.reportUnifiedLoggingImpressions
local SduiBuilder = SduiCoreSystemModule.SduiBuilder
local SduiCollectionAnalyticsBuilder = SduiCoreSystemModule.SduiCollectionAnalyticsBuilder
local SduiErrors = SduiCoreSystemModule.SduiErrors
local SduiCollectionItemModule = require(ServerDrivenUi.Content.Collections.SduiCollectionItem)
local SduiParseHelpers = SduiCoreSystemModule.SduiParseHelpers
local GetSduiComponentWrapperFunction = SduiCoreSystemModule.getSduiComponentWrapper
local UseCollectionAnalyticsContextFunction = require(Parent.SduiSharedContent).useCollectionAnalyticsContext
local UseScrollTelemetryCallbackModule = require(ServerDrivenUi.Analytics.useScrollTelemetryCallback)
local UseUniformItemHeightModule = require(ServerDrivenUi.Content.Collections.useUniformItemHeight)
local ItemHeightModeModule = require(ServerDrivenUi.Content.Collections.ItemHeightMode)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppLayoutParamsInContext = SharedFlagsModule.FFlagLuaAppLayoutParamsInContext
local FFlagLuaAppCompositionAlways = SharedFlagsModule.FFlagLuaAppCompositionAlways
local FFlagLuaAppUseFrameBoundsImpressions = SharedFlagsModule.FFlagLuaAppUseFrameBoundsImpressions
local FFlagSduiCollectionCarouselOverrides = SharedFlagsModule.FFlagSduiCollectionCarouselOverrides
local FFlagSduiEdpStoreImpressionsLogging = SharedFlagsModule.FFlagSduiEdpStoreImpressionsLogging
local FFlagSduiGenreSelector = SharedFlagsModule.FFlagSduiGenreSelector
local t = {}

return ReactModule.memo(function(p1)
	-- upvalues: FFlagLuaAppCompositionAlways (copy), ReactModule (copy), CryoModule (copy), FFlagLuaAppLayoutParamsInContext (copy), SignalsReactModule (copy), UseCollectionLayoutParamsFunction (copy), CollectionItemSize (copy), FindAnalyticsFieldFunction (copy), t (copy), SduiBuilder (copy), UseCollectionAnalyticsContextFunction (copy), UseCollectionImpressionsSignalFunction (copy), GetImpressionsTagModule (copy), SduiParseHelpers (copy), SduiErrors (copy), ReportUnifiedLoggingImpressionsFunction (copy), FFlagSduiEdpStoreImpressionsLogging (copy), SendLegacyGameImpressionsForSduiModule (copy), UseTokensFunction (copy), ItemHeightModeModule (copy), UseUniformItemHeightModule (copy), SduiCollectionAnalyticsBuilder (copy), GetSduiComponentWrapperFunction (copy), SduiCollectionItemModule (copy), HoverTileCoordinator (copy), UseScrollTelemetryCallbackModule (copy), FFlagSduiGenreSelector (copy), CollectionCarousel (copy), FFlagSduiCollectionCarouselOverrides (copy), WaitForPropWrapper (copy), FFlagLuaAppUseFrameBoundsImpressions (copy), FrameBoundsImpressionsTracker (copy), ScreenSizeImpressionsTracker (copy), ScrollDetector (copy)
	local FFlagLuaAppCompositionAlways1 = FFlagLuaAppCompositionAlways or (p1.appCompositionEnabled or p1.sduiContext.appCompositionEnabled)
	local LayoutOrder = p1.layoutOrder
	local SduiContext = p1.sduiContext
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy)
		if not p1.items then
			return {}
		end
		for _, item in p1.items do
			if p1.itemTemplateKey and item.templateKey == nil then
				item.templateKey = p1.itemTemplateKey
			end
		end
		if not p1.maxItemsToShow or p1.maxItemsToShow >= #p1.items then
			return p1.items
		end
		local List = {}
		
		for i, item1 in p1.items do
			if i ~= p1.maxItemsToShow + 1 then
				table.insert(List, item1)
				continue
			elseif not p1.overflowItem then
				break
			else
				table.insert(List, p1.overflowItem)
				
				return List
			end
		end
		return List
	end, {
		p1.items,
		p1.itemTemplateKey,
		p1.maxItemsToShow,
		p1.overflowItem
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(nil)
	local JoinResult = if p1.layoutOverrides then CryoModule.Dictionary.join(p1.layoutOverrides, { sideMargin = p1.pageSideMargin }) else { sideMargin = p1.pageSideMargin }
	local UseSignalStateResult = if FFlagLuaAppCompositionAlways then nil elseif FFlagLuaAppLayoutParamsInContext then SignalsReactModule.useSignalState((ReactModule.useCallback(function(p2)
		-- upvalues: SduiContext (copy), p1 (copy)
		return SduiContext.getPageLayoutConfig(p1.collectionItemSize)(p2)
	end, { p1.collectionItemSize, SduiContext.getPageLayoutConfig }))) else UseCollectionLayoutParamsFunction(p1.collectionItemSize or CollectionItemSize.Small, UseStateResult, false, JoinResult)
	local CountUseMemoResult: number = if UseMemoResult then #UseMemoResult else 0
	local UseCollectionAnalyticsContextResult, UseCollectionAnalyticsContextResult2 = UseCollectionAnalyticsContextFunction(p1.analyticsContext, FindAnalyticsFieldFunction("componentType", p1.analyticsContext.analyticsData or t) or SduiBuilder.getComponentType(p1.componentConfig, SduiContext), CountUseMemoResult, CountUseMemoResult, SduiContext, p1.startRow, p1.componentConfig.__isClientBinding)
	local UseRefResult1 = ReactModule.useRef({})
	local UseCollectionImpressionsSignalResult, UseCollectionImpressionsSignalResult2 = UseCollectionImpressionsSignalFunction(p1.scrollViewPositionChangedSignal)
	local ImpressionsTagModule = GetImpressionsTagModule(p1.index, UseCollectionAnalyticsContextResult2.current, SduiContext, p1.debugName)
	local UseResult = ReactModule.useCallback(function(List)
		-- upvalues: UseMemoResult (copy), UseCollectionAnalyticsContextResult (copy), SduiParseHelpers (upval), SduiContext (copy), SduiErrors (upval), ImpressionsTagModule (copy), p1 (copy), UseCollectionAnalyticsContextResult2 (copy), ReportUnifiedLoggingImpressionsFunction (upval), UseRefResult1 (copy), FFlagSduiEdpStoreImpressionsLogging (upval), SendLegacyGameImpressionsForSduiModule (upval)
		if UseMemoResult ~= nil and #UseMemoResult ~= 0 then
			assert(UseMemoResult, "itemConfigs must exist")
			
			if p1.impressionEventName or not UseCollectionAnalyticsContextResult2.current or UseCollectionAnalyticsContextResult2.current.contentType ~= "Game" then
				ReportUnifiedLoggingImpressionsFunction(SduiContext, List, UseRefResult1.current, UseCollectionAnalyticsContextResult2.current, p1.startRow, p1.impressionEventName, p1.skipItemImpressionsLog, if FFlagSduiEdpStoreImpressionsLogging then ImpressionsTagModule else nil)
				
				return
			end
			if UseCollectionAnalyticsContextResult2.current and UseCollectionAnalyticsContextResult2.current.contentType == "Game" then
				SendLegacyGameImpressionsForSduiModule(List, UseRefResult1.current, UseMemoResult, UseCollectionAnalyticsContextResult, UseCollectionAnalyticsContextResult2.current, p1.startRow, SduiContext, nil, nil, ImpressionsTagModule)
			end
			ReportUnifiedLoggingImpressionsFunction(SduiContext, List, UseRefResult1.current, UseCollectionAnalyticsContextResult2.current, p1.startRow)
			
			return
		elseif List and #List > 0 then
			SduiContext.dependencies.logger.reportError(SduiErrors.SduiErrorType.FailedToLogImpressions, {
				componentType = "CollectionCarousel",
				name = ImpressionsTagModule,
				message = `Failed to log impressions. No configs. indexes: {table.concat(List, ",")} analytics: {if UseCollectionAnalyticsContextResult then SduiParseHelpers.stringifyValue(UseCollectionAnalyticsContextResult.analyticsData) else nil}`
			}, SduiContext.appPage)
		end
	end, {
		UseMemoResult, p1.startRow, SduiContext, UseCollectionAnalyticsContextResult2,
		UseRefResult1, UseCollectionAnalyticsContextResult, ImpressionsTagModule,
		p1.impressionEventName, p1.skipItemImpressionsLog
	})
	local Scale = UseTokensFunction().Config.UI.Scale
	local IsItemHeightModeMatch = p1.itemHeightMode == ItemHeightModeModule.Uniform
	local UseUniformItemHeightModuleResult = UseUniformItemHeightModule(IsItemHeightModeMatch)
	local OnItemSizeChanged = UseUniformItemHeightModuleResult.onItemSizeChanged
	local HasMeasuredMaxHeight: boolean = if UseUniformItemHeightModuleResult then UseUniformItemHeightModuleResult.measuredMaxHeight ~= nil else false
	local ItemHeightFromWidth = nil
	
	if IsItemHeightModeMatch then
		local MeasuredMaxHeight: number = UseUniformItemHeightModuleResult.measuredMaxHeight
		
		if MeasuredMaxHeight and MeasuredMaxHeight > 0 then
			ItemHeightFromWidth = UDim.new(0, MeasuredMaxHeight / Scale)
		end
	elseif p1.itemHeightMode ~= ItemHeightModeModule.Auto then
		ItemHeightFromWidth = p1.itemHeightFromWidth
	end
	local v1: boolean = ItemHeightFromWidth == nil and #UseMemoResult > 0
	
	return ReactModule.createElement(ReactModule.Fragment, nil, CryoModule.Dictionary.join(ReactModule.useMemo(function()
		-- upvalues: p1 (copy), ReactModule (upval), UseCollectionAnalyticsContextResult (copy)
		local CloneElementResults = nil
		
		if p1.children then
			CloneElementResults = {}
			
			for i, child in p1.children do
				CloneElementResults[i] = ReactModule.cloneElement(child, {
					parentAnalyticsContext = UseCollectionAnalyticsContextResult
				})
			end
		end
		return CloneElementResults
	end, { UseCollectionAnalyticsContextResult, p1.children }) or t, {
		CollectionCarousel = ReactModule.createElement(CollectionCarousel, {
			collectionItemSize = if FFlagLuaAppCompositionAlways1 then p1.collectionItemSize else nil,
			onReachedThresholdFromEnd = p1.onScrollToEnd,
			thresholdFromEnd = p1.scrollThresholdFromEnd,
			containerRef = UseStateResult2,
			scrollingFrameRef = UseRefResult,
			getItemHeight = ReactModule.useCallback(function(p2)
				-- upvalues: IsItemHeightModeMatch (copy), UseUniformItemHeightModuleResult (copy), ItemHeightFromWidth (ref), Scale (copy)
				if IsItemHeightModeMatch then
					local MeasuredMaxHeight: number = UseUniformItemHeightModuleResult.measuredMaxHeight
					
					return if MeasuredMaxHeight and MeasuredMaxHeight > 0 then MeasuredMaxHeight else 0
				else
					return if ItemHeightFromWidth then p2 * ItemHeightFromWidth.Scale + ItemHeightFromWidth.Offset * Scale else 0
				end
			end, {
				IsItemHeightModeMatch,
				ItemHeightFromWidth,
				UseUniformItemHeightModuleResult.measuredMaxHeight,
				Scale
			}),
			items = UseMemoResult,
			renderItem = ReactModule.useCallback(function(ComponentConfig, Index, Size, _)
				-- upvalues: SduiContext (copy), SduiErrors (upval), ImpressionsTagModule (copy), ReactModule (upval), FindAnalyticsFieldFunction (upval), t (upval), SduiBuilder (upval), UseRefResult1 (copy), SduiCollectionAnalyticsBuilder (upval), GetSduiComponentWrapperFunction (upval), UseCollectionAnalyticsContextResult (copy), p1 (copy), IsItemHeightModeMatch (copy), HasMeasuredMaxHeight (copy), SduiCollectionItemModule (upval), v1 (copy), OnItemSizeChanged (copy), UseUniformItemHeightModuleResult (copy)
				if not ComponentConfig then
					SduiContext.dependencies.logger.reportError(SduiErrors.SduiErrorType.NilItem, {
						componentType = "CollectionCarousel",
						name = ImpressionsTagModule,
						message = `Nil item in CollectionCarousel.renderItem at index {Index}`
					}, SduiContext.appPage)
					
					return ReactModule.createElement(ReactModule.Fragment), "nil"
				end
				local ComponentType = FindAnalyticsFieldFunction("componentType", ComponentConfig.analyticsData or t) or SduiBuilder.getComponentType(ComponentConfig, SduiContext)
				
				if ComponentType then
					local LocalAnalyticsData = {
						itemPosition = Index,
						itemComponentType = ComponentType,
						componentType = ComponentType
					}
					UseRefResult1.current[Index] = SduiCollectionAnalyticsBuilder.buildAndValidateItemAnalyticsData(SduiContext, ComponentConfig.analyticsData, nil, LocalAnalyticsData, ComponentType)
					
					return ReactModule.createElement(SduiCollectionItemModule, {
						index = Index,
						impressionsTag = ImpressionsTagModule,
						automaticSize = if v1 or IsItemHeightModeMatch then Enum.AutomaticSize.Y else nil,
						size = Size,
						onItemSizeChanged = if IsItemHeightModeMatch then OnItemSizeChanged else nil,
						minHeightBinding = if IsItemHeightModeMatch then UseUniformItemHeightModuleResult.measuredMaxHeightBinding else nil
					}, {
						Item = ReactModule.createElement(GetSduiComponentWrapperFunction(ComponentConfig), {
							componentConfig = ComponentConfig,
							sduiContext = SduiContext,
							parentAnalyticsContext = if ComponentConfig.__isClientBinding then nil else UseCollectionAnalyticsContextResult,
							extraLocalProps = {
								scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
								verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
								index = Index,
								selectionOrder = if p1.disableSelectionOrder or not p1.selectionOrderBase then nil else p1.selectionOrderBase + Index,
								size = if IsItemHeightModeMatch and HasMeasuredMaxHeight then UDim2.new(1, 0, 1, 0) else nil
							},
							debugName = `{ComponentType}_{Index}`,
							localAnalyticsData = LocalAnalyticsData
						})
					}), ComponentType or "unknown"
				else
					SduiContext.dependencies.logger.reportError(SduiErrors.SduiErrorType.NilComponentType, {
						componentType = "CollectionCarousel",
						name = ImpressionsTagModule,
						message = `Nil componentType in CollectionCarousel.renderItem at index {Index}`
					}, SduiContext.appPage)
					
					return ReactModule.createElement(ReactModule.Fragment), "nil"
				end
			end, {
				SduiContext, p1.analyticsContext, p1.scrollViewPositionChangedSignal,
				p1.verticalScrollingFrameRef, UseCollectionAnalyticsContextResult, v1,
				ImpressionsTagModule, p1.index, p1.disableSelectionOrder,
				p1.selectionOrderBase, IsItemHeightModeMatch, OnItemSizeChanged,
				HasMeasuredMaxHeight, UseUniformItemHeightModuleResult.measuredMaxHeightBinding
			}),
			numColumns = if FFlagLuaAppCompositionAlways1 then if FFlagSduiCollectionCarouselOverrides then p1.numColumnsOverride else nil else UseSignalStateResult.numColumns,
			fractionalItemAmount = if FFlagLuaAppCompositionAlways1 then nil else UseSignalStateResult.fractionalItemAmount,
			columnGap = if FFlagLuaAppCompositionAlways1 then nil else UseSignalStateResult.columnGap,
			sideMargin = if FFlagLuaAppCompositionAlways1 then nil else UseSignalStateResult.sideMargin,
			onViewableItemsChanged = UseCollectionImpressionsSignalResult2,
			onChangeCanvasPosition = UseCollectionImpressionsSignalResult2,
			LayoutOrder = LayoutOrder,
			scrollingEnabledOverride = p1.scrollingEnabledOverride,
			AutomaticSize = if v1 or IsItemHeightModeMatch then Enum.AutomaticSize.Y else nil,
			headerComponent = ReactModule.useMemo(function()
				-- upvalues: p1 (copy), ReactModule (upval), UseCollectionAnalyticsContextResult (copy), FFlagSduiGenreSelector (upval), FFlagLuaAppCompositionAlways1 (copy)
				return if p1.headerComponent then ReactModule.cloneElement(p1.headerComponent, {
					parentAnalyticsContext = UseCollectionAnalyticsContextResult,
					extraLocalProps = if FFlagSduiGenreSelector then {
						sideMargin = 0,
						appCompositionEnabled = FFlagLuaAppCompositionAlways1,
						scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
						verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
						startRow = p1.startRow,
						numUpdatesToDelayImpressions = p1.numUpdatesToDelayImpressions,
						index = p1.index
					} else nil
				}) else nil
			end, {
				UseCollectionAnalyticsContextResult, p1.headerComponent,
				if FFlagSduiGenreSelector then FFlagLuaAppCompositionAlways1 else nil,
				if FFlagSduiGenreSelector then p1.scrollViewPositionChangedSignal else nil,
				if FFlagSduiGenreSelector then p1.verticalScrollingFrameRef else nil,
				if FFlagSduiGenreSelector then p1.startRow else nil,
				if FFlagSduiGenreSelector then p1.numUpdatesToDelayImpressions else nil,
				if FFlagSduiGenreSelector then p1.index else nil
			}),
			backgroundMuralUrl = p1.backgroundMuralUrl,
			onScrollButtonEnter = ReactModule.useCallback(function()
				-- upvalues: HoverTileCoordinator (upval)
				HoverTileCoordinator.default:reset()
			end, {}),
			numItemsToRenderOffScreen = p1.numItemsToRenderOffScreen,
			enableHoverOverflow = p1.enableHoverOverflow,
			testId = if p1.testId then p1.testId else "--sdui-collection-carousel"
		}),
		ImpressionDetector = ReactModule.createElement(WaitForPropWrapper, {
			waitForProp = p1.startRow,
			maxUpdatesToDelay = p1.numUpdatesToDelayImpressions,
			wrappedComponent = if FFlagLuaAppUseFrameBoundsImpressions or p1.shouldUseFrameBoundsForImpressions then ReactModule.createElement(FrameBoundsImpressionsTracker, {
				parentRef = UseRefResult,
				pageContext = SduiContext.routeName or SduiContext.appPage,
				impressionsTag = ImpressionsTagModule,
				scrollViewPositionChangedSignal = UseCollectionImpressionsSignalResult,
				sendImpressions = UseResult,
				dataUpdatedTimestamp = p1.sduiContext.dataUpdatedTimestamp
			}) else ReactModule.createElement(ScreenSizeImpressionsTracker, {
				parentRef = UseRefResult,
				pageContext = SduiContext.routeName or SduiContext.appPage,
				impressionsTag = ImpressionsTagModule,
				scrollViewPositionChangedSignal = UseCollectionImpressionsSignalResult,
				sendImpressions = UseResult,
				dataUpdatedTimestamp = p1.sduiContext.dataUpdatedTimestamp
			})
		}),
		ScrollDetector = ReactModule.createElement(ScrollDetector, {
			scrollingFrameRef = UseRefResult,
			sendScrollEvent = UseScrollTelemetryCallbackModule(UseRefResult, UseCollectionAnalyticsContextResult2, SduiContext)
		}),
		FocusNavActions = ReactModule.useMemo(function()
			-- upvalues: p1 (copy), ReactModule (upval), UseCollectionAnalyticsContextResult (copy), UseStateResult (copy)
			return if p1.focusNavActionsComponent then ReactModule.cloneElement(p1.focusNavActionsComponent, {
				parentAnalyticsContext = UseCollectionAnalyticsContextResult,
				extraLocalProps = { guiObject = UseStateResult }
			}) else nil
		end, {
			UseCollectionAnalyticsContextResult,
			p1.focusNavActionsComponent,
			UseStateResult
		})
	}))
end)