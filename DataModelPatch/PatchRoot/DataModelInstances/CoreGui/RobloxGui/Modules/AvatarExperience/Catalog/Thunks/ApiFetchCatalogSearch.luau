local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(CorePackages.Packages.Promise)
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local AppendSearchInCatalogModule = require(Modules.AvatarExperience.Catalog.Actions.AppendSearchInCatalog)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local SetSearchInCatalogModule = require(Modules.AvatarExperience.Catalog.Actions.SetSearchInCatalog)
local SetAssetInfoFromSortResultsModule = require(Modules.AvatarExperience.Catalog.Actions.SetAssetInfoFromSortResults)
local SetBundleInfoFromSortResultsModule = require(Modules.AvatarExperience.Catalog.Actions.SetBundleInfoFromSortResults)
local SetSearchTimeModule = require(Modules.LuaApp.Actions.SetSearchTime)
local _ = require(Modules.AvatarExperience.Catalog.SearchTypes)
local FilterUtilsModule = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterUtils)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local ReportAvatarEventCounterNoAnalyticsArgumentFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging)
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local _ = require(Modules.LuaApp.Types.RoduxTypes)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local Api = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Api
local SendAXStatFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXStat
local FetchCatalogSearchForLooksModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchCatalogSearchForLooks)
local OrganicTTIMilestoneManager = require(CorePackages.Workspace.Packages.AvatarExperienceTTIPerformance).OrganicTTIMilestoneManager
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local CatalogSearchAXPages = Api.CatalogSearchAXPages

local function v24(p1, p2, Pages, p3, Callback: (any) -> (), p4)
	-- upvalues: FilterUtilsModule (copy), UtilsModule (copy), ConstantsModule (copy), AppendSearchInCatalogModule (copy), SetSearchInCatalogModule (copy), SetSearchTimeModule (copy), SetAssetInfoFromSortResultsModule (copy), SetBundleInfoFromSortResultsModule (copy), OrganicTTIMilestoneManager (copy)
	local SearchUuid = p1.searchUuid
	local SearchKeyword = p1.searchKeyword
	local SearchesInCatalogEntry = p2:getState().Search.SearchesInCatalog[SearchUuid]
	
	if FilterUtilsModule.selectSortAndFiltersKey(p2:getState()) ~= p4 then
		Callback("Search with Uuid " .. SearchUuid .. " has been terminated")
	end
	local List = {}
	local List1 = {}
	local config = {
		items = {},
		keyword = SearchKeyword,
		hasMoreEntries = not Pages.IsFinished
	}
	
	for i, value in UtilsModule.tableToCamelCaseKeys((Pages:GetCurrentPage())) do
		if value.itemType == ConstantsModule.ItemType.Asset then
			value.assetType = ConstantsModule.AssetTypeIdStrings[value.assetType]
			table.insert(List, value)
		elseif value.itemType == ConstantsModule.ItemType.Bundle then
			value.bundleType = ConstantsModule.BundleTypeIdStrings[value.bundleType]
			table.insert(List1, value)
		end
		config.items[i] = {
			id = tostring(value.id),
			type = tostring(value.itemType),
			productId = value.productId
		}
	end
	if SearchesInCatalogEntry then
		p2:dispatch(AppendSearchInCatalogModule(SearchUuid, config))
	else
		p2:dispatch(SetSearchInCatalogModule(SearchUuid, config))
	end
	if p1.recordSearchTime then
		p2:dispatch(SetSearchTimeModule(SearchUuid, tick()))
	end
	if #List > 0 then
		p2:dispatch(SetAssetInfoFromSortResultsModule(List))
	end
	if #List1 > 0 then
		p2:dispatch(SetBundleInfoFromSortResultsModule(List1))
	end
	p3:storePageObject(SearchUuid, Pages)
	OrganicTTIMilestoneManager.L3.catalogApiSearchCompleted()
	OrganicTTIMilestoneManager.L2.primaryDataReady()
	Callback()
end

