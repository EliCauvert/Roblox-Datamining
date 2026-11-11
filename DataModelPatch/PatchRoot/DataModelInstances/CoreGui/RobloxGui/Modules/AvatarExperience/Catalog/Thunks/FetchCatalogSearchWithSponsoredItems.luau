local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local ApiFetchCatalogSearchModule = require(Modules.AvatarExperience.Catalog.Thunks.ApiFetchCatalogSearch)
local FetchSponsoredItemsModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchSponsoredItems)
local _ = require(Modules.AvatarExperience.Catalog.SearchTypes)
local _ = require(CorePackages.Packages.LuauPolyfill)
local OrganicTTIMilestoneManager = require(CorePackages.Workspace.Packages.AvatarExperienceTTIPerformance).OrganicTTIMilestoneManager

return function(p1, p2)
	-- upvalues: OrganicTTIMilestoneManager (copy), FetchSponsoredItemsModule (copy), CatalogConstantsModule (copy), ApiFetchCatalogSearchModule (copy)
	return function(p3)
		-- upvalues: p2 (copy), OrganicTTIMilestoneManager (upval), FetchSponsoredItemsModule (upval), p1 (copy), CatalogConstantsModule (upval), ApiFetchCatalogSearchModule (upval)
		if (p2 and p2.categoryInfo or {}).ShowSponsored then
			OrganicTTIMilestoneManager.L3.sponsoredSearchStarted()
			local DispatchResult = p3:dispatch(FetchSponsoredItemsModule(p1, CatalogConstantsModule.SponsoredItemsCategoryRecommended, CatalogConstantsModule.SponsoredItemsToFetch))
			
			if DispatchResult and DispatchResult.andThen then
				DispatchResult:andThen(function()
					-- upvalues: OrganicTTIMilestoneManager (upval)
					OrganicTTIMilestoneManager.L3.sponsoredSearchCompleted()
				end)
			end
		end
		return p3:dispatch(ApiFetchCatalogSearchModule(p2, p1))
	end
end