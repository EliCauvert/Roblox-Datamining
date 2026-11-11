local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CreateCategoryInventoryStoreFunction = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor).Stores.createCategoryInventoryStore
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local GetAvatarEditorCategoriesModule = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorCategories)
local PhotoboothCategoriesModule = require(Modules.AvatarExperience.Photobooth.photoboothCategories)
local FFlagAXEditorSubcategoryFilters = AvatarExperienceFlagsModule.FFlagAXEditorSubcategoryFilters
local FFlagAXPhotoboothFunctionality = AvatarExperienceFlagsModule.FFlagAXPhotoboothFunctionality
local FFlagAXPhotoboothIsStandalone = AvatarExperienceFlagsModule.FFlagAXPhotoboothIsStandalone

return function()
	-- upvalues: GetAvatarEditorCategoriesModule (copy), FFlagAXPhotoboothIsStandalone (copy), CreateCategoryInventoryStoreFunction (copy), FFlagAXEditorSubcategoryFilters (copy), FFlagAXPhotoboothFunctionality (copy), PhotoboothCategoriesModule (copy)
	local t = {}
	
	for _, value in GetAvatarEditorCategoriesModule() do
		if not value.Subcategories then
			if not FFlagAXPhotoboothIsStandalone or value.NavigationKey then
				t[value.NavigationKey] = CreateCategoryInventoryStoreFunction()
				continue
			end
			continue
		end
		for _, subcategory in value.Subcategories do
			if not FFlagAXPhotoboothIsStandalone or subcategory.NavigationKey then
				t[subcategory.NavigationKey] = CreateCategoryInventoryStoreFunction()
				
				if FFlagAXEditorSubcategoryFilters and subcategory.SubcategoryFilters then
					for _, subcategoryFilter in subcategory.SubcategoryFilters do
						t[subcategoryFilter.NavigationKey] = CreateCategoryInventoryStoreFunction()
					end
				end
			end
		end
	end
	if FFlagAXPhotoboothFunctionality then
		for _, value1 in PhotoboothCategoriesModule do
			t[value1.NavigationKey] = CreateCategoryInventoryStoreFunction()
		end
	end
	return t
end