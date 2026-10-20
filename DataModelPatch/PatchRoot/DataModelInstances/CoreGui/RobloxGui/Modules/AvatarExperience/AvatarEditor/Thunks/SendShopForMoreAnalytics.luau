return function(p1)
	return function(p2)
		-- upvalues: p1 (copy)
		p1.clickShopForMore(p2:getState().AvatarExperience.AvatarEditor.Categories.category, p2:getState().AvatarExperience.AvatarEditor.Categories.subcategory)
	end
end