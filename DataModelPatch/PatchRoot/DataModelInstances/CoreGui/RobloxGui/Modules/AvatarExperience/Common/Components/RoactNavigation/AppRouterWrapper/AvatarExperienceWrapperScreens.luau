local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AvatarScreen = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen

return {
	[AvatarScreen.ItemDetails] = require(Modules.AvatarExperience.Common.Components.ItemDetails.ItemDetailsScreen),
	[AvatarScreen.ResellersPage] = require(Modules.AvatarExperience.Catalog.Components.Resellers.ResellersPage),
	[AvatarScreen.SellItemPage] = require(Modules.AvatarExperience.Common.Components.ItemDetails.SellPage.SellPage),
	[AvatarScreen.TryOnItem] = require(Modules.AvatarExperience.Common.Components.ItemDetails.TryOnItemScreen),
	[AvatarScreen.ItemOwnershipPage] = require(Modules.AvatarExperience.Common.Components.ItemDetails.ItemOwnershipPage.ItemOwnershipPage),
	[AvatarScreen.SellItemPeekView] = require(Modules.AvatarExperience.Common.Components.ItemDetails.SellPage.SellItemPeekView),
	[AvatarScreen.AvatarBackground] = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)((require(Modules.AvatarExperience.Common.Components.AvatarBackground))),
	[AvatarScreen.OutfitDetails] = require(Modules.AvatarExperience.AvatarEditor.Components.AssetManagement.OutfitDetailsScreen)
}