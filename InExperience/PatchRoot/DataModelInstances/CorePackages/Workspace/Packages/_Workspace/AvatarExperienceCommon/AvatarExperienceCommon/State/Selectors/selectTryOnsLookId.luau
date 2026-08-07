local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local LOOK_TYPE = require(avatarExperienceCommon.Constants).LOOK_TYPE
local fFlagAXMISEnableMultiShopping = require(avatarExperienceCommon.Parent.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping

return function(p0) --[[ line: 14 | named "selectTryOnsLookId" ]]
	-- upvalues: fFlagAXMISEnableMultiShopping (ref), LOOK_TYPE (ref)
	return if fFlagAXMISEnableMultiShopping and (if fFlagAXMISEnableMultiShopping then p0.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledLookType else nil) == LOOK_TYPE.Makeup then p0.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookId else p0.AvatarExperience.AvatarScene.OutfitTryOn.LookId
end