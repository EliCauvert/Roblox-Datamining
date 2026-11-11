local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(game:GetService("CorePackages").Packages.React)
local InventorySortAndFiltersModule = require(Modules.AvatarExperience.SlotBasedEditor.Components.InventorySortAndFilters.InventorySortAndFilters)
local UseInventorySortsAndFiltersPropsModule = require(Modules.AvatarExperience.SlotBasedEditor.Components.InventorySortAndFilters.useInventorySortsAndFiltersProps)

return ReactModule.memo(function(p1)
	-- upvalues: UseInventorySortsAndFiltersPropsModule (copy), ReactModule (copy), InventorySortAndFiltersModule (copy)
	return ReactModule.createElement(InventorySortAndFiltersModule, (UseInventorySortsAndFiltersPropsModule(p1)))
end)