local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local ConstantsModule = require(AvatarExperienceCatalog.Sdui.Constants)
local NormalizeScreenSizeForWireFunction = require(AvatarExperienceCatalog.Parent.AvatarExperienceCommon).Utils.normalizeScreenSizeForWire

return function(p1, p2): string --[[ Line: 11 | Named "getCatalogConfigKey" ]]
	-- upvalues: NormalizeScreenSizeForWireFunction (copy), ConstantsModule (copy)
	return `{ConstantsModule.CatalogSduiConfigKeyPrefix}-{p1}-{NormalizeScreenSizeForWireFunction(p2)}`
end