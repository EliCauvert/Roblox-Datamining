local LOOKTYPE = require(script:FindFirstAncestor("AvatarExperienceCommon").Constants).LOOK_TYPE

return function(p1)
	-- upvalues: LOOKTYPE (copy)
	return if p1.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledLookType == LOOKTYPE.Makeup then p1.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookId else p1.AvatarExperience.AvatarScene.OutfitTryOn.LookId
end