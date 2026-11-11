local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local _ = require(Modules.AvatarExperience.Common.Enum.SalesTypeFilter)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)

return (require(CorePackages.Packages.Rodux).createReducer(CatalogConstantsModule.DefaultFilters.SalesTypeFilter, {
	[require(Modules.AvatarExperience.Catalog.Actions.SetSalesTypeFilter).name] = function(_, p1)
		return p1.salesType
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.ResetSortAndFilters).name] = function(_, _)
		-- upvalues: CatalogConstantsModule (copy)
		return CatalogConstantsModule.DefaultFilters.SalesTypeFilter
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.SetSortAndFilters).name] = function(p1, p2)
		return p2.SalesTypeFilter or p1
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.NavigatedToDeepLinkCatalogFilter).name] = function(p1, p2)
		return p2.salesTypeFilter or p1
	end
}))