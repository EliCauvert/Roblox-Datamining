local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local ConstantsModule = require(AvatarExperienceCommon.Constants)
local FFlagAXCustomizeMakeupSupport = require(AvatarExperienceCommon.Parent.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport
local config = {
	[ConstantsModule.ASSET_TYPE_NAME_TO_ID_STRING.EyebrowAccessory] = true,
	[ConstantsModule.ASSET_TYPE_NAME_TO_ID_STRING.EyelashAccessory] = true
}

return function(p1): boolean
	-- upvalues: FFlagAXCustomizeMakeupSupport (copy), ConstantsModule (copy), config (copy)
	return if FFlagAXCustomizeMakeupSupport then ConstantsModule.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[p1] ~= nil or config[p1] == true else false
end