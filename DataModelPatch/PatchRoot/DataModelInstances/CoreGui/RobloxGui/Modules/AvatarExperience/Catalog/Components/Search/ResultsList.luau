local CorePackages = game:GetService("CorePackages")
local CollectionService = game:GetService("CollectionService")
local IXPService = game:GetService("IXPService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local Focusable = RoactGamepadModule.Focusable
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local EmptyState = UIBloxModule.App.Indicator.EmptyState
local WithStyleFunction = UIBloxModule.Style.withStyle
local PromiseModule = require(CorePackages.Packages.Promise)
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local TModule = require(CorePackages.Packages.t)
local FitTextLabel = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents.FitTextLabel
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local CryoModule = require(CorePackages.Packages.Cryo)
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local WithAdaptiveScrollingFunction = AvatarExperienceCommonModule.Hooks.withAdaptiveScrolling
local AvatarExperienceCatalogModule = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local GetTryOnItemReducerKeyFunction = AvatarExperienceCommonModule.Utils.getTryOnItemReducerKey
local GetCatalogCategoriesStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local UseSignalStateFunction = SignalsReactModule.useSignalState
local UseFocusGuiObjectFunction = require(CorePackages.Packages.ReactFocusNavigation).useFocusGuiObject
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local CatalogTilesLatencyTrackerModule = require(Modules.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker)
local _ = require(Modules.AvatarExperience.Catalog.Reducers.SearchCategories)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local AvatarRoute = AvatarExperienceNavigationModule.AvatarRoute.AvatarRoute
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseStoreFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useStore
local TutilsModule = require(CorePackages.Packages.tutils)
local WithNavigationFunction = require(CorePackages.Packages.RoactNavigation).withNavigation
local WithAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local DeepLinkUtilsModule = require(Modules.AvatarExperience.Common.DeepLinkUtils)
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local ConstantsModule1 = require(Modules.LuaApp.Constants)
local AnalyticsModule = require(Modules.AvatarExperience.Common.Services.Analytics)
local AnalyticsModule1 = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local ApiFetchCatalogSearchModule = require(Modules.AvatarExperience.Catalog.Thunks.ApiFetchCatalogSearch)
local FetchAssetOrBundleInfoModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo)
local ToggleTryOnThunkModule = require(Modules.AvatarExperience.Common.Thunks.ToggleTryOnThunk)
local FetchDataWithErrorToastsModule = require(Modules.LuaApp.Thunks.FetchDataWithErrorToasts)
local SignalConnectionModule = require(Modules.LuaApp.Components.SignalConnection)
local WithNamedRefsModule = require(Modules.AvatarExperience.Common.Context.withNamedRefs)
local WidgetListModule = require(Modules.AvatarExperience.Common.Components.WidgetList)
local SelectIsFullViewModule = require(Modules.AvatarExperience.Common.Selectors.selectIsFullView)
local SelectFilterCountModule = require(Modules.AvatarExperience.Catalog.Selectors.selectFilterCount)
local GetUseSelectorDeepEqualsFunction = AvatarExperienceCommonModule.Utils.getUseSelectorDeepEquals
local CatalogSduiFeedEntryPoint = AvatarExperienceCatalogModule.Components.CatalogSduiFeedEntryPoint
local UseApplySduiFocusedSortFunction = AvatarExperienceCatalogModule.Sdui.useApplySduiFocusedSort
local UseClearSduiFocusedSortFunction = AvatarExperienceCatalogModule.Sdui.useClearSduiFocusedSort
local ResolveSduiFocusedSortContextFunction = AvatarExperienceCatalogModule.Sdui.resolveSduiFocusedSortContext
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local _ = require(Modules.AvatarExperience.Catalog.Reducers.SortAndFilters)
local FilterUtilsModule = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterUtils)
local ResultsListTopPanelModule = require(Modules.AvatarExperience.Catalog.Components.Search.ResultsListTopPanel)
local ResultsListCatalogOffersBannerModule = require(Modules.AvatarExperience.Catalog.Components.Search.ResultsListCatalogOffersBanner)
local CatalogResultListNavigationContainerModule = require(Modules.AvatarExperience.Catalog.Components.Search.CatalogResultListNavigation.CatalogResultListNavigationContainer)
local FFlagAXMigrateCatalogResultListNavigationToMVVM = AvatarExperienceFlagsModule.FFlagAXMigrateCatalogResultListNavigationToMVVM
local ResultsListListHeaderModule = require(Modules.AvatarExperience.Catalog.Components.Search.ResultsListListHeader)
local WidgetConstants = AvatarExperienceCatalogModule.WidgetConstants
local StoresModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Stores)
local AvatarExperienceScreenSizeImpressionsDetector = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).AvatarExperienceScreenSizeImpressionsDetector
local CatalogCategories = AvatarExperienceCommonModule.Enums.CatalogCategories
local TagBasedImpressionsDetector = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).TagBasedImpressionsDetector
local UseUnifiedEventImpressionsReporterFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).useUnifiedEventImpressionsReporter
local SendUnifiedEventLogFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventLog
local UnifiedEventLogEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums
local UseAnimatedVisibilityFunction = AvatarExperienceCommonModule.Stores.AnimatedVisibilityStore.useAnimatedVisibility
local GetShouldPageUseWidgetOnlyFetcherFunction = AvatarExperienceCatalogModule.Utils.getShouldPageUseWidgetOnlyFetcher
local GetAXMarketplaceWidgetStoreFunction = AvatarExperienceCatalogModule.Stores.getAXMarketplaceWidgetStore
local CartIdService = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Lib.CartIdService
local FStringAXImpressionsEventNameModule = require(Modules.AvatarExperience.Flags.FStringAXImpressionsEventName)
local SetResultsListFocusedWidgetModule = require(Modules.AvatarExperience.Catalog.Actions.SetResultsListFocusedWidget)
local ClearResultsListFocusedWidgetModule = require(Modules.AvatarExperience.Catalog.Actions.ClearResultsListFocusedWidget)
local SetWidgetInfoModule = require(Modules.AvatarExperience.Catalog.Actions.SetWidgetInfo)
local ClearWidgetInfoModule = require(Modules.AvatarExperience.Catalog.Actions.ClearWidgetInfo)
local SetHydratedWidgetDataModule = require(Modules.AvatarExperience.Catalog.Actions.SetHydratedWidgetData)
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local EquippedDeepLinkCatalogItemModule = require(Modules.AvatarExperience.Catalog.Actions.EquippedDeepLinkCatalogItem)
local ClearTryOnsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.ClearTryOns
local AXFixResultListCrash = game:DefineFastFlag("AXFixResultListCrash", false)
local ConstantsModule2 = require(Modules.AvatarExperience.Common.Constants)
local GetFFlagEnableCatalogTileLoadingLatencyModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableCatalogTileLoadingLatency)
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local FFlagAXMISEnableMultiShoppingUnifiedEvents = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShoppingUnifiedEvents
local FFlagAXMigrateMainNavigationInputBindings = AvatarExperienceFlagsModule.FFlagAXMigrateMainNavigationInputBindings
local FFlagAXItemDetailsIxpExposure = AvatarExperienceFlagsModule.FFlagAXItemDetailsIxpExposure
local FFlagLuaAppsDefaultSelection = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppsDefaultSelection
local OrganicEventImpressionsReporterModule = require(Modules.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsReporter)
local ImpressionEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums
local UseResultsListFocusNavigationBindingsModule = require(script.Parent.useResultsListFocusNavigationBindings)
local UseResultsAreSduiEnabledModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Hooks.useResultsAreSduiEnabled)
local FFlagAXFixCatalogRefreshRendering = AvatarExperienceFlagsModule.FFlagAXFixCatalogRefreshRendering
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagRenameDeprecatedUIBloxTokens = SharedFlagsModule.FFlagRenameDeprecatedUIBloxTokens
local FFlagAXMigrateAXToGlobalAutofocus = SharedFlagsModule.FFlagAXMigrateAXToGlobalAutofocus
local MarketplaceCatalogSduiSelectionBridge = require(CorePackages.Workspace.Packages.AvatarExperienceServerDrivenUi).MarketplaceCatalogSduiSelectionBridge
local FFlagAXAdaptiveScrollingFixForward = AvatarExperienceFlagsModule.FFlagAXAdaptiveScrollingFixForward
local FFlagAXRemoveCatalogCategoryNavKey = AvatarExperienceFlagsModule.FFlagAXRemoveCatalogCategoryNavKey
local FFlagAXHideMenuOnScroll = AvatarExperienceFlagsModule.FFlagAXHideMenuOnScroll
local FFlagAXMoveAllTabToWidgetOnly = AvatarExperienceFlagsModule.FFlagAXMoveAllTabToWidgetOnly
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI
local AvatarExperienceTTIPerformanceModule = require(CorePackages.Workspace.Packages.AvatarExperienceTTIPerformance)
local TTIPerformanceManager = AvatarExperienceTTIPerformanceModule.TTIPerformanceManager
local OrganicTTIMilestoneManager = AvatarExperienceTTIPerformanceModule.OrganicTTIMilestoneManager
local FFlagAXFixWidgetOnlyTabNoItemsFound = AvatarExperienceFlagsModule.FFlagAXFixWidgetOnlyTabNoItemsFound
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlagsModule.FFlagAXMigrateAllTabToSduiDev
local FFlagAXCatalogOffersBannerEnabled = AvatarExperienceFlagsModule.FFlagAXCatalogOffersBannerEnabled
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local FFlagSduiMarketplaceCatalogSortSupport = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSduiMarketplaceCatalogSortSupport
local CatalogPageMonolithDependenciesProviderModule = if FFlagSduiMarketplaceCatalogSortSupport then require(script.Parent.CatalogPageMonolithDependenciesProvider) else nil
local ResultsList = RoactModule.PureComponent:extend("ResultsList")
ResultsList.defaultProps = { navBarSizeY = 0 }
ResultsList.validateProps = TModule.strictInterface({
	analyticsContext = TModule.string,
	layoutOrder = TModule.optional(TModule.number),
	fromSearch = TModule.boolean,
	itemsHeader = TModule.optional(TModule.table),
	frameRef = TModule.optional(TModule.table),
	scrollingFrameRef = TModule.optional(TModule.table),
	onRetry = TModule.callback,
	searchUuid = TModule.string,
	navBarSizeY = TModule.optional(TModule.number),
	navBarRef = TModule.optional(TModule.table),
	backToTopSignal = TModule.optional(TModule.table),
	multiTryOnBottomBarRef = TModule.optional(TModule.table),
	categoryInfo = TModule.optional(TModule.table),
	onCategoryOrSubcategoryChange = TModule.optional(TModule.callback),
	onCategoryOrSubcategoryChangeById = TModule.optional(TModule.callback),
	itemDetailsPeekViewRefs = TModule.table,
	showCloseIcon = TModule.optional(TModule.boolean),
	onCloseFocusedWidget = TModule.optional(TModule.callback),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	defaultFocusRef = if FFlagLuaAppsDefaultSelection then TModule.optional(TModule.callback) else nil,
	searchParameters = TModule.optional(TModule.table),
	searchInCatalog = TModule.optional(TModule.table),
	dataStatus = TModule.string,
	currentPage = TModule.optional(TModule.table),
	tryOnItems = TModule.optional(TModule.table),
	tryOnLookId = TModule.optional(TModule.string),
	fullView = TModule.optional(TModule.userdata),
	focusedWidget = TModule.optional(TModule.table),
	hideTopBar = TModule.optional(TModule.boolean),
	widgetRequestId = TModule.optional(TModule.string),
	selectedCategoryId = TModule.optional(TModule.string),
	selectedSubcategoryId = TModule.optional(TModule.string),
	selectedSearchCategoryId = TModule.optional(TModule.string),
	selectedSearchSubcategoryId = TModule.optional(TModule.string),
	selectedCategory = TModule.optional(TModule.table),
	selectedSearchCategory = TModule.optional(TModule.table),
	selectedSearchSubcategory = TModule.optional(TModule.table),
	widgetDataStatus = TModule.optional(TModule.string),
	hasWidgets = TModule.boolean,
	sortAndFilters = TModule.optional(TModule.table),
	externalNavigationRequestParams = TModule.table,
	itemInfos = TModule.table,
	analyticsMetadata = TModule.optional(TModule.table),
	filterCount = if FFlagAXMoveAllTabToWidgetOnly then TModule.number else nil,
	dispatchLoadMore = TModule.callback,
	dispatchSetResultsListFocusedWidget = TModule.callback,
	dispatchClearResultsListFocusedWidget = TModule.callback,
	dispatchApplySduiFocusedSort = if FFlagAXMigrateAllTabToSduiDev then TModule.callback else nil,
	dispatchClearSduiFocusedSort = if FFlagAXMigrateAllTabToSduiDev then TModule.callback else nil,
	dispatchCatalogTilesLatencyStartTracker = if GetFFlagEnableCatalogTileLoadingLatencyModule() then TModule.callback else nil,
	fetchItemData = TModule.callback,
	handleDeepLinkEquipError = TModule.callback,
	equipCatalogDeepLinkItem = TModule.callback,
	catalogAnalytics = TModule.table,
	axAnalytics = TModule.table,
	networking = TModule.callback,
	avatarRoute = AvatarRoute.Interface,
	namedRefs = TModule.table,
	navigation = TModule.table,
	adaptiveScrolling = TModule.optional(TModule.any),
	visibilityRatioBinding = if FFlagAXHideMenuOnScroll then TModule.optional(TModule.table) else nil,
	focusNavigationBindingsRef = if FFlagAXMigrateMainNavigationInputBindings then TModule.callback else nil,
	tagBasedImpressionsDetectorExtensions = if FFlagAXItemDetailsIxpExposure then TModule.table else nil,
	hasProcessedMarketplaceFetcher = if FFlagAXMoveAllTabToWidgetOnly then TModule.boolean else nil,
	isFetchingMarketplaceError = if FFlagAXMoveAllTabToWidgetOnly or FFlagAXCatalogCategoriesSDUI or FFlagAXMigrateAllTabToSduiDev then TModule.boolean else nil,
	shouldPageUseWidgetOnly = if FFlagAXMoveAllTabToWidgetOnly then TModule.boolean else nil,
	showSduiResults = if FFlagAXMigrateAllTabToSduiDev then TModule.boolean else nil,
	context = if FFlagAXMigrateAllTabToSduiDev then TModule.optional(TModule.string) else nil
})

