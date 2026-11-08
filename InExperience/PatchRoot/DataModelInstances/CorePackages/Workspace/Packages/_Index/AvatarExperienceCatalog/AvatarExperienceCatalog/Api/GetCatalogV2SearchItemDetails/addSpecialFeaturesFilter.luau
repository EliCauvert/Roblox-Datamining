local _ = require(script:FindFirstAncestor("AvatarExperienceCatalog").Models.CatalogV2SearchItemDetails)

return function(Tbl, RequiredPropertyFilters)
	if RequiredPropertyFilters == nil or #RequiredPropertyFilters == 0 then
		return Tbl
	else
		local Copy = table.clone(Tbl)
		Copy.requiredPropertyFilters = RequiredPropertyFilters
		
		return Copy
	end
end