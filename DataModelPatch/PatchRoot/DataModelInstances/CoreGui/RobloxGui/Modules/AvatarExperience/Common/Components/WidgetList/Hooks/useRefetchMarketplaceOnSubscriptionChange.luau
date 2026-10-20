local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local Modules = CoreGui.RobloxGui.Modules
local TryOnLookV2Module = require(CoreGui.RobloxGui.Modules.AvatarExperience.Common.Thunks.TryOnLookV2)
local ReactModule = require(CorePackages.Packages.React)
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local RobloxSubscriptionPurchaseAppModule = require(CorePackages.Workspace.Packages.RobloxSubscriptionPurchaseApp)
local FetchAssetOrBundleInfoModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo)
local ClearReceivedCatalogDataModule = require(Modules.AvatarExperience.Common.Actions.ClearReceivedCatalogData)
local FFlagAXMarketplaceSessionSubscriptionRefetch = AvatarExperienceFlagsModule.FFlagAXMarketplaceSessionSubscriptionRefetch
local FFlagAXSubscriptionRefetchClearCatalogData = AvatarExperienceFlagsModule.FFlagAXSubscriptionRefetchClearCatalogData
local FFlagAXSubscriptionRefetchEvictStores = AvatarExperienceFlagsModule.FFlagAXSubscriptionRefetchEvictStores
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local GetCatalogCategoriesStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local UseMarketplaceResultsFetcherModule = require(script.Parent.useMarketplaceResultsFetcher)
local UseMarketplaceResultsFetcherSduiModule = require(script.Parent.useMarketplaceResultsFetcherSdui)
local UseResultsAreSduiEnabledModule = require(script.Parent.useResultsAreSduiEnabled)
local UseGetSelectedCategoryAndSubcategoryIdModule = require(Modules.AvatarExperience.Catalog.Hooks.useGetSelectedCategoryAndSubcategoryId)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlagsModule.FFlagAXMigrateAllTabToSduiDev
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen

local function v24(p1)
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
end

local function v25(p1)
	return p1.AvatarExperience.AvatarScene.OutfitTryOn
end