function ResultsList.init(p1)
	-- upvalues: RoactModule (copy), Signal (copy), RetrievalStatusModule (copy), PromiseModule (copy), AXFixResultListCrash (copy), MutedErrorModule (copy), FFlagAXMigrateAllTabToSduiDev (copy), FilterUtilsModule (copy), GetFFlagEnableCatalogTileLoadingLatencyModule (copy), TTIPerformanceManager (copy), OrganicTTIMilestoneManager (copy)
	p1.state = {
		restorePreviousChildFocus = true,
		numItemsPerRow = 0,
		navBarSizeY = 0,
		showFailedState = false
	}
	p1.lastYPosition = 0
	p1.scrollingFrameRef = p1.props.scrollingFrameRef or RoactModule.createRef()
	p1.navBarRef = RoactModule.createRef()
	p1.topPanelRef = RoactModule.createRef()
	p1.gridRef = RoactModule.createRef()
	p1.pillBarRef = RoactModule.createRef()
	p1.emptyStateRef = RoactModule.createRef()
	p1.widgetFlatListRef = RoactModule.createRef()
	p1.topPanelHeightBinding = nil
	p1.updateTopPanelHeightBinding = nil
	p1.topPanelHeightBinding, p1.updateTopPanelHeightBinding = RoactModule.createBinding(0)
	p1.impressionsReported = {}
	p1.itemDetailsPeekViewRefs = p1.props.itemDetailsPeekViewRefs
	
	function p1.onNumItemsPerRowChanged(NumItemsPerRow)
		-- upvalues: p1 (copy)
		p1:setState({ numItemsPerRow = NumItemsPerRow })
	end
	
	function p1.onNavBarSizeChanged(Vector)
		-- upvalues: p1 (copy)
		if Vector.Y ~= p1.state.navBarSizeY then
			p1:setState({ navBarSizeY = Vector.Y })
		end
	end
	
	p1.requestImpressionsSignal = Signal.new()
	
	function p1.onItemsListScroll(p2)
		-- upvalues: p1 (copy)
		p1.requestImpressionsSignal:fire()
		local AdaptiveScrolling = p1.props.adaptiveScrolling or {}
		
		if AdaptiveScrolling.onCanvasYChanged then
			AdaptiveScrolling.onCanvasYChanged(p2)
		end
	end
	
	function p1.loadMore()
		-- upvalues: p1 (copy), RetrievalStatusModule (upval), PromiseModule (upval), AXFixResultListCrash (upval), MutedErrorModule (upval)
		if p1.props.dataStatus == RetrievalStatusModule.Fetching then
			p1.retryLoadMore = true
			
			return PromiseModule.resolve("Currently fetching")
		end
		local CatalogAnalytics = p1.props.catalogAnalytics
		local SearchUuid = p1.props.searchUuid
		local SearchInCatalog = p1.props.searchInCatalog
		local SearchParameters = p1.props.searchParameters
		local DispatchLoadMoreFunction = p1.props.dispatchLoadMore
		
		if AXFixResultListCrash and not SearchInCatalog then
			SearchInCatalog = {}
			MutedErrorModule(string.format("ResultsList: searchInCatalog is nil; searchUuid: %s", (tostring(SearchUuid))))
		end
		return DispatchLoadMoreFunction(CatalogAnalytics, SearchInCatalog.keyword, SearchUuid, SearchParameters and SearchParameters.categoryInfo or nil, p1.props.networking)
	end
	
	function p1.onFocusGained()
		-- upvalues: p1 (copy)
		p1:setState({ restorePreviousChildFocus = true })
	end
	
	function p1.scrollBackToTop()
		-- upvalues: p1 (copy)
		local Current = p1.props.scrollingFrameRef.current
		
		if Current then
			Current:ScrollToTop()
		end
	end
	
	function p1.setFocusedWidget(p2)
		-- upvalues: p1 (copy)
		p1.props.dispatchSetResultsListFocusedWidget(p1.props.searchUuid, p2.id, {
			title = if p2 and p2.template then p2.template.title else nil,
			localizedTitle = if p2 and p2.template then p2.template.localizedTitle else "",
			description = if p2 and p2.template then p2.template.description else nil,
			localizedDescription = if p2 and p2.template then p2.template.localizedDescription else "",
			tooltip = if p2 and p2.template then p2.template.tooltip else nil,
			localizedTooltip = if p2 and p2.template then p2.template.localizedTooltip else ""
		})
	end
	
	function p1.clearFocusedWidget()
		-- upvalues: p1 (copy), FFlagAXMigrateAllTabToSduiDev (upval)
		p1.props.dispatchClearResultsListFocusedWidget(p1.props.searchUuid)
		
		if FFlagAXMigrateAllTabToSduiDev and p1.sduiFocusedSortContext then
			p1.props.dispatchClearSduiFocusedSort(p1.sduiFocusedSortContext)
			p1.sduiFocusedSortContext = nil
		end
	end
	
	function p1.shouldScrollBackToTopOfList(p2)
		-- upvalues: FilterUtilsModule (upval)
		local OldSortsAndFilter = p2.oldSortsAndFilter
		local NewSortsAndFilter = p2.newSortsAndFilter
		
		return p2.searchChanged or not FilterUtilsModule.areSortAndFiltersEqual(OldSortsAndFilter, NewSortsAndFilter)
	end
	
	if GetFFlagEnableCatalogTileLoadingLatencyModule() then
		TTIPerformanceManager.Surface.Marketplace.Root.startTracking()
		OrganicTTIMilestoneManager.L2.primaryDataStarted()
		OrganicTTIMilestoneManager.L3.networkFetch()
		p1.props.dispatchCatalogTilesLatencyStartTracker(p1.props.searchUuid)
	end
