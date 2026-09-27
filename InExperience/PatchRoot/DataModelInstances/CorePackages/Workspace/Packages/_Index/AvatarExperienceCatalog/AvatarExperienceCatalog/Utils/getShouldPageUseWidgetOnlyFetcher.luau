local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local _ = require(parent.AvatarExperienceCommon)
local var1 = require(parent.AvatarExperienceModel).Enums.CatalogCategories.Recommended:rawValue()

return function(p1, p2, p3)
	-- upvalues: var1 (ref)
	return if p1 then if p3 then false else p1.Id == var1 and (p2 and p2 > 0) else false
end