local AvatarScreen = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local GetCatalogCategoriesStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)

return function(Callback)
	-- upvalues: AvatarScreen (copy), GetCatalogCategoriesStoreModule (copy), CatalogConstantsModule (copy), UtilsModule (copy)
	return function(p1)
		-- upvalues: AvatarScreen (upval), GetCatalogCategoriesStoreModule (upval), CatalogConstantsModule (upval), UtilsModule (upval), Callback (copy)
		local Category = nil
		local AvatarShop = nil
		local EntryPage = p1:getState().AvatarExperience.LayeredClothingSort.EntryPage
		
		if EntryPage == AvatarScreen.AvatarEditor then
			Category = p1:getState().AvatarExperience.AvatarEditor.Categories.category
			AvatarShop = "avatarEditor"
		else
			if EntryPage ~= AvatarScreen.Catalog and EntryPage ~= AvatarScreen.CatalogSearch then return end
			Category = GetCatalogCategoriesStoreModule.getCatalogSelectionStore().selectedCategoryId(false)
			AvatarShop = CatalogConstantsModule.AnalyticsContext.AvatarShop
		end
		Callback(AvatarShop, UtilsModule.getUserId(p1:getState()), Category)
	end
end