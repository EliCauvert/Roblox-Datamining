local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local PromiseModule = require(CorePackages.Packages.Promise)
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseStoreFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useStore
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local StoresModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Stores)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local UseGetCategoryInfoModule = require(Modules.AvatarExperience.Catalog.Hooks.useGetCategoryInfo)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local GetCatalogCategoriesFromStoreModule = require(Modules.AvatarExperience.Catalog.GetCatalogCategoriesFromStore)
local MutedErrorFunction = require(CorePackages.Workspace.Packages.Loggers).mutedError
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local AvatarExperienceAnalyticsModule = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics)
local SendAXCounterV2Function = AvatarExperienceAnalyticsModule.sendAXCounterV2
local SendAXStatFunction = AvatarExperienceAnalyticsModule.sendAXStat
local LogWidgetLoadedFunction = AvatarExperienceAnalyticsModule.logWidgetLoaded
local SetSearchTimeModule = require(Modules.LuaApp.Actions.SetSearchTime)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXPrefetchOnlyWithinTTL = AvatarExperienceFlagsModule.FFlagAXPrefetchOnlyWithinTTL
local FFlagAXSduiWidgetsTTITracking = AvatarExperienceFlagsModule.FFlagAXSduiWidgetsTTITracking
local FIntAXPrefetchWidgetHydrationRowsPortrait = AvatarExperienceFlagsModule.FIntAXPrefetchWidgetHydrationRowsPortrait
local FIntAXPrefetchWidgetHydrationRowsLandscape = AvatarExperienceFlagsModule.FIntAXPrefetchWidgetHydrationRowsLandscape
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local AvatarExperienceTTIPerformanceModule = require(CorePackages.Workspace.Packages.AvatarExperienceTTIPerformance)
local WidgetsPercievedTTIManager = AvatarExperienceTTIPerformanceModule.WidgetsPercievedTTIManager
local OrganicTTIMilestoneManager = AvatarExperienceTTIPerformanceModule.OrganicTTIMilestoneManager
local TTIPerformanceManager = AvatarExperienceTTIPerformanceModule.TTIPerformanceManager
local CatalogTilesLatencyTrackerModule = require(Modules.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker)
local GetFFlagEnableCatalogTileLoadingLatencyModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableCatalogTileLoadingLatency)
local AvatarExperienceCatalogModule = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local FetchCatalogPageFunction = AvatarExperienceCatalogModule.Sdui.fetchCatalogPage
local GetCatalogConfigKeyFunction = AvatarExperienceCatalogModule.Sdui.getCatalogConfigKey
local GetCatalogPageIdentifierFunction = AvatarExperienceCatalogModule.Sdui.getCatalogPageIdentifier
local BuildOrderedWidgetsFromCatalogPageFunction = AvatarExperienceCatalogModule.Sdui.buildOrderedWidgetsFromCatalogPage
local GetAXMarketplaceWidgetStoreFunction = AvatarExperienceCatalogModule.Stores.getAXMarketplaceWidgetStore
local GetCatalogPageRequestIdStoreFunction = AvatarExperienceCatalogModule.Stores.getCatalogPageRequestIdStore
local SduiLoadTimer = require(CorePackages.Workspace.Packages.SduiSharedUtilities).SduiLoadTimer
local SetHydratedWidgetDataModule = require(Modules.AvatarExperience.Catalog.Actions.SetHydratedWidgetData)
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local HydrateCatalogSortEntitiesFunction = AvatarExperienceCatalogModule.Sdui.hydrateCatalogSortEntities

local function _(SearchUuid)
	return function(p1)
		-- upvalues: SearchUuid (copy)
		return if typeof(p1.SearchTimes) == "table" and SearchUuid then p1.SearchTimes[SearchUuid] else nil
	end
