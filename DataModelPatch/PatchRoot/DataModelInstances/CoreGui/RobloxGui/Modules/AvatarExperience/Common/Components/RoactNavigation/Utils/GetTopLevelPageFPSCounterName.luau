local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AvatarScreen = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)

return function(p1, p2)
	-- upvalues: ConstantsModule (copy), NavigationUtilsModule (copy), AvatarScreen (copy)
	local TopLevelFPS = ConstantsModule.Counter.TopLevelFPS
	local IsWithinViewContext = NavigationUtilsModule.isWithinViewContext(p2, AvatarScreen.CatalogSearch)
	
	return ({
		[AvatarScreen.Catalog] = TopLevelFPS.Catalog,
		[AvatarScreen.CatalogSearch] = TopLevelFPS.Search,
		[AvatarScreen.AvatarEditor] = TopLevelFPS.Editor,
		[AvatarScreen.ItemDetails] = IsWithinViewContext and TopLevelFPS.SearchItemDetails or TopLevelFPS.CatalogItemDetails,
		[AvatarScreen.SortAndFilters] = IsWithinViewContext and TopLevelFPS.SearchFilters or TopLevelFPS.CatalogFilters
	})[p1] or ConstantsModule.Counter.TopLevelFPS.Unknown
end