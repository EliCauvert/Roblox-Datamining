local SetCategoryAndSubcategoryModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.AvatarEditor.Actions.SetCategoryAndSubcategory)
local FFlagAXEditorSubcategoryFilters = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceFlags).FFlagAXEditorSubcategoryFilters

return function(p1, p2, p3, p4)
	-- upvalues: SetCategoryAndSubcategoryModule (copy), FFlagAXEditorSubcategoryFilters (copy)
	return function(p5)
		-- upvalues: SetCategoryAndSubcategoryModule (upval), p1 (copy), p2 (copy), FFlagAXEditorSubcategoryFilters (upval), p4 (copy), p3 (copy)
		p5:dispatch(SetCategoryAndSubcategoryModule(p1, p2, if FFlagAXEditorSubcategoryFilters then p4 else nil))
		p3.clickNavigationTab(p5:getState().AvatarExperience.AvatarEditor.Categories.category, p5:getState().AvatarExperience.AvatarEditor.Categories.subcategory, p5:getState().AvatarExperience.AvatarEditor.Categories.subcategoryFilter)
	end
end