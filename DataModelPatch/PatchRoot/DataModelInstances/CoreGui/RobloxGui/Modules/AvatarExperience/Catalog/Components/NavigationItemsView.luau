local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local TModule = require(CorePackages.Packages.t)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local RobloxAppEnumsModule = require(CorePackages.Workspace.Packages.RobloxAppEnums)
local NamedRefConstantsModule = require(Modules.AvatarExperience.Common.NamedRefConstants)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local AvatarExperienceExperimentsModule = require(CorePackages.Workspace.Packages.AvatarExperienceExperiments)
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local SendAXCounterV2Function = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2
local FFlagAXLegacyIXPExposureLogging = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXLegacyIXPExposureLogging
local ResultsListModule = require(Modules.AvatarExperience.Catalog.Components.Search.ResultsList)
local RemoveSearchInCatalogModule = require(Modules.AvatarExperience.Catalog.Actions.RemoveSearchInCatalog)
local SetSearchParametersModule = require(Modules.LuaApp.Actions.SetSearchParameters)
local SetSearchTypeModule = require(Modules.LuaApp.Actions.SetSearchType)
local WithContextValueModule = require(Modules.AvatarExperience.Common.withContextValue)
local PageObjectManagerContextModule = require(Modules.AvatarExperience.Common.Context.PageObjectManagerContext)
local WithAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local DeepLinkUtilsModule = require(Modules.AvatarExperience.Common.DeepLinkUtils)
local ClearSelectedTopicsModule = require(Modules.AvatarExperience.Catalog.Actions.ClearSelectedTopics)
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local FetchCatalogSearchWithSponsoredItemsModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchCatalogSearchWithSponsoredItems)
local FetchWidgetInfoModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchWidgetInfo)
local WithNamedRefsModule = require(Modules.AvatarExperience.Common.Context.withNamedRefs)
local ResetSortAndFiltersModule = require(Modules.AvatarExperience.Catalog.Actions.ResetSortAndFilters)
local ResetSortAndFiltersThunkModule = require(Modules.AvatarExperience.Catalog.Thunks.ResetSortAndFiltersThunk)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local GetAXMarketplaceWidgetStoreFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Stores.getAXMarketplaceWidgetStore
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local FFlagAXRemoveDupSearchCallModule = require(Modules.AvatarExperience.Flags.FFlagAXRemoveDupSearchCall)
local FFlagAXResetAnalyticsMetadataOnFilterResetModule = require(Modules.AvatarExperience.Flags.FFlagAXResetAnalyticsMetadataOnFilterReset)
local CatalogTilesLatencyTrackerModule = require(Modules.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker)
local GetFFlagEnableCatalogTileLoadingLatencyModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableCatalogTileLoadingLatency)
local NavigationItemsView = RoactModule.PureComponent:extend("NavigationItemsView")
local FFlagAXEnableCatalogCreatorHttpLinkModule = require(Modules.LuaApp.Flags.FFlagAXEnableCatalogCreatorHttpLink)
local FFlagAXEditorSubcategoryFilters = AvatarExperienceFlagsModule.FFlagAXEditorSubcategoryFilters
local AXPrefetchMarketplaceIXP = AvatarExperienceExperimentsModule.AXPrefetchMarketplaceIXP
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local UseMarketplaceResultsFetcherModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Hooks.useMarketplaceResultsFetcher)
local UseMarketplaceResultsFetcherSduiModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Hooks.useMarketplaceResultsFetcherSdui)
local UseDispatchPendingCatalogDeepLinkModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Hooks.useDispatchPendingCatalogDeepLink)
local UseResultsAreSduiEnabledModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Hooks.useResultsAreSduiEnabled)
local UseSduiWidgetTTIPrimaryDataReadyModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Hooks.useSduiWidgetTTIPrimaryDataReady)
local UseSduiWidgetTTITileLatencyModule = require(Modules.AvatarExperience.Common.Hooks.TileLatency.useSduiWidgetTTITileLatency)
local SduiWidgetTTITileLatencyContext = require(CorePackages.Workspace.Packages.AvatarExperienceServerDrivenUi).Context.SduiWidgetTTITileLatencyContext
local UseGetSelectedCategoryAndSubcategoryIdModule = require(Modules.AvatarExperience.Catalog.Hooks.useGetSelectedCategoryAndSubcategoryId)
local FFlagAXUnifiedMarketplaceResultsFetcher = AvatarExperienceFlagsModule.FFlagAXUnifiedMarketplaceResultsFetcher
local FFlagAXPrefetchOnlyWithinTTL = AvatarExperienceFlagsModule.FFlagAXPrefetchOnlyWithinTTL
local FIntAXPrefetchTTL = AvatarExperienceFlagsModule.FIntAXPrefetchTTL
local AXCatalogRealTimeRecommendationsIXP = AvatarExperienceExperimentsModule.AXCatalogRealTimeRecommendationsIXP
local AXCatalogExitReEnterRefreshInterval = game:DefineFastInt("AXCatalogExitReEnterRefreshInterval", 60)
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI
local FFlagAXPassScreenSizeToWidgetApi = AvatarExperienceFlagsModule.FFlagAXPassScreenSizeToWidgetApi
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlagsModule.FFlagAXMigrateAllTabToSduiDev
local FFlagAXSduiWidgetsTTITracking = AvatarExperienceFlagsModule.FFlagAXSduiWidgetsTTITracking
local UserIsInExperiment = AvatarExperienceFlagsModule.FFlagsAXPrefetchMarketplaceThumbnailsXP.UserIsInExperiment
local AvatarExperienceTTIPerformanceModule = require(CorePackages.Workspace.Packages.AvatarExperienceTTIPerformance)
local TTIPerformanceManager = AvatarExperienceTTIPerformanceModule.TTIPerformanceManager
local OrganicTTIMilestoneManager = AvatarExperienceTTIPerformanceModule.OrganicTTIMilestoneManager
local FFlagLuaAppsDefaultSelection = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppsDefaultSelection
local GetCatalogCategoriesStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local UseSignalStateFunction = SignalsReactModule.useSignalState
local SelectFilterCountModule = require(Modules.AvatarExperience.Catalog.Selectors.selectFilterCount)
local GetShouldPageUseWidgetOnlyFetcherFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Utils.getShouldPageUseWidgetOnlyFetcher
local config = {
	[AvatarScreen.AvatarEditor] = true,
	[AvatarScreen.ProfilePictureEditorEmotes] = true,
	[AvatarScreen.MySharedAvatars] = true,
	[AvatarScreen.SearchLandingFocusedWidgetPage] = if AvatarExperienceCommonModule.Experiments.AXRecentlyViewedSearchItemsIXPTest.isEnabled() then true else nil
}
NavigationItemsView.validateProps = TModule.strictInterface({
	defaultChildRef = TModule.optional(TModule.table),
	defaultFocusRef = if FFlagLuaAppsDefaultSelection then TModule.optional(TModule.callback) else nil,
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	multiTryOnBottomBarRef = TModule.optional(TModule.table),
	itemDetailsPeekViewRefs = TModule.table,
	categoryId = TModule.string,
	subcategoryId = TModule.optional(TModule.string),
	minPrice = TModule.number,
	maxPrice = TModule.number,
	selectedTopics = TModule.optional(TModule.table),
	catalogSort = TModule.string,
	catalogSortAggregation = TModule.string,
	searchParameters = TModule.optional(TModule.table),
	searchTime = TModule.optional(TModule.number),
	searchUuid = TModule.string,
	categoryInfo = TModule.table,
	creatorFilter = TModule.string,
	salesTypeFilter = TModule.string,
	unavailableItemFilter = TModule.string,
	wearTimeFilter = TModule.optional(TModule.string),
	widgetFetchTime = TModule.optional(TModule.number),
	externalNavigationRequest = if FFlagAXEnableCatalogCreatorHttpLinkModule then TModule.table else nil,
	isRecentMarketplaceUser = if AXPrefetchMarketplaceIXP.isEnabled() then TModule.optional(TModule.boolean) else nil,
	screenSize = if FFlagAXPassScreenSizeToWidgetApi then TModule.string else nil,
	filterCount = if FFlagAXPassScreenSizeToWidgetApi then TModule.number else nil,
	setSearchType = TModule.callback,
	setSearchParameters = TModule.callback,
	dispatchSearch = TModule.callback,
	fetchWidgetInfo = TModule.callback,
	dispatchRemoveSearch = TModule.callback,
	clearSelectedTopics = TModule.callback,
	resetSortAndFilters = TModule.callback,
	dispatchCatalogTilesLatencyStartTracker = if GetFFlagEnableCatalogTileLoadingLatencyModule() then TModule.callback else nil,
	pageObjectManager = TModule.optional(TModule.table),
	avatarRoute = AvatarExperienceNavigationModule.AvatarRoute.AvatarRoute.Interface,
	namedRefs = TModule.table,
	networking = TModule.callback,
	catalogAnalytics = TModule.table,
	hasPrefetchedMarketplace = if AXPrefetchMarketplaceIXP.isEnabled() or FFlagAXUnifiedMarketplaceResultsFetcher then TModule.optional(TModule.boolean) else nil,
	isPrefetchingMarketplace = if AXPrefetchMarketplaceIXP.isEnabled() or FFlagAXUnifiedMarketplaceResultsFetcher then TModule.optional(TModule.boolean) else nil,
	fetchMarketplace = if AXPrefetchMarketplaceIXP.isEnabled() or FFlagAXUnifiedMarketplaceResultsFetcher then TModule.optional(TModule.callback) else nil,
	fetchedMarketplaceTimestamp = if FFlagAXPrefetchOnlyWithinTTL then TModule.optional(TModule.number) else nil,
	resultsAreSduiEnabled = if FFlagAXMigrateAllTabToSduiDev then TModule.optional(TModule.boolean) else nil
})

