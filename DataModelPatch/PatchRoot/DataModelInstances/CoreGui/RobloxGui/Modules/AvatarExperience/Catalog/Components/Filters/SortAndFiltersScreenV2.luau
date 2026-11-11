local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local CatalogSortAndFiltersModule = require(Modules.AvatarExperience.Catalog.Components.Filters.CatalogSortAndFilters)
local InventorySortsAndFiltersContainerModule = require(Modules.AvatarExperience.SlotBasedEditor.Components.InventorySortAndFilters.InventorySortsAndFiltersContainer)

return function()
	-- upvalues: UseNavigationFunction (copy), ReactModule (copy), InventorySortsAndFiltersContainerModule (copy), CatalogSortAndFiltersModule (copy)
	local Params = UseNavigationFunction().state.params
	
	return if Params.slotBasedEditorContext then ReactModule.createElement(InventorySortsAndFiltersContainerModule, { slotBasedEditorContext = Params.slotBasedEditorContext }) else ReactModule.createElement(CatalogSortAndFiltersModule)
end