end

function ResultsList.getNextSelectionRight(p1, Name, Key)
	-- upvalues: AvatarScreen (copy), CryoModule (copy)
	local NextSelectionRight = p1.props.NextSelectionRight
	
	if Name == AvatarScreen.ItemDetails and Key then
		NextSelectionRight = p1.itemDetailsPeekViewRefs[Key]
		
		return NextSelectionRight
	end
	if Name == AvatarScreen.LookDetails then
		NextSelectionRight = p1.props.namedRefs[AvatarScreen.LookDetails]
		
		return NextSelectionRight
	end
	if p1.props.tryOnItems and not CryoModule.isEmpty(p1.props.tryOnItems) and Name ~= AvatarScreen.SortAndFilters and p1.props.multiTryOnBottomBarRef and p1.props.multiTryOnBottomBarRef:getValue() ~= nil then
		NextSelectionRight = p1.props.multiTryOnBottomBarRef
	end
	return NextSelectionRight
end

function ResultsList.renderResultsList(p1, p2, p3)
	-- upvalues: FFlagAXMoveAllTabToWidgetOnly (copy), RetrievalStatusModule (copy), CatalogConstantsModule (copy), FFlagAXFixWidgetOnlyTabNoItemsFound (copy), AvatarScreen (copy), ConstantsModule1 (copy), WithLocalizationFunction (copy), ImpressionEnums (copy), RoactModule (copy), OrganicEventImpressionsReporterModule (copy), FStringAXImpressionsEventNameModule (copy), GetFFlagEnableCatalogTileLoadingLatencyModule (copy), AvatarExperienceScreenSizeImpressionsDetector (copy), WidgetConstants (copy), IXPService (copy), CollectionService (copy), FFlagAXRemoveCatalogCategoryNavKey (copy), CatalogCategories (copy), FFlagAXCatalogOffersBannerEnabled (copy), FFlagAXHideMenuOnScroll (copy), Focusable (copy), FFlagEnableLeftNavOnConsole (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), FFlagAXMigrateMainNavigationInputBindings (copy), RoactGamepadModule (copy), SignalConnectionModule (copy), ReactModule (copy), ResultsListCatalogOffersBannerModule (copy), FFlagAXMigrateCatalogResultListNavigationToMVVM (copy), CatalogResultListNavigationContainerModule (copy), ResultsListTopPanelModule (copy), FFlagLuaAppsDefaultSelection (copy), FFlagAXMigrateAllTabToSduiDev (copy), CatalogSduiFeedEntryPoint (copy), EmptyState (copy), WidgetListModule (copy), FFlagAXAdaptiveScrollingFixForward (copy), ResultsListListHeaderModule (copy), FitTextLabel (copy), FFlagRenameDeprecatedUIBloxTokens (copy), TagBasedImpressionsDetector (copy)
	local SearchInCatalog = p1.props.searchInCatalog
	local ShouldPageUseWidgetOnly = if FFlagAXMoveAllTabToWidgetOnly then p1.props.shouldPageUseWidgetOnly else nil
	local HasProcessedMarketplaceFetcher = if FFlagAXMoveAllTabToWidgetOnly then ShouldPageUseWidgetOnly and p1.props.hasProcessedMarketplaceFetcher else nil
	local Key: string = p1.props.navigation.state.key
	local AvatarRoute = p1.props.avatarRoute
	local Name = AvatarRoute.current.name
	local Key1 = AvatarRoute.current.key
	local Entries = p1.state.entries
	local HasEntries: boolean = Entries and #Entries ~= 0
	local HasWidgets = p1.props.hasWidgets
	local WidgetDataStatus = p1.props.widgetDataStatus
	local NoWidgetDataStatus = p1.props.dataStatus == RetrievalStatusModule.Done and (not WidgetDataStatus or WidgetDataStatus == RetrievalStatusModule.Done)
	local CountEntries = Entries and #Entries or CatalogConstantsModule.PageFetchLimit
	local NoNoWidgetDataStatus = not NoWidgetDataStatus or (HasEntries or (p1.props.hasWidgets or FFlagAXMoveAllTabToWidgetOnly and (HasProcessedMarketplaceFetcher and p1.props.hasProcessedMarketplaceFetcher)))
	local v1 = nil
	
	if FFlagAXFixWidgetOnlyTabNoItemsFound then
		if HasProcessedMarketplaceFetcher then
			NoWidgetDataStatus = p1.props.hasProcessedMarketplaceFetcher
		end
		v1 = HasProcessedMarketplaceFetcher and (p1.props.hasProcessedMarketplaceFetcher and HasWidgets)
		NoNoWidgetDataStatus = not NoWidgetDataStatus or (HasEntries or (p1.props.hasWidgets or v1))
	end
	local HasMoreEntries = SearchInCatalog and SearchInCatalog.hasMoreEntries or nil
	local HasMoreEntries1 = HasEntries and HasMoreEntries
	local NoHasMoreEntries1 = HasEntries and not HasMoreEntries1 or (FFlagAXMoveAllTabToWidgetOnly and HasProcessedMarketplaceFetcher or FFlagAXFixWidgetOnlyTabNoItemsFound and v1)
	local _Font = p2.Font
	local BodyFont = _Font.Body.Font
	local ScaledBaseSize = _Font.BaseSize * _Font.Body.RelativeSize
	local Theme = p2.Theme
	local Color = Theme.TextMuted.Color
	local Transparency = Theme.TextMuted.Transparency
	local v2: boolean = Name ~= AvatarScreen.ItemDetails and p3 ~= nil
	local Element = nil
	local Text = ConstantsModule1.ImpressionsEvents.AvatarItems .. (if Key then string.gsub(Key, "[-{}]", "") else "")
	local NoHasWidgets: boolean = not NoNoWidgetDataStatus and not HasWidgets
	
	if not FFlagAXFixWidgetOnlyTabNoItemsFound or not HasProcessedMarketplaceFetcher then
		NoHasWidgets = NoHasWidgets and (Entries and #Entries == 0)
	end
	local v3: boolean? = nil
	local SelectedCategory = p1.props.selectedCategory
	local SelectedSearchCategory = p1.props.selectedSearchCategory
	local Flag: boolean? = nil
	local Flag1: boolean? = nil
	
	if AvatarRoute.opaque.name == AvatarScreen.Catalog and SelectedCategory.LooksWidgetContextForOrganicContent ~= nil then
		Flag = true
	end
	if AvatarRoute.opaque.name == AvatarScreen.CatalogSearch and SelectedSearchCategory.LooksWidgetContextForOrganicContent ~= nil then
		Flag1 = true
	end
	if (Flag or Flag1) and (Entries and #Entries == 0 and HasMoreEntries) then
		v3 = true
		NoHasWidgets = false
		CountEntries = 0
	end
	local Active = p1.props.focusedWidget.active
	local Title = p1.props.focusedWidget.title
	local Id = p1.props.focusedWidget.id
	local Title1 = if Active then Title else nil
	local t = {}
	local NoHasMoreEntries1_1 = NoHasMoreEntries1 or Active
	
	return WithLocalizationFunction({
		noItemsFound = "Feature.Catalog.Response.NoItemsFound",
		emptyText = "Feature.DisplayName.ErrorMessage.SomethingWentWrong",
		focusedWidgetTitle = if Title1 == "" then nil else Title1
	})(function(p4)
		-- upvalues: p1 (copy), Name (copy), Key1 (copy), ImpressionEnums (upval), Element (ref), RoactModule (upval), OrganicEventImpressionsReporterModule (upval), Key (copy), FStringAXImpressionsEventNameModule (upval), Text (copy), GetFFlagEnableCatalogTileLoadingLatencyModule (upval), AvatarExperienceScreenSizeImpressionsDetector (upval), WidgetConstants (upval), t (copy), IXPService (upval), CollectionService (upval), FFlagAXRemoveCatalogCategoryNavKey (upval), CatalogCategories (upval), HasEntries (copy), FFlagAXCatalogOffersBannerEnabled (upval), FFlagAXHideMenuOnScroll (upval), Focusable (upval), FFlagEnableLeftNavOnConsole (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), FFlagAXMigrateMainNavigationInputBindings (upval), v2 (copy), RoactGamepadModule (upval), p3 (copy), SignalConnectionModule (upval), Theme (copy), ReactModule (upval), ResultsListCatalogOffersBannerModule (upval), FFlagAXMigrateCatalogResultListNavigationToMVVM (upval), CatalogResultListNavigationContainerModule (upval), ResultsListTopPanelModule (upval), FFlagLuaAppsDefaultSelection (upval), FFlagAXMigrateAllTabToSduiDev (upval), CatalogSduiFeedEntryPoint (upval), EmptyState (upval), WidgetListModule (upval), Entries (copy), NoNoWidgetDataStatus (ref), HasMoreEntries1 (copy), NoHasMoreEntries1_1 (ref), Active (copy), Id (copy), CountEntries (ref), FFlagAXAdaptiveScrollingFixForward (upval), ResultsListListHeaderModule (upval), NoHasWidgets (ref), FitTextLabel (upval), FFlagRenameDeprecatedUIBloxTokens (upval), p2 (copy), ScaledBaseSize (copy), Color (copy), Transparency (copy), BodyFont (copy), v3 (ref), TagBasedImpressionsDetector (upval)
		local NextSelectionRight = p1:getNextSelectionRight(Name, Key1)
		Element = RoactModule.createElement(OrganicEventImpressionsReporterModule, {
			eventName = "marketplaceOrganicFELog",
			impressionsSchema = "defaultItem",
			parentRef = p1.gridRef,
			pageFilter = function(): boolean
				-- upvalues: Key (upval), Key1 (upval)
				return Key == Key1
			end,
			onRequestImpressionsSignal = p1.requestImpressionsSignal,
			eventContext = FStringAXImpressionsEventNameModule(),
			requestId = p1.props.widgetRequestId,
			impressionsTag = Text,
			searchUuid = if GetFFlagEnableCatalogTileLoadingLatencyModule() then p1.props.searchUuid else nil,
			surface = if p1.props.fromSearch then ImpressionEnums.MarketplaceSurfaceType.SEARCH else ImpressionEnums.MarketplaceSurfaceType.HOMEPAGE,
			analyticsMetadata = p1.props.analyticsMetadata
		})
		local Element1 = RoactModule.createElement(AvatarExperienceScreenSizeImpressionsDetector, {
			parentRef = p1.gridRef,
			pageFilter = function(): boolean
				-- upvalues: Key (upval), Key1 (upval)
				return Key == Key1
			end,
			onRequestImpressionsSignal = p1.requestImpressionsSignal,
			filterImpressionFunc = function(Object): boolean
				-- upvalues: WidgetConstants (upval), t (upval)
				local Attribute = Object:GetAttribute(WidgetConstants.WidgetExposureMetadata.AttributeKey)
				
				return Attribute and not t[Attribute]
			end,
			onImpressionsDetected = function(List)
				-- upvalues: WidgetConstants (upval), t (upval), IXPService (upval), p1 (upval)
				for _, value in List do
					local Attribute = value:GetAttribute(WidgetConstants.WidgetExposureMetadata.AttributeKey)
					t[Attribute] = true
					IXPService:LogUserLayerExposure(Attribute)
					local ImpressionsReported = p1.impressionsReported
					
					if not ImpressionsReported[value.Name] then
						p1.props.catalogAnalytics.widgetInteractionV2({}, WidgetConstants.ActionType.IMPRESSION)
						ImpressionsReported[value.Name] = true
					end
				end
			end,
			collectObjectsFunc = function(_)
				-- upvalues: CollectionService (upval), WidgetConstants (upval)
				return CollectionService:GetTagged(WidgetConstants.WidgetExposureMetadata.TagName)
			end
		})
		local FrameRef = p1.props.frameRef
		local BackToTopSignal = p1.props.backToTopSignal
		local AdaptiveScrolling = p1.props.adaptiveScrolling or {}
		local Y = 0
		
		if p1.props.multiTryOnBottomBarRef then
			local Value = p1.props.multiTryOnBottomBarRef:getValue()
			Y = if Value then Value.AbsoluteSize.Y else 0
		end
		local NamedRef = p1.props.namedRefs[p1.props.navigation.state.routeName .. "TopPanel"]
		local SelectedSearchCategory = p1.props.selectedSearchCategory
		
		if FFlagAXRemoveCatalogCategoryNavKey and (SelectedSearchCategory.Id == CatalogCategories.Avatars:rawValue() or true) or SelectedSearchCategory.NavigationKey == CatalogCategories.Avatars then
		end
		local HasLooksWidgetContextForOrganicContent = (if p1.props.selectedSearchSubcategory then p1.props.selectedSearchSubcategory else SelectedSearchCategory).LooksWidgetContextForOrganicContent ~= nil
		local config = {
			fromSearch = p1.props.fromSearch,
			catalogAnalytics = p1.props.catalogAnalytics,
			axAnalytics = p1.props.axAnalytics,
			searchUuid = p1.props.searchUuid,
			searchInCatalog = p1.props.searchInCatalog,
			hideTopBar = p1.props.hideTopBar,
			focusedWidget = p1.props.focusedWidget,
			showCloseIcon = p1.props.showCloseIcon,
			restorePreviousChildFocus = p1.state.restorePreviousChildFocus,
			topPanelRef = p1.topPanelRef,
			gridRef = p1.gridRef,
			hasEntries = HasEntries,
			backToTopSignal = p1.props.backToTopSignal,
			onCategoryOrSubcategoryChange = p1.props.onCategoryOrSubcategoryChange,
			onCategoryOrSubcategoryChangeById = p1.props.onCategoryOrSubcategoryChangeById,
			onCloseFocusedWidget = p1.props.onCloseFocusedWidget,
			hidePillBar = HasLooksWidgetContextForOrganicContent
		}
		
		if not FFlagAXCatalogOffersBannerEnabled then
			config.updateHeightBinding = p1.updateTopPanelHeightBinding
		end
		local MapResult = if FFlagAXHideMenuOnScroll and p1.props.visibilityRatioBinding then RoactModule.joinBindings({
			visibility = p1.props.visibilityRatioBinding,
			height = p1.topPanelHeightBinding
		}):map(function(p5): UDim2
			return UDim2.fromOffset(0, (math.floor((1 - p5.visibility) * -p5.height)))
		end) else nil
		local MapResult1 = if FFlagAXHideMenuOnScroll and p1.props.visibilityRatioBinding then RoactModule.joinBindings({
			visibility = p1.props.visibilityRatioBinding,
			height = p1.topPanelHeightBinding
		}):map(function(p5): UDim2
			return UDim2.new(1, 0, 1, -(p5.height * p5.visibility))
		end) else nil
		local MapResult2 = if FFlagAXHideMenuOnScroll and p1.props.visibilityRatioBinding then RoactModule.joinBindings({
			visibility = p1.props.visibilityRatioBinding,
			height = p1.topPanelHeightBinding
		}):map(function(p5): UDim2
			return UDim2.fromOffset(0, p5.height * p5.visibility)
		end) else nil
		
		return RoactModule.createElement(Focusable.Frame, {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			ClipsDescendants = not FFlagEnableLeftNavOnConsole,
			LayoutOrder = p1.props.layoutOrder,
			[RoactModule.Ref] = FrameRef,
			defaultChild = p1.topPanelRef,
			NextSelectionUp = p1.props.NextSelectionUp,
			restorePreviousChildFocus = p1.state.restorePreviousChildFocus,
			inputBindings = if FFlagAXMigrateAXToGlobalAutofocus or FFlagAXMigrateMainNavigationInputBindings then nil else v2 and {
				NavUp = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, function()
					-- upvalues: p3 (upval), p1 (upval)
					p3.moveFocusTo(p1.props.NextSelectionUp)
				end)
			} or nil
		}, {
			BackToTopSignal = if BackToTopSignal then RoactModule.createElement(SignalConnectionModule, { signal = BackToTopSignal, callback = p1.scrollBackToTop }) else nil,
			ScrollPanel = RoactModule.createElement(if FFlagAXMigrateMainNavigationInputBindings then "Frame" else Focusable.Frame, {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				ClipsDescendants = not FFlagEnableLeftNavOnConsole,
				[RoactModule.Ref] = if FFlagAXMigrateMainNavigationInputBindings then p1.props.focusNavigationBindingsRef else nil
			}, {
				TopPanel = if FFlagAXCatalogOffersBannerEnabled then RoactModule.createElement(Focusable.Frame, {
					BackgroundTransparency = Theme.BackgroundMuted.Transparency,
					BackgroundColor3 = Theme.BackgroundMuted.Color,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					ZIndex = 2,
					ref = NamedRef,
					Position = if FFlagAXHideMenuOnScroll then MapResult else nil,
					[RoactModule.Change.AbsoluteSize] = function(Frame)
						-- upvalues: p1 (upval)
						p1.updateTopPanelHeightBinding(Frame.AbsoluteSize.Y)
					end
				}, {
					ListLayout = RoactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 0)
					}),
					OffersBanner = if FFlagAXCatalogOffersBannerEnabled and p1.props.hideTopBar ~= true then RoactModule.createElement("Frame", {
						BorderSizePixel = 0,
						LayoutOrder = 0,
						BackgroundTransparency = Theme.BackgroundMuted.Transparency,
						BackgroundColor3 = Theme.BackgroundMuted.Color,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						OffersBanner = ReactModule.createElement(ResultsListCatalogOffersBannerModule)
					}) else nil,
					Navigation = RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						LayoutOrder = 1,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						Content = RoactModule.createElement(if FFlagAXMigrateCatalogResultListNavigationToMVVM then CatalogResultListNavigationContainerModule else ResultsListTopPanelModule, config)
					})
				}) else RoactModule.createElement(Focusable.Frame, {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					ref = NamedRef,
					Position = if FFlagAXHideMenuOnScroll then MapResult else nil
				}, RoactModule.createElement(if FFlagAXMigrateCatalogResultListNavigationToMVVM then CatalogResultListNavigationContainerModule else ResultsListTopPanelModule, config)),
				ListFrame = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ref = if FFlagLuaAppsDefaultSelection then p1.props.defaultFocusRef else nil,
					Size = if FFlagAXHideMenuOnScroll and MapResult1 then MapResult1 else p1.topPanelHeightBinding:map(function(p5): UDim2
						return UDim2.new(1, 0, 1, -p5)
					end),
					Position = if FFlagAXHideMenuOnScroll and MapResult2 then MapResult2 else p1.topPanelHeightBinding:map(function(YOffset): UDim2
						return UDim2.fromOffset(0, YOffset)
					end)
				}, if FFlagAXMigrateAllTabToSduiDev and p1.props.showSduiResults then {
					SduiResults = ReactModule.createElement(CatalogSduiFeedEntryPoint, {
						context = p1.props.context or "",
						Size = UDim2.new(1, 0, 1, 0),
						ref = p1.gridRef
					})
				} elseif p1.state.showFailedState then {
					EmptyState = RoactModule.createElement(EmptyState, {
						onActivated = p1.props.onRetry,
						text = p4.emptyText,
						[RoactModule.Ref] = p1.emptyStateRef
					})
				} else {
					WidgetList = RoactModule.createElement(WidgetListModule.WidgetList, {
						entries = Entries,
						fromSearch = p1.props.fromSearch,
						bottomBarHeight = Y,
						showingEntries = NoNoWidgetDataStatus,
						searchUuid = p1.props.searchUuid,
						loadMore = HasMoreEntries1 and p1.loadMore or nil,
						hasMoreRows = HasMoreEntries1,
						shouldCreateEndOfScrollElement = NoHasMoreEntries1_1,
						itemDetailsPeekViewRefs = p1.itemDetailsPeekViewRefs,
						gridRef = p1.gridRef,
						flatListRef = p1.widgetFlatListRef,
						onScroll = p1.onItemsListScroll,
						focusedWidget = if Active then Id else nil,
						onWidgetFocusAcquired = p1.setFocusedWidget,
						onWidgetFocusReleased = p1.clearFocusedWidget,
						requestImpressionsSignal = p1.requestImpressionsSignal,
						onNumItemsPerRowChanged = p1.onNumItemsPerRowChanged,
						NextSelectionRight = NextSelectionRight,
						NextSelectionUp = p1.topPanelRef,
						restorePreviousChildFocus = p1.state.restorePreviousChildFocus,
						onFocusGained = if p1.state.restorePreviousChildFocus then nil else p1.onFocusGained or nil,
						numItemsExpected = CountEntries,
						scrollingEnabled = if AdaptiveScrolling.scrollingEnabledBinding then AdaptiveScrolling.scrollingEnabledBinding:map(function(p5)
							return p5
						end) elseif FFlagAXAdaptiveScrollingFixForward then true else AdaptiveScrolling.scrollingEnabled,
						listHeaderComponent = RoactModule.createElement(ResultsListListHeaderModule),
						pillBarVisible = not HasLooksWidgetContextForOrganicContent
					}),
					NoItemsFound = NoHasWidgets and RoactModule.createElement(FitTextLabel, {
						BackgroundTransparency = 1,
						width = UDim.new(1, 0),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0, if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Size.Size_800 else p2.Tokens.Global.Space_400),
						Text = p4.noItemsFound,
						TextSize = ScaledBaseSize,
						TextColor3 = Color,
						TextTransparency = Transparency,
						Font = BodyFont
					}),
					AvatarsTabError = v3 and RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = p1.props.layoutOrder,
						Size = UDim2.fromScale(1, 1)
					}, {
						EmptyState = RoactModule.createElement(EmptyState, {
							onActivated = p1.loadMore,
							text = p4.emptyText,
							[RoactModule.Ref] = p1.emptyStateRef
						})
					})
				})
			}),
			ImpressionsReporter = Element,
			WidgetImpressionsReporter = Element1,
			UnifiedImpressionsReporter = RoactModule.createElement(TagBasedImpressionsDetector, {
				parentRef = p1.gridRef,
				pageFilter = function(): boolean
					-- upvalues: Key (upval), Key1 (upval)
					return Key == Key1
				end,
				requestImpressionsSignal = p1.requestImpressionsSignal,
				extensions = p1.props.tagBasedImpressionsDetectorExtensions
			})
		})
	end)
