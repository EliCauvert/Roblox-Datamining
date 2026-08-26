local constantsModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Sdui.Constants)
local normalizeScreenSizeForWireModule = require(script.Parent.normalizeScreenSizeForWire)

return function(p1, p2)
	-- upvalues: normalizeScreenSizeForWireModule (ref), constantsModule (ref)
	return `{constantsModule.CatalogSduiConfigKeyPrefix}-{p1}-{normalizeScreenSizeForWireModule(p2)}`
end