local function _(p1): boolean
	-- upvalues: AvatarScreen (copy)
	return p1.avatarRoute.opaque.name == AvatarScreen.Catalog
end

local _ = function(p1): boolean
	-- upvalues: AvatarScreen (copy)
	return p1.avatarRoute.opaque.name == AvatarScreen.CatalogSearch
end

local Callback = if AXCatalogRealTimeRecommendationsIXP.isEnabled() then function(p1): boolean
	-- upvalues: AvatarScreen (copy), ConstantsModule1 (copy)
	if p1.avatarRoute.opaque.name == AvatarScreen.Catalog then
		local CategoryInfo = p1.categoryInfo
		
		return if CategoryInfo then CategoryInfo.Id == ConstantsModule1.DefaultCatalogCategoryId else false
	else
		return false
	end
end else nil

function NavigationItemsView.init(p1)
	-- upvalues: AvatarScreen (copy), NamedRefConstantsModule (copy), RoactModule (copy), Signal (copy), AXPrefetchMarketplaceIXP (copy), AXCatalogRealTimeRecommendationsIXP (copy), FFlagAXMigrateAllTabToSduiDev (copy), RobloxAppEnumsModule (copy), CatalogUtilsModule (copy), FFlagAXCatalogCategoriesSDUI (copy), FFlagAXUnifiedMarketplaceResultsFetcher (copy)
	p1.itemsListRef = p1.props.namedRefs[AvatarScreen.Catalog .. NamedRefConstantsModule.ItemsList]
	p1.scrollingFrameRef = RoactModule.createRef()
	p1.navBarRef = RoactModule.createRef()
	p1.backToTopSignal = Signal.new()
	p1:setState({
		restorePreviousChildFocus = true,
		isInitialPrefetch = if AXPrefetchMarketplaceIXP.isEnabled() then p1.props.isInitialPrefetch else nil,
		hasEnteredAvatarExperience = not AXCatalogRealTimeRecommendationsIXP.isEnabled() and nil
	})
	
	if AXCatalogRealTimeRecommendationsIXP.isEnabled() or FFlagAXMigrateAllTabToSduiDev then
		p1.lastMarketplaceFetchTime = 0
	end
	function p1.dispatchInitialSearch()
		-- upvalues: p1 (copy), RobloxAppEnumsModule (upval)
		local DispatchSearchFunction = p1.props.dispatchSearch
		local SetSearchParametersFunction: (any, any, any, any, any, any, any) -> () = p1.props.setSearchParameters
		local CategoryInfo = p1.props.categoryInfo
		local SearchUuid = p1.props.searchUuid
		p1.props.setSearchType(SearchUuid, RobloxAppEnumsModule.SearchTypes.Catalog)
		SetSearchParametersFunction(SearchUuid, CategoryInfo, p1.props.catalogSort, p1.props.catalogSortAggregation, p1.props.minPrice, p1.props.maxPrice, p1.props.selectedTopics)
		
		return DispatchSearchFunction(p1.props.networking, SearchUuid, CategoryInfo)
	end
	
	function p1.fetchWidgetInfo(p2, p3)
		-- upvalues: CatalogUtilsModule (upval), p1 (copy)
		return p1.props.fetchWidgetInfo(p1.props.networking, nil, if p2 then CatalogUtilsModule.getContextForWidgetsById(p1.props.avatarRoute.opaque.name, p2, p3) else nil)
	end
	
	if FFlagAXCatalogCategoriesSDUI or FFlagAXMigrateAllTabToSduiDev then
		function p1.initialSearch()
			-- upvalues: FFlagAXUnifiedMarketplaceResultsFetcher (upval), p1 (copy), AXCatalogRealTimeRecommendationsIXP (upval), FFlagAXMigrateAllTabToSduiDev (upval)
			if FFlagAXUnifiedMarketplaceResultsFetcher then
				p1.props.fetchMarketplace()
				
				if AXCatalogRealTimeRecommendationsIXP.isEnabled() or FFlagAXMigrateAllTabToSduiDev then
					p1.lastMarketplaceFetchTime = os.time()
					
					return
				end
			else
				p1.dispatchInitialSearch()
			end
		end
		
		function p1.retrySearch()
			-- upvalues: FFlagAXUnifiedMarketplaceResultsFetcher (upval), p1 (copy), AXCatalogRealTimeRecommendationsIXP (upval), FFlagAXMigrateAllTabToSduiDev (upval)
			if FFlagAXUnifiedMarketplaceResultsFetcher then
				p1.props.fetchMarketplace(if p1.props.resultsAreSduiEnabled then { forceRefresh = true } else nil)
				
				if AXCatalogRealTimeRecommendationsIXP.isEnabled() or FFlagAXMigrateAllTabToSduiDev then
					p1.lastMarketplaceFetchTime = os.time()
					
					return
				end
			else
				p1.dispatchInitialSearch()
			end
		end
	end
