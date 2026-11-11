local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)

return (require(CorePackages.Packages.Rodux).createReducer(CatalogConstantsModule.DefaultFilters.WearTimeFilter, {
	[require(Modules.AvatarExperience.Catalog.Actions.SetWearTimeFilter).name] = function(_, p1)
		return p1.wearTimeFilter
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.ResetSortAndFilters).name] = function(_, _)
		-- upvalues: CatalogConstantsModule (copy)
		return CatalogConstantsModule.DefaultFilters.WearTimeFilter
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.SetSortAndFilters).name] = function(p1, p2)
		return p2.WearTimeFilter or p1
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.NavigatedToDeepLinkCatalogFilter).name] = function(p1, p2)
		return p2.wearTimeFilter or p1
	end
}))