local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local FFlagAXEditorSubcategoryFilters = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXEditorSubcategoryFilters

return require(CorePackages.Packages.Rodux).createReducer({
	category = 1,
	subcategory = 1,
	subButton = 1,
	subcategoryFilter = if FFlagAXEditorSubcategoryFilters then 1 else nil
}, {
	[require(Modules.AvatarExperience.AvatarEditor.Actions.SetCategoryAndSubcategory).name] = function(p1, p2)
		-- upvalues: CryoModule (copy), FFlagAXEditorSubcategoryFilters (copy)
		return CryoModule.Dictionary.join(p1, {
			subButton = 1,
			category = p2.category or p1.category,
			subcategory = p2.subcategory or 1,
			subcategoryFilter = if FFlagAXEditorSubcategoryFilters then p2.subcategoryFilter or 1 else nil
		})
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.NavigatedToDeepLinkAvatarEditor).name] = function(p1, p2)
		-- upvalues: CryoModule (copy), FFlagAXEditorSubcategoryFilters (copy)
		return CryoModule.Dictionary.join(p1, {
			subButton = 1,
			category = p2.category or p1.category,
			subcategory = p2.subcategory or 1,
			subcategoryFilter = if FFlagAXEditorSubcategoryFilters then p2.subcategoryFilter or 1 else nil
		})
	end
})