end

if AXPrefetchMarketplaceIXP.isEnabled() then
	function NavigationItemsView.hasPrefetchedMarketplace(p1): boolean
		-- upvalues: IxpUtilsModule (copy), AXPrefetchMarketplaceIXP (copy), SendAXCounterV2Function (copy), ConstantsModule (copy), FFlagAXPrefetchOnlyWithinTTL (copy), FIntAXPrefetchTTL (copy), FFlagAXLegacyIXPExposureLogging (copy), UserIsInExperiment (copy), IXPServiceWrapper (copy), AppUserLayers (copy), GetFFlagEnableCatalogTileLoadingLatencyModule (copy), TTIPerformanceManager (copy), AXCatalogRealTimeRecommendationsIXP (copy), FFlagAXMigrateAllTabToSduiDev (copy)
		local TestVariable = IxpUtilsModule.readTestVariable(AXPrefetchMarketplaceIXP.EnabledForUser)
		local TestVariable1 = IxpUtilsModule.readTestVariable(AXPrefetchMarketplaceIXP.UserIsInExperiment)
		
		if not p1.props.isRecentMarketplaceUser then
			return false
		end
		SendAXCounterV2Function(ConstantsModule.Counter.PrefetchMarketplace.enteredMarketplaceAndIsRecentUser)
		
		if TestVariable1 then
			local NoFFlagAXPrefetchOnlyWithinTTL: boolean = not FFlagAXPrefetchOnlyWithinTTL or not p1.props.fetchedMarketplaceTimestamp or os.time() - p1.props.fetchedMarketplaceTimestamp <= FIntAXPrefetchTTL
			
			if not NoFFlagAXPrefetchOnlyWithinTTL then
				return false
			end
			SendAXCounterV2Function(ConstantsModule.Counter.PrefetchMarketplace.inExperimentAndIsRecentUserAndEnteredMarketplace)
			
			if FFlagAXLegacyIXPExposureLogging then
				if AXPrefetchMarketplaceIXP.logExposureEnabled and AXPrefetchMarketplaceIXP.logExposureEnabled() then
					IxpUtilsModule.logExperimentExposure(AXPrefetchMarketplaceIXP)
				end
				if UserIsInExperiment then
					IXPServiceWrapper:LogFlagLinkedUserLayerExposure(AppUserLayers.AvatarExperienceUAPerformance)
					SendAXCounterV2Function(ConstantsModule.Counter.PrefetchMarketplace.inExperimentAndIsRecentUserAndEnteredMarketplaceThumbnails)
				end
			else
				IxpUtilsModule.logExperimentExposure(AXPrefetchMarketplaceIXP)
			end
			if TestVariable and NoFFlagAXPrefetchOnlyWithinTTL then
				if GetFFlagEnableCatalogTileLoadingLatencyModule() then
					TTIPerformanceManager.Surface.Marketplace.Root.startTracking()
					p1.props.dispatchCatalogTilesLatencyStartTracker(p1.props.searchUuid)
				end
				if AXCatalogRealTimeRecommendationsIXP.isEnabled() or FFlagAXMigrateAllTabToSduiDev then
					p1.lastMarketplaceFetchTime = os.time()
				end
				p1:setState({ isInitialPrefetch = true })
				
				return true
			end
		end
		return false
	end
