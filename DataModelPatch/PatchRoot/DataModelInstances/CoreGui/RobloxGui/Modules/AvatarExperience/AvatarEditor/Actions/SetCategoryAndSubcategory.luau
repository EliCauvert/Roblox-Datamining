local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local FFlagAXEditorSubcategoryFilters = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXEditorSubcategoryFilters

return require(CorePackages.Packages.Rodux).makeActionCreator("Avatar-" .. script.Name, function(Category, Subcategory, p1)
	-- upvalues: ArgCheckModule (copy), FFlagAXEditorSubcategoryFilters (copy)
	ArgCheckModule.isTypeOrNil(Category, "number", "SetCategoryAndSubCategory expects category")
	ArgCheckModule.isTypeOrNil(Subcategory, "number", "SetCategoryAndSubCategory expects subcategory")
	
	if FFlagAXEditorSubcategoryFilters then
		ArgCheckModule.isTypeOrNil(p1, "number", "SetCategoryAndSubCategory expects subcategoryFilter")
	end
	return {
		category = Category,
		subcategory = Subcategory,
		subcategoryFilter = if FFlagAXEditorSubcategoryFilters then p1 else nil
	}
end)