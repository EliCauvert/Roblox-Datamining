local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CloseMatchingScreensModule = require(Modules.AvatarExperience.Common.Thunks.CloseMatchingScreens)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local AppPageModule = require(Modules.LuaApp.AppPage)
local FFlagAXEditorSubcategoryFilters = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXEditorSubcategoryFilters

return function(p1)
	-- upvalues: CloseMatchingScreensModule (copy), AvatarScreen (copy), AppPageModule (copy), FFlagAXEditorSubcategoryFilters (copy)
	return CloseMatchingScreensModule(p1, {
		AvatarScreen.ItemDetails,
		AvatarScreen.SortAndFilters,
		AppPageModule.GameDetail,
		AppPageModule.ProfilePlatform,
		if FFlagAXEditorSubcategoryFilters then AvatarScreen.SubcategoryFiltersDropdown else nil
	})
end