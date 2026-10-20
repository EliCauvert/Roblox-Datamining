local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local TutilsModule = require(CorePackages.Packages.tutils)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local _ = require(CorePackages.Workspace.Packages.AppCommonLib)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local AvatarExperienceCatalogModule = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local UseWidgetListInfoViewModelFunction = AvatarExperienceCatalogModule.Components.ResultsList.useWidgetListInfoViewModel
local WidgetListBreakPointEnum = AvatarExperienceCatalogModule.Components.ResultsList.WidgetListBreakPointEnum
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXLookAndFeelBackgrounds = AvatarExperienceFlagsModule.FFlagAXLookAndFeelBackgrounds
local GetIteratorModule = require(Modules.AvatarExperience.Common.Util.getIterator)
local OrganicContentRowModule = require(Modules.AvatarExperience.Common.Components.OrganicContentRow)
local CatalogGridWidgetModule = require(Modules.AvatarExperience.Common.Components.Widgets.CatalogGridWidget)
local UseLocalWidgetsModule = require(Modules.AvatarExperience.Common.Hooks.useLocalWidgets)
local UseHandleThumbnailsLoadedModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Hooks.useHandleThumbnailsLoaded)
local SelectFilterCountModule = require(Modules.AvatarExperience.Catalog.Selectors.selectFilterCount)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local _ = require(Modules.AvatarExperience.Common.Components.WidgetList.Types)
local WidgetListResultsHeaderModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Components.WidgetListResultsHeader)
local WidgetListSpacerModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Components.WidgetListSpacer)
local WidgetListLoadMoreButtonModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Components.WidgetListLoadMoreButton)
local WidgetConstants = AvatarExperienceCatalogModule.WidgetConstants
local _ = require(Modules.AvatarExperience.Catalog.SearchTypes)
local GetOrganicResultIdsFromEntriesModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Utils.getOrganicResultIdsFromEntries)
local GetEntriesAsRowsModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Utils.getEntriesAsRows)
local GetWidgetItemIdsFromWidgetInfoModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Utils.getWidgetItemIdsFromWidgetInfo)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UseTileLatencyTrackerModule = require(Modules.AvatarExperience.Common.Hooks.TileLatency.useTileLatencyTracker)
local UseTileLoadingLatencyInitializerModule = require(Modules.AvatarExperience.Common.Hooks.TileLatency.useTileLoadingLatencyInitializer)
local UseGetHydratedWidgetsModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Hooks.useGetHydratedWidgets)
local GetFFlagEnableCatalogTileLoadingLatencyModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableCatalogTileLoadingLatency)
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local AXCatalogPerfReduxReductionIXPModule = require(Modules.AvatarExperience.Experiments.AXCatalogPerfReduxReductionIXP)
local AXRecentlyViewedSearchItemsIXPTest = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Experiments.AXRecentlyViewedSearchItemsIXPTest
local AXUseRendererInfoConditionalHookBacktraceError = game:DefineFastFlag("AXUseRendererInfoConditionalHookBacktraceError", false)
local GetFFlagEnableDecreaseWidgetPaddingSizingModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableDecreaseWidgetPaddingSizing)
local GetFIntWidgetPaddingSizingModule = require(Modules.AvatarExperience.Flags.GetFIntWidgetPaddingSizing)
local Utils = AvatarExperienceCatalogModule.Utils
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local UseGetCurrentCategoryNamesModule = require(Modules.AvatarExperience.Catalog.Hooks.useGetCurrentCategoryNames)
local FFlagAXCatalogCategoriesStoreImprovePerf = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesStoreImprovePerf
local GetCatalogCategoriesStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local FFlagAXPassScreenSizeToWidgetApi = AvatarExperienceFlagsModule.FFlagAXPassScreenSizeToWidgetApi
local FFlagAXMoveAllTabToWidgetOnly = AvatarExperienceFlagsModule.FFlagAXMoveAllTabToWidgetOnly
local WidgetsPercievedTTIManager = require(CorePackages.Workspace.Packages.AvatarExperienceTTIPerformance).WidgetsPercievedTTIManager
local FFlagAXFixCatalogTileThumbnailFlash = AvatarExperienceFlagsModule.FFlagAXFixCatalogTileThumbnailFlash

local function getBreakpointFromRowWidth(RowWidth, UIScaleFromTokens)
	-- upvalues: WidgetListBreakPointEnum (copy)
	local UIScaleFromTokens1 = UIScaleFromTokens or 1
	
	return if RowWidth then if RowWidth <= 330 * UIScaleFromTokens1 then WidgetListBreakPointEnum.XSmall elseif RowWidth <= 570 * UIScaleFromTokens1 then WidgetListBreakPointEnum.Small elseif RowWidth <= 654 * UIScaleFromTokens1 then WidgetListBreakPointEnum.Medium elseif RowWidth <= 884 * UIScaleFromTokens1 then WidgetListBreakPointEnum.Large elseif RowWidth <= 1116 * UIScaleFromTokens1 then WidgetListBreakPointEnum.XLarge else WidgetListBreakPointEnum.X2Large else WidgetListBreakPointEnum.Default
