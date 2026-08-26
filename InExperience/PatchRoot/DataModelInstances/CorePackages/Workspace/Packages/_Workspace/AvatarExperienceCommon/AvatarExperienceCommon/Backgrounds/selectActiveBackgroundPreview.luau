return function(value)
	local var1 = value and value.AvatarExperience
	local outfitTryOn = var1 and (var1.AvatarScene and var1.AvatarScene.OutfitTryOn)
	
	return if outfitTryOn then outfitTryOn.BackgroundPreview else nil
end