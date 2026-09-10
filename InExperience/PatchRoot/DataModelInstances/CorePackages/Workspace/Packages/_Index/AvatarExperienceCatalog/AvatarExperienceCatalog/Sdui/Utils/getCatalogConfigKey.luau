local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local constantsModule = require(avatarExperienceCatalog.Sdui.Constants)
local normalizeScreenSizeForWire = require(avatarExperienceCatalog.Parent.AvatarExperienceCommon).Utils.normalizeScreenSizeForWire

return function(p1, p2)
	-- upvalues: normalizeScreenSizeForWire (ref), constantsModule (ref)
	return `{constantsModule.CatalogSduiConfigKeyPrefix}-{p1}-{normalizeScreenSizeForWire(p2)}`
end