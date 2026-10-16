local ConstantsModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Sdui.Constants)
local config = { ["catalog-tab:all"] = "catalog-tab:recommended" }

return function(p1): string --[[ Line: 33 | Named "getCatalogPageIdentifier" ]]
	-- upvalues: config (copy), ConstantsModule (copy)
	return `{ConstantsModule.CatalogContentIdentifierPrefix}:{config[p1] or p1}`
end