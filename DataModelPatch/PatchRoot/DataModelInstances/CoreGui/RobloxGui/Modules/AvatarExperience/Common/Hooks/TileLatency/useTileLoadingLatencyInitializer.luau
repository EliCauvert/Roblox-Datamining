local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local UseGetCurrentCategoryNamesModule = require(Modules.AvatarExperience.Catalog.Hooks.useGetCurrentCategoryNames)
local CatalogTilesLatencyTrackerModule = require(Modules.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UsePreviousFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.usePrevious
local MemStorageService = game:GetService("MemStorageService")
local SendAXStatFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXStat
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local AvatarExperienceTTIPerformanceModule = require(CorePackages.Workspace.Packages.AvatarExperienceTTIPerformance)
local TTIPerformanceManager = AvatarExperienceTTIPerformanceModule.TTIPerformanceManager
local WidgetsPercievedTTIManager = AvatarExperienceTTIPerformanceModule.WidgetsPercievedTTIManager
local OrganicTTIMilestoneManager = AvatarExperienceTTIPerformanceModule.OrganicTTIMilestoneManager

local function fireTileLoadingLatencyTracker(p1, p2, p3)
	-- upvalues: CatalogTilesLatencyTrackerModule (copy), ConstantsModule (copy), WidgetsPercievedTTIManager (copy), OrganicTTIMilestoneManager (copy), TTIPerformanceManager (copy), SendAXStatFunction (copy), MemStorageService (copy)
	if p1.trackerStartTime then
		local TrackerPerceivedStartTime: number = p1.trackerPerceivedStartTime
		local ClockTime = os.clock()
		
		if p2 and not p3 then
			p1.dispatch(CatalogTilesLatencyTrackerModule.EndTracking(p1.searchUuid, ClockTime))
		end
		local ScaledClockTime = (ClockTime - p1.trackerStartTime) * 1000
		local ScaledClockTime1 = if TrackerPerceivedStartTime then (ClockTime - TrackerPerceivedStartTime) * 1000 else nil
		local Thumbnails = if p3 then if p2 then ConstantsModule.Counter.Latency.Widget.Thumbnails else ConstantsModule.Counter.Latency.Widget.Tiles elseif p2 then ConstantsModule.Counter.Latency.Organic.Thumbnails else ConstantsModule.Counter.Latency.Organic.Tiles
		local MetaData = {
			Page = p1.currentPageName,
			OpaquePage = p1.opaquePageName,
			ColdStart = p1.coldStart,
			Category = p1.currentCategory,
			Subcategory = p1.currentSubcategory
		}
		local config = {
			page = p1.currentPageName,
			opaquePage = p1.opaquePageName,
			coldStart = p1.coldStart,
			category = p1.currentCategory,
			subcategory = p1.currentSubcategory
		}
		
		if p3 then
			if p2 then
				WidgetsPercievedTTIManager.L2.surfaceReady()
			else
				WidgetsPercievedTTIManager.L2.functionallyReady()
			end
		end
		if not p3 then
			if p2 then
				OrganicTTIMilestoneManager.L2.surfaceReady()
			else
				OrganicTTIMilestoneManager.L2.functionallyReady()
			end
		end
		local Root = TTIPerformanceManager.Surface.Marketplace.Root
		Root.endTracking(Thumbnails, config)
		
		if ScaledClockTime1 then
			Root.endPerceivedTracking(Thumbnails, config)
		end
		SendAXStatFunction({
			statName = Thumbnails,
			deltaMs = ScaledClockTime,
			metaData = MetaData
		})
		
		if ScaledClockTime1 then
			SendAXStatFunction({
				statName = Thumbnails .. "_Percieved",
				deltaMs = ScaledClockTime1,
				metaData = MetaData
			})
		end
		if MemStorageService:GetItem(ConstantsModule.MemStorageKeys.ColdStart.CatalogAndCatalogSearch) and p2 then
			MemStorageService:SetItem(ConstantsModule.MemStorageKeys.ColdStart.CatalogAndCatalogSearch, "false")
		end
	end
end

local function perceivedStartTimeSelector(p1)
	return p1.AvatarExperience.Catalog.ResultsList.perceivedStartTime or nil
end

return function(SearchUuid)
	-- upvalues: UseAvatarRouteFunction (copy), UseDispatchFunction (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), UseGetCurrentCategoryNamesModule (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy), perceivedStartTimeSelector (copy), MemStorageService (copy), ConstantsModule (copy), UsePreviousFunction (copy), ReactModule (copy), AvatarScreen (copy), fireTileLoadingLatencyTracker (copy)
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local Name = UseAvatarRouteResult.current.name
	local Name1 = if UseAvatarRouteResult.opaque then UseAvatarRouteResult.opaque.name else nil
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseGetCurrentCategoryNamesModuleResult = UseGetCurrentCategoryNamesModule()
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: SearchUuid (copy)
		return p1.AvatarExperience.Catalog.ResultsList[SearchUuid] and p1.AvatarExperience.Catalog.ResultsList[SearchUuid].tileLoadingLatency and p1.AvatarExperience.Catalog.ResultsList[SearchUuid].tileLoadingLatency.thumbnails or nil
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult1 = UseSelectorFunction(function(p1)
		-- upvalues: SearchUuid (copy)
		return p1.AvatarExperience.Catalog.ResultsList[SearchUuid] and p1.AvatarExperience.Catalog.ResultsList[SearchUuid].tileLoadingLatency and p1.AvatarExperience.Catalog.ResultsList[SearchUuid].tileLoadingLatency.startTime or nil
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult2 = UseSelectorFunction(perceivedStartTimeSelector, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult3 = UseSelectorFunction(function(p1)
		-- upvalues: SearchUuid (copy)
		return p1.AvatarExperience.Catalog.ResultsList[SearchUuid] and p1.AvatarExperience.Catalog.ResultsList[SearchUuid].tileLoadingLatency and p1.AvatarExperience.Catalog.ResultsList[SearchUuid].tileLoadingLatency.endTime or nil
	end, GetUseSelectorDeepEqualsFunction())
	local IsNotFalse = MemStorageService:GetItem(ConstantsModule.MemStorageKeys.ColdStart.CatalogAndCatalogSearch) ~= "false"
	local UsePreviousResult = UsePreviousFunction(UseSelectorResult)
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	ReactModule.useEffect(function()
		-- upvalues: UseGetCurrentCategoryNamesModuleResult (copy), Name (copy), AvatarScreen (upval), UseStateResult2 (copy), UseStateResult2_1 (copy)
		if not UseGetCurrentCategoryNamesModuleResult then return end
		if Name == AvatarScreen.CatalogSearch then
			UseStateResult2(UseGetCurrentCategoryNamesModuleResult.catalogSearchCategory)
			UseStateResult2_1(UseGetCurrentCategoryNamesModuleResult.catalogSearchSubcategory)
			
			return
		else
			UseStateResult2(UseGetCurrentCategoryNamesModuleResult.catalogCategory)
			UseStateResult2_1(UseGetCurrentCategoryNamesModuleResult.catalogSubcategory)
		end
	end, { Name, UseGetCurrentCategoryNamesModuleResult })
	
	return {
		dispatch = UseDispatchResult,
		analytics = UseRoactServiceModuleResult,
		trackerLoadedThumbnails = UseSelectorResult,
		trackerStartTime = UseSelectorResult1,
		trackerEndTime = UseSelectorResult3,
		coldStart = IsNotFalse,
		prevImpressionResults = UsePreviousResult,
		currentCategory = UseStateResult,
		setCurrentCategory = UseStateResult2,
		currentSubcategory = UseStateResult1,
		setCurrentSubcategory = UseStateResult2_1,
		currentPageName = Name,
		searchUuid = SearchUuid,
		opaquePageName = Name1,
		fireTileLoadingLatencyTracker = fireTileLoadingLatencyTracker,
		trackerPerceivedStartTime = UseSelectorResult2
	}
end