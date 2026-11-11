local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ItemDetailsModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.ItemDetails)
local ItemDetailsDEPRECATEDModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.ItemDetails_DEPRECATED)

return require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)(if require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation then ItemDetailsModule else ItemDetailsDEPRECATEDModule)