end
function NavigationItemsView.didMount(p1)
	-- upvalues: AXPrefetchMarketplaceIXP (copy), FFlagAXUnifiedMarketplaceResultsFetcher (copy), AXCatalogRealTimeRecommendationsIXP (copy), FFlagAXMigrateAllTabToSduiDev (copy)
	if AXPrefetchMarketplaceIXP.isEnabled() and p1:hasPrefetchedMarketplace() then return end
	if FFlagAXUnifiedMarketplaceResultsFetcher then
		p1.props.fetchMarketplace()
		
		if AXCatalogRealTimeRecommendationsIXP.isEnabled() or FFlagAXMigrateAllTabToSduiDev then
			p1.lastMarketplaceFetchTime = os.time()
			
			return
		end
	else
		p1.dispatchInitialSearch()
		p1.fetchWidgetInfo(p1.props.categoryId, p1.props.subcategoryId)
	end
end

function NavigationItemsView.searchResultsAreOld(p1, _, CategoryInfo, p2): boolean
	local SearchTime = if p2 then p2.searchTime else p1.props.searchTime
	
	return if CategoryInfo.TimeToRefresh and CategoryInfo.TimeToRefresh >= 0 and SearchTime then CategoryInfo.TimeToRefresh < tick() - SearchTime else false
end

function NavigationItemsView.updateSearchParams(p1, p2)
	-- upvalues: GetFFlagEnableCatalogTileLoadingLatencyModule (copy), TTIPerformanceManager (copy), FFlagAXSduiWidgetsTTITracking (copy), OrganicTTIMilestoneManager (copy), FFlagAXPassScreenSizeToWidgetApi (copy), GetShouldPageUseWidgetOnlyFetcherFunction (copy), ConstantsModule (copy)
	local CategoryInfo = p2.categoryInfo
	local SearchUuid = p2.searchUuid
	local DispatchSearchFunction: (any, any, any) -> () = p1.props.dispatchSearch
	local SetSearchParametersFunction: (any, any, any, any, any, any, any, any, any, any, any) -> () = p1.props.setSearchParameters
	local FetchWidgetInfoFunction: (any, any) -> () = p1.fetchWidgetInfo
	local IsNotCategoryIdMatch: boolean = p2.categoryId ~= p1.props.categoryId or p2.subcategoryId ~= p1.props.subcategoryId
	local IsNotWearTimeFilterMatch = p2.wearTimeFilter ~= p1.props.wearTimeFilter
	
	if IsNotCategoryIdMatch or p2.catalogSort ~= p1.props.catalogSort or p2.catalogSortAggregation ~= p1.props.catalogSortAggregation or p2.minPrice ~= p1.props.minPrice or p2.maxPrice ~= p1.props.maxPrice or p2.selectedTopics ~= p1.props.selectedTopics or p2.creatorFilter ~= p1.props.creatorFilter or p2.salesTypeFilter ~= p1.props.salesTypeFilter or p2.unavailableItemFilter ~= p1.props.unavailableItemFilter or IsNotWearTimeFilterMatch then
		if IsNotCategoryIdMatch then
			p1.props.clearSelectedTopics()
			local SearchParameter = p1.props.searchParameters[SearchUuid]
			
			if SearchParameter == nil then
				SetSearchParametersFunction(SearchUuid, CategoryInfo, p2.catalogSort, p2.catalogSortAggregation, p2.minPrice, p2.maxPrice, p2.selectedTopics, p2.creatorFilter, p2.salesTypeFilter, p2.unavailableItemFilter, p2.wearTimeFilter)
				
				if GetFFlagEnableCatalogTileLoadingLatencyModule() then
					TTIPerformanceManager.Surface.Marketplace.Root.startTracking()
					
					if not p1.props.resultsAreSduiEnabled or not FFlagAXSduiWidgetsTTITracking then
						OrganicTTIMilestoneManager.L2.primaryDataStarted()
						OrganicTTIMilestoneManager.L3.networkFetch()
					end
					p1.props.dispatchCatalogTilesLatencyStartTracker(SearchUuid)
				end
				DispatchSearchFunction(p1.props.networking, SearchUuid, CategoryInfo)
				FetchWidgetInfoFunction(p2.categoryId, p2.subcategoryId)
			else
				local SearchResultsAreOldResult = p1:searchResultsAreOld(SearchUuid, CategoryInfo, p2) or (SearchParameter.catalogSort and SearchParameter.catalogSort ~= p2.catalogSort or (SearchParameter.catalogSortAggregation and SearchParameter.catalogSortAggregation ~= p2.catalogSortAggregation or (SearchParameter.minPrice and SearchParameter.minPrice ~= p2.minPrice or (SearchParameter.maxPrice and SearchParameter.maxPrice ~= p2.maxPrice or (SearchParameter.selectedTopics and SearchParameter.selectedTopics ~= p2.selectedTopics or (SearchParameter.creatorFilter and SearchParameter.creatorFilter ~= p2.creatorFilter or (SearchParameter.salesTypeFilter and SearchParameter.salesTypeFilter ~= p2.salesTypeFilter or SearchParameter.unavailableItemFilter and SearchParameter.unavailableItemFilter ~= p2.unavailableItemFilter)))))))
				local ShouldPageUseWidgetOnlyFetcher = if FFlagAXPassScreenSizeToWidgetApi then GetShouldPageUseWidgetOnlyFetcherFunction(p2.categoryInfo, p2.filterCount, SearchParameter and SearchParameter.searchKeyword) else nil
				
				if FFlagAXPassScreenSizeToWidgetApi and ShouldPageUseWidgetOnlyFetcher then
					SearchResultsAreOldResult = false
				end
				if SearchResultsAreOldResult then
					if p1:searchResultsAreOld(SearchUuid, CategoryInfo, p2) then
						p1.props.catalogAnalytics.sendAXCounter(ConstantsModule.Counter.CatalogRefresh.StaleResults)
					end
					p1.props.pageObjectManager:storePageObject(SearchUuid, nil)
					p1.props.dispatchRemoveSearch(SearchUuid)
					
					if GetFFlagEnableCatalogTileLoadingLatencyModule() then
						TTIPerformanceManager.Surface.Marketplace.Root.startTracking()
						
						if not p1.props.resultsAreSduiEnabled or not FFlagAXSduiWidgetsTTITracking then
							OrganicTTIMilestoneManager.L2.primaryDataStarted()
							OrganicTTIMilestoneManager.L3.networkFetch()
						end
						p1.props.dispatchCatalogTilesLatencyStartTracker(SearchUuid)
					end
					SetSearchParametersFunction(SearchUuid, CategoryInfo, p2.catalogSort, p2.catalogSortAggregation, p2.minPrice, p2.maxPrice, p2.selectedTopics, p2.creatorFilter, p2.salesTypeFilter, p2.unavailableItemFilter, p2.wearTimeFilter)
					DispatchSearchFunction(p1.props.networking, SearchUuid, CategoryInfo)
					FetchWidgetInfoFunction(p2.categoryId, p2.subcategoryId)
				end
			end
		else
			p1.props.pageObjectManager:storePageObject(SearchUuid, nil)
			p1.props.dispatchRemoveSearch(SearchUuid)
			SetSearchParametersFunction(SearchUuid, CategoryInfo, p2.catalogSort, p2.catalogSortAggregation, p2.minPrice, p2.maxPrice, p2.selectedTopics, p2.creatorFilter, p2.salesTypeFilter, p2.unavailableItemFilter, p2.wearTimeFilter)
			DispatchSearchFunction(p1.props.networking, SearchUuid, CategoryInfo)
		end
		if p1.scrollingFrameRef.current then
			p1.scrollingFrameRef.current.CanvasPosition = Vector2.new()
		end
	end
