local constantsModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Sdui.Constants)
local t = { ["catalog-tab:all"] = "catalog-tab:recommended" }

return function(p1)
	-- upvalues: t (ref), constantsModule (ref)
	return `{constantsModule.CatalogContentIdentifierPrefix}:{t[p1] or p1}`
end