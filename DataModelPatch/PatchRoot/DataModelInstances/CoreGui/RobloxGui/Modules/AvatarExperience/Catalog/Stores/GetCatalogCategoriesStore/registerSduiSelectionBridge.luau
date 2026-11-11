local ApplyCatalogCategorySelectionModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.Stores.applyCatalogCategorySelection)

return function(p1, p2)
	-- upvalues: ApplyCatalogCategorySelectionModule (copy)
	p1.register("MonolithCatalogSelectionStore", {
		selectCategory = function(p3)
			-- upvalues: ApplyCatalogCategorySelectionModule (upval), p2 (copy)
			ApplyCatalogCategorySelectionModule(p2, p3, nil, { source = "SduiTap" })
		end,
		selectSubcategory = function(p3)
			-- upvalues: ApplyCatalogCategorySelectionModule (upval), p2 (copy)
			ApplyCatalogCategorySelectionModule(p2, nil, p3, { source = "SduiTap" })
		end
	})
	
	return function()
		-- upvalues: p1 (copy)
		p1.unregister("MonolithCatalogSelectionStore")
	end
end