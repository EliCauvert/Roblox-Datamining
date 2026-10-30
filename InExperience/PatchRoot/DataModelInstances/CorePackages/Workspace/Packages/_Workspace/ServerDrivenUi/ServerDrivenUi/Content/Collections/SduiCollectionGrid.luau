local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.AppCommonLib)
local CryoModule = require(Parent.Cryo)
local SignalsReactModule = require(Parent.SignalsReact)
local CollectionViewsModule = require(Parent.CollectionViews)
local CollectionGrid = CollectionViewsModule.CollectionGrid
local CollectionItemSize = CollectionViewsModule.CollectionViewTypes.CollectionItemSize
local UseCollectionImpressionsSignalFunction = CollectionViewsModule.useCollectionImpressionsSignal
local UseCollectionLayoutFunction = CollectionViewsModule.useCollectionLayout
local UseCollectionLayoutParamsFunction = CollectionViewsModule.useCollectionLayoutParams
local WaitForPropWrapper = require(Parent.GameCollections).WaitForPropWrapper
local ImpressionsModule = require(Parent.Impressions)
local FrameBoundsImpressionsTracker = ImpressionsModule.FrameBoundsImpressionsTracker
local ScreenSizeImpressionsTracker = ImpressionsModule.ScreenSizeImpressionsTracker
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UsePreferredTextSizeLineBudgetFunction = require(Parent.SduiSharedUtilities).usePreferredTextSizeLineBudget
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local FindAnalyticsFieldFunction = SduiCoreSystemModule.findAnalyticsField
local GetImpressionsTagModule = require(ServerDrivenUi.Analytics.getImpressionsTag)
local SendLegacyGameImpressionsForSduiModule = require(ServerDrivenUi.Analytics.sendLegacyGameImpressionsForSdui)
local ReportUnifiedLoggingImpressionsFunction = SduiCoreSystemModule.reportUnifiedLoggingImpressions
local SduiBuilder = SduiCoreSystemModule.SduiBuilder
local SduiCollectionAnalyticsBuilder = SduiCoreSystemModule.SduiCollectionAnalyticsBuilder
local SduiErrors = SduiCoreSystemModule.SduiErrors
local SduiParseHelpers = SduiCoreSystemModule.SduiParseHelpers
local GetSduiComponentWrapperFunction = SduiCoreSystemModule.getSduiComponentWrapper
local SduiCollectionItemModule = require(ServerDrivenUi.Content.Collections.SduiCollectionItem)
local SduiCollectionGridRevealRowsModule = require(ServerDrivenUi.Content.Collections.SduiCollectionGridRevealRows)
local UseCollectionAnalyticsContextFunction = require(Parent.SduiSharedContent).useCollectionAnalyticsContext
local FFlagLuaAppLayoutParamsInContext = require(Parent.SharedFlags).FFlagLuaAppLayoutParamsInContext
local FFlagLuaAppCompositionAlways = require(Parent.SharedFlags).FFlagLuaAppCompositionAlways
local FFlagSduiFixSearchTelemetry = require(Parent.SharedFlags).FFlagSduiFixSearchTelemetry
local FFlagSduiPreferredTextSizeLineBudgets = require(Parent.SharedFlags).FFlagSduiPreferredTextSizeLineBudgets
local FFlagSduiCollectionGridRevealRows = require(Parent.SharedFlags).FFlagSduiCollectionGridRevealRows

local function _(p1, p2, p3): UDim2
	local ColSpan = p1.colSpan or 1
	local RowSpan = p1.rowSpan or 1
	
	return UDim2.new(ColSpan, p2 * (ColSpan - 1), RowSpan, p3 * (RowSpan - 1))
end

local t = {}