return function()
	-- upvalues: RobloxSubscriptionPurchaseAppModule (copy), UseSignalStateFunction (copy), UseAvatarRouteFunction (copy), UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), AnalyticsModule (copy), UseSelectorFunction (copy), v24 (copy), v25 (copy), ReactModule (copy), FetchAssetOrBundleInfoModule (copy), TryOnLookV2Module (copy), GetCatalogCategoriesStoreModule (copy), AvatarScreen (copy), UseMarketplaceResultsFetcherModule (copy), FFlagAXMigrateAllTabToSduiDev (copy), UseGetSelectedCategoryAndSubcategoryIdModule (copy), UseMarketplaceResultsFetcherSduiModule (copy), ConstantsModule (copy), UseResultsAreSduiEnabledModule (copy), FFlagAXSubscriptionRefetchClearCatalogData (copy), FFlagAXSubscriptionRefetchEvictStores (copy), ClearReceivedCatalogDataModule (copy), FFlagAXMarketplaceSessionSubscriptionRefetch (copy)
	local GetResult = RobloxSubscriptionPurchaseAppModule.RobloxSubscriptionSignals.get()
	local UseSignalStateResult = UseSignalStateFunction(GetResult.getHasRobloxSubscription)
	local Opaque = UseAvatarRouteFunction().opaque
	local Name = if Opaque then Opaque.name else nil
	local Detail = if Opaque and Opaque.params then Opaque.params.detail else nil
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AnalyticsModule)
	local UseSelectorResult = UseSelectorFunction(v24)
	local UseSelectorResult1 = UseSelectorFunction(v25)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseSelectorResult (copy), UseDispatchResult (copy), FetchAssetOrBundleInfoModule (upval), UseRoactServiceResult (copy), UseRoactServiceResult1 (copy), UseSelectorResult1 (copy), TryOnLookV2Module (upval)
		for _, value in UseSelectorResult do
			UseDispatchResult(FetchAssetOrBundleInfoModule(UseRoactServiceResult, UseRoactServiceResult1, value.itemId, value.itemType, true))
		end
		if UseSelectorResult1.LookId then
			UseDispatchResult(TryOnLookV2Module(UseRoactServiceResult, nil, {}, UseSelectorResult1.LookId, nil, nil, true))
		end
		if UseSelectorResult1.MakeupLookId then
			UseDispatchResult(TryOnLookV2Module(UseRoactServiceResult, nil, {}, UseSelectorResult1.MakeupLookId, nil, nil, true))
		end
	end, {
		UseSelectorResult,
		UseRoactServiceResult,
		UseRoactServiceResult1,
		UseSelectorResult1
	})
	local CatalogSearchSelectionStore = GetCatalogCategoriesStoreModule.getCatalogSearchSelectionStore()
	local UseSignalStateResult1 = UseSignalStateFunction(CatalogSearchSelectionStore.selectedCategoryId)
	local UseSignalStateResult2 = UseSignalStateFunction(CatalogSearchSelectionStore.selectedSubcategoryId)
	local UseMarketplaceResultsFetcherModuleResult = UseMarketplaceResultsFetcherModule((ReactModule.useMemo(function()
		-- upvalues: Name (copy), AvatarScreen (upval), Detail (copy), UseSignalStateResult1 (copy), UseSignalStateResult2 (copy)
		return if Name == AvatarScreen.CatalogSearch and (typeof(Detail) == "string" and Detail ~= "") then {
			searchUuid = Detail,
			categoryId = UseSignalStateResult1,
			subcategoryId = UseSignalStateResult2
		} else nil
	end, {
		Name,
		Detail,
		UseSignalStateResult1,
		UseSignalStateResult2
	})))
	local FetchMarketplaceFunction2 = UseMarketplaceResultsFetcherModuleResult.fetchMarketplace
	
	if FFlagAXMigrateAllTabToSduiDev then
		local UseGetSelectedCategoryAndSubcategoryIdModuleResult, _ = UseGetSelectedCategoryAndSubcategoryIdModule()
		local FetchMarketplaceFunction1 = UseMarketplaceResultsFetcherSduiModule({
			categoryId = UseGetSelectedCategoryAndSubcategoryIdModuleResult or ConstantsModule.DefaultCatalogCategoryId
		}).fetchMarketplace
		local UseResultsAreSduiEnabledModuleResult = UseResultsAreSduiEnabledModule()
		local FetchMarketplaceFunction = UseMarketplaceResultsFetcherModuleResult.fetchMarketplace
		FetchMarketplaceFunction2 = ReactModule.useCallback(function()
			-- upvalues: UseResultsAreSduiEnabledModuleResult (copy), FetchMarketplaceFunction1 (copy), FetchMarketplaceFunction (copy)
			if UseResultsAreSduiEnabledModuleResult and FetchMarketplaceFunction1 then
				FetchMarketplaceFunction1({ forceRefresh = true })
				
				return
			else
				FetchMarketplaceFunction()
			end
		end, {
			UseResultsAreSduiEnabledModuleResult,
			FetchMarketplaceFunction,
			FetchMarketplaceFunction1
		})
	end
	local UseDispatchResult1 = if FFlagAXSubscriptionRefetchClearCatalogData then UseDispatchFunction() else nil
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseSignalStateResult (copy), FFlagAXSubscriptionRefetchEvictStores (upval), FFlagAXSubscriptionRefetchClearCatalogData (upval), UseDispatchResult1 (copy), ClearReceivedCatalogDataModule (upval), FetchMarketplaceFunction2 (ref), UseResult (copy)
		local Current = UseRefResult.current
		UseRefResult.current = UseSignalStateResult
		
		if if FFlagAXSubscriptionRefetchEvictStores then Current ~= nil and Current ~= UseSignalStateResult else Current == false and UseSignalStateResult == true then
			if FFlagAXSubscriptionRefetchClearCatalogData and UseDispatchResult1 then
				UseDispatchResult1(ClearReceivedCatalogDataModule())
			end
			FetchMarketplaceFunction2()
			UseResult()
		end
	end, { UseSignalStateResult, UseResult })
	
	if FFlagAXMarketplaceSessionSubscriptionRefetch then
		ReactModule.useLayoutEffect(function()
			-- upvalues: GetResult (copy), FFlagAXSubscriptionRefetchClearCatalogData (upval), UseDispatchResult1 (copy), ClearReceivedCatalogDataModule (upval), FetchMarketplaceFunction2 (ref)
			if GetResult.getGainedRobloxSubscriptionThisSession() then
				if FFlagAXSubscriptionRefetchClearCatalogData and UseDispatchResult1 then
					UseDispatchResult1(ClearReceivedCatalogDataModule())
				end
				FetchMarketplaceFunction2()
			end
		end, {})
	end
end