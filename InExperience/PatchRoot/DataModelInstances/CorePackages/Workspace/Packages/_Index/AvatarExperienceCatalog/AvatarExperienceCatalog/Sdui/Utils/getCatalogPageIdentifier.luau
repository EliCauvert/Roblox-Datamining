local constantsModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Sdui.Constants)
local t = { ["catalog-tab:all"] = "catalog-tab:recommended" }

return function(p0) --[[ line: 33 | named "getCatalogPageIdentifier" ]]
	-- upvalues: t (ref), constantsModule (ref)
	return `{constantsModule.CatalogContentIdentifierPrefix}:{t[p0] or p0}`
end