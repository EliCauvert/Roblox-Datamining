local constantsModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Sdui.Constants)
local normalizeScreenSizeForWireModule = require(script.Parent.normalizeScreenSizeForWire)

return function(p0, p1) --[[ line: 10 | named "getCatalogConfigKey" ]]
	-- upvalues: normalizeScreenSizeForWireModule (ref), constantsModule (ref)
	return `{constantsModule.CatalogSduiConfigKeyPrefix}-{p0}-{normalizeScreenSizeForWireModule(p1)}`
end