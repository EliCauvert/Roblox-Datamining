local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local FetchCatalogSearchWithSponsoredItemsModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchCatalogSearchWithSponsoredItems)
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local PromiseModule = require(CorePackages.Packages.Promise)
local _ = require(Modules.AvatarExperience.Catalog.SearchTypes)

return function(Callback, p1, SearchUuid, CategoryInfo, SearchKeyword)
	-- upvalues: PromiseModule (copy), FetchCatalogSearchWithSponsoredItemsModule (copy), Logging (copy)
	return PromiseModule.new(function(Callback1: (any) -> (), Callback2)
		-- upvalues: SearchUuid (copy), CategoryInfo (copy), SearchKeyword (copy), Callback (copy), FetchCatalogSearchWithSponsoredItemsModule (upval), p1 (copy), Logging (upval)
		local config = {
			recordSearchTime = true,
			searchUuid = SearchUuid,
			categoryInfo = CategoryInfo
		}
		
		if SearchKeyword then
			config.searchKeyword = SearchKeyword
		end
		local CallbackResult = Callback(FetchCatalogSearchWithSponsoredItemsModule(p1, config))
		
		if CallbackResult and CallbackResult.andThen then
			CallbackResult:andThen(function(Result)
				-- upvalues: Callback1 (copy)
				Callback1(Result)
			end, function(p2)
				-- upvalues: Logging (upval), Callback2 (copy)
				Logging.warn("fetchCatalogSearchWithSponsoredItems: Catalog search with sponsored items fetch failed: " .. tostring(p2))
				Callback2(p2)
			end)
			
			return
		else
			Callback1(true)
		end
	end)
end