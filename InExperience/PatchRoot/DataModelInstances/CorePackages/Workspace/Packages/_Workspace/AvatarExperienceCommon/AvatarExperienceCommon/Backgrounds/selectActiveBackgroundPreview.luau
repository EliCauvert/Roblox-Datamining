return function(value)
	local var0 = value and value.AvatarExperience
	local outfitTryOn = var0 and (var0.AvatarScene and var0.AvatarScene.OutfitTryOn)
	
	return if outfitTryOn then outfitTryOn.BackgroundPreview else nil
end