end

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseStoreFunction (copy), StoresModule (copy), UseSignalStateFunction (copy), FFlagAXPrefetchOnlyWithinTTL (copy), UseGetCategoryInfoModule (copy), GetCatalogCategoriesFromStoreModule (copy), UtilsModule (copy), MutedErrorFunction (copy), ReactModule (copy), UseSelectorFunction (copy), FFlagAXSduiWidgetsTTITracking (copy), GetCatalogPageIdentifierFunction (copy), GetFFlagEnableCatalogTileLoadingLatencyModule (copy), TTIPerformanceManager (copy), CatalogTilesLatencyTrackerModule (copy), GetAXMarketplaceWidgetStoreFunction (copy), SduiLoadTimer (copy), AvatarScreen (copy), GetCatalogPageRequestIdStoreFunction (copy), FetchCatalogPageFunction (copy), PromiseModule (copy), WidgetsPercievedTTIManager (copy), SendAXStatFunction (copy), ConstantsModule (copy), GetCatalogConfigKeyFunction (copy), BuildOrderedWidgetsFromCatalogPageFunction (copy), LogWidgetLoadedFunction (copy), SelectIsPortraitModule (copy), FIntAXPrefetchWidgetHydrationRowsPortrait (copy), FIntAXPrefetchWidgetHydrationRowsLandscape (copy), HydrateCatalogSortEntitiesFunction (copy), SetHydratedWidgetDataModule (copy), WebApiModule (copy), SendAXCounterV2Function (copy), SetSearchTimeModule (copy), OrganicTTIMilestoneManager (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseStoreResult = UseStoreFunction()
	local FetchMarketplaceStore = StoresModule.getFetchMarketplaceStore(false)
	local UseSignalStateResult = UseSignalStateFunction(FetchMarketplaceStore.getFetchingMarketplace)
	local UseSignalStateResult1 = UseSignalStateFunction(FetchMarketplaceStore.getFetchedMarketplace)
	local UseSignalStateResult2 = if FFlagAXPrefetchOnlyWithinTTL then UseSignalStateFunction(FetchMarketplaceStore.getFetchedMarketplaceTimestamp) else nil
	local SetFetchingMarketplaceInProgressFunction = FetchMarketplaceStore.setFetchingMarketplaceInProgress
	local SetFetchedMarketplaceCompletedFunction = FetchMarketplaceStore.setFetchedMarketplaceCompleted
	local SetFetchingMarketplaceErrorOccuredFunction = FetchMarketplaceStore.setFetchingMarketplaceErrorOccured
	local SetFetchingMarketplaceProcessedFunction = FetchMarketplaceStore.setFetchingMarketplaceProcessed
	local UseGetCategoryInfoModuleResult = UseGetCategoryInfoModule()
	local CategoryId = p1.categoryId
	local SubcategoryId = p1.subcategoryId
	local CategoryInfoById = UtilsModule.getCategoryInfoById(GetCatalogCategoriesFromStoreModule(), CategoryId, SubcategoryId)
	
	if not CategoryInfoById then
		MutedErrorFunction("[useMarketplaceResultsFetcherSdui] categoryInfo is nil for categoryId: " .. tostring(CategoryId) .. " and subcategoryId: " .. tostring(SubcategoryId))
		CategoryInfoById = UseGetCategoryInfoModuleResult
	end
	local SearchUuid = CategoryInfoById.SearchUuid
	local WidgetContext = CategoryInfoById.WidgetContext
	local TimeToRefresh = CategoryInfoById.TimeToRefresh
	local UseSelectorResult = UseSelectorFunction((ReactModule.useCallback(function(p2)
		-- upvalues: SearchUuid (copy)
		return if typeof(p2.SearchTimes) == "table" and SearchUuid then p2.SearchTimes[SearchUuid] else nil
	end, { SearchUuid })))
	local Identifier = nil
	local Callback = nil
	
	if FFlagAXSduiWidgetsTTITracking then
		Identifier = GetCatalogPageIdentifierFunction(WidgetContext or "")
		local UseRefResult = ReactModule.useRef(nil)
		Callback = ReactModule.useCallback(function(Current)
			-- upvalues: GetFFlagEnableCatalogTileLoadingLatencyModule (upval), UseRefResult (copy), TTIPerformanceManager (upval), UseDispatchResult (copy), CatalogTilesLatencyTrackerModule (upval)
			if not GetFFlagEnableCatalogTileLoadingLatencyModule() then return end
			if Current == nil or Current == "" then return end
			if UseRefResult.current ~= Current then
				UseRefResult.current = Current
				TTIPerformanceManager.Surface.Marketplace.Root.startTracking()
				UseDispatchResult(CatalogTilesLatencyTrackerModule.StartTracking(Current))
				
				return
			end
		end, { UseDispatchResult })
		ReactModule.useEffect(function()
			-- upvalues: Callback (ref), SearchUuid (copy)
			if Callback then
				Callback(SearchUuid)
				
				return
			end
		end, { SearchUuid, Callback })
	end
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: GetAXMarketplaceWidgetStoreFunction (upval), SduiLoadTimer (upval), AvatarScreen (upval), WidgetContext (copy), GetCatalogPageIdentifierFunction (upval), GetCatalogPageRequestIdStoreFunction (upval), FetchCatalogPageFunction (upval), PromiseModule (upval), FFlagAXSduiWidgetsTTITracking (upval), WidgetsPercievedTTIManager (upval), SendAXStatFunction (upval), ConstantsModule (upval), GetCatalogConfigKeyFunction (upval), BuildOrderedWidgetsFromCatalogPageFunction (upval), LogWidgetLoadedFunction (upval), UseStoreResult (copy), SelectIsPortraitModule (upval), FIntAXPrefetchWidgetHydrationRowsPortrait (upval), FIntAXPrefetchWidgetHydrationRowsLandscape (upval), HydrateCatalogSortEntitiesFunction (upval), UseDispatchResult (copy), UseRoactServiceResult (copy), SetHydratedWidgetDataModule (upval), WebApiModule (upval), SetFetchingMarketplaceErrorOccuredFunction (copy)
		local DebouncedScreenSize = GetAXMarketplaceWidgetStoreFunction(false).getDebouncedScreenSize(false)
		local LoadTimer = SduiLoadTimer.createLoadTimer(AvatarScreen.Catalog)
		local WidgetContext1 = WidgetContext or ""
		local CatalogPageIdentifier = GetCatalogPageIdentifierFunction(WidgetContext1)
		local CatalogPageRequestIdStore = GetCatalogPageRequestIdStoreFunction(false)
		
		if p2 then
			CatalogPageRequestIdStore.resetPageRequestId(CatalogPageIdentifier)
		end
		local OrCreatePageRequestId = CatalogPageRequestIdStore.getOrCreatePageRequestId(CatalogPageIdentifier)
		local ClockTime = os.clock()
		local CatalogPage = FetchCatalogPageFunction({
			requestId = OrCreatePageRequestId,
			context = WidgetContext1,
			screenSize = DebouncedScreenSize
		}, LoadTimer, if p2 then { forceRefresh = true } else nil)
		
		return if typeof(CatalogPage) == "table" and typeof(CatalogPage.andThen) == "function" then CatalogPage:andThen(function()
			-- upvalues: FFlagAXSduiWidgetsTTITracking (upval), WidgetsPercievedTTIManager (upval), SendAXStatFunction (upval), ConstantsModule (upval), ClockTime (copy), GetCatalogConfigKeyFunction (upval), WidgetContext1 (copy), DebouncedScreenSize (copy), BuildOrderedWidgetsFromCatalogPageFunction (upval), CatalogPageIdentifier (copy), LogWidgetLoadedFunction (upval), OrCreatePageRequestId (copy), UseStoreResult (upval), SelectIsPortraitModule (upval), FIntAXPrefetchWidgetHydrationRowsPortrait (upval), FIntAXPrefetchWidgetHydrationRowsLandscape (upval), HydrateCatalogSortEntitiesFunction (upval), UseDispatchResult (upval), UseRoactServiceResult (upval), SetHydratedWidgetDataModule (upval), WebApiModule (upval)
			if FFlagAXSduiWidgetsTTITracking then
				WidgetsPercievedTTIManager.L3.responseReceived()
			end
			SendAXStatFunction({
				statName = ConstantsModule.Counter.Latency.Network.FetchWidgetInfo,
				deltaMs = (os.clock() - ClockTime) * 1000
			})
			local List = {}
			
			for _, value in BuildOrderedWidgetsFromCatalogPageFunction(GetCatalogConfigKeyFunction(WidgetContext1, DebouncedScreenSize), CatalogPageIdentifier) do
				if value.type ~= nil then
					table.insert(List, value)
				end
			end
			if #List > 0 then
				LogWidgetLoadedFunction(List, OrCreatePageRequestId)
			end
			local FIntAXPrefetchWidgetHydrationRowsPortrait1 = if SelectIsPortraitModule((UseStoreResult:getState())) then FIntAXPrefetchWidgetHydrationRowsPortrait else FIntAXPrefetchWidgetHydrationRowsLandscape
			
			if FFlagAXSduiWidgetsTTITracking then
				WidgetsPercievedTTIManager.L3.requestFetchHydratedWidgets()
			end
			HydrateCatalogSortEntitiesFunction(UseDispatchResult, UseRoactServiceResult, SetHydratedWidgetDataModule, WebApiModule, FIntAXPrefetchWidgetHydrationRowsPortrait1)
		end, function(p3)
			-- upvalues: SetFetchingMarketplaceErrorOccuredFunction (upval), PromiseModule (upval)
			SetFetchingMarketplaceErrorOccuredFunction()
			
			return PromiseModule.reject(p3)
		end) else PromiseModule.resolve()
	end, {
		WidgetContext,
		UseStoreResult,
		UseDispatchResult,
		UseRoactServiceResult,
		SetFetchingMarketplaceErrorOccuredFunction
	})
	
	return {
		fetchMarketplace = ReactModule.useCallback(function(p3)
			-- upvalues: FFlagAXSduiWidgetsTTITracking (upval), WidgetsPercievedTTIManager (upval), SetFetchingMarketplaceInProgressFunction (copy), Callback (ref), SearchUuid (copy), UseSelectorResult (copy), TimeToRefresh (copy), SendAXCounterV2Function (upval), ConstantsModule (upval), UseDispatchResult (copy), SetSearchTimeModule (upval), UseResult (copy), PromiseModule (upval), OrganicTTIMilestoneManager (upval), SetFetchedMarketplaceCompletedFunction (copy), SetFetchingMarketplaceProcessedFunction (copy)
			if FFlagAXSduiWidgetsTTITracking then
				WidgetsPercievedTTIManager.L2.primaryDataStarted()
			end
			SetFetchingMarketplaceInProgressFunction()
			
			if Callback then
				Callback(SearchUuid)
			end
			local IsForceRefresh: boolean = p3 ~= nil and p3.forceRefresh == true
			local IsCurrentTimeAbove: boolean = not IsForceRefresh and (UseSelectorResult ~= nil and (TimeToRefresh ~= nil and (TimeToRefresh >= 0 and tick() - UseSelectorResult > TimeToRefresh)))
			
			if IsCurrentTimeAbove then
				SendAXCounterV2Function(ConstantsModule.Counter.CatalogRefresh.StaleResults)
			end
			local IsForceRefresh1: boolean = IsForceRefresh or IsCurrentTimeAbove
			UseDispatchResult(SetSearchTimeModule(SearchUuid, tick()))
			
			if FFlagAXSduiWidgetsTTITracking then
				WidgetsPercievedTTIManager.L3.networkFetch()
			end
			local list = { UseResult(IsForceRefresh1) }
			PromiseModule.all(list):andThen(function()
				-- upvalues: FFlagAXSduiWidgetsTTITracking (upval), WidgetsPercievedTTIManager (upval), OrganicTTIMilestoneManager (upval), SetFetchedMarketplaceCompletedFunction (upval)
				if not FFlagAXSduiWidgetsTTITracking then
					WidgetsPercievedTTIManager.L2.dataProcessingStarted()
					OrganicTTIMilestoneManager.L2.dataProcessingStarted()
				end
				SetFetchedMarketplaceCompletedFunction()
				
				if not FFlagAXSduiWidgetsTTITracking then
					WidgetsPercievedTTIManager.L2.dataProcessingCompleted()
					OrganicTTIMilestoneManager.L2.dataProcessingCompleted()
				end
			end):catch(function(Err)
				-- upvalues: SendAXCounterV2Function (upval), ConstantsModule (upval)
				local Success, Result = pcall(function(): string
					-- upvalues: Err (copy)
					return (string.sub(tostring(Err), 1, 100))
				end)
				SendAXCounterV2Function(ConstantsModule.Counter.Catalog.Errors.FetchMarketplaceSduiError, { error = if Success then Result else "unknown" })
			end)
			PromiseModule.allSettled(list):finally(function()
				-- upvalues: FFlagAXSduiWidgetsTTITracking (upval), WidgetsPercievedTTIManager (upval), SetFetchingMarketplaceProcessedFunction (upval)
				if FFlagAXSduiWidgetsTTITracking then
					WidgetsPercievedTTIManager.L2.dataProcessingStarted()
				end
				if SetFetchingMarketplaceProcessedFunction then
					SetFetchingMarketplaceProcessedFunction()
				end
				if FFlagAXSduiWidgetsTTITracking then
					WidgetsPercievedTTIManager.L2.dataProcessingCompleted()
				end
			end)
			
			if not FFlagAXSduiWidgetsTTITracking then
				WidgetsPercievedTTIManager.L3.networkFetch()
				OrganicTTIMilestoneManager.L3.networkFetch()
			end
		end, {
			SearchUuid, UseSelectorResult, TimeToRefresh,
			SetFetchingMarketplaceInProgressFunction,
			SetFetchedMarketplaceCompletedFunction,
			SetFetchingMarketplaceProcessedFunction, UseDispatchResult, UseResult, Callback
		}),
		hasFetched = UseSignalStateResult1,
		isFetching = UseSignalStateResult,
		fetchedMarketplaceTimestamp = if FFlagAXPrefetchOnlyWithinTTL then UseSignalStateResult2 else nil,
		searchUuid = SearchUuid,
		identifier = Identifier
	}
end