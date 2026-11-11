local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local _ = require(Modules.AvatarExperience.Common.Enum.UnavailableItemFilter)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)

return require(CorePackages.Packages.Rodux).createReducer(CatalogConstantsModule.DefaultFilters.UnavailableItemFilter, {
	[require(Modules.AvatarExperience.Catalog.Actions.SetUnavailableItemFilter).name] = function(_, p1)
		return p1.unavailableItemFilter
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.ResetSortAndFilters).name] = function(_, _)
		-- upvalues: CatalogConstantsModule (copy)
		return CatalogConstantsModule.DefaultFilters.UnavailableItemFilter
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.SetSortAndFilters).name] = function(p1, p2)
		return p2.UnavailableItemFilter or p1
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.NavigatedToDeepLinkCatalogFilter).name] = function(p1, p2)
		return p2.unavailableItemFilter or p1
	end
})