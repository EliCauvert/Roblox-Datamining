local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local constantsModule = require(avatarExperienceCommon.Constants)
local fFlagAXCustomizeMakeupSupport = require(avatarExperienceCommon.Parent.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport

return function(value) --[[ line: 11 | named "isMakeupAssetType" ]]
	-- upvalues: fFlagAXCustomizeMakeupSupport (ref), constantsModule (ref)
	return if fFlagAXCustomizeMakeupSupport then constantsModule.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[value] ~= nil else false
end