return function(p1)
	local AvatarExperience = p1 and p1.AvatarExperience or p1
	local OutfitTryOn = AvatarExperience and (AvatarExperience.AvatarScene and AvatarExperience.AvatarScene.OutfitTryOn)
	
	return if OutfitTryOn then OutfitTryOn.BackgroundPreview else nil
end