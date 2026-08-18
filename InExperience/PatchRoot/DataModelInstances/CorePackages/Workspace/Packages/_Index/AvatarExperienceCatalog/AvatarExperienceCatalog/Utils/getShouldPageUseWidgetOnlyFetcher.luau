local var0 = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceCommon).Enums.CatalogCategories.Recommended:rawValue()

return function(p0, p1, p2) --[[ line: 25 | named "getShouldPageUseWidgetOnlyFetcher" ]]
	-- upvalues: var0 (ref)
	return if p0 then if p2 then false else p0.Id == var0 and (p1 and p1 > 0) else false
end