end

function NavigationItemsView.willUpdate(p1, p2)
	-- upvalues: AvatarScreen (copy), FFlagAXRemoveDupSearchCallModule (copy)
	if p1.props.avatarRoute.opaque.name == AvatarScreen.Catalog and p2.avatarRoute.opaque.name ~= AvatarScreen.Catalog then
		p1.props.clearSelectedTopics()
		p1.props.resetSortAndFilters()
	end
	if p1.props.avatarRoute.opaque.name ~= AvatarScreen.Catalog and p2.avatarRoute.opaque.name == AvatarScreen.Catalog then
		p1.props.clearSelectedTopics()
	end
	if not FFlagAXRemoveDupSearchCallModule or p2.avatarRoute.opaque.name == AvatarScreen.Catalog then
		p1:updateSearchParams(p2)
		
		return
	end
end

function NavigationItemsView.renderWithStyle(p1, p2)
	-- upvalues: RoactModule (copy), Focusable (copy), ResultsListModule (copy), FFlagLuaAppsDefaultSelection (copy), CatalogConstantsModule (copy), FFlagAXMigrateAllTabToSduiDev (copy), FFlagAXCatalogCategoriesSDUI (copy)
	local Theme = p2.Theme
	
	return RoactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = Theme.BackgroundDefault.Transparency or 1,
		BackgroundColor3 = Theme.BackgroundDefault.Color,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		[RoactModule.Ref] = p1.props.defaultChildRef,
		restorePreviousChildFocus = p1.state.restorePreviousChildFocus,
		defaultChild = p1.navBarRef,
		NextSelectionRight = p1.props.NextSelectionRight
	}, {
		ListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 0)
		}),
		ResultsList = RoactModule.createElement(ResultsListModule, {
			fromSearch = false,
			layoutOrder = 2,
			frameRef = p1.itemsListRef,
			defaultFocusRef = if FFlagLuaAppsDefaultSelection then p1.props.defaultFocusRef else nil,
			navBarRef = p1.navBarRef,
			analyticsContext = CatalogConstantsModule.AnalyticsContext.Catalog,
			searchUuid = p1.props.searchUuid,
			scrollingFrameRef = p1.scrollingFrameRef,
			onRetry = if FFlagAXMigrateAllTabToSduiDev then p1.retrySearch elseif FFlagAXCatalogCategoriesSDUI then p1.initialSearch else p1.dispatchInitialSearch,
			NextSelectionUp = p1.props.NextSelectionUp,
			backToTopSignal = p1.backToTopSignal,
			multiTryOnBottomBarRef = p1.props.multiTryOnBottomBarRef,
			itemDetailsPeekViewRefs = p1.props.itemDetailsPeekViewRefs
		})
	})
end

function NavigationItemsView.render(p1)
	-- upvalues: WithStyleFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithStyle(p2)
	end)
end

if AXCatalogRealTimeRecommendationsIXP.isEnabled() then
	function NavigationItemsView.handleExitAndReEnterAvatarExperience(p1, p2)
		-- upvalues: Callback (copy), FFlagAXUnifiedMarketplaceResultsFetcher (copy), AXCatalogExitReEnterRefreshInterval (copy), IxpUtilsModule (copy), AXCatalogRealTimeRecommendationsIXP (copy), FFlagAXLegacyIXPExposureLogging (copy), SendAXCounterV2Function (copy), ConstantsModule (copy), FFlagAXMigrateAllTabToSduiDev (copy)
		local IsVisible = p1.props.avatarRoute.isVisible
		local IsVisible1 = p2.avatarRoute.isVisible
		
		if IsVisible and not p1.state.hasEnteredAvatarExperience then
			p1:setState({ hasEnteredAvatarExperience = true })
		end
		if IsVisible and (not IsVisible1 and p1.state.hasEnteredAvatarExperience) and Callback(p1.props) and FFlagAXUnifiedMarketplaceResultsFetcher and p1.props.fetchMarketplace then
			local Timestamp = os.time()
			
			if AXCatalogExitReEnterRefreshInterval <= Timestamp - p1.lastMarketplaceFetchTime then
				if IxpUtilsModule.readTestVariable(AXCatalogRealTimeRecommendationsIXP.UserIsInExperiment) then
					if FFlagAXLegacyIXPExposureLogging then
						if AXCatalogRealTimeRecommendationsIXP.logExposureEnabled and AXCatalogRealTimeRecommendationsIXP.logExposureEnabled() then
							IxpUtilsModule.logExperimentExposure(AXCatalogRealTimeRecommendationsIXP)
						end
					else
						IxpUtilsModule.logExperimentExposure(AXCatalogRealTimeRecommendationsIXP)
					end
				end
				SendAXCounterV2Function(ConstantsModule.Counter.FetchMarketplace.ExitAndReEnterRefreshCounter)
				
				if IxpUtilsModule.readTestVariable(AXCatalogRealTimeRecommendationsIXP.EnabledForUser) then
					SendAXCounterV2Function(ConstantsModule.Counter.FetchMarketplace.ExitAndReEnterRefreshTreatment)
					p1.props.fetchMarketplace(if FFlagAXMigrateAllTabToSduiDev and p1.props.resultsAreSduiEnabled then { forceRefresh = true } else nil)
					p1.lastMarketplaceFetchTime = Timestamp
					
					return
				end
			end
		end
	end
