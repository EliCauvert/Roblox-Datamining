local LOOK_TYPE = require(script:FindFirstAncestor("AvatarExperienceCommon").Constants).LOOK_TYPE

return function(p1)
	-- upvalues: LOOK_TYPE (ref)
	return if p1.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledLookType == LOOK_TYPE.Makeup then p1.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookId else p1.AvatarExperience.AvatarScene.OutfitTryOn.LookId
end