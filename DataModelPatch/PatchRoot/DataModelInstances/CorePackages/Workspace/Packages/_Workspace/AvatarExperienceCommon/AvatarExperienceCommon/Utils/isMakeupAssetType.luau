local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local ConstantsModule = require(AvatarExperienceCommon.Constants)
local FFlagAXCustomizeMakeupSupport = require(AvatarExperienceCommon.Parent.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport

return function(p1): boolean
	-- upvalues: FFlagAXCustomizeMakeupSupport (copy), ConstantsModule (copy)
	return if FFlagAXCustomizeMakeupSupport then ConstantsModule.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[p1] ~= nil else false
end