return ReactModule.memo(function(p1)
	-- upvalues: FFlagLuaAppCompositionAlways (copy), ReactModule (copy), t (copy), FFlagLuaAppLayoutParamsInContext (copy), SignalsReactModule (copy), UseCollectionLayoutParamsFunction (copy), CollectionItemSize (copy), CryoModule (copy), UseCollectionLayoutFunction (copy), FindAnalyticsFieldFunction (copy), SduiBuilder (copy), UseCollectionAnalyticsContextFunction (copy), UseCollectionImpressionsSignalFunction (copy), GetImpressionsTagModule (copy), SduiParseHelpers (copy), SduiErrors (copy), ReportUnifiedLoggingImpressionsFunction (copy), SendLegacyGameImpressionsForSduiModule (copy), UseTokensFunction (copy), FFlagSduiPreferredTextSizeLineBudgets (copy), UsePreferredTextSizeLineBudgetFunction (copy), FFlagSduiFixSearchTelemetry (copy), SduiCollectionAnalyticsBuilder (copy), GetSduiComponentWrapperFunction (copy), SduiCollectionItemModule (copy), FFlagSduiCollectionGridRevealRows (copy), SduiCollectionGridRevealRowsModule (copy), CollectionGrid (copy), WaitForPropWrapper (copy), FrameBoundsImpressionsTracker (copy), ScreenSizeImpressionsTracker (copy)
	local FFlagLuaAppCompositionAlways1 = FFlagLuaAppCompositionAlways or (p1.appCompositionEnabled or p1.sduiContext.appCompositionEnabled)
	local LayoutOrder = p1.layoutOrder
	local SduiContext = p1.sduiContext
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), t (upval)
		if p1.items == nil then
			return t
		end
		for _, item in p1.items do
			if p1.itemTemplateKey and item.templateKey == nil then
				item.templateKey = p1.itemTemplateKey
			end
		end
		return p1.items
	end, { p1.items, p1.itemTemplateKey })
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(nil)
	UseRefResult.current = UseStateResult
	local UseSignalStateResult = if FFlagLuaAppCompositionAlways then nil elseif FFlagLuaAppLayoutParamsInContext then SignalsReactModule.useSignalState((ReactModule.useCallback(function(p2)
		-- upvalues: SduiContext (copy), p1 (copy)
		return SduiContext.getPageLayoutConfig(p1.collectionItemSize)(p2)
	end, { p1.collectionItemSize, SduiContext.getPageLayoutConfig }))) else UseCollectionLayoutParamsFunction(p1.collectionItemSize or CollectionItemSize.Small, UseStateResult, false, if p1.layoutOverrides then CryoModule.Dictionary.join(p1.layoutOverrides, {
		overrideLoadMoreThreshold = 1e999,
		sideMargin = p1.pageSideMargin
	}) else {
		overrideLoadMoreThreshold = 1e999,
		sideMargin = p1.pageSideMargin
	})
	local Count = 0
	
	if UseMemoResult then
		for _, value in UseMemoResult do
			if not value.isBlank then
				Count += 1
			end
		end
	end
	local UseCollectionLayoutResult = UseCollectionLayoutFunction(p1.collectionItemSize)
	local ItemsPerRow = UseCollectionLayoutResult.itemsPerRow
	local ItemsPerRow1 = if FFlagLuaAppCompositionAlways1 then ItemsPerRow else UseSignalStateResult.numColumns
	local Gutter = if FFlagLuaAppCompositionAlways1 then UseCollectionLayoutResult.gutter else UseSignalStateResult and UseSignalStateResult.columnGap or 0
	local VerticalGap = if FFlagLuaAppCompositionAlways1 then UseCollectionLayoutResult.verticalGap else UseSignalStateResult and UseSignalStateResult.verticalPadding or 0
	local UseCollectionAnalyticsContextResult, UseCollectionAnalyticsContextResult2 = UseCollectionAnalyticsContextFunction(p1.analyticsContext, FindAnalyticsFieldFunction("componentType", p1.analyticsContext.analyticsData or t) or SduiBuilder.getComponentType(p1.componentConfig, SduiContext), ItemsPerRow1, Count, SduiContext, p1.startRow, p1.componentConfig.__isClientBinding)
	local UseRefResult1 = ReactModule.useRef({})
	local UseCollectionImpressionsSignalResult, UseCollectionImpressionsSignalResult2 = UseCollectionImpressionsSignalFunction(p1.scrollViewPositionChangedSignal)
	local UseResult = ReactModule.useCallback(function(_, _)
		-- upvalues: p1 (copy), UseCollectionImpressionsSignalResult2 (copy)
		if p1.onCollectionViewabilityChanged then
			p1.onCollectionViewabilityChanged()
		end
		if UseCollectionImpressionsSignalResult2 then
			UseCollectionImpressionsSignalResult2()
		end
	end, {
		UseCollectionImpressionsSignalResult2,
		p1.onCollectionViewabilityChanged
	})
	local ImpressionsTag = p1.impressionsTag or GetImpressionsTagModule(p1.index, UseCollectionAnalyticsContextResult2.current, SduiContext, p1.debugName)
	local UseResult1 = ReactModule.useCallback(function(List)
		-- upvalues: UseMemoResult (copy), UseCollectionAnalyticsContextResult (copy), SduiParseHelpers (upval), SduiContext (copy), SduiErrors (upval), ImpressionsTag (copy), p1 (copy), UseCollectionAnalyticsContextResult2 (copy), ReportUnifiedLoggingImpressionsFunction (upval), UseRefResult1 (copy), SendLegacyGameImpressionsForSduiModule (upval)
		if UseMemoResult ~= nil and #UseMemoResult ~= 0 then
			assert(UseMemoResult, "itemConfigs must exist")
			
			if (p1.impressionEventName or not UseCollectionAnalyticsContextResult2.current or UseCollectionAnalyticsContextResult2.current.contentType ~= "Game") and not p1.sendGameImpressions then
				ReportUnifiedLoggingImpressionsFunction(SduiContext, List, UseRefResult1.current, UseCollectionAnalyticsContextResult2.current, p1.startRow, p1.impressionEventName, p1.skipItemImpressionsLog, ImpressionsTag)
				
				return
			end
			if UseCollectionAnalyticsContextResult2.current and UseCollectionAnalyticsContextResult2.current.contentType == "Game" then
				SendLegacyGameImpressionsForSduiModule(List, UseRefResult1.current, UseMemoResult, UseCollectionAnalyticsContextResult, UseCollectionAnalyticsContextResult2.current, p1.startRow, SduiContext, p1.sendGameImpressions, UseCollectionAnalyticsContextResult2.current.itemsPerRow, ImpressionsTag)
			end
			ReportUnifiedLoggingImpressionsFunction(SduiContext, List, UseRefResult1.current, UseCollectionAnalyticsContextResult2.current)
			
			return
		elseif List and #List > 0 then
			SduiContext.dependencies.logger.reportError(SduiErrors.SduiErrorType.FailedToLogImpressions, {
				componentType = "CollectionGrid",
				name = ImpressionsTag,
				message = `Failed to log impressions. No configs. indexes: {table.concat(List, ",")} analytics: {if UseCollectionAnalyticsContextResult then SduiParseHelpers.stringifyValue(UseCollectionAnalyticsContextResult.analyticsData) else nil}`
			}, SduiContext.appPage)
		end
	end, {
		UseMemoResult, p1.startRow, SduiContext, UseCollectionAnalyticsContextResult2,
		UseRefResult1, UseCollectionAnalyticsContextResult, p1.sendGameImpressions,
		ImpressionsTag, p1.impressionEventName, p1.skipItemImpressionsLog
	})
	ReactModule.useLayoutEffect(function()
		-- upvalues: p1 (copy), UseResult1 (copy)
		if p1.setLogImpressions then
			p1.setLogImpressions(UseResult1)
		end
	end, { UseResult1, p1.setLogImpressions })
	local Scale = UseTokensFunction().Config.UI.Scale
	local UsePreferredTextSizeLineBudgetResult = if FFlagSduiPreferredTextSizeLineBudgets then UsePreferredTextSizeLineBudgetFunction(p1.preferredTextSizeLineCount) else nil
	local GridProps = {
		disableRelativeGap = true,
		collectionItemSize = if FFlagLuaAppCompositionAlways1 then p1.collectionItemSize else nil,
		verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
		containerRef = UseStateResult2,
		getItemHeight = ReactModule.useCallback(function(p2)
			-- upvalues: p1 (copy), Scale (copy), UsePreferredTextSizeLineBudgetResult (ref)
			return p2 * p1.itemHeightFromWidth.Scale + p1.itemHeightFromWidth.Offset * Scale + (UsePreferredTextSizeLineBudgetResult or 0)
		end, {
			p1.itemHeightFromWidth,
			Scale,
			if FFlagSduiPreferredTextSizeLineBudgets then UsePreferredTextSizeLineBudgetResult else nil
		}),
		items = UseMemoResult,
		renderItem = ReactModule.useCallback(function(ComponentConfig, Index, Size, _)
			-- upvalues: ReactModule (upval), SduiContext (copy), SduiErrors (upval), ImpressionsTag (copy), FindAnalyticsFieldFunction (upval), t (upval), SduiBuilder (upval), FFlagSduiFixSearchTelemetry (upval), UseRefResult1 (copy), SduiCollectionAnalyticsBuilder (upval), GetSduiComponentWrapperFunction (upval), UseCollectionAnalyticsContextResult (copy), p1 (copy), VerticalGap (copy), SduiCollectionItemModule (upval), Gutter (copy)
			if ComponentConfig and ComponentConfig.isBlank then
				return ReactModule.createElement("Frame", { BackgroundTransparency = 1, LayoutOrder = Index }), "blank"
			end
			if not ComponentConfig then
				SduiContext.dependencies.logger.reportError(SduiErrors.SduiErrorType.NilItem, {
					componentType = "CollectionGrid",
					name = ImpressionsTag,
					message = `Nil item in SduiCollectionGrid.renderItem at index {Index}`
				}, SduiContext.appPage)
				
				return ReactModule.createElement(ReactModule.Fragment), "nil"
			end
			local ComponentType = FindAnalyticsFieldFunction("componentType", ComponentConfig.analyticsData or t) or SduiBuilder.getComponentType(ComponentConfig, SduiContext)
			
			if not ComponentType then
				SduiContext.dependencies.logger.reportError(SduiErrors.SduiErrorType.NilComponentType, {
					componentType = "CollectionGrid",
					name = ImpressionsTag,
					message = `Nil componentType in CollectionGrid.renderItem at index {Index}`
				}, SduiContext.appPage)
				
				return ReactModule.createElement(ReactModule.Fragment), "nil"
			end
			local LocalAnalyticsData = {
				itemPosition = Index,
				itemComponentType = ComponentType,
				componentType = ComponentType,
				topicContentsIndex = ComponentConfig.realIndex,
				topicDataPosition = if FFlagSduiFixSearchTelemetry then ComponentConfig.realIndex else nil
			}
			UseRefResult1.current[Index] = SduiCollectionAnalyticsBuilder.buildAndValidateItemAnalyticsData(SduiContext, ComponentConfig.analyticsData, nil, LocalAnalyticsData, ComponentType)
			local Element = ReactModule.createElement(GetSduiComponentWrapperFunction(ComponentConfig), {
				componentConfig = ComponentConfig,
				sduiContext = SduiContext,
				parentAnalyticsContext = if ComponentConfig.__isClientBinding then nil else UseCollectionAnalyticsContextResult,
				extraLocalProps = {
					scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
					verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
					index = Index,
					selectionOrder = if p1.disableSelectionOrder or not p1.selectionOrderBase then nil else p1.selectionOrderBase + Index,
					alignmentType = if ComponentConfig.spanOverride == nil then nil else ComponentConfig.spanOverride.alignmentType,
					cellVerticalPadding = if ComponentConfig.spanOverride == nil then nil else VerticalGap
				},
				debugName = `{ComponentType}_{Index}`,
				localAnalyticsData = LocalAnalyticsData
			})
			local CreateElementFunction = ReactModule.createElement
			local config = {
				index = Index,
				impressionsTag = ImpressionsTag,
				size = Size,
				zIndex = -Index
			}
			local InnerWrapperSize = nil
			
			if ComponentConfig.spanOverride == nil then
				InnerWrapperSize = nil
			else
				local SpanOverride = ComponentConfig.spanOverride
				local ColSpan = SpanOverride.colSpan or 1
				local RowSpan = SpanOverride.rowSpan or 1
				InnerWrapperSize = UDim2.new(ColSpan, Gutter * (ColSpan - 1), RowSpan, VerticalGap * (RowSpan - 1))
			end
			config.innerWrapperSize = InnerWrapperSize
			
			return CreateElementFunction(SduiCollectionItemModule, config, { Item = Element }), ComponentType or "unknown"
		end, {
			SduiContext, p1.analyticsContext, p1.scrollViewPositionChangedSignal,
			p1.verticalScrollingFrameRef, UseCollectionAnalyticsContextResult,
			ImpressionsTag, p1.index, p1.disableSelectionOrder, p1.selectionOrderBase,
			Gutter, VerticalGap
		}),
		numColumns = if FFlagLuaAppCompositionAlways1 then nil else UseSignalStateResult.numColumns,
		columnGap = if FFlagLuaAppCompositionAlways1 then nil else UseSignalStateResult.columnGap,
		sideMargin = if FFlagLuaAppCompositionAlways1 then nil else UseSignalStateResult.sideMargin,
		onViewableItemsChanged = UseResult,
		LayoutOrder = LayoutOrder,
		verticalPadding = if FFlagLuaAppCompositionAlways1 then nil else UseSignalStateResult.verticalPadding,
		headerComponent = ReactModule.useMemo(function()
			-- upvalues: p1 (copy), ReactModule (upval), UseCollectionAnalyticsContextResult (copy)
			return if p1.headerComponent then ReactModule.cloneElement(p1.headerComponent, {
				parentAnalyticsContext = UseCollectionAnalyticsContextResult
			}) else nil
		end, { UseCollectionAnalyticsContextResult, p1.headerComponent }),
		testId = if p1.testId then p1.testId else "--sdui-collection-grid",
		onReachedThresholdFromEnd = p1.onReachedThresholdFromEnd,
		thresholdRowsFromBottom = p1.thresholdRowsFromBottom,
		maxNumRows = p1.maxNumRows
	}
	
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
		CollectionGrid = if FFlagSduiCollectionGridRevealRows and (p1.initialFeedVisibleRows ~= nil or p1.visibleRowsPerReveal ~= nil) then if p1.setDisplayedRowCount == nil or p1.revealRowsComponent == nil then ReactModule.createElement(CollectionGrid, GridProps) else ReactModule.createElement(SduiCollectionGridRevealRowsModule, {
			gridProps = GridProps,
			sduiContext = p1.sduiContext,
			analyticsContext = p1.analyticsContext,
			itemCount = #UseMemoResult,
			itemsPerRow = ItemsPerRow1,
			maxNumRows = p1.maxNumRows,
			initialFeedVisibleRows = p1.initialFeedVisibleRows,
			visibleRowsPerReveal = p1.visibleRowsPerReveal,
			startRow = p1.startRow,
			setDisplayedRowCount = p1.setDisplayedRowCount,
			revealRowsComponent = p1.revealRowsComponent,
			containerFrame = UseStateResult,
			setContainerFrame = UseStateResult2
		}) else ReactModule.createElement(CollectionGrid, GridProps),
		ImpressionDetector = if p1.disableImpressionsDetector then nil else ReactModule.createElement(WaitForPropWrapper, {
			waitForProp = p1.startRow,
			maxUpdatesToDelay = p1.numUpdatesToDelayImpressions,
			wrappedComponent = if p1.shouldUseFrameBoundsForImpressions then ReactModule.createElement(FrameBoundsImpressionsTracker, {
				parentRef = UseRefResult,
				pageContext = SduiContext.routeName or SduiContext.appPage,
				impressionsTag = ImpressionsTag,
				scrollViewPositionChangedSignal = UseCollectionImpressionsSignalResult,
				sendImpressions = UseResult1,
				dataUpdatedTimestamp = p1.sduiContext.dataUpdatedTimestamp
			}) else ReactModule.createElement(ScreenSizeImpressionsTracker, {
				parentRef = UseRefResult,
				pageContext = SduiContext.routeName or SduiContext.appPage,
				impressionsTag = ImpressionsTag,
				scrollViewPositionChangedSignal = UseCollectionImpressionsSignalResult,
				sendImpressions = UseResult1,
				dataUpdatedTimestamp = p1.sduiContext.dataUpdatedTimestamp
			})
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