end
function NavigationItemsView.didUpdate(p1, p2)
	-- upvalues: AvatarScreen (copy), config (copy), AXCatalogRealTimeRecommendationsIXP (copy), FFlagAXPassScreenSizeToWidgetApi (copy), GetShouldPageUseWidgetOnlyFetcherFunction (copy), FFlagAXEnableCatalogCreatorHttpLinkModule (copy), DeepLinkUtilsModule (copy), FFlagAXMigrateAllTabToSduiDev (copy), AXCatalogExitReEnterRefreshInterval (copy), AXPrefetchMarketplaceIXP (copy), IxpUtilsModule (copy), SendAXCounterV2Function (copy), ConstantsModule (copy)
	local Name = p1.props.avatarRoute.current.name
	local Name1 = p2.avatarRoute.current.name
	
	if Name == AvatarScreen.Catalog then
		if not p1.state.restorePreviousChildFocus then
			p1:setState({ restorePreviousChildFocus = true })
		end
	elseif config[Name] and Name1 == AvatarScreen.Catalog and p1.state.restorePreviousChildFocus then
		p1:setState({ restorePreviousChildFocus = false })
	end
	if AXCatalogRealTimeRecommendationsIXP.isEnabled() then
		p1:handleExitAndReEnterAvatarExperience(p2)
	end
	local SearchParameter = if FFlagAXPassScreenSizeToWidgetApi and p1.props.searchParameters then p1.props.searchParameters[p1.props.searchUuid] else nil
	local ShouldPageUseWidgetOnlyFetcher = if FFlagAXPassScreenSizeToWidgetApi then GetShouldPageUseWidgetOnlyFetcherFunction(p1.props.categoryInfo, p1.props.filterCount, SearchParameter and SearchParameter.searchKeyword) else nil
	
	if FFlagAXPassScreenSizeToWidgetApi and p1.props.screenSize and p2.screenSize and p1.props.screenSize ~= p2.screenSize and ShouldPageUseWidgetOnlyFetcher then
		p1.props.fetchMarketplace()
	end
	if p2.avatarRoute.opaque.name == AvatarScreen.CatalogSearch and p1.props.avatarRoute.opaque.name == AvatarScreen.Catalog then
		if FFlagAXEnableCatalogCreatorHttpLinkModule then
			if p1.props.externalNavigationRequest == p2.externalNavigationRequest and not DeepLinkUtilsModule.catalogDeepLinkExists(p1.props.externalNavigationRequest) then
				p1.props.resetSortAndFilters()
			end
		else
			p1.props.resetSortAndFilters()
		end
	end
	if FFlagAXMigrateAllTabToSduiDev and p1.props.resultsAreSduiEnabled and p1.props.fetchMarketplace then
		local NoResultsAreSduiEnabled = not p2.resultsAreSduiEnabled
		local Inverted: boolean = p1.props.avatarRoute.opaque.name == AvatarScreen.Catalog and not (p2.avatarRoute.opaque.name == AvatarScreen.Catalog)
		
		if p1.props.avatarRoute.isVisible and p2.avatarRoute.isVisible and (NoResultsAreSduiEnabled or Inverted) then
			local Timestamp = os.time()
			
			if AXCatalogExitReEnterRefreshInterval <= Timestamp - (p1.lastMarketplaceFetchTime or 0) then
				p1.props.fetchMarketplace({ forceRefresh = true })
				p1.lastMarketplaceFetchTime = Timestamp
			end
		end
	end
	local ShowWidgets = p2.categoryInfo and p2.categoryInfo.ShowWidgets
	local IsNameMatch: boolean = Name == AvatarScreen.Catalog and Name1 == AvatarScreen.AvatarExperienceLandingPage
	
	if p1.props.categoryInfo and p1.props.categoryInfo.ShowWidgets and not ShowWidgets or IsNameMatch then
		if FFlagAXPassScreenSizeToWidgetApi and ShouldPageUseWidgetOnlyFetcher then
			p1.props.fetchMarketplace()
		else
			p1.fetchWidgetInfo(p1.props.categoryId, p1.props.subcategoryId)
		end
	end
	local TestVariable = if AXPrefetchMarketplaceIXP.isEnabled() then IxpUtilsModule.readTestVariable(AXPrefetchMarketplaceIXP.EnabledForUser) else nil
	local NoHasPrefetchedMarketplace = if TestVariable then p2.isPrefetchingMarketplace and not p2.hasPrefetchedMarketplace else nil
	local NoHasPrefetchedMarketplace1 = if TestVariable then not p1.props.isPrefetchingMarketplace and not p1.props.hasPrefetchedMarketplace else nil
	
	if TestVariable then
		if p1.props.hasPrefetchedMarketplace and p1.state.isInitialPrefetch then
			SendAXCounterV2Function(ConstantsModule.Counter.PrefetchMarketplace.inTreatmentAndHasPrefetchedMarketplace)
			p1:setState({ isInitialPrefetch = false })
		end
		if NoHasPrefetchedMarketplace and NoHasPrefetchedMarketplace1 and p1.state.isInitialPrefetch then
			SendAXCounterV2Function(ConstantsModule.Counter.PrefetchMarketplace.enteredMarketplaceButPrefetchFailed)
			p1.dispatchInitialSearch()
			p1.fetchWidgetInfo(p1.props.categoryId, p1.props.subcategoryId)
			p1:setState({ isInitialPrefetch = false })
		end
	end
end

local v1 = RoactServices.connect({
	networking = RoactNetworkingModule,
	catalogAnalytics = AnalyticsModule
})((WithNamedRefsModule((WithAvatarRouteModule((WithContextValueModule(RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: FFlagAXEditorSubcategoryFilters (copy), UtilsModule (copy), AXPrefetchMarketplaceIXP (copy), FFlagAXEnableCatalogCreatorHttpLinkModule (copy), FFlagAXPassScreenSizeToWidgetApi (copy), SelectFilterCountModule (copy)
	local CategoryId = p2.categoryId
	local SubcategoryId = p2.subcategoryId
	local CategoryInfo = p2.categoryInfo
	local SubcategoryFilter = if FFlagAXEditorSubcategoryFilters then p1.AvatarExperience.AvatarEditor.Categories.subcategoryFilter else nil
	local SearchUuidAndAssetTypes, _ = UtilsModule.getSearchUuidAndAssetTypes(CategoryInfo, p1.AvatarExperience.AvatarEditor.Categories.subButton, if FFlagAXEditorSubcategoryFilters then SubcategoryFilter else nil)
	
	return {
		categoryInfo = CategoryInfo,
		categoryId = CategoryId,
		subcategoryId = SubcategoryId,
		minPrice = p1.AvatarExperience.Catalog.SortAndFilters.PriceRange.minPrice,
		maxPrice = p1.AvatarExperience.Catalog.SortAndFilters.PriceRange.maxPrice,
		selectedTopics = if CategoryInfo == nil or not CategoryInfo.ShowTopics then nil else p1.AvatarExperience.Catalog.SortAndFilters.SelectedTopics,
		catalogSort = p1.AvatarExperience.Catalog.SortAndFilters.CatalogSort,
		catalogSortAggregation = p1.AvatarExperience.Catalog.SortAndFilters.CatalogSortAggregation,
		creatorFilter = p1.AvatarExperience.Catalog.SortAndFilters.CreatorFilter,
		salesTypeFilter = p1.AvatarExperience.Catalog.SortAndFilters.SalesTypeFilter,
		unavailableItemFilter = p1.AvatarExperience.Catalog.SortAndFilters.UnavailableItemFilter,
		wearTimeFilter = p1.AvatarExperience.Catalog.SortAndFilters.WearTimeFilter,
		searchParameters = p1.SearchesParameters,
		searchTime = p1.SearchTimes and p1.SearchTimes[SearchUuidAndAssetTypes] or nil,
		searchUuid = SearchUuidAndAssetTypes,
		widgetFetchTime = p1.AvatarExperience.Common.Widgets.WidgetInfo.FetchTime,
		externalNavigationRequest = if FFlagAXEnableCatalogCreatorHttpLinkModule then p1.AvatarExperience.ExternalNavigationRequest else nil,
		isRecentMarketplaceUser = if AXPrefetchMarketplaceIXP.isEnabled() then p1.AvatarExperience.Catalog.Metadata.isRecentMarketplaceUser else nil,
		filterCount = if FFlagAXPassScreenSizeToWidgetApi then SelectFilterCountModule(p1) else nil
	}
end, function(Callback)
	-- upvalues: SetSearchTypeModule (copy), SetSearchParametersModule (copy), FetchCatalogSearchWithSponsoredItemsModule (copy), FetchWidgetInfoModule (copy), RemoveSearchInCatalogModule (copy), ClearSelectedTopicsModule (copy), FFlagAXResetAnalyticsMetadataOnFilterResetModule (copy), ResetSortAndFiltersThunkModule (copy), ResetSortAndFiltersModule (copy), GetFFlagEnableCatalogTileLoadingLatencyModule (copy), CatalogTilesLatencyTrackerModule (copy)
	return {
		setSearchType = function(p1, p2)
			-- upvalues: Callback (copy), SetSearchTypeModule (upval)
			return Callback(SetSearchTypeModule(p1, p2))
		end,
		setSearchParameters = function(p1, CategoryInfo, CatalogSort, CatalogSortAggregation, MinPrice, MaxPrice, SelectedTopics, CreatorFilter, SalesTypeFilter, UnavailableItemFilter, WearTimeFilter)
			-- upvalues: Callback (copy), SetSearchParametersModule (upval)
			return Callback(SetSearchParametersModule(p1, {
				categoryInfo = CategoryInfo,
				catalogSort = CatalogSort,
				catalogSortAggregation = CatalogSortAggregation,
				minPrice = MinPrice,
				maxPrice = MaxPrice,
				selectedTopics = SelectedTopics,
				creatorFilter = CreatorFilter,
				salesTypeFilter = SalesTypeFilter,
				unavailableItemFilter = UnavailableItemFilter,
				wearTimeFilter = WearTimeFilter
			}))
		end,
		dispatchSearch = function(p1, SearchUuid, CategoryInfo)
			-- upvalues: Callback (copy), FetchCatalogSearchWithSponsoredItemsModule (upval)
			return Callback(FetchCatalogSearchWithSponsoredItemsModule(p1, {
				recordSearchTime = true,
				searchUuid = SearchUuid,
				categoryInfo = CategoryInfo
			}))
		end,
		fetchWidgetInfo = function(p1, p2, p3)
			-- upvalues: Callback (copy), FetchWidgetInfoModule (upval)
			return Callback(FetchWidgetInfoModule(p1, p2, p3))
		end,
		dispatchRemoveSearch = function(p1)
			-- upvalues: Callback (copy), RemoveSearchInCatalogModule (upval)
			Callback(RemoveSearchInCatalogModule(p1))
		end,
		clearSelectedTopics = function()
			-- upvalues: Callback (copy), ClearSelectedTopicsModule (upval)
			Callback(ClearSelectedTopicsModule())
		end,
		resetSortAndFilters = function()
			-- upvalues: FFlagAXResetAnalyticsMetadataOnFilterResetModule (upval), Callback (copy), ResetSortAndFiltersThunkModule (upval), ResetSortAndFiltersModule (upval)
			if FFlagAXResetAnalyticsMetadataOnFilterResetModule then
				Callback(ResetSortAndFiltersThunkModule())
				
				return
			else
				Callback(ResetSortAndFiltersModule())
			end
		end,
		dispatchCatalogTilesLatencyStartTracker = if GetFFlagEnableCatalogTileLoadingLatencyModule() then function(p1)
			-- upvalues: Callback (copy), CatalogTilesLatencyTrackerModule (upval)
			Callback(CatalogTilesLatencyTrackerModule.StartTracking(p1))
		end else nil
	}
end)(NavigationItemsView), PageObjectManagerContextModule.Consumer, "pageObjectManager")))))))

return function(Tbl)
	-- upvalues: AXPrefetchMarketplaceIXP (copy), IxpUtilsModule (copy), FFlagAXUnifiedMarketplaceResultsFetcher (copy), UseMarketplaceResultsFetcherModule (copy), FFlagAXPrefetchOnlyWithinTTL (copy), FFlagAXMigrateAllTabToSduiDev (copy), UseDispatchPendingCatalogDeepLinkModule (copy), UseGetSelectedCategoryAndSubcategoryIdModule (copy), UseMarketplaceResultsFetcherSduiModule (copy), ConstantsModule1 (copy), UseResultsAreSduiEnabledModule (copy), FFlagAXSduiWidgetsTTITracking (copy), UseSduiWidgetTTIPrimaryDataReadyModule (copy), UseSduiWidgetTTITileLatencyModule (copy), GetCatalogCategoriesStoreModule (copy), UseSignalStateFunction (copy), FFlagAXPassScreenSizeToWidgetApi (copy), GetAXMarketplaceWidgetStoreFunction (copy), SignalsReactModule (copy), RoactModule (copy), SduiWidgetTTITileLatencyContext (copy), v1 (ref)
	local UseMarketplaceResultsFetcherModuleResult = if AXPrefetchMarketplaceIXP.isEnabled() or FFlagAXUnifiedMarketplaceResultsFetcher then UseMarketplaceResultsFetcherModule() else nil
	local Copy = table.clone(Tbl)
	
	if ((if AXPrefetchMarketplaceIXP.isEnabled() then IxpUtilsModule.readTestVariable(AXPrefetchMarketplaceIXP.EnabledForUser) else nil) or FFlagAXUnifiedMarketplaceResultsFetcher) and UseMarketplaceResultsFetcherModuleResult then
		Copy.hasPrefetchedMarketplace = UseMarketplaceResultsFetcherModuleResult.hasFetched
		Copy.isPrefetchingMarketplace = UseMarketplaceResultsFetcherModuleResult.isFetching
		Copy.fetchMarketplace = UseMarketplaceResultsFetcherModuleResult.fetchMarketplace
		Copy.fetchedMarketplaceTimestamp = if FFlagAXPrefetchOnlyWithinTTL then UseMarketplaceResultsFetcherModuleResult.fetchedMarketplaceTimestamp else nil
	end
	local Value = nil
	
	if FFlagAXMigrateAllTabToSduiDev then
		UseDispatchPendingCatalogDeepLinkModule()
		local UseGetSelectedCategoryAndSubcategoryIdModuleResult, _ = UseGetSelectedCategoryAndSubcategoryIdModule()
		local UseMarketplaceResultsFetcherSduiModuleResult = UseMarketplaceResultsFetcherSduiModule({
			categoryId = UseGetSelectedCategoryAndSubcategoryIdModuleResult or ConstantsModule1.DefaultCatalogCategoryId
		})
		local UseResultsAreSduiEnabledModuleResult = UseResultsAreSduiEnabledModule()
		
		if FFlagAXSduiWidgetsTTITracking then
			local SearchUuid = UseMarketplaceResultsFetcherSduiModuleResult.searchUuid
			local Identifier = UseMarketplaceResultsFetcherSduiModuleResult.identifier
			UseSduiWidgetTTIPrimaryDataReadyModule({
				searchUuid = SearchUuid,
				resultsAreSduiEnabled = UseResultsAreSduiEnabledModuleResult,
				identifier = Identifier
			})
			Value = UseSduiWidgetTTITileLatencyModule({
				searchUuid = SearchUuid,
				resultsAreSduiEnabled = UseResultsAreSduiEnabledModuleResult,
				identifier = Identifier
			})
		end
		Copy.resultsAreSduiEnabled = UseResultsAreSduiEnabledModuleResult
		
		if UseResultsAreSduiEnabledModuleResult then
			Copy.hasPrefetchedMarketplace = UseMarketplaceResultsFetcherSduiModuleResult.hasFetched
			Copy.isPrefetchingMarketplace = UseMarketplaceResultsFetcherSduiModuleResult.isFetching
			Copy.fetchedMarketplaceTimestamp = UseMarketplaceResultsFetcherSduiModuleResult.fetchedMarketplaceTimestamp
			Copy.fetchMarketplace = UseMarketplaceResultsFetcherSduiModuleResult.fetchMarketplace
		end
	end
	local CatalogSelectionStore = GetCatalogCategoriesStoreModule.getCatalogSelectionStore()
	Copy.categoryId = UseSignalStateFunction(CatalogSelectionStore.selectedCategoryId)
	Copy.subcategoryId = UseSignalStateFunction(CatalogSelectionStore.selectedSubcategoryId)
	Copy.categoryInfo = UseSignalStateFunction(CatalogSelectionStore.selectedCategoryInfo)
	
	if FFlagAXPassScreenSizeToWidgetApi then
		Copy.screenSize = SignalsReactModule.useSignalState(GetAXMarketplaceWidgetStoreFunction(false).getDebouncedScreenSize)
	end
	return if FFlagAXSduiWidgetsTTITracking then RoactModule.createElement(SduiWidgetTTITileLatencyContext.Provider, { value = Value }, {
		NavigationItemsView = RoactModule.createElement(v1, Copy)
	}) else RoactModule.createElement(v1, Copy)
end