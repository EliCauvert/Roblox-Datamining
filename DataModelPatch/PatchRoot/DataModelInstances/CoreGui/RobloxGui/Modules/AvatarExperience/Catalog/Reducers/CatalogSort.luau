local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(Modules.AvatarExperience.Common.Enum.SortType)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)

return require(game:GetService("CorePackages").Packages.Rodux).createReducer(CatalogConstantsModule.DefaultFilters.CatalogSort, {
	[require(Modules.AvatarExperience.Catalog.Actions.SetCatalogSort).name] = function(_, p1)
		return p1.sort
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.ResetSortAndFilters).name] = function(_, _)
		-- upvalues: CatalogConstantsModule (copy)
		return CatalogConstantsModule.DefaultFilters.CatalogSort
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.SetSortAndFilters).name] = function(p1, p2)
		return p2.CatalogSort or p1
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.NavigatedToDeepLinkCatalogFilter).name] = function(p1, p2)
		return p2.sortType or p1
	end
})