local function fetchInitialPage(p5, p6, PageObjectManager, _, p7, Callback, SelectSortAndFiltersKeyResult, IsDeviceOrientationMatch, p8)
	-- upvalues: UtilsModule (copy), Api (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (copy), ConstantsModule1 (copy), Logging (copy), CatalogSearchAXPages (copy), v24 (copy)
	local SearchParamsAsQueryParams = UtilsModule.getSearchParamsAsQueryParams(UtilsModule.getSearchParams(p5, p6:getState().AvatarExperience.Catalog.SortAndFilters, IsDeviceOrientationMatch), p5.categoryInfo)
	local CatalogV2SearchItemDetails, _ = Api.getCatalogV2SearchItemDetails(p8, SearchParamsAsQueryParams)
	CatalogV2SearchItemDetails:andThen(function(Result)
		-- upvalues: GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule1 (upval), Logging (upval), Callback (copy), CatalogSearchAXPages (upval), p8 (copy), SearchParamsAsQueryParams (copy), v24 (upval), p5 (copy), p6 (copy), PageObjectManager (copy), p7 (copy), SelectSortAndFiltersKeyResult (copy)
		if Result and Result.data then
			v24(p5, p6, CatalogSearchAXPages.new(p8, SearchParamsAsQueryParams, Result.data, Result.nextPageCursor), PageObjectManager, p7, SelectSortAndFiltersKeyResult)
			
			return
		end
		if GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule() then
			ReportAvatarEventCounterNoAnalyticsArgumentFunction(ConstantsModule1.Counter.AvatarEditorServiceErrors.SearchCatalog)
		end
		Logging.warn("ApiFetchCatalogSearch V2 failure: CatalogV2SearchItemDetails is nil")
		Callback({ HttpError = Enum.HttpError.OK })
	end):catch(function(Err)
		-- upvalues: GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule1 (upval), Logging (upval), Callback (copy)
		if GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule() then
			ReportAvatarEventCounterNoAnalyticsArgumentFunction(ConstantsModule1.Counter.AvatarEditorServiceErrors.SearchCatalog)
		end
		Logging.warn("ApiFetchCatalogSearch V2 failure: " .. tostring(Err))
		Callback({ HttpError = Enum.HttpError.OK })
	end)
end

local function advancePage(Pages, p5, p6, PageObjectManager, p7, Callback: (any) -> (), SelectSortAndFiltersKeyResult)
	-- upvalues: v24 (copy), Logging (copy)
	local Success, Result = pcall(function()
		-- upvalues: Pages (copy)
		Pages:AdvanceToNextPageAsync()
	end)
	
	if Success then
		v24(p5, p6, Pages, PageObjectManager, p7, SelectSortAndFiltersKeyResult)
		
		return
	else
		Logging.warn("ApiFetchCatalogSearch failure: " .. Result)
		Callback({ HttpError = Enum.HttpError.OK })
	end
end

return function(p5, p6)
	-- upvalues: FilterUtilsModule (copy), DeviceOrientationMode (copy), FetchCatalogSearchForLooksModule (copy), PerformFetch (copy), UtilsModule (copy), PromiseModule (copy), OrganicTTIMilestoneManager (copy), fetchInitialPage (copy), SendAXStatFunction (copy), ConstantsModule1 (copy), advancePage (copy)
	return function(p7, p8)
		-- upvalues: p5 (copy), FilterUtilsModule (upval), DeviceOrientationMode (upval), FetchCatalogSearchForLooksModule (upval), p6 (copy), PerformFetch (upval), UtilsModule (upval), PromiseModule (upval), OrganicTTIMilestoneManager (upval), fetchInitialPage (upval), SendAXStatFunction (upval), ConstantsModule1 (upval), advancePage (upval)
		local PageObjectManager = p8.pageObjectManager
		local AvatarEditorService = p8.avatarEditorService
		local SearchUuid = p5.searchUuid
		local SelectSortAndFiltersKeyResult = FilterUtilsModule.selectSortAndFiltersKey(p7:getState())
		local ClockTime = os.clock()
		local IsDeviceOrientationMatch = p7:getState().DeviceOrientation == DeviceOrientationMode.Portrait
		
		local function v44()
			-- upvalues: p7 (copy), FetchCatalogSearchForLooksModule (upval), p5 (upval), p6 (upval)
			return p7:dispatch(FetchCatalogSearchForLooksModule(p5, p6))
		end
		
		local CategoryInfo = p5 and p5.categoryInfo
		
		return PerformFetch.Single(UtilsModule.getSearchKey(p7:getState(), SearchUuid), function(p9)
			-- upvalues: CategoryInfo (copy), v44 (copy), PageObjectManager (copy), SearchUuid (copy), PromiseModule (upval), OrganicTTIMilestoneManager (upval), fetchInitialPage (upval), p5 (upval), AvatarEditorService (copy), SelectSortAndFiltersKeyResult (copy), IsDeviceOrientationMatch (copy), p6 (upval), ClockTime (copy), SendAXStatFunction (upval), ConstantsModule1 (upval), advancePage (upval)
			if CategoryInfo and CategoryInfo.LooksWidgetContextForOrganicContent then
				assert(v44, "Function exists if AXAvatarsTabIXP.isEnabled() is enabled. Assert can be removed with AXAvatarsTabIXP.isEnabled()")
				
				return v44()
			end
			local PageObject = PageObjectManager:getPageObject(SearchUuid)
			
			if PageObject and PageObject.IsFinished then
				return PromiseModule.resolve()
			else
				OrganicTTIMilestoneManager.L3.catalogApiSearchStarted()
				
				return PromiseModule.new(function(p10, Callback: (any) -> ())
					-- upvalues: SearchUuid (upval), PageObject (copy), fetchInitialPage (upval), p5 (upval), p9 (copy), PageObjectManager (upval), AvatarEditorService (upval), SelectSortAndFiltersKeyResult (upval), IsDeviceOrientationMatch (upval), p6 (upval), ClockTime (upval), SendAXStatFunction (upval), ConstantsModule1 (upval), advancePage (upval)
					if not SearchUuid then
						Callback("Must have a searchUuid.")
					end
					if PageObject == nil then
						fetchInitialPage(p5, p9, PageObjectManager, AvatarEditorService, p10, Callback, SelectSortAndFiltersKeyResult, IsDeviceOrientationMatch, p6)
						
						if ClockTime then
							SendAXStatFunction({
								statName = ConstantsModule1.Counter.Latency.Network.ApiFetchCatalogSearch,
								deltaMs = (os.clock() - ClockTime) * 1000
							})
							
							return
						end
					else
						advancePage(PageObject, p5, p9, PageObjectManager, p10, Callback, SelectSortAndFiltersKeyResult)
					end
				end)
			end
		end)(p7)
	end
end