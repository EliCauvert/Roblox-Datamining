local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local LOOK_TYPE = require(avatarExperienceCommon.Constants).LOOK_TYPE
local fFlagAXMISEnableMultiShopping = require(avatarExperienceCommon.Parent.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping

return function(p1)
	-- upvalues: fFlagAXMISEnableMultiShopping (ref), LOOK_TYPE (ref)
	return if fFlagAXMISEnableMultiShopping and (if fFlagAXMISEnableMultiShopping then p1.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledLookType else nil) == LOOK_TYPE.Makeup then p1.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookId else p1.AvatarExperience.AvatarScene.OutfitTryOn.LookId
end