end

local function _(p1)
	return if p1 and p1.Config and p1.Config.UI and p1.Config.UI.Scale then p1.Config.UI.Scale else 1
end

local function getRowInfoToInsertWidgets(List, p1, Widgets, FocusedWidget, Ceiled, p2)
	-- upvalues: TutilsModule (copy)
	local List1 = {}
	local FieldCountResult = TutilsModule.fieldCount(p1)
	
	for _, RowNum in List do
		local Widget = Widgets[tostring(RowNum)]
		
		if (not FocusedWidget or Widget.id == FocusedWidget) and (RowNum <= Ceiled or not p2) then
			local NewFieldCountResult = FieldCountResult + #List1
			
			if NewFieldCountResult < RowNum then
				RowNum = NewFieldCountResult + 1
			end
			table.insert(List1, { rowNum = RowNum, widgetInfo = Widget })
		end
	end
	return List1
end

local function separateOrganicContentTemplatesFromWidgets(Widgets)
	-- upvalues: WidgetConstants (copy)
	local t = {}
	local t1 = {}
	
	for i, widget in Widgets do
		if widget.type == WidgetConstants.Types.OrganicContent then
			t[i] = widget
		else
			t1[i] = widget
		end
	end
	return t, t1
end

local function selectSearchesParameters(p3)
	return p3.SearchesParameters
end

local function constructWidgetAnalyticsInfo(WidgetInfo, WidgetPosition: number, SearchParameters, OrganicResultIds, PreviewColumns, HandleThumbnailsLoaded)
	-- upvalues: GetWidgetItemIdsFromWidgetInfoModule (copy)
	return {
		requestId = if WidgetInfo then WidgetInfo.requestId else nil,
		widgetPosition = WidgetPosition,
		widgetId = if WidgetInfo then WidgetInfo.id else nil,
		widgetType = if WidgetInfo then WidgetInfo.type else nil,
		widgetAbsPosition = (WidgetPosition - 1) * PreviewColumns,
		query = if SearchParameters then SearchParameters.searchKeyword else nil,
		organicResultIds = OrganicResultIds,
		widgetItemIds = GetWidgetItemIdsFromWidgetInfoModule(WidgetInfo, PreviewColumns),
		handleThumbnailsLoaded = HandleThumbnailsLoaded
	}
end

local function constructWidgetRenderInfo(p3)
	-- upvalues: constructWidgetAnalyticsInfo (copy), ReactModule (copy), CatalogGridWidgetModule (copy), FFlagAXCatalogCategoriesStoreImprovePerf (copy)
	local RequestWidgetAcquireFocus = nil
	local IsIdMatch = nil
	local PreviewColumns = nil
	local PreviewRows = nil
	local ConstructWidgetAnalyticsInfoResult = nil
	
	RequestWidgetAcquireFocus = function()
		-- upvalues: p3 (copy)
		if p3.onWidgetFocusAcquired then
			p3.onWidgetFocusAcquired(p3.widgetInfo)
		end
	end
	
	IsIdMatch = p3.focusedWidget and p3.widgetInfo.id == p3.focusedWidget
	PreviewColumns = p3.widgetInfo.template.previewColumns
	PreviewRows = p3.widgetInfo.template.previewRows
	ConstructWidgetAnalyticsInfoResult = constructWidgetAnalyticsInfo(p3.widgetInfo, p3.rowIndex, p3.searchParameters, p3.organicResultIds, PreviewColumns)
	
	return {
		key = p3.key,
		render = function(_)
			-- upvalues: ReactModule (upval), CatalogGridWidgetModule (upval), p3 (copy), PreviewColumns (ref), PreviewRows (ref), ConstructWidgetAnalyticsInfoResult (ref), IsIdMatch (ref), RequestWidgetAcquireFocus (ref), FFlagAXCatalogCategoriesStoreImprovePerf (upval)
			return ReactModule.createElement(CatalogGridWidgetModule, {
				widgetRow = p3.rowIndex,
				widgetInfo = p3.widgetInfo,
				itemsPerRow = PreviewColumns,
				rowCount = PreviewRows,
				rowHeight = p3.itemSize.Y,
				itemSize = p3.itemSize,
				ref = p3.ref,
				NextSelectionUp = p3.nextSelectionUp,
				NextSelectionDown = p3.nextSelectionDown,
				widgetAnalyticsInfo = ConstructWidgetAnalyticsInfoResult,
				widgetFocused = IsIdMatch,
				requestWidgetAcquireFocus = RequestWidgetAcquireFocus,
				requestWidgetReleaseFocus = p3.onWidgetFocusReleased,
				itemDetailsPeekViewRefs = p3.itemDetailsPeekViewRefs,
				gridRef = p3.gridRef,
				gamepadNavigationFocusPos = p3.gamepadNavigationFocusPos,
				setGamepadNavigationFocusPos = p3.setGamepadNavigationFocusPos,
				includeBottomDivider = p3.includeBottomDivider,
				widgetConfiguration = p3.widgetConfiguration,
				rowWidth = p3.rowWidth,
				onThumbnailLoaded = p3.onThumbnailLoaded,
				selectedCategory = if FFlagAXCatalogCategoriesStoreImprovePerf then p3.selectedCategory else nil,
				selectedSubcategory = if FFlagAXCatalogCategoriesStoreImprovePerf then p3.selectedSubcategory else nil,
				selectedCategoryInfo = if FFlagAXCatalogCategoriesStoreImprovePerf then p3.selectedCategoryInfo else nil
			})
		end
	}
end

local function selectHydratedWidgetData(p3)
	return p3.AvatarExperience.Common.Widgets.HydratedWidgetData
end

return function(ItemSize, ItemsPerRow, WidgetsPerRow, SearchUuid, p3, p4, p5, FromSearch, Height, Height1, FocusedWidget, OnWidgetFocusAcquired, OnWidgetFocusReleased, p6, ItemDetailsPeekViewRefs, Entry, GridRef, OnFocusGained, RequestImpressionsSignal, Callback, ThumbnailAspectRatio, ThumbnailScaleType, ThumbnailSize, OnActivated, RowWidth, PillBarVisible)
	-- upvalues: ReactModule (copy), UseTokensFunction (copy), FFlagAXPassScreenSizeToWidgetApi (copy), Utils (copy), UseAvatarRouteFunction (copy), AXRecentlyViewedSearchItemsIXPTest (copy), UseNavigationFunction (copy), GetCatalogCategoriesStoreModule (copy), UseSignalStateFunction (copy), FFlagAXCatalogCategoriesStoreImprovePerf (copy), AvatarScreen (copy), WidgetConstants (copy), CatalogUtilsModule (copy), UseSelectorFunction (copy), selectSearchesParameters (copy), GetUseSelectorDeepEqualsFunction (copy), UseWidgetListInfoViewModelFunction (copy), getBreakpointFromRowWidth (copy), FFlagAXFixCatalogTileThumbnailFlash (copy), separateOrganicContentTemplatesFromWidgets (copy), selectHydratedWidgetData (copy), UseGetHydratedWidgetsModule (copy), WidgetsPercievedTTIManager (copy), UseGetCurrentCategoryNamesModule (copy), GetFFlagEnableCatalogTileLoadingLatencyModule (copy), UseTileLatencyTrackerModule (copy), SelectFilterCountModule (copy), UseLocalWidgetsModule (copy), AXCatalogPerfReduxReductionIXPModule (copy), IxpUtilsModule (copy), AXUseRendererInfoConditionalHookBacktraceError (copy), UseHandleThumbnailsLoadedModule (copy), UseTileLoadingLatencyInitializerModule (copy), TutilsModule (copy), GetEntriesAsRowsModule (copy), GetOrganicResultIdsFromEntriesModule (copy), CryoModule (copy), GetIteratorModule (copy), FFlagAXLookAndFeelBackgrounds (copy), FFlagAXMoveAllTabToWidgetOnly (copy), GetFFlagEnableDecreaseWidgetPaddingSizingModule (copy), GetFIntWidgetPaddingSizingModule (copy), OrganicContentRowModule (copy), constructWidgetRenderInfo (copy), getRowInfoToInsertWidgets (copy), WidgetListResultsHeaderModule (copy), ConstantsModule (copy), WidgetListLoadMoreButtonModule (copy), WidgetListSpacerModule (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(1)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(Vector2.new(1, 1))
	local UseTokensResult = UseTokensFunction()
	local UIScaleFromTokens = if FFlagAXPassScreenSizeToWidgetApi then Utils.getUIScaleFromTokens(UseTokensResult) elseif UseTokensResult and UseTokensResult.Config and UseTokensResult.Config.UI and UseTokensResult.Config.UI.Scale then UseTokensResult.Config.UI.Scale else 1
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseNavigationResult = if AXRecentlyViewedSearchItemsIXPTest.isEnabled() then UseNavigationFunction() else nil
	local CatalogSelectionStore = GetCatalogCategoriesStoreModule.getCatalogSelectionStore()
	local UseSignalStateResult = UseSignalStateFunction(CatalogSelectionStore.selectedCategoryId)
	local UseSignalStateResult1 = UseSignalStateFunction(CatalogSelectionStore.selectedSubcategoryId)
	local v1 = nil
	local v2 = nil
	local v3 = nil
	
	if FFlagAXCatalogCategoriesStoreImprovePerf then
		v1 = UseSignalStateFunction(CatalogSelectionStore.selectedCategory)
		v2 = UseSignalStateFunction(CatalogSelectionStore.selectedSubcategory)
		v3 = UseSignalStateFunction(CatalogSelectionStore.selectedCategoryInfo)
	end
	local Context = if UseAvatarRouteResult and UseAvatarRouteResult.opaque and UseAvatarRouteResult.opaque.name == AvatarScreen.MySharedAvatars then WidgetConstants.ContextWidgets.MySharedAvatars.Context elseif AXRecentlyViewedSearchItemsIXPTest.isEnabled() and UseAvatarRouteResult and UseAvatarRouteResult.opaque and UseAvatarRouteResult.opaque.name == AvatarScreen.SearchLandingFocusedWidgetPage then (WidgetConstants.ContextWidgets[UseNavigationResult.getParam("widgetType")] or {}).Context elseif UseSignalStateResult then CatalogUtilsModule.getContextForWidgetsById(UseAvatarRouteResult.opaque.name, UseSignalStateResult, UseSignalStateResult1) else nil
	local UseSelectorResultEntry = UseSelectorFunction(selectSearchesParameters, GetUseSelectorDeepEqualsFunction())[SearchUuid]
	local HasSearchKeyword: boolean = UseSelectorResultEntry and UseSelectorResultEntry.searchKeyword ~= nil
	local UseWidgetListInfoViewModelResult = if FFlagAXPassScreenSizeToWidgetApi then UseWidgetListInfoViewModelFunction(SearchUuid, Context, Utils.getBreakpointFromRowWidth(RowWidth, UIScaleFromTokens)) else UseWidgetListInfoViewModelFunction(SearchUuid, Context, (getBreakpointFromRowWidth(RowWidth, UIScaleFromTokens)))
	local Widgets = UseWidgetListInfoViewModelResult.widgets
	local Configuration = UseWidgetListInfoViewModelResult.configuration
	local OrganicContentTemplates = nil
	local Widgets1 = nil
	
	if FFlagAXFixCatalogTileThumbnailFlash then
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: separateOrganicContentTemplatesFromWidgets (upval), Widgets (copy)
			local SeparateOrganicContentTemplatesFromWidgetsResult, SeparateOrganicContentTemplatesFromWidgetsResult2 = separateOrganicContentTemplatesFromWidgets(Widgets)
			
			return {
				organicContentTemplates = SeparateOrganicContentTemplatesFromWidgetsResult,
				widgets = SeparateOrganicContentTemplatesFromWidgetsResult2
			}
		end, { Widgets })
		OrganicContentTemplates = UseMemoResult.organicContentTemplates
		Widgets1 = UseMemoResult.widgets
	else
		OrganicContentTemplates, Widgets1 = separateOrganicContentTemplatesFromWidgets(Widgets)
	end
	local UseGetHydratedWidgetsModuleResult = UseGetHydratedWidgetsModule({
		selectedWidgetIndex = 1,
		hydratedWidgetData = UseSelectorFunction(selectHydratedWidgetData, GetUseSelectorDeepEqualsFunction()),
		widgetInfoDetails = Widgets
	})
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseGetHydratedWidgetsModuleResult (copy), WidgetsPercievedTTIManager (upval)
		if UseRefResult.current then return end
		if UseGetHydratedWidgetsModuleResult and next(UseGetHydratedWidgetsModuleResult) ~= nil then
			UseRefResult.current = true
			WidgetsPercievedTTIManager.L2.primaryDataReady()
			WidgetsPercievedTTIManager.L3.responseReceived()
			WidgetsPercievedTTIManager.L3.requestFetchHydratedWidgets()
			
			return
		end
	end, { UseGetHydratedWidgetsModuleResult })
	local UseGetCurrentCategoryNamesModuleResult = UseGetCurrentCategoryNamesModule()
	
	if GetFFlagEnableCatalogTileLoadingLatencyModule() then
		UseTileLatencyTrackerModule(SearchUuid, p3, UseGetHydratedWidgetsModuleResult and next(UseGetHydratedWidgetsModuleResult) ~= nil)
	end
	local UseSelectorResult = UseSelectorFunction(SelectFilterCountModule, GetUseSelectorDeepEqualsFunction())
	local UseLocalWidgetsModuleResult = UseLocalWidgetsModule(SearchUuid, p4, FromSearch)
	local TestVariable = if AXCatalogPerfReduxReductionIXPModule.isEnabled() then IxpUtilsModule.readTestVariable(AXCatalogPerfReduxReductionIXPModule.EnabledForUser) else nil
	local UseHandleThumbnailsLoadedModuleResult = nil
	UseHandleThumbnailsLoadedModuleResult = if AXUseRendererInfoConditionalHookBacktraceError and AXCatalogPerfReduxReductionIXPModule.isEnabled() then UseHandleThumbnailsLoadedModule() elseif TestVariable then UseHandleThumbnailsLoadedModule() else nil
	local UseRefResult1 = ReactModule.useRef(false)
	local UseTileLoadingLatencyInitializerModuleResult = UseTileLoadingLatencyInitializerModule(SearchUuid)
	local Current = if UseRefResult1 then UseRefResult1.current else nil
	local UseResult = ReactModule.useCallback(function(p7)
		-- upvalues: UseRefResult1 (copy), UseGetHydratedWidgetsModuleResult (copy), UseTileLoadingLatencyInitializerModuleResult (copy)
		if UseRefResult1 and not UseRefResult1.current and UseGetHydratedWidgetsModuleResult and next(UseGetHydratedWidgetsModuleResult) ~= nil then
			local Selected = next(UseGetHydratedWidgetsModuleResult) and select(2, next(UseGetHydratedWidgetsModuleResult))
			
			if Selected then
				for _, value in Selected do
					if tostring(value.id) == p7 then
						UseRefResult1.current = true
						UseTileLoadingLatencyInitializerModuleResult.fireTileLoadingLatencyTracker(UseTileLoadingLatencyInitializerModuleResult, true, true)
						break
					end
				end
			end
		end
	end, {
		UseGetHydratedWidgetsModuleResult,
		UseTileLoadingLatencyInitializerModuleResult
	})
	
	return (ReactModule.useMemo(function()
		-- upvalues: p5 (copy), ItemsPerRow (ref), Configuration (ref), p3 (copy), TutilsModule (upval), GetEntriesAsRowsModule (upval), GetOrganicResultIdsFromEntriesModule (upval), UseSelectorResultEntry (copy), CryoModule (upval), HasSearchKeyword (copy), Context (ref), UseSelectorResult (copy), GetIteratorModule (upval), UseLocalWidgetsModuleResult (copy), Widgets1 (ref), FocusedWidget (copy), Entry (copy), ReactModule (upval), SearchUuid (copy), FromSearch (copy), ItemDetailsPeekViewRefs (copy), GridRef (copy), Callback (copy), RequestImpressionsSignal (copy), OnFocusGained (copy), UseBindingResult (copy), UseBindingResult2 (copy), UseBindingResult1 (copy), UseBindingResult2_1 (copy), OrganicContentTemplates (ref), FFlagAXLookAndFeelBackgrounds (upval), FFlagAXMoveAllTabToWidgetOnly (upval), Widgets (copy), GetFFlagEnableDecreaseWidgetPaddingSizingModule (upval), UseTokensResult (copy), GetFIntWidgetPaddingSizingModule (upval), UseGetCurrentCategoryNamesModuleResult (copy), CatalogUtilsModule (upval), OrganicContentRowModule (upval), ItemSize (copy), ThumbnailAspectRatio (copy), ThumbnailScaleType (copy), ThumbnailSize (copy), TestVariable (copy), UseHandleThumbnailsLoadedModuleResult (ref), FFlagAXCatalogCategoriesStoreImprovePerf (upval), v1 (ref), v2 (ref), v3 (ref), constructWidgetRenderInfo (upval), WidgetsPerRow (copy), OnWidgetFocusAcquired (copy), OnWidgetFocusReleased (copy), RowWidth (copy), Current (copy), UseResult (copy), getRowInfoToInsertWidgets (upval), p6 (copy), p4 (copy), WidgetListResultsHeaderModule (upval), PillBarVisible (copy), Height (ref), ConstantsModule (upval), OnActivated (copy), WidgetListLoadMoreButtonModule (upval), WidgetListSpacerModule (upval), Height1 (copy)
		local List = {}
		
		for _ = 1, p5 do
			table.insert(List, {})
		end
		ItemsPerRow = Configuration and Configuration.defaultItemGroupTemplate and Configuration.defaultItemGroupTemplate.previewColumns or 1
		local P24 = p3 or List
		local Ceiled = math.ceil(TutilsModule.fieldCount(P24) / ItemsPerRow)
		local EntriesAsRowsModule = GetEntriesAsRowsModule(P24, Ceiled, ItemsPerRow)
		local OrganicResultIdsFromEntriesModule = GetOrganicResultIdsFromEntriesModule(P24)
		local CategoryInfo = UseSelectorResultEntry and UseSelectorResultEntry.categoryInfo or {}
		local IsEmpty = if Context and not HasSearchKeyword then if UseSelectorResult > 0 then if HasSearchKeyword then CryoModule.isEmpty(CategoryInfo) or CategoryInfo.ShowWidgets else false else not HasSearchKeyword or (CryoModule.isEmpty(CategoryInfo) or CategoryInfo.ShowWidgets) elseif UseSelectorResult > 0 then if HasSearchKeyword then CryoModule.isEmpty(CategoryInfo) or CategoryInfo.ShowWidgets else false elseif HasSearchKeyword then CryoModule.isEmpty(CategoryInfo) or CategoryInfo.ShowWidgets elseif CryoModule.isEmpty(CategoryInfo) then HasSearchKeyword else CategoryInfo.ShowWidgets or HasSearchKeyword
		local List1 = {}
		local Count = 1
		local Count1 = 1
		local IteratorModule = GetIteratorModule(UseLocalWidgetsModuleResult)
		
		local function _()
			-- upvalues: IsEmpty (ref), Widgets1 (upval), Count1 (ref)
			while IsEmpty and Widgets1 and Widgets1[tostring(Count1)] do
				Count1 += 1
			end
		end
		
		local Next1 = IteratorModule.getNext()
		
		if not FocusedWidget then
			for EntryRowIndex, Row in EntriesAsRowsModule do
				while Next1 and Next1.row == Count do
					local Component = Next1.component
					local RowIndex: number = Count1
					local Entry1 = if RowIndex <= 1 then nil else Entry[RowIndex - 1]
					while IsEmpty and Widgets1 and Widgets1[tostring(Count1)] do
						Count1 += 1
					end
					List1[Count] = {
						key = "localWidget_" .. RowIndex,
						render = function()
							-- upvalues: ReactModule (upval), Component (copy), SearchUuid (upval), FromSearch (upval), ItemsPerRow (upval), ItemDetailsPeekViewRefs (upval), GridRef (upval), Callback (upval), RequestImpressionsSignal (upval), OnFocusGained (upval), Entry1 (ref), Entry (upval), RowIndex (copy), UseBindingResult (upval), UseBindingResult2 (upval), UseBindingResult1 (upval), UseBindingResult2_1 (upval), Configuration (upval)
							return ReactModule.createElement(Component, {
								searchUuid = SearchUuid,
								fromSearch = FromSearch,
								itemsPerRow = ItemsPerRow,
								itemDetailsPeekViewRefs = ItemDetailsPeekViewRefs,
								gridRef = GridRef,
								scrollingFrameRef = Callback(),
								requestImpressionsSignal = RequestImpressionsSignal,
								onFocusGained = OnFocusGained,
								NextSelectionUp = Entry1,
								NextSelectionDown = Entry[RowIndex + 1],
								ref = Entry[RowIndex],
								rowIndex = RowIndex,
								gamepadNavigationColumn = UseBindingResult,
								setGamepadNavigationColumn = UseBindingResult2,
								gamepadNavigationFocusPos = UseBindingResult1,
								setGamepadNavigationFocusPos = UseBindingResult2_1,
								widgetConfiguration = Configuration
							})
						end
					}
					Count += 1
					Count1 += 1
					Next1 = IteratorModule.getNext()
				end
				while IsEmpty and Widgets1 and Widgets1[tostring(Count1)] do
					Count1 += 1
				end
				local Count2: number = Count1
				local OrganicContentTemplate = OrganicContentTemplates[tostring(Count1)]
				
				if FFlagAXLookAndFeelBackgrounds and not OrganicContentTemplate then
					OrganicContentTemplate = {
						template = if Configuration then Configuration.defaultItemGroupTemplate else {}
					}
				end
				if not IsEmpty then
					OrganicContentTemplate = nil
				end
				local NoWidget = if FFlagAXMoveAllTabToWidgetOnly then nil else OrganicContentTemplate and (Widgets and Widgets[tostring(Count1 + 1)] == nil)
				local Size800 = nil
				
				if GetFFlagEnableDecreaseWidgetPaddingSizingModule() then
					local config = {
						[32] = UseTokensResult.Size.Size_800,
						[24] = UseTokensResult.Size.Size_600,
						[20] = UseTokensResult.Size.Size_500,
						[16] = UseTokensResult.Size.Size_400
					}
					Size800 = if config[GetFIntWidgetPaddingSizingModule()] == nil then UseTokensResult.Size.Size_800 else config[GetFIntWidgetPaddingSizingModule()]
				end
				if FromSearch and UseGetCurrentCategoryNamesModuleResult and UseGetCurrentCategoryNamesModuleResult.catalogSearchCategory == "Avatars" then
					Configuration, OrganicContentTemplate = CatalogUtilsModule.removeItemFootersFromConfigs(Configuration, OrganicContentTemplate, false, true, false)
				end
				List1[Count] = {
					key = "organicContentRow_" .. Count2,
					render = function(p8)
						-- upvalues: ReactModule (upval), OrganicContentRowModule (upval), OrganicContentTemplate (ref), Configuration (upval), FFlagAXLookAndFeelBackgrounds (upval), SearchUuid (upval), EntryRowIndex (copy), NoWidget (copy), GetFFlagEnableDecreaseWidgetPaddingSizingModule (upval), Size800 (ref), UseTokensResult (upval), Row (copy), ItemsPerRow (upval), ItemSize (upval), FromSearch (upval), ItemDetailsPeekViewRefs (upval), GridRef (upval), OnFocusGained (upval), UseBindingResult (upval), UseBindingResult2 (upval), UseBindingResult1 (upval), UseBindingResult2_1 (upval), Entry (upval), Count2 (copy), ThumbnailAspectRatio (upval), ThumbnailScaleType (upval), ThumbnailSize (upval), TestVariable (upval), UseHandleThumbnailsLoadedModuleResult (upval), FFlagAXCatalogCategoriesStoreImprovePerf (upval), v1 (upval), v2 (upval), v3 (upval)
						return ReactModule.createElement(OrganicContentRowModule, {
							template = if OrganicContentTemplate then OrganicContentTemplate.template elseif Configuration then Configuration.defaultItemGroupTemplate else {},
							titleKey = if OrganicContentTemplate then OrganicContentTemplate.template.title else nil,
							titleText = if OrganicContentTemplate then OrganicContentTemplate.template.localizedTitle else nil,
							descriptionKey = if OrganicContentTemplate then OrganicContentTemplate.template.description else nil,
							descriptionText = if OrganicContentTemplate then OrganicContentTemplate.template.localizedDescription else nil,
							cardStyle = if FFlagAXLookAndFeelBackgrounds and OrganicContentTemplate then OrganicContentTemplate.template.cardStyle else nil,
							searchUuid = SearchUuid,
							entryRowIndex = EntryRowIndex,
							catalogRowIndex = if p8 and p8.index then p8.index - 1 else nil,
							padding = if OrganicContentTemplate and not NoWidget then {
								bottom = UDim.new(0, if GetFFlagEnableDecreaseWidgetPaddingSizingModule() then Size800 else UseTokensResult.Size.Size_800)
							} else { bottom = UDim.new(0, UseTokensResult.Size.Size_400) },
							row = Row,
							itemsPerRow = ItemsPerRow,
							itemSize = ItemSize,
							fromSearch = FromSearch,
							itemDetailsPeekViewRefs = ItemDetailsPeekViewRefs,
							gridRef = GridRef,
							onFocusGained = OnFocusGained,
							gamepadNavigationColumn = UseBindingResult,
							setGamepadNavigationColumn = UseBindingResult2,
							gamepadNavigationFocusPos = UseBindingResult1,
							setGamepadNavigationFocusPos = UseBindingResult2_1,
							NextSelectionUp = Entry[Count2 - 1],
							NextSelectionDown = Entry[Count2 + 1],
							ref = Entry[Count2],
							thumbnailAspectRatio = ThumbnailAspectRatio,
							thumbnailScaleType = ThumbnailScaleType,
							thumbnailSize = ThumbnailSize,
							widgetConfiguration = Configuration,
							onThumbnailLoaded = if TestVariable then UseHandleThumbnailsLoadedModuleResult else nil,
							selectedCategory = if FFlagAXCatalogCategoriesStoreImprovePerf then v1 else nil,
							selectedSubcategory = if FFlagAXCatalogCategoriesStoreImprovePerf then v2 else nil,
							selectedCategoryInfo = if FFlagAXCatalogCategoriesStoreImprovePerf then v3 else nil
						})
					end
				}
				Count += 1
				Count1 += 1
			end
		end
		if IsEmpty and Widgets1 then
			local List11 = {}
			
			if Context and Widgets1[Context] and FocusedWidget == Widgets1[Context].id then
				table.insert(List1, 1, (constructWidgetRenderInfo({
					rowIndex = 1,
					includeBottomDivider = false,
					key = "widget_" .. Context,
					ref = Entry[Context],
					searchParameters = UseSelectorResultEntry,
					organicResultIds = OrganicResultIdsFromEntriesModule,
					widgetInfo = Widgets1[Context],
					widgetsPerRow = WidgetsPerRow,
					itemSize = ItemSize,
					widgetRefCache = Entry,
					focusedWidget = FocusedWidget,
					onWidgetFocusAcquired = OnWidgetFocusAcquired,
					onWidgetFocusReleased = OnWidgetFocusReleased,
					itemDetailsPeekViewRefs = ItemDetailsPeekViewRefs,
					gridRef = GridRef,
					gamepadNavigationFocusPos = UseBindingResult1,
					setGamepadNavigationFocusPos = UseBindingResult2_1,
					widgetConfiguration = Configuration,
					rowWidth = RowWidth,
					onThumbnailLoaded = if Current then nil else UseResult,
					selectedCategory = if FFlagAXCatalogCategoriesStoreImprovePerf then v1 else nil,
					selectedSubcategory = if FFlagAXCatalogCategoriesStoreImprovePerf then v2 else nil,
					selectedCategoryInfo = if FFlagAXCatalogCategoriesStoreImprovePerf then v3 else nil
				})))
			end
			for i, _ in Widgets1 do
				if tonumber(i) ~= nil then
					table.insert(List11, (tonumber(i)))
				end
			end
			table.sort(List11)
			local RowInfoToInsertWidgets = getRowInfoToInsertWidgets(List11, List1, Widgets1, FocusedWidget, Ceiled, p6)
			
			for i1, rowInfoToInsertWidget in RowInfoToInsertWidgets do
				local RowNum: number = rowInfoToInsertWidget.rowNum
				table.insert(List1, RowNum, (constructWidgetRenderInfo({
					key = "widget_" .. RowNum,
					ref = Entry[RowNum],
					nextSelectionUp = Entry[RowNum - 1],
					nextSelectionDown = Entry[RowNum + 1],
					organicResultIds = OrganicResultIdsFromEntriesModule,
					searchParameters = UseSelectorResultEntry,
					rowIndex = RowNum,
					widgetInfo = rowInfoToInsertWidget.widgetInfo,
					widgetsPerRow = WidgetsPerRow,
					itemSize = ItemSize,
					widgetRefCache = Entry,
					focusedWidget = FocusedWidget,
					onWidgetFocusAcquired = OnWidgetFocusAcquired,
					onWidgetFocusReleased = OnWidgetFocusReleased,
					itemDetailsPeekViewRefs = ItemDetailsPeekViewRefs,
					gridRef = GridRef,
					gamepadNavigationFocusPos = UseBindingResult1,
					setGamepadNavigationFocusPos = UseBindingResult2_1,
					includeBottomDivider = i1 < #RowInfoToInsertWidgets and RowInfoToInsertWidgets[i1 + 1].rowNum ~= RowNum + 1 or i1 == #RowInfoToInsertWidgets and RowNum < #List1,
					widgetConfiguration = Configuration,
					rowWidth = RowWidth,
					onThumbnailLoaded = if Current then nil else UseResult,
					selectedCategory = if FFlagAXCatalogCategoriesStoreImprovePerf then v1 else nil,
					selectedSubcategory = if FFlagAXCatalogCategoriesStoreImprovePerf then v2 else nil,
					selectedCategoryInfo = if FFlagAXCatalogCategoriesStoreImprovePerf then v3 else nil
				})))
			end
			if FFlagAXMoveAllTabToWidgetOnly and Next1 and #List1 >= 11 then
				local Component1 = Next1.component
				table.insert(List1, 11, {
					key = "localWidget_sponsored",
					render = function()
						-- upvalues: ReactModule (upval), Component1 (copy), SearchUuid (upval), FromSearch (upval), ItemsPerRow (upval), ItemDetailsPeekViewRefs (upval), GridRef (upval), Callback (upval), RequestImpressionsSignal (upval), OnFocusGained (upval), Entry (upval), UseBindingResult (upval), UseBindingResult2 (upval), UseBindingResult1 (upval), UseBindingResult2_1 (upval), Configuration (upval)
						return ReactModule.createElement(Component1, {
							rowIndex = 10,
							searchUuid = SearchUuid,
							fromSearch = FromSearch,
							itemsPerRow = ItemsPerRow,
							itemDetailsPeekViewRefs = ItemDetailsPeekViewRefs,
							gridRef = GridRef,
							scrollingFrameRef = Callback(),
							requestImpressionsSignal = RequestImpressionsSignal,
							onFocusGained = OnFocusGained,
							NextSelectionUp = Entry[9],
							NextSelectionDown = Entry[11],
							ref = Entry[10],
							gamepadNavigationColumn = UseBindingResult,
							setGamepadNavigationColumn = UseBindingResult2,
							gamepadNavigationFocusPos = UseBindingResult1,
							setGamepadNavigationFocusPos = UseBindingResult2_1,
							widgetConfiguration = Configuration
						})
					end
				})
				local _ = IteratorModule.getNext()
			end
		end
		if FromSearch and p4 then
			local HasFocusedWidget = FocusedWidget ~= nil
			table.insert(List1, 1, {
				key = "header",
				render = function()
					-- upvalues: ReactModule (upval), WidgetListResultsHeaderModule (upval), SearchUuid (upval), HasFocusedWidget (copy), PillBarVisible (upval)
					return ReactModule.createElement(WidgetListResultsHeaderModule, {
						searchUuid = SearchUuid,
						hideResultsHeader = HasFocusedWidget,
						pillBarVisible = PillBarVisible
					})
				end
			})
		else
			Height = (Height or 0) + ConstantsModule.WidgetListVerticalMargin
		end
		if OnActivated then
			local Count3: number = Count1
			table.insert(List1, {
				key = "loadMoreButton_" .. Count3,
				render = function()
					-- upvalues: ReactModule (upval), WidgetListLoadMoreButtonModule (upval), OnActivated (upval), Entry (upval), Count3 (copy)
					return ReactModule.createElement(WidgetListLoadMoreButtonModule, {
						onActivated = OnActivated,
						ref = Entry[Count3],
						NextSelectionUp = Entry[Count3 - 1]
					})
				end
			})
		end
		if Height then
			table.insert(List1, 1, {
				key = "topSpacer",
				render = function()
					-- upvalues: ReactModule (upval), WidgetListSpacerModule (upval), Height (upval)
					return ReactModule.createElement(WidgetListSpacerModule, { height = Height })
				end
			})
		end
		if Height1 then
			table.insert(List1, {
				key = "bottomSpacer",
				render = function()
					-- upvalues: ReactModule (upval), WidgetListSpacerModule (upval), Height1 (upval)
					return ReactModule.createElement(WidgetListSpacerModule, { height = Height1 })
				end
			})
		end
		return List1
	end, {
		ItemSize, ItemsPerRow, WidgetsPerRow, SearchUuid, p3, p4, p5, FromSearch,
		Height, Height1, FocusedWidget, OnWidgetFocusAcquired, OnWidgetFocusReleased,
		p6, ItemDetailsPeekViewRefs, Entry, GridRef, OnFocusGained,
		RequestImpressionsSignal, Callback, Widgets1, UseSelectorResultEntry,
		HasSearchKeyword, ThumbnailAspectRatio, ThumbnailScaleType, ThumbnailSize,
		Context, OnActivated, UseTokensResult,
		if AXUseRendererInfoConditionalHookBacktraceError and AXCatalogPerfReduxReductionIXPModule.isEnabled() then UseHandleThumbnailsLoadedModuleResult elseif TestVariable then UseHandleThumbnailsLoadedModuleResult else nil,
		RowWidth
	}))
end