end

function ResultsList.render(p4)
	-- upvalues: WithStyleFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy)
	return WithStyleFunction(function(p5)
		-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (upval), p4 (copy), RoactGamepadModule (upval)
		return if FFlagAXMigrateAXToGlobalAutofocus then p4:renderResultsList(p5) else RoactGamepadModule.withFocusController(function(p6)
			-- upvalues: p4 (upval), p5 (copy)
			return p4:renderResultsList(p5, p6)
		end)
	end)
end

function ResultsList.updateItems(p4, IsNotSearchUuidMatch)
	-- upvalues: FFlagAXMoveAllTabToWidgetOnly (copy), DeepLinkUtilsModule (copy), ItemDataModule (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), UnifiedEventLogEnums (copy), SendUnifiedEventLogFunction (copy), CartIdService (copy), FFlagAXFixCatalogRefreshRendering (copy), RoactModule (copy), CryoModule (copy), ConstantsModule (copy), FFlagAXMISEnableMultiShopping (copy), GetTryOnItemReducerKeyFunction (copy)
	local SearchInCatalog = p4.props.searchInCatalog
	local Items = SearchInCatalog and SearchInCatalog.items or nil
	local ShouldPageUseWidgetOnly = if FFlagAXMoveAllTabToWidgetOnly then p4.props.shouldPageUseWidgetOnly else false
	local HasProcessedMarketplaceFetcher = if FFlagAXMoveAllTabToWidgetOnly then ShouldPageUseWidgetOnly and p4.props.hasProcessedMarketplaceFetcher else nil
	local T = nil
	T = if FFlagAXMoveAllTabToWidgetOnly and HasProcessedMarketplaceFetcher then {} else Items
	
	if p4.props.externalNavigationRequestParams then
		if DeepLinkUtilsModule.newValidEquipDeepLinkExists(p4.props.externalNavigationRequestParams) then
			local ParseItemIdAndItemTypeResult, ParseItemIdAndItemTypeResult2 = DeepLinkUtilsModule.parseItemIdAndItemType(p4.props.externalNavigationRequestParams)
			local ItemDataModuleResult = ItemDataModule(p4.props.itemInfos, ParseItemIdAndItemTypeResult, ParseItemIdAndItemTypeResult2)
			
			if ItemDataModuleResult then
				local ParseItemSubTypeResult = DeepLinkUtilsModule.parseItemSubType(ParseItemIdAndItemTypeResult2, ItemDataModuleResult)
				
				if FFlagAXMISEnableMultiShoppingUnifiedEvents then
					SendUnifiedEventLogFunction({
						action = UnifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_SELECTED,
						cartId = CartIdService.getCartId(),
						itemId = ParseItemIdAndItemTypeResult,
						itemType = if ParseItemIdAndItemTypeResult2 == "Asset" then UnifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET elseif ParseItemIdAndItemTypeResult2 == "Bundle" then UnifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE else nil,
						assetType = if ParseItemIdAndItemTypeResult2 == "Asset" then ParseItemSubTypeResult else nil,
						bundleType = if ParseItemIdAndItemTypeResult2 == "Asset" then nil else ParseItemSubTypeResult,
						organicItemPrice = ItemDataModuleResult.priceInRobux
					})
				end
				p4.props.equipCatalogDeepLinkItem(p4.props.networking, p4.props.catalogAnalytics, ParseItemIdAndItemTypeResult2, ParseItemSubTypeResult, ParseItemIdAndItemTypeResult, true, p4.props.avatarRoute, p4.props.navigation, p4.props.widgetAnalyticsInfo)
			elseif not p4.props.externalNavigationRequestParams.wasItemEquipped then
				p4.props.fetchItemData(p4.props.networking, p4.props.catalogAnalytics, ParseItemIdAndItemTypeResult, ParseItemIdAndItemTypeResult2):catch(function()
					-- upvalues: p4 (copy), ParseItemIdAndItemTypeResult (copy), ParseItemIdAndItemTypeResult2 (copy), DeepLinkUtilsModule (upval), T (ref)
					p4.props.handleDeepLinkEquipError(ParseItemIdAndItemTypeResult, ParseItemIdAndItemTypeResult2)
					DeepLinkUtilsModule.removeDeepLinkEntries(T)
				end)
			end
		end
		if p4.props.externalNavigationRequestParams.wasItemEquipped then
			local CategoryInfo = if FFlagAXFixCatalogRefreshRendering and p4.props.categoryInfo then p4.props.categoryInfo else nil
			DeepLinkUtilsModule.addEquippedItemToCatalogEntries(p4.props.externalNavigationRequestParams, p4.props.tryOnItems, p4.props.searchParameters and p4.props.searchParameters.categoryInfo or (CategoryInfo or {}), T)
		end
	end
	if not T then
		p4:setState({ entries = RoactModule.None })
		
		return
	end
	local TryOnItems = p4.props.tryOnItems
	
	if IsNotSearchUuidMatch and (not CryoModule.isEmpty(TryOnItems) and (not FFlagAXMoveAllTabToWidgetOnly or not HasProcessedMarketplaceFetcher)) and p4.props.tryOnLookId == nil then
		local CategoryInfo = p4.props.searchParameters and p4.props.searchParameters.categoryInfo or {}
		local JoinResult = {}
		local Total = 0
		
		if CategoryInfo.AssetTypeIdStrings then
			for _, assetTypeIdString in CategoryInfo.AssetTypeIdStrings do
				JoinResult = CryoModule.Dictionary.join(JoinResult, { [assetTypeIdString] = ConstantsModule.ItemType.Asset })
			end
			Total += #CategoryInfo.AssetTypeIdStrings
		end
		if CategoryInfo.BundleTypes then
			for _, bundleType in CategoryInfo.BundleTypes do
				JoinResult = CryoModule.Dictionary.join(JoinResult, { [bundleType] = ConstantsModule.ItemType.Bundle })
			end
			Total += #CategoryInfo.BundleTypes
		end
		local Buffer = table.create(#T)
		
		if Total > 0 then
			for _, tryOnItem in TryOnItems do
				if (not FFlagAXMISEnableMultiShopping or not tryOnItem.lookId) and (tryOnItem.itemSubType and JoinResult[tryOnItem.itemSubType] == tryOnItem.itemType) then
					table.insert(Buffer, {
						encryptedAdTrackingData = nil,
						id = tostring(tryOnItem.itemId),
						type = tostring(tryOnItem.itemType)
					})
				end
			end
		end
		for _, value in T do
			if not TryOnItems[GetTryOnItemReducerKeyFunction(value.id, value.type)] then
				table.insert(Buffer, value)
			end
		end
		p4:setState({ entries = Buffer })
	elseif not CryoModule.List.equals(p4.state.entries, T) then
		p4:setState({ entries = T })
	end
end

function ResultsList.registerSduiFocusedSortHandler(p5)
	-- upvalues: MarketplaceCatalogSduiSelectionBridge (copy), ResolveSduiFocusedSortContextFunction (copy), CatalogUtilsModule (copy)
	if not p5.sduiFocusedSortOwnerId then
		local RouteName = p5.props.navigation.state.routeName
		p5.sduiFocusedSortOwnerId = `ResultsList:{tostring(p5)}`
		MarketplaceCatalogSduiSelectionBridge.registerFocusedSortHandler(p5.sduiFocusedSortOwnerId, function(p6)
			-- upvalues: ResolveSduiFocusedSortContextFunction (upval), RouteName (copy), p5 (copy), CatalogUtilsModule (upval)
			local ResolveSduiFocusedSortContextResult = ResolveSduiFocusedSortContextFunction({
				routeName = RouteName,
				selectedCategoryId = p5.props.selectedCategoryId,
				selectedSubcategoryId = p5.props.selectedSubcategoryId,
				getContextForWidgetsById = CatalogUtilsModule.getContextForWidgetsById,
				sortId = p6 and p6.sortId
			})
			
			if not ResolveSduiFocusedSortContextResult then return end
			if p5.props.dispatchApplySduiFocusedSort(p6, ResolveSduiFocusedSortContextResult, p5.props.networking) then
				p5.setFocusedWidget({
					id = p6.sortId,
					template = {
						localizedTitle = p6.title,
						localizedDescription = p6.description,
						localizedTooltip = p6.tooltipText
					}
				})
				p5.sduiFocusedSortContext = ResolveSduiFocusedSortContextResult
				
				return
			end
		end)
		
		return
	end
end

function ResultsList.unregisterSduiFocusedSortHandler(p5)
	-- upvalues: MarketplaceCatalogSduiSelectionBridge (copy)
	if p5.sduiFocusedSortOwnerId then
		MarketplaceCatalogSduiSelectionBridge.unregisterFocusedSortHandler(p5.sduiFocusedSortOwnerId)
		p5.sduiFocusedSortOwnerId = nil
	end
	if p5.sduiFocusedSortContext then
		p5.props.dispatchClearSduiFocusedSort(p5.sduiFocusedSortContext)
		p5.sduiFocusedSortContext = nil
	end
end

function ResultsList.didMount(p5)
	-- upvalues: FFlagAXMigrateAllTabToSduiDev (copy), AvatarScreen (copy)
	p5:updateItems(true)
	
	if FFlagAXMigrateAllTabToSduiDev and p5.props.navigation.state.routeName == AvatarScreen.Catalog then
		p5:registerSduiFocusedSortHandler()
	end
end

function ResultsList.willUnmount(p5)
	-- upvalues: FFlagAXMigrateAllTabToSduiDev (copy)
	if FFlagAXMigrateAllTabToSduiDev then
		p5:unregisterSduiFocusedSortHandler()
	end
end

function ResultsList.didUpdate(p5, p6, State)
	-- upvalues: RetrievalStatusModule (copy), FFlagAXMoveAllTabToWidgetOnly (copy), FFlagAXFixCatalogRefreshRendering (copy), CryoModule (copy), FFlagAXCatalogCategoriesSDUI (copy), FFlagAXMigrateAllTabToSduiDev (copy), AvatarScreen (copy), ConstantsModule2 (copy)
	local IsNotSearchUuidMatch = p5.props.searchUuid ~= p6.searchUuid
	
	if p5.props.fromSearch then
		IsNotSearchUuidMatch = IsNotSearchUuidMatch or p6.categoryInfo ~= p5.props.categoryInfo or not p5.props.searchInCatalog
	end
	if IsNotSearchUuidMatch and p5.state.restorePreviousChildFocus ~= false then
		p5:setState({ restorePreviousChildFocus = false })
	end
	if IsNotSearchUuidMatch or p5.state.numItemsPerRow ~= State.numItemsPerRow then
		p5.requestImpressionsSignal:fire()
	end
	local IsNotDataStatusMatch: boolean = p5.props.dataStatus == RetrievalStatusModule.Done and p6.dataStatus ~= RetrievalStatusModule.Done
	local HasProcessedMarketplaceFetcher = if FFlagAXMoveAllTabToWidgetOnly then p5.props.hasProcessedMarketplaceFetcher else nil
	local ShouldPageUseWidgetOnly = if FFlagAXMoveAllTabToWidgetOnly then p5.props.shouldPageUseWidgetOnly else false
	local SearchInCatalog = p5.props.searchInCatalog
	local Items = SearchInCatalog and SearchInCatalog.items or nil
	
	if FFlagAXMoveAllTabToWidgetOnly and (if FFlagAXMoveAllTabToWidgetOnly then ShouldPageUseWidgetOnly and HasProcessedMarketplaceFetcher else nil) and not Items then
		Items = {}
	end
	if FFlagAXFixCatalogRefreshRendering then
		local IsNotWasItemEquippedMatch: boolean = if p5.props.externalNavigationRequestParams and p6.externalNavigationRequestParams then p5.props.externalNavigationRequestParams.wasItemEquipped ~= p6.externalNavigationRequestParams.wasItemEquipped else p5.props.externalNavigationRequestParams ~= p6.externalNavigationRequestParams
		local IsNotItemInfosMatch = p5.props.itemInfos ~= p6.itemInfos
		
		if FFlagAXMoveAllTabToWidgetOnly then
			local Inverted = not CryoModule.List.equals(p5.state.entries, Items)
			local IsNotHasProcessedMarketplaceFetcherMatch = p6.hasProcessedMarketplaceFetcher ~= p5.props.hasProcessedMarketplaceFetcher
			
			if IsNotWasItemEquippedMatch or IsNotItemInfosMatch or (IsNotSearchUuidMatch or IsNotDataStatusMatch) and Inverted or IsNotHasProcessedMarketplaceFetcherMatch and Inverted then
				p5:updateItems(IsNotSearchUuidMatch)
			end
		elseif IsNotWasItemEquippedMatch or IsNotItemInfosMatch or (IsNotSearchUuidMatch or IsNotDataStatusMatch) and not CryoModule.List.equals(p5.state.entries, Items) then
			p5:updateItems(IsNotSearchUuidMatch)
		end
	else
		p5:updateItems(IsNotSearchUuidMatch)
	end
	if p5.props.dataStatus == RetrievalStatusModule.Done and p6.dataStatus == RetrievalStatusModule.Fetching and p5.retryLoadMore then
		p5.retryLoadMore = false
		p5.loadMore()
	end
	if p5.shouldScrollBackToTopOfList({
		searchChanged = IsNotSearchUuidMatch,
		oldSortsAndFilter = p6.sortAndFilters,
		newSortsAndFilter = p5.props.sortAndFilters
	}) and p5.widgetFlatListRef and p5.widgetFlatListRef.current then
		p5.widgetFlatListRef.current:scrollToOffset({ offset = 0, animated = false })
	end
	local Entries = p5.state.entries
	local IsFetchingMarketplaceError = p5.props.dataStatus == RetrievalStatusModule.Failed and not (Entries and #Entries ~= 0)
	
	if (FFlagAXCatalogCategoriesSDUI or FFlagAXMigrateAllTabToSduiDev) and p5.props.isFetchingMarketplaceError then
		IsFetchingMarketplaceError = p5.props.isFetchingMarketplaceError
	elseif FFlagAXMoveAllTabToWidgetOnly and p5.props.shouldPageUseWidgetOnly then
		IsFetchingMarketplaceError = p5.props.isFetchingMarketplaceError
	end
	if IsFetchingMarketplaceError ~= State.showFailedState and IsFetchingMarketplaceError ~= p5.state.showFailedState then
		p5:setState({ showFailedState = IsFetchingMarketplaceError })
		
		if IsFetchingMarketplaceError then
			local CatalogAnalytics = p5.props.catalogAnalytics
			
			if p5.props.navigation.state.routeName == AvatarScreen.CatalogSearch then
				CatalogAnalytics.sendAXCounter(ConstantsModule2.Counter.Errors.NoInternetConnectionErrorSearchView)
				
				return
			end
			CatalogAnalytics.sendAXCounter(ConstantsModule2.Counter.Errors.NoInternetConnectionErrorCatalogView)
		end
	end
end

local WithAdaptiveScrollingResult = WithAdaptiveScrollingFunction((WithNavigationFunction((RoactServices.connect({
	axAnalytics = AnalyticsModule,
	catalogAnalytics = AnalyticsModule1,
	networking = RoactNetworkingModule
})((WithNamedRefsModule((WithAvatarRouteModule((RoactRoduxModule.connect(function(p5, p6)
	-- upvalues: UtilsModule (copy), CatalogUtilsModule (copy), CryoModule (copy), FFlagAXMoveAllTabToWidgetOnly (copy), GetAXMarketplaceWidgetStoreFunction (copy), PerformFetch (copy), FFlagAXFixWidgetOnlyTabNoItemsFound (copy), SelectIsFullViewModule (copy), AvatarScreen (copy), SelectFilterCountModule (copy)
	local SearchUuid = p6.searchUuid
	local CategoryInfo = p6.categoryInfo
	local SearchKey = UtilsModule.getSearchKey(p5, SearchUuid)
	local HasNextEntry = false
	local Status = nil
	local FromSearch = p6.fromSearch
	
	if SearchUuid and FromSearch then
		local QueryStringForSearchWidgets = CatalogUtilsModule.getQueryStringForSearchWidgets(p5.SearchesParameters[SearchUuid])
		local SearchPageWidget = p5.AvatarExperience.Common.Widgets.SearchPageWidgetInfo[QueryStringForSearchWidgets]
		
		if SearchPageWidget then
			local Details = SearchPageWidget.Details
			HasNextEntry = typeof(Details) == "table" and next(Details) ~= nil and (CryoModule.isEmpty(CategoryInfo) or CategoryInfo.ShowWidgets) or false
		end
		Status = PerformFetch.GetStatus(p5, if FFlagAXMoveAllTabToWidgetOnly then CatalogUtilsModule.getFetchWidgetInfoFetchKey(QueryStringForSearchWidgets, nil, (GetAXMarketplaceWidgetStoreFunction(false).getDebouncedScreenSize(false))) else CatalogUtilsModule.getFetchWidgetInfoFetchKey(QueryStringForSearchWidgets))
	elseif FFlagAXFixWidgetOnlyTabNoItemsFound and CategoryInfo and p6.shouldPageUseWidgetOnly then
		local WidgetContext = CategoryInfo.WidgetContext
		
		if WidgetContext then
			local ContextWidget = p5.AvatarExperience.Common.Widgets.ContextWidgetInfo[WidgetContext]
			
			if ContextWidget then
				HasNextEntry = typeof(ContextWidget.Details) == "table" and next(ContextWidget.Details) ~= nil
			end
		end
	end
	return {
		fullView = SelectIsFullViewModule(p5, AvatarScreen.Catalog),
		searchParameters = p5.SearchesParameters[p6.searchUuid],
		sortAndFilters = p5.AvatarExperience.Catalog.SortAndFilters,
		filterCount = if FFlagAXMoveAllTabToWidgetOnly then SelectFilterCountModule(p5) else nil,
		searchInCatalog = p5.Search.SearchesInCatalog[p6.searchUuid],
		dataStatus = PerformFetch.GetStatus(p5, SearchKey),
		tryOnItems = p5.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems,
		tryOnLookId = p5.AvatarExperience.AvatarScene.OutfitTryOn.LookId,
		focusedWidget = p5.AvatarExperience.Catalog.ResultsList[p6.searchUuid] and p5.AvatarExperience.Catalog.ResultsList[p6.searchUuid].focusedWidget or {},
		hideTopBar = p5.AvatarExperience.Catalog.ResultsList[p6.searchUuid] and p5.AvatarExperience.Catalog.ResultsList[p6.searchUuid].hideTopBar or false,
		widgetRequestId = p5.AvatarExperience.Common.Widgets.WidgetInfo.RequestId,
		widgetDataStatus = Status,
		hasWidgets = HasNextEntry,
		externalNavigationRequestParams = p5.AvatarExperience.ExternalNavigationRequest.params or {},
		analyticsMetadata = p5.AvatarExperience.AnalyticsMetadata
	}
end, function(Callback)
	-- upvalues: FetchDataWithErrorToastsModule (copy), ApiFetchCatalogSearchModule (copy), SetResultsListFocusedWidgetModule (copy), ClearResultsListFocusedWidgetModule (copy), GetFFlagEnableCatalogTileLoadingLatencyModule (copy), CatalogTilesLatencyTrackerModule (copy), FetchAssetOrBundleInfoModule (copy), ToggleTryOnThunkModule (copy), EquippedDeepLinkCatalogItemModule (copy), SetCurrentToastMessageModule (copy), ClearTryOnsFunction (copy)
	local function _(p5, p6, p7, p8, p9, p10, p11, p12)
		-- upvalues: Callback (copy), SetResultsListFocusedWidgetModule (upval)
		return Callback(SetResultsListFocusedWidgetModule(p5, p6, p7, p8, p9, p10, p11, p12))
	end
	
	return {
		dispatchLoadMore = function(_, SearchKeyword, SearchUuid, CategoryInfo, p5)
			-- upvalues: Callback (copy), FetchDataWithErrorToastsModule (upval), ApiFetchCatalogSearchModule (upval)
			return Callback(FetchDataWithErrorToastsModule(ApiFetchCatalogSearchModule({
				searchKeyword = SearchKeyword,
				searchUuid = SearchUuid,
				categoryInfo = CategoryInfo
			}, p5)))
		end,
		dispatchSetResultsListFocusedWidget = function(p5, p6, p7)
			-- upvalues: Callback (copy), SetResultsListFocusedWidgetModule (upval)
			return Callback(SetResultsListFocusedWidgetModule(p5, p6, p7))
		end,
		dispatchClearResultsListFocusedWidget = function(p5)
			-- upvalues: Callback (copy), ClearResultsListFocusedWidgetModule (upval)
			return Callback(ClearResultsListFocusedWidgetModule(p5))
		end,
		dispatchCatalogTilesLatencyStartTracker = if GetFFlagEnableCatalogTileLoadingLatencyModule() then function(p5)
			-- upvalues: Callback (copy), CatalogTilesLatencyTrackerModule (upval)
			return Callback(CatalogTilesLatencyTrackerModule.StartTracking(p5))
		end else nil,
		fetchItemData = function(p5, p6, p7, p8)
			-- upvalues: Callback (copy), FetchAssetOrBundleInfoModule (upval)
			return Callback(FetchAssetOrBundleInfoModule(p5, p6, p7, p8))
		end,
		handleDeepLinkEquipError = function(ItemId, ItemType)
			-- upvalues: Callback (copy), SetCurrentToastMessageModule (upval), EquippedDeepLinkCatalogItemModule (upval), ClearTryOnsFunction (upval)
			Callback(SetCurrentToastMessageModule({
				toastMessage = "Feature.Avatar.Message.DeepLinkEquipFailed"
			}))
			Callback(EquippedDeepLinkCatalogItemModule({
				wasItemEquipped = false,
				fetchItemFailed = true,
				itemId = ItemId,
				itemType = ItemType
			}))
			Callback(ClearTryOnsFunction())
		end,
		equipCatalogDeepLinkItem = function(p5, p6, ItemType, p7, ItemId, p8, p9, p10, p11)
			-- upvalues: Callback (copy), ToggleTryOnThunkModule (upval), EquippedDeepLinkCatalogItemModule (upval)
			Callback(ToggleTryOnThunkModule(p5, p6, ItemType, p7, ItemId, p8, p9, p10, p11, true))
			Callback(EquippedDeepLinkCatalogItemModule({
				wasItemEquipped = true,
				fetchItemFailed = false,
				itemId = ItemId,
				itemType = ItemType
			}))
		end
	}
end)(ResultsList)))))))))))

local function selectItemInfos(p5)
	return {
		AssetInfos = p5.AvatarExperience.Common.AssetInfos,
		BundleInfos = p5.AvatarExperience.Common.BundleInfos
	}
end

return function(Tbl)
	-- upvalues: FFlagAXMigrateMainNavigationInputBindings (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), UseDispatchFunction (copy), RoactGamepadModule (copy), UseFocusGuiObjectFunction (copy), UseSelectorFunction (copy), ReactModule (copy), ClearResultsListFocusedWidgetModule (copy), UseResultsListFocusNavigationBindingsModule (copy), FFlagAXItemDetailsIxpExposure (copy), UseUnifiedEventImpressionsReporterFunction (copy), GetCatalogCategoriesStoreModule (copy), UseSignalStateFunction (copy), FFlagAXHideMenuOnScroll (copy), UseAnimatedVisibilityFunction (copy), SignalsReactModule (copy), FFlagAXCatalogCategoriesSDUI (copy), FFlagAXMoveAllTabToWidgetOnly (copy), FFlagAXMigrateAllTabToSduiDev (copy), StoresModule (copy), GetUseSelectorDeepEqualsFunction (copy), SelectFilterCountModule (copy), GetShouldPageUseWidgetOnlyFetcherFunction (copy), selectItemInfos (copy), TutilsModule (copy), UseResultsAreSduiEnabledModule (copy), UseStoreFunction (copy), UseApplySduiFocusedSortFunction (copy), SetWidgetInfoModule (copy), SetHydratedWidgetDataModule (copy), WebApiModule (copy), UseClearSduiFocusedSortFunction (copy), ClearWidgetInfoModule (copy), FFlagSduiMarketplaceCatalogSortSupport (copy), CatalogPageMonolithDependenciesProviderModule (copy), WithAdaptiveScrollingResult (ref)
	local Copy = table.clone(Tbl)
	
	if FFlagAXMigrateMainNavigationInputBindings then
		local v4 = if FFlagAXMigrateAXToGlobalAutofocus then function(p5)
			return p5.AvatarExperience.Catalog.ResultsList
		end else nil
		local UseDispatchResult = if FFlagAXMigrateAXToGlobalAutofocus then UseDispatchFunction() else nil
		local UseFocusControllerResult = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactGamepadModule.useFocusController()
		local UseFocusGuiObjectResult = if FFlagAXMigrateAXToGlobalAutofocus then UseFocusGuiObjectFunction() else nil
		local Active = nil
		
		if FFlagAXMigrateAXToGlobalAutofocus then
			local UseSelectorResult = UseSelectorFunction(v4)
			local FocusedWidget = UseSelectorResult[Tbl.searchUuid] and UseSelectorResult[Tbl.searchUuid].focusedWidget
			Active = if FocusedWidget then FocusedWidget.active else false
		end
		Copy.focusNavigationBindingsRef = UseResultsListFocusNavigationBindingsModule({
			onNavigateBack = ReactModule.useCallback(function(p5)
				-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (upval), Active (ref), UseDispatchResult (ref), ClearResultsListFocusedWidgetModule (upval), Tbl (copy), UseFocusGuiObjectResult (copy), UseFocusControllerResult (copy)
				p5.cancelled = true
				
				if not FFlagAXMigrateAXToGlobalAutofocus then
					UseFocusControllerResult.moveFocusTo(Tbl.NextSelectionUp)
				elseif Active then
					UseDispatchResult(ClearResultsListFocusedWidgetModule(Tbl.searchUuid))
					
					if type(Tbl.onCloseFocusedWidget) == "function" then
						Tbl.onCloseFocusedWidget()
						
						return
					end
				elseif UseFocusGuiObjectResult and Tbl.NextSelectionUp and Tbl.NextSelectionUp.current then
					UseFocusGuiObjectResult(Tbl.NextSelectionUp.current)
					
					return
				end
			end, {
				if FFlagAXMigrateAXToGlobalAutofocus then UseFocusGuiObjectResult else UseFocusControllerResult,
				Tbl.NextSelectionUp, if FFlagAXMigrateAXToGlobalAutofocus then Active else nil,
				if FFlagAXMigrateAXToGlobalAutofocus then Tbl.searchUuid else nil,
				if FFlagAXMigrateAXToGlobalAutofocus then UseDispatchResult else nil,
				if FFlagAXMigrateAXToGlobalAutofocus then Tbl.onCloseFocusedWidget else nil
			})
		}, Tbl.frameRef)
	end
	if FFlagAXItemDetailsIxpExposure then
		local UseUnifiedEventImpressionsReporterResult = UseUnifiedEventImpressionsReporterFunction()
		Copy.tagBasedImpressionsDetectorExtensions = ReactModule.useMemo(function()
			-- upvalues: UseUnifiedEventImpressionsReporterResult (copy)
			return { UseUnifiedEventImpressionsReporterResult }
		end, { UseUnifiedEventImpressionsReporterResult })
	end
	local CatalogSelectionStore = GetCatalogCategoriesStoreModule.getCatalogSelectionStore()
	Copy.selectedCategoryId = UseSignalStateFunction(CatalogSelectionStore.selectedCategoryId)
	Copy.selectedSubcategoryId = UseSignalStateFunction(CatalogSelectionStore.selectedSubcategoryId)
	local CatalogSearchSelectionStore = GetCatalogCategoriesStoreModule.getCatalogSearchSelectionStore()
	Copy.selectedSearchCategoryId = UseSignalStateFunction(CatalogSearchSelectionStore.selectedCategoryId)
	Copy.selectedSearchSubcategoryId = UseSignalStateFunction(CatalogSearchSelectionStore.selectedSubcategoryId)
	local UseSignalStateResult = UseSignalStateFunction(CatalogSelectionStore.selectedCategory)
	Copy.selectedCategory = UseSignalStateResult
	local UseSignalStateResult1 = UseSignalStateFunction(CatalogSearchSelectionStore.selectedCategory)
	Copy.selectedSearchCategory = UseSignalStateResult1
	Copy.selectedSearchSubcategory = UseSignalStateFunction(CatalogSearchSelectionStore.selectedSubcategory)
	local UseSignalStateResult2 = if Tbl.fromSearch then UseSignalStateResult1 else UseSignalStateResult
	Copy.categoryInfo = UseSignalStateResult2
	
	if FFlagAXHideMenuOnScroll then
		local UseAnimatedVisibilityResult = UseAnimatedVisibilityFunction()
		Copy.visibilityRatioBinding = if UseAnimatedVisibilityResult then SignalsReactModule.useSignalBinding(UseAnimatedVisibilityResult.animatedMenusStore.getVisibilityRatio) else ReactModule.createBinding(1)
	end
	if FFlagAXCatalogCategoriesSDUI or FFlagAXMoveAllTabToWidgetOnly or FFlagAXMigrateAllTabToSduiDev then
		local FetchMarketplaceStore = StoresModule.getFetchMarketplaceStore(false)
		local UseSignalStateResult3 = UseSignalStateFunction(FetchMarketplaceStore.getFetchingMarketplaceError)
		local UseSignalStateResult31 = if FFlagAXCatalogCategoriesSDUI or FFlagAXMigrateAllTabToSduiDev then UseSignalStateFunction(FetchMarketplaceStore.getCatalogCategoriesError) else nil
		Copy.isFetchingMarketplaceError = UseSignalStateResult3
		
		if FFlagAXCatalogCategoriesSDUI or FFlagAXMigrateAllTabToSduiDev then
			Copy.isFetchingMarketplaceError = UseSignalStateResult3 or UseSignalStateResult31
		end
		if FFlagAXMoveAllTabToWidgetOnly then
			Copy.hasProcessedMarketplaceFetcher = UseSignalStateFunction(FetchMarketplaceStore.getFetchingMarketplaceProcessed)
			local UseSelectorResult = UseSelectorFunction(ReactModule.useCallback(function(p5)
				-- upvalues: Tbl (copy)
				return p5.SearchesParameters[Tbl.searchUuid]
			end, { Tbl.searchUuid }), GetUseSelectorDeepEqualsFunction())
			Copy.shouldPageUseWidgetOnly = GetShouldPageUseWidgetOnlyFetcherFunction(Copy.categoryInfo, UseSelectorFunction(SelectFilterCountModule), UseSelectorResult and UseSelectorResult.searchKeyword)
		end
	end
	Copy.itemInfos = UseSelectorFunction(selectItemInfos, TutilsModule.shallowEqual)
	
	if FFlagAXMigrateAllTabToSduiDev then
		local UseSelectorResult = UseSelectorFunction((ReactModule.useCallback(function(p5)
			-- upvalues: Tbl (copy)
			local Results = p5.AvatarExperience.Catalog.ResultsList[Tbl.searchUuid]
			
			return Results and Results.focusedWidget and Results.focusedWidget.active or false
		end, { Tbl.searchUuid })))
		local WidgetContext = UseSignalStateResult2 and UseSignalStateResult2.WidgetContext or ""
		Copy.showSduiResults = UseResultsAreSduiEnabledModule() and not UseSelectorResult
		Copy.context = WidgetContext
		local UseStoreResult = UseStoreFunction()
		Copy.dispatchApplySduiFocusedSort = UseApplySduiFocusedSortFunction({
			SetWidgetInfo = SetWidgetInfoModule,
			SetHydratedWidgetData = SetHydratedWidgetDataModule,
			CatalogWebApi = WebApiModule,
			getHydratedWidgetData = ReactModule.useCallback(function()
				-- upvalues: UseStoreResult (copy)
				return UseStoreResult:getState().AvatarExperience.Common.Widgets.HydratedWidgetData
			end, { UseStoreResult })
		})
		Copy.dispatchClearSduiFocusedSort = UseClearSduiFocusedSortFunction({ ClearWidgetInfo = ClearWidgetInfoModule })
	end
	return if FFlagSduiMarketplaceCatalogSortSupport then ReactModule.createElement(CatalogPageMonolithDependenciesProviderModule, nil, ReactModule.createElement(WithAdaptiveScrollingResult, Copy)) else ReactModule.createElement(WithAdaptiveScrollingResult, Copy)
end