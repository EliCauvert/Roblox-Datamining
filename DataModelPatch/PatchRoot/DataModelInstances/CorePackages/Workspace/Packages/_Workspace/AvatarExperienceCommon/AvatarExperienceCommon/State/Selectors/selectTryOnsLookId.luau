local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local LOOKTYPE = require(AvatarExperienceCommon.Constants).LOOK_TYPE
local FFlagAXMISEnableMultiShopping = require(AvatarExperienceCommon.Parent.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping

return function(p1)
	-- upvalues: FFlagAXMISEnableMultiShopping (copy), LOOKTYPE (copy)
	local LastToggledLookType = if FFlagAXMISEnableMultiShopping then p1.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledLookType else nil
	
	return if FFlagAXMISEnableMultiShopping and LastToggledLookType == LOOKTYPE.Makeup then p1.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookId else p1.AvatarExperience.AvatarScene.OutfitTryOn.LookId
end