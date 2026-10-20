local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseStoreFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useStore
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local StoresModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Stores)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local PageObjectManagerContextModule = require(Modules.AvatarExperience.Common.Context.PageObjectManagerContext)
local UseGetCategoryInfoModule = require(Modules.AvatarExperience.Catalog.Hooks.useGetCategoryInfo)
local UseGetSelectedCategoryAndSubcategoryIdModule = require(Modules.AvatarExperience.Catalog.Hooks.useGetSelectedCategoryAndSubcategoryId)
local UseCatalogCategoriesFetcherModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Hooks.useCatalogCategoriesFetcher)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local AXPrefetchMarketplaceIXP = require(CorePackages.Workspace.Packages.AvatarExperienceExperiments).AXPrefetchMarketplaceIXP
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local RobloxAppEnumsModule = require(CorePackages.Workspace.Packages.RobloxAppEnums)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local FetchCatalogSearchWithSponsoredItemsModule = require(script.Parent.Parent.Utils.fetchCatalogSearchWithSponsoredItems)
local MarketplaceSubscriptionRefetchUtilsModule = require(script.Parent.Parent.Utils.MarketplaceSubscriptionRefetchUtils)
local GetSearchKeywordFromSearchesParametersFunction = MarketplaceSubscriptionRefetchUtilsModule.getSearchKeywordFromSearchesParameters
local GetShouldFetchCatalogOrganicAfterWidgetsFunction = MarketplaceSubscriptionRefetchUtilsModule.getShouldFetchCatalogOrganicAfterWidgets
local FetchHydratedWidgetsModule = require(script.Parent.Parent.Utils.fetchHydratedWidgets)
local FetchSponsoredItemsModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchSponsoredItems)
local ApiFetchCatalogSearchModule = require(Modules.AvatarExperience.Catalog.Thunks.ApiFetchCatalogSearch)
local GetCatalogCategoriesFromStoreModule = require(Modules.AvatarExperience.Catalog.GetCatalogCategoriesFromStore)
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local RemoveSearchInCatalogModule = require(Modules.AvatarExperience.Catalog.Actions.RemoveSearchInCatalog)
local ClearWidgetInfoModule = require(Modules.AvatarExperience.Catalog.Actions.ClearWidgetInfo)
local SetSearchParametersModule = require(Modules.LuaApp.Actions.SetSearchParameters)
local SetSearchTypeModule = require(Modules.LuaApp.Actions.SetSearchType)
local SetSearchTimeModule = require(Modules.LuaApp.Actions.SetSearchTime)
local CatalogTilesLatencyTrackerModule = require(Modules.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker)
local _ = require(Modules.AvatarExperience.Catalog.Reducers.SortAndFilters)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXFixPrefetchMarketplaceStartupCrash = AvatarExperienceFlagsModule.FFlagAXFixPrefetchMarketplaceStartupCrash
local FFlagAXUnifiedMarketplaceResultsFetcher = AvatarExperienceFlagsModule.FFlagAXUnifiedMarketplaceResultsFetcher
local FFlagAXPrefetchOnlyWithinTTL = AvatarExperienceFlagsModule.FFlagAXPrefetchOnlyWithinTTL
local GetFFlagEnableCatalogTileLoadingLatencyModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableCatalogTileLoadingLatency)
local FFlagAXResetFetchMarketplaceLogic = AvatarExperienceFlagsModule.FFlagAXResetFetchMarketplaceLogic
local FFlagAXMoveAllTabToWidgetOnly = AvatarExperienceFlagsModule.FFlagAXMoveAllTabToWidgetOnly
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlagsModule.FFlagAXMigrateAllTabToSduiDev
local FFlagAXFixHydratedWidgetsParams = AvatarExperienceFlagsModule.FFlagAXFixHydratedWidgetsParams
local FFlagAXFixDataProcessingMilestoneGating = AvatarExperienceFlagsModule.FFlagAXFixDataProcessingMilestoneGating
local FFlagAXMarketplaceSubscriptionRefetchListener = AvatarExperienceFlagsModule.FFlagAXMarketplaceSubscriptionRefetchListener
local AvatarExperienceTTIPerformanceModule = require(CorePackages.Workspace.Packages.AvatarExperienceTTIPerformance)
local TTIPerformanceManager = AvatarExperienceTTIPerformanceModule.TTIPerformanceManager
local WidgetsPercievedTTIManager = AvatarExperienceTTIPerformanceModule.WidgetsPercievedTTIManager
local OrganicTTIMilestoneManager = AvatarExperienceTTIPerformanceModule.OrganicTTIMilestoneManager
local SendAXCounterV2Function = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2

function selectSortAndFilters(p1)
	-- upvalues: FFlagAXFixPrefetchMarketplaceStartupCrash (copy)
	return if FFlagAXFixPrefetchMarketplaceStartupCrash and (not p1.AvatarExperience or not p1.AvatarExperience.Catalog) then nil else p1.AvatarExperience.Catalog.SortAndFilters
end

return function(p1)
	-- upvalues: AXPrefetchMarketplaceIXP (copy), IxpUtilsModule (copy), UseDispatchFunction (copy), FFlagAXResetFetchMarketplaceLogic (copy), UseSelectorFunction (copy), ReactModule (copy), PageObjectManagerContextModule (copy), UseRoactServiceFunction (copy), RoactNetworkingModule (copy), StoresModule (copy), UseSignalStateFunction (copy), FFlagAXPrefetchOnlyWithinTTL (copy), FFlagAXMoveAllTabToWidgetOnly (copy), FFlagAXCatalogCategoriesSDUI (copy), UseGetCategoryInfoModule (copy), UseGetSelectedCategoryAndSubcategoryIdModule (copy), ConstantsModule (copy), FFlagAXFixHydratedWidgetsParams (copy), GetCatalogCategoriesFromStoreModule (copy), UtilsModule (copy), MutedErrorModule (copy), UseStoreFunction (copy), FFlagAXUnifiedMarketplaceResultsFetcher (copy), UseCatalogCategoriesFetcherModule (copy), FFlagAXFixPrefetchMarketplaceStartupCrash (copy), RemoveSearchInCatalogModule (copy), GetFFlagEnableCatalogTileLoadingLatencyModule (copy), TTIPerformanceManager (copy), CatalogTilesLatencyTrackerModule (copy), SetSearchTypeModule (copy), RobloxAppEnumsModule (copy), FFlagAXMarketplaceSubscriptionRefetchListener (copy), SetSearchParametersModule (copy), CatalogUtilsModule (copy), AvatarScreen (copy), ClearWidgetInfoModule (copy), FetchSponsoredItemsModule (copy), CatalogConstantsModule (copy), Logging (copy), GetSearchKeywordFromSearchesParametersFunction (copy), ApiFetchCatalogSearchModule (copy), WidgetsPercievedTTIManager (copy), SetSearchTimeModule (copy), OrganicTTIMilestoneManager (copy), FFlagAXMigrateAllTabToSduiDev (copy), SendAXCounterV2Function (copy), FetchHydratedWidgetsModule (copy), GetShouldFetchCatalogOrganicAfterWidgetsFunction (copy), FetchCatalogSearchWithSponsoredItemsModule (copy), FFlagAXFixDataProcessingMilestoneGating (copy)
	local TestVariable = if AXPrefetchMarketplaceIXP.isEnabled() then IxpUtilsModule.readTestVariable(AXPrefetchMarketplaceIXP.EnabledForUser) else nil
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = if FFlagAXResetFetchMarketplaceLogic then UseSelectorFunction(selectSortAndFilters) else nil
	local UseContextResult = if FFlagAXResetFetchMarketplaceLogic then ReactModule.useContext(PageObjectManagerContextModule.Consumer) else nil
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworkingModule)
	local FetchMarketplaceStore = StoresModule.getFetchMarketplaceStore(false)
	local UseSignalStateResult = UseSignalStateFunction(FetchMarketplaceStore.getFetchingMarketplace)
	local UseSignalStateResult1 = UseSignalStateFunction(FetchMarketplaceStore.getFetchedMarketplace)
	local UseSignalStateResult2 = if FFlagAXPrefetchOnlyWithinTTL then UseSignalStateFunction(FetchMarketplaceStore.getFetchedMarketplaceTimestamp) else nil
	local SetFetchingMarketplaceInProgressFunction = FetchMarketplaceStore.setFetchingMarketplaceInProgress
	local SetFetchedMarketplaceCompletedFunction = FetchMarketplaceStore.setFetchedMarketplaceCompleted
	local SetFetchingMarketplaceErrorOccured = if FFlagAXMoveAllTabToWidgetOnly or FFlagAXCatalogCategoriesSDUI then FetchMarketplaceStore.setFetchingMarketplaceErrorOccured else nil
	local SetCatalogCategoriesErrorOccured = if FFlagAXCatalogCategoriesSDUI then FetchMarketplaceStore.setCatalogCategoriesErrorOccured else nil
	local SetFetchingMarketplaceProcessed = if FFlagAXMoveAllTabToWidgetOnly then FetchMarketplaceStore.setFetchingMarketplaceProcessed else nil
	local UseGetCategoryInfoModuleResult = UseGetCategoryInfoModule()
	local UseGetSelectedCategoryAndSubcategoryIdModuleResult, UseGetSelectedCategoryAndSubcategoryIdModuleResult2 = UseGetSelectedCategoryAndSubcategoryIdModule()
	
	if not UseGetSelectedCategoryAndSubcategoryIdModuleResult then
		UseGetSelectedCategoryAndSubcategoryIdModuleResult = ConstantsModule.DefaultCatalogCategoryId
	end
	local CategoryInfo = if p1 and not FFlagAXFixHydratedWidgetsParams then p1.categoryInfo else UseGetCategoryInfoModuleResult
	local CategoryId = if p1 then p1.categoryId else UseGetSelectedCategoryAndSubcategoryIdModuleResult
	local SubcategoryId = if p1 then p1.subcategoryId else UseGetSelectedCategoryAndSubcategoryIdModuleResult2
	
	if FFlagAXFixHydratedWidgetsParams then
		CategoryInfo = UtilsModule.getCategoryInfoById(GetCatalogCategoriesFromStoreModule(), CategoryId, SubcategoryId)
		
		if not CategoryInfo then
			MutedErrorModule("[useMarketplaceResultsFetcher] categoryInfo is nil for categoryId: " .. tostring(CategoryId) .. " and subcategoryId: " .. tostring(SubcategoryId))
			CategoryInfo = UseGetCategoryInfoModuleResult
		end
	end
	local SearchUuid = if p1 then p1.searchUuid else CategoryInfo.SearchUuid
	local UseStoreResult = UseStoreFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local v1 = nil
	local Callback1 = nil
	local v2 = nil
	local Callback2 = nil
	local v3 = nil
	local Callback = nil
	local v4 = nil
	local Callback3 = nil
	local v5 = nil
	local Callback4 = nil
	
	if FFlagAXMoveAllTabToWidgetOnly then
		v1, Callback1 = ReactModule.useState(false)
		v2, Callback2 = ReactModule.useState(false)
		v3, Callback = ReactModule.useState(false)
		v4, Callback3 = ReactModule.useState(false)
		v5, Callback4 = ReactModule.useState(false)
	end
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local HasSearchUuid: boolean = if TestVariable then not UseSignalStateResult and SearchUuid ~= nil else FFlagAXUnifiedMarketplaceResultsFetcher and (not UseSignalStateResult and SearchUuid ~= nil)
	local UseCatalogCategoriesFetcherModuleResult = if FFlagAXCatalogCategoriesSDUI then UseCatalogCategoriesFetcherModule() else nil
	local UseResult = if FFlagAXResetFetchMarketplaceLogic then ReactModule.useCallback(function()
		-- upvalues: FFlagAXFixPrefetchMarketplaceStartupCrash (upval), UseSelectorResult (copy), FFlagAXMoveAllTabToWidgetOnly (upval), Callback1 (ref), Callback2 (ref), Callback (ref), Callback3 (ref), Callback4 (ref), UseStateResult2 (copy), UseStateResult2_1 (copy), UseContextResult (copy), SearchUuid (copy), UseDispatchResult (copy), RemoveSearchInCatalogModule (upval), GetFFlagEnableCatalogTileLoadingLatencyModule (upval), TTIPerformanceManager (upval), CatalogTilesLatencyTrackerModule (upval), SetSearchTypeModule (upval), RobloxAppEnumsModule (upval), FFlagAXMarketplaceSubscriptionRefetchListener (upval), UseStoreResult (copy), SetSearchParametersModule (upval), CategoryInfo (ref), CategoryId (copy), SubcategoryId (copy), CatalogUtilsModule (upval), AvatarScreen (upval), ClearWidgetInfoModule (upval), SetFetchingMarketplaceInProgressFunction (copy)
		if FFlagAXFixPrefetchMarketplaceStartupCrash and UseSelectorResult == nil then return end
		if FFlagAXMoveAllTabToWidgetOnly then
			Callback1(false)
			Callback2(false)
			Callback(false)
			Callback3(false)
			Callback4(false)
		else
			UseStateResult2(false)
		end
		UseStateResult2_1(false)
		
		if UseContextResult then
			UseContextResult:storePageObject(SearchUuid, nil)
		end
		UseDispatchResult(RemoveSearchInCatalogModule(SearchUuid))
		
		if GetFFlagEnableCatalogTileLoadingLatencyModule() then
			TTIPerformanceManager.Surface.Marketplace.Root.startTracking()
			UseDispatchResult(CatalogTilesLatencyTrackerModule.StartTracking(SearchUuid))
		end
		UseDispatchResult(SetSearchTypeModule(SearchUuid, RobloxAppEnumsModule.SearchTypes.Catalog))
		local SearchKeyword = nil
		
		if FFlagAXMarketplaceSubscriptionRefetchListener then
			local State = UseStoreResult:getState()
			local SearchesParameter = if State.SearchesParameters and SearchUuid then State.SearchesParameters[SearchUuid] else nil
			
			if SearchesParameter then
				SearchKeyword = SearchesParameter.searchKeyword
			end
		end
		UseDispatchResult(SetSearchParametersModule(SearchUuid, {
			categoryInfo = CategoryInfo,
			catalogSort = UseSelectorResult.CatalogSort,
			catalogSortAggregation = UseSelectorResult.CatalogSortAggregation,
			minPrice = UseSelectorResult.PriceRange.minPrice,
			maxPrice = UseSelectorResult.PriceRange.maxPrice,
			selectedTopics = UseSelectorResult.SelectedTopics,
			creatorFilter = UseSelectorResult.CreatorFilter,
			salesTypeFilter = UseSelectorResult.SalesTypeFilter,
			unavailableItemFilter = UseSelectorResult.UnavailableItemFilter,
			wearTimeFilter = UseSelectorResult.WearTimeFilter,
			searchKeyword = if FFlagAXMarketplaceSubscriptionRefetchListener then SearchKeyword else nil
		}))
		local ContextForWidgetsById = nil
		
		if CategoryId then
			local CategoryId1 = if type(CategoryId) == "string" then CategoryId elseif type(CategoryId) == "number" then tostring(CategoryId) else nil
			local SubcategoryId1 = if type(SubcategoryId) == "string" then SubcategoryId elseif type(SubcategoryId) == "number" then tostring(SubcategoryId) else nil
			
			if CategoryId1 then
				ContextForWidgetsById = CatalogUtilsModule.getContextForWidgetsById(AvatarScreen.Catalog, CategoryId1, SubcategoryId1)
			end
		end
		if ContextForWidgetsById then
			UseDispatchResult(ClearWidgetInfoModule(nil, ContextForWidgetsById))
		end
		UseDispatchResult(ClearWidgetInfoModule(nil, nil))
		SetFetchingMarketplaceInProgressFunction()
	end, {
		UseContextResult, SearchUuid, UseSelectorResult, CategoryInfo, CategoryId,
		SubcategoryId, SetFetchingMarketplaceInProgressFunction,
		if FFlagAXMarketplaceSubscriptionRefetchListener then UseStoreResult else nil,
		if FFlagAXMarketplaceSubscriptionRefetchListener then UseDispatchResult else nil
	}) else nil
	local UseResult1 = if FFlagAXMoveAllTabToWidgetOnly then ReactModule.useCallback(function()
		-- upvalues: CategoryInfo (ref), UseDispatchResult (copy), FetchSponsoredItemsModule (upval), UseRoactServiceResult (copy), CatalogConstantsModule (upval), Callback2 (ref), Callback3 (ref), Logging (upval)
		if not CategoryInfo.ShowSponsored then
			Callback3(true)
			
			return
		end
		local UseDispatchResultResult = UseDispatchResult(FetchSponsoredItemsModule(UseRoactServiceResult, CatalogConstantsModule.SponsoredItemsCategoryRecommended, CatalogConstantsModule.SponsoredItemsToFetch))
		
		if UseDispatchResultResult and UseDispatchResultResult.andThen then
			UseDispatchResultResult:andThen(function()
				-- upvalues: Callback2 (upval), Callback3 (upval)
				Callback2(true)
				Callback3(true)
			end, function(p2)
				-- upvalues: Logging (upval), Callback3 (upval)
				Logging.warn("useMarketplaceResultsFetcher: Fetch sponsored items failed: " .. tostring(p2))
				Callback3(true)
			end)
			
			return
		else
			Callback3(true)
		end
	end, {
		CategoryInfo,
		UseRoactServiceResult,
		UseDispatchResult,
		Callback2,
		Callback3
	}) else nil
	local UseResult2 = if FFlagAXMoveAllTabToWidgetOnly then ReactModule.useCallback(function()
		-- upvalues: SearchUuid (copy), CategoryInfo (ref), FFlagAXMarketplaceSubscriptionRefetchListener (upval), GetSearchKeywordFromSearchesParametersFunction (upval), UseStoreResult (copy), UseDispatchResult (copy), ApiFetchCatalogSearchModule (upval), UseRoactServiceResult (copy), Callback1 (ref), Callback (ref), WidgetsPercievedTTIManager (upval), Logging (upval)
		local config = {
			recordSearchTime = true,
			searchUuid = SearchUuid,
			categoryInfo = CategoryInfo
		}
		
		if FFlagAXMarketplaceSubscriptionRefetchListener then
			local SearchKeywordFromSearchesParameters = GetSearchKeywordFromSearchesParametersFunction(UseStoreResult, SearchUuid)
			
			if SearchKeywordFromSearchesParameters then
				config.searchKeyword = SearchKeywordFromSearchesParameters
			end
		end
		local UseDispatchResultResult = UseDispatchResult(ApiFetchCatalogSearchModule(config, UseRoactServiceResult))
		
		if UseDispatchResultResult and UseDispatchResultResult.andThen then
			UseDispatchResultResult:andThen(function()
				-- upvalues: Callback1 (upval), Callback (upval), WidgetsPercievedTTIManager (upval)
				Callback1(true)
				Callback(true)
				WidgetsPercievedTTIManager.L3.requestFetchCatalogSearchOrganic()
			end, function(p2)
				-- upvalues: Logging (upval), Callback (upval)
				Logging.warn("useMarketplaceResultsFetcher: Fetch catalog search failed: " .. tostring(p2))
				Callback(true)
			end)
			
			return
		else
			Callback(true)
		end
	end, {
		SearchUuid, CategoryInfo, UseDispatchResult, UseRoactServiceResult, Callback1,
		Callback,
		if FFlagAXMarketplaceSubscriptionRefetchListener then UseStoreResult else nil
	}) else nil
	local UseResult3 = if FFlagAXMoveAllTabToWidgetOnly then ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), SetSearchTimeModule (upval), SearchUuid (copy)
		UseDispatchResult(SetSearchTimeModule(SearchUuid, tick()))
	end, { UseDispatchResult, SearchUuid }) else nil
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: HasSearchUuid (copy), WidgetsPercievedTTIManager (upval), OrganicTTIMilestoneManager (upval), FFlagAXResetFetchMarketplaceLogic (upval), UseResult (copy), SetFetchingMarketplaceInProgressFunction (copy), FFlagAXMoveAllTabToWidgetOnly (upval), UseResult3 (copy), FFlagAXCatalogCategoriesSDUI (upval), FFlagAXMigrateAllTabToSduiDev (upval), UseCatalogCategoriesFetcherModuleResult (ref), SendAXCounterV2Function (upval), ConstantsModule (upval), SetCatalogCategoriesErrorOccured (copy), FetchHydratedWidgetsModule (upval), UseDispatchResult (copy), UseRoactServiceResult (copy), CategoryInfo (ref), UseStoreResult (copy), FFlagAXFixHydratedWidgetsParams (upval), CategoryId (copy), SubcategoryId (copy), UseResult1 (copy), UseStateResult2_1 (copy), Callback4 (ref), FFlagAXMarketplaceSubscriptionRefetchListener (upval), GetSearchKeywordFromSearchesParametersFunction (upval), SearchUuid (copy), GetShouldFetchCatalogOrganicAfterWidgetsFunction (upval), UseResult2 (copy), Callback (ref), SetFetchingMarketplaceErrorOccured (copy), FetchCatalogSearchWithSponsoredItemsModule (upval), UseStateResult2 (copy)
		if not HasSearchUuid then return end
		WidgetsPercievedTTIManager.L2.primaryDataStarted()
		OrganicTTIMilestoneManager.L2.primaryDataStarted()
		
		if FFlagAXResetFetchMarketplaceLogic then
			UseResult()
		else
			SetFetchingMarketplaceInProgressFunction()
		end
		if FFlagAXMoveAllTabToWidgetOnly then
			UseResult3()
			
			if FFlagAXCatalogCategoriesSDUI and not FFlagAXMigrateAllTabToSduiDev then
				UseCatalogCategoriesFetcherModuleResult():andThen(function() end, function(p2)
					-- upvalues: SendAXCounterV2Function (upval), ConstantsModule (upval), SetCatalogCategoriesErrorOccured (upval)
					warn("fetchCatalogCategories error", p2)
					local Success, Result = pcall(function(): string
						-- upvalues: p2 (copy)
						return (string.sub(tostring(p2), 1, 100))
					end)
					SendAXCounterV2Function(ConstantsModule.Counter.Catalog.Errors.FetchCatalogCategoriesError, { error = if Success then Result else "unknown" })
					SetCatalogCategoriesErrorOccured()
				end)
			end
			WidgetsPercievedTTIManager.L3.networkFetch()
			OrganicTTIMilestoneManager.L3.networkFetch()
			local HydratedWidgetsModule = FetchHydratedWidgetsModule(UseDispatchResult, UseRoactServiceResult, CategoryInfo, UseStoreResult, if FFlagAXFixHydratedWidgetsParams then CategoryId else nil, if FFlagAXFixHydratedWidgetsParams then SubcategoryId else nil)
			UseResult1()
			
			if HydratedWidgetsModule and HydratedWidgetsModule.andThen then
				HydratedWidgetsModule:andThen(function(Result)
					-- upvalues: UseStateResult2_1 (upval), Callback4 (upval), FFlagAXMarketplaceSubscriptionRefetchListener (upval), GetSearchKeywordFromSearchesParametersFunction (upval), UseStoreResult (upval), SearchUuid (upval), GetShouldFetchCatalogOrganicAfterWidgetsFunction (upval), UseResult2 (upval), Callback (upval)
					UseStateResult2_1(true)
					Callback4(true)
					
					if FFlagAXMarketplaceSubscriptionRefetchListener then
						if GetShouldFetchCatalogOrganicAfterWidgetsFunction(Result and (Result.configuration and (Result.configuration.customizedDataMap and Result.configuration.customizedDataMap.disableOrganicContentFetch)), (GetSearchKeywordFromSearchesParametersFunction(UseStoreResult, SearchUuid))) then
							UseResult2()
							
							return
						else
							Callback(true)
							
							return
						end
					elseif Result and Result.configuration and Result.configuration.customizedDataMap and Result.configuration.customizedDataMap.disableOrganicContentFetch then
						Callback(true)
						
						return
					else
						UseResult2()
					end
				end, function(_)
					-- upvalues: Callback (upval), SetFetchingMarketplaceErrorOccured (upval)
					Callback(true)
					SetFetchingMarketplaceErrorOccured()
				end)
				
				return
			end
		else
			if FFlagAXCatalogCategoriesSDUI and not FFlagAXMigrateAllTabToSduiDev then
				UseCatalogCategoriesFetcherModuleResult():andThen(function() end, function(p2)
					-- upvalues: SendAXCounterV2Function (upval), ConstantsModule (upval), SetCatalogCategoriesErrorOccured (upval)
					warn("fetchCatalogCategories error", p2)
					local Success, Result = pcall(function(): string
						-- upvalues: p2 (copy)
						return (string.sub(tostring(p2), 1, 100))
					end)
					SendAXCounterV2Function(ConstantsModule.Counter.Catalog.Errors.FetchCatalogCategoriesError, { error = if Success then Result else "unknown" })
					SetCatalogCategoriesErrorOccured()
				end)
			end
			WidgetsPercievedTTIManager.L3.networkFetch()
			OrganicTTIMilestoneManager.L3.networkFetch()
			local CatalogSearchWithSponsoredItemsModule = if FFlagAXMarketplaceSubscriptionRefetchListener then FetchCatalogSearchWithSponsoredItemsModule(UseDispatchResult, UseRoactServiceResult, SearchUuid, CategoryInfo, GetSearchKeywordFromSearchesParametersFunction(UseStoreResult, SearchUuid)) else FetchCatalogSearchWithSponsoredItemsModule(UseDispatchResult, UseRoactServiceResult, SearchUuid, CategoryInfo)
			local HydratedWidgetsModule = FetchHydratedWidgetsModule(UseDispatchResult, UseRoactServiceResult, CategoryInfo, UseStoreResult, if FFlagAXFixHydratedWidgetsParams then CategoryId else nil, if FFlagAXFixHydratedWidgetsParams then SubcategoryId else nil)
			
			if CatalogSearchWithSponsoredItemsModule and CatalogSearchWithSponsoredItemsModule.andThen then
				CatalogSearchWithSponsoredItemsModule:andThen(function()
					-- upvalues: UseStateResult2 (upval), WidgetsPercievedTTIManager (upval)
					UseStateResult2(true)
					WidgetsPercievedTTIManager.L3.requestFetchCatalogSearch()
				end)
			end
			if HydratedWidgetsModule and HydratedWidgetsModule.andThen then
				HydratedWidgetsModule:andThen(function()
					-- upvalues: UseStateResult2_1 (upval)
					UseStateResult2_1(true)
				end)
			end
		end
	end, {
		HasSearchUuid, SearchUuid, SetFetchingMarketplaceInProgressFunction,
		UseDispatchResult,
		if FFlagAXResetFetchMarketplaceLogic then UseResult else nil,
		UseRoactServiceResult, CategoryInfo,
		if FFlagAXFixHydratedWidgetsParams then CategoryId else nil,
		if FFlagAXFixHydratedWidgetsParams then SubcategoryId else nil, UseStoreResult,
		UseStateResult2, if FFlagAXMoveAllTabToWidgetOnly then Callback1 else nil,
		if FFlagAXMoveAllTabToWidgetOnly then UseResult3 else nil,
		if FFlagAXMoveAllTabToWidgetOnly then Callback4 else nil,
		if FFlagAXMoveAllTabToWidgetOnly then Callback else nil,
		if FFlagAXMoveAllTabToWidgetOnly then SetFetchingMarketplaceErrorOccured else nil,
		UseStateResult2_1
	})
	
	if FFlagAXMoveAllTabToWidgetOnly then
		ReactModule.useEffect(function()
			-- upvalues: UseStateResult1 (copy), v1 (ref), v2 (ref), FFlagAXFixDataProcessingMilestoneGating (upval), WidgetsPercievedTTIManager (upval), OrganicTTIMilestoneManager (upval), SetFetchedMarketplaceCompletedFunction (copy), v5 (ref), v3 (ref), v4 (ref), SetFetchingMarketplaceProcessed (copy)
			if UseStateResult1 and v1 and v2 then
				if not FFlagAXFixDataProcessingMilestoneGating then
					WidgetsPercievedTTIManager.L2.dataProcessingStarted()
					OrganicTTIMilestoneManager.L2.dataProcessingStarted()
				end
				SetFetchedMarketplaceCompletedFunction()
				
				if not FFlagAXFixDataProcessingMilestoneGating then
					WidgetsPercievedTTIManager.L2.dataProcessingCompleted()
					OrganicTTIMilestoneManager.L2.dataProcessingCompleted()
				end
			end
			if v5 and v3 and v4 then
				if FFlagAXFixDataProcessingMilestoneGating then
					WidgetsPercievedTTIManager.L2.dataProcessingStarted()
					OrganicTTIMilestoneManager.L2.dataProcessingStarted()
				end
				SetFetchingMarketplaceProcessed()
				
				if FFlagAXFixDataProcessingMilestoneGating then
					WidgetsPercievedTTIManager.L2.dataProcessingCompleted()
					OrganicTTIMilestoneManager.L2.dataProcessingCompleted()
				end
			end
		end, {
			UseStateResult1, v1, v2, v5, v3, v4
		})
	else
		ReactModule.useEffect(function()
			-- upvalues: UseStateResult (copy), UseStateResult1 (copy), WidgetsPercievedTTIManager (upval), OrganicTTIMilestoneManager (upval), SetFetchedMarketplaceCompletedFunction (copy)
			if UseStateResult and UseStateResult1 then
				WidgetsPercievedTTIManager.L3.responseReceived()
				WidgetsPercievedTTIManager.L2.dataProcessingStarted()
				OrganicTTIMilestoneManager.L3.responseReceived()
				OrganicTTIMilestoneManager.L2.dataProcessingStarted()
				SetFetchedMarketplaceCompletedFunction()
				WidgetsPercievedTTIManager.L2.dataProcessingCompleted()
				OrganicTTIMilestoneManager.L2.dataProcessingCompleted()
			end
		end, { UseStateResult, UseStateResult1 })
	end
	return {
		fetchMarketplace = UseResult4,
		hasFetched = UseSignalStateResult1,
		isFetching = UseSignalStateResult,
		fetchedMarketplaceTimestamp = if FFlagAXPrefetchOnlyWithinTTL then UseSignalStateResult2 else nil
	}
end