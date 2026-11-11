local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local SetWidgetInfoModule = require(Modules.AvatarExperience.Catalog.Actions.SetWidgetInfo)
local ClearWidgetInfoModule = require(Modules.AvatarExperience.Catalog.Actions.ClearWidgetInfo)
local SearchUuidModule = require(Modules.LuaApp.SearchUuid)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local AvatarExperienceCatalogModule = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local Api = AvatarExperienceCatalogModule.Api
local GetAXMarketplaceWidgetStoreFunction = AvatarExperienceCatalogModule.Stores.getAXMarketplaceWidgetStore
local LogWidgetLoadedFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).logWidgetLoaded
local FFlagAXPassScreenSizeToWidgetApi = AvatarExperienceFlagsModule.FFlagAXPassScreenSizeToWidgetApi
local FFlagAXMoveAllTabToWidgetOnly = AvatarExperienceFlagsModule.FFlagAXMoveAllTabToWidgetOnly

return function(p1, p2, p3)
	-- upvalues: CatalogUtilsModule (copy), SearchUuidModule (copy), FFlagAXPassScreenSizeToWidgetApi (copy), FFlagAXMoveAllTabToWidgetOnly (copy), GetAXMarketplaceWidgetStoreFunction (copy), PerformFetch (copy), ClearWidgetInfoModule (copy), Api (copy), SetWidgetInfoModule (copy), LogWidgetLoadedFunction (copy), Logging (copy)
	local FetchWidgetInfoFetchKey = CatalogUtilsModule.getFetchWidgetInfoFetchKey(p2, p3)
	local SearchUuidModuleResult = SearchUuidModule()
	local NoFFlagAXMoveAllTabToWidgetOnly: boolean = FFlagAXPassScreenSizeToWidgetApi and not FFlagAXMoveAllTabToWidgetOnly
	
	if FFlagAXPassScreenSizeToWidgetApi and FFlagAXMoveAllTabToWidgetOnly then
		local DebouncedScreenSize = GetAXMarketplaceWidgetStoreFunction(false).getDebouncedScreenSize(false)
		FetchWidgetInfoFetchKey = CatalogUtilsModule.getFetchWidgetInfoFetchKey(p2, p3, DebouncedScreenSize)
		
		return PerformFetch.Single(FetchWidgetInfoFetchKey, function(p4)
			-- upvalues: ClearWidgetInfoModule (upval), p2 (copy), p3 (copy), Api (upval), p1 (copy), SearchUuidModuleResult (copy), DebouncedScreenSize (copy), SetWidgetInfoModule (upval), LogWidgetLoadedFunction (upval), Logging (upval)
			p4:dispatch(ClearWidgetInfoModule(p2, p3))
			local WidgetListInfoSearch = nil
			
			if p2 then
				local _
				WidgetListInfoSearch, _ = Api.getWidgetListInfoSearch(p1, SearchUuidModuleResult, p2)
			else
				local _
				WidgetListInfoSearch, _ = Api.getWidgetListInfo(p1, SearchUuidModuleResult, p3, DebouncedScreenSize)
			end
			return WidgetListInfoSearch:andThen(function(Result)
				-- upvalues: p4 (copy), SetWidgetInfoModule (upval), SearchUuidModuleResult (upval), p2 (upval), p3 (upval), LogWidgetLoadedFunction (upval)
				p4:dispatch(SetWidgetInfoModule(if Result and Result.widgets then Result.widgets else {}, SearchUuidModuleResult, p2, p3, if Result and Result.configuration then Result.configuration else {}))
				
				if Result and Result.widgets then
					LogWidgetLoadedFunction(Result.widgets, SearchUuidModuleResult)
				end
				return Result
			end):catch(function(Err)
				-- upvalues: Logging (upval)
				Logging.warn("WebApi failure in FetchWidgetInfo: " .. tostring(Err))
			end)
		end)
	elseif NoFFlagAXMoveAllTabToWidgetOnly then
		local DebouncedScreenSize1 = GetAXMarketplaceWidgetStoreFunction(false).getDebouncedScreenSize(false)
		FetchWidgetInfoFetchKey = CatalogUtilsModule.getFetchWidgetInfoFetchKey(p2, p3, nil)
		
		return PerformFetch.Single(FetchWidgetInfoFetchKey, function(p4)
			-- upvalues: ClearWidgetInfoModule (upval), p2 (copy), p3 (copy), Api (upval), p1 (copy), SearchUuidModuleResult (copy), SearchUuidModule (upval), DebouncedScreenSize1 (copy), Logging (upval), SetWidgetInfoModule (upval)
			p4:dispatch(ClearWidgetInfoModule(p2, p3))
			local WidgetListInfoSearch = nil
			
			if p2 then
				local _
				WidgetListInfoSearch, _ = Api.getWidgetListInfoSearch(p1, SearchUuidModuleResult, p2)
			else
				local _
				WidgetListInfoSearch, _ = Api.getWidgetListInfo(p1, SearchUuidModuleResult, p3, nil)
			end
			local SearchUuidModuleResult1 = SearchUuidModule()
			local WidgetListInfoSearch1 = nil
			
			if p2 then
				local _
				WidgetListInfoSearch1, _ = Api.getWidgetListInfoSearch(p1, SearchUuidModuleResult1, p2)
			else
				local _
				WidgetListInfoSearch1, _ = Api.getWidgetListInfo(p1, SearchUuidModuleResult1, p3, DebouncedScreenSize1)
			end
			WidgetListInfoSearch1:catch(function(Err)
				-- upvalues: Logging (upval)
				Logging.warn("WebApi failure in FetchWidgetInfo (shadow traffic): " .. tostring(Err))
			end)
			
			return WidgetListInfoSearch:andThen(function(Result)
				-- upvalues: p4 (copy), SetWidgetInfoModule (upval), SearchUuidModuleResult (upval), p2 (upval), p3 (upval)
				p4:dispatch(SetWidgetInfoModule(if Result and Result.widgets then Result.widgets else {}, SearchUuidModuleResult, p2, p3, if Result and Result.configuration then Result.configuration else {}))
				
				return Result
			end):catch(function(Err)
				-- upvalues: Logging (upval)
				Logging.warn("WebApi failure in FetchWidgetInfo: " .. tostring(Err))
			end)
		end)
	else
		return PerformFetch.Single(FetchWidgetInfoFetchKey, function(p4)
			-- upvalues: ClearWidgetInfoModule (upval), p2 (copy), p3 (copy), Api (upval), p1 (copy), SearchUuidModuleResult (copy), SetWidgetInfoModule (upval), Logging (upval)
			p4:dispatch(ClearWidgetInfoModule(p2, p3))
			local WidgetListInfoSearch = nil
			
			if p2 then
				local _
				WidgetListInfoSearch, _ = Api.getWidgetListInfoSearch(p1, SearchUuidModuleResult, p2)
			else
				local _
				WidgetListInfoSearch, _ = Api.getWidgetListInfo(p1, SearchUuidModuleResult, p3)
			end
			return WidgetListInfoSearch:andThen(function(Result)
				-- upvalues: p4 (copy), SetWidgetInfoModule (upval), SearchUuidModuleResult (upval), p2 (upval), p3 (upval)
				p4:dispatch(SetWidgetInfoModule(if Result and Result.widgets then Result.widgets else {}, SearchUuidModuleResult, p2, p3, if Result and Result.configuration then Result.configuration else {}))
			end):catch(function(Err)
				-- upvalues: Logging (upval)
				Logging.warn("WebApi failure in FetchWidgetInfo: " .. tostring(Err))
			end)
		end)
	end
end