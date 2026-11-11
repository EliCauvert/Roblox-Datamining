local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)

return require(CorePackages.Packages.Rodux).createReducer(CatalogConstantsModule.DefaultFilters.SelectedTopics, {
	[require(Modules.AvatarExperience.Catalog.Actions.SetSelectedTopics).name] = function(_, p1)
		return p1.selectedTopics
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.ClearSelectedTopics).name] = function(_, _)
		-- upvalues: CatalogConstantsModule (copy)
		return CatalogConstantsModule.DefaultFilters.SelectedTopics
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.SetSortAndFilters).name] = function(p1, p2)
		return p2.SelectedTopics or p1
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.ResetSortAndFilters).name] = function(_, _)
		-- upvalues: CatalogConstantsModule (copy)
		return CatalogConstantsModule.DefaultFilters.SelectedTopics
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.NavigatedToDeepLinkCatalogFilter).name] = function(p1, p2)
		return p2.topics or p1
	end
})