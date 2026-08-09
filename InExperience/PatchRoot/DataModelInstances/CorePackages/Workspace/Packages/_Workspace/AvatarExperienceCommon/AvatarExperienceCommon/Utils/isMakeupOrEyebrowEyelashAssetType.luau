local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local constantsModule = require(avatarExperienceCommon.Constants)
local fFlagAXCustomizeMakeupSupport = require(avatarExperienceCommon.Parent.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport
local t = {
	[constantsModule.ASSET_TYPE_NAME_TO_ID_STRING.EyebrowAccessory] = true,
	[constantsModule.ASSET_TYPE_NAME_TO_ID_STRING.EyelashAccessory] = true
}

return function(value) --[[ line: 16 | named "isMakeupOrEyebrowEyelashAssetType" ]]
	-- upvalues: fFlagAXCustomizeMakeupSupport (ref), constantsModule (ref), t (ref)
	return if fFlagAXCustomizeMakeupSupport then if constantsModule.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[value] == nil then t[value] == true else true else false
end