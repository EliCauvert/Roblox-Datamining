local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local _ = require(Parent.AvatarExperienceCommon)
local RawValueResult = require(Parent.AvatarExperienceModel).Enums.CatalogCategories.Recommended:rawValue()

return function(p1, p2: number, p3): boolean
	-- upvalues: RawValueResult (copy)
	return if p1 then not p3 and (p1.Id == RawValueResult and (not p2 or p2 <= 0)) else false
end