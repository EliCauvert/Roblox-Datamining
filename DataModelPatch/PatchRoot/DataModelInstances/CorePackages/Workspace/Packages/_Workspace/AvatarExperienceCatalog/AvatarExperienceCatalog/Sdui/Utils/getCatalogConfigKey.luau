local ConstantsModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Sdui.Constants)
local NormalizeScreenSizeForWireModule = require(script.Parent.normalizeScreenSizeForWire)

return function(p1, p2): string
	-- upvalues: NormalizeScreenSizeForWireModule (copy), ConstantsModule (copy)
	return `{ConstantsModule.CatalogSduiConfigKeyPrefix}-{p1}-{NormalizeScreenSizeForWireModule(p2)}`
end