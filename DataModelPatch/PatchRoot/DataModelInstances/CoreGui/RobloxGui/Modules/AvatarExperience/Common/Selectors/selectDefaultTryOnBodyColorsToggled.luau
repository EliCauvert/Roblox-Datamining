return function(p1)
	local OutfitTryOn = p1.AvatarExperience.AvatarScene.OutfitTryOn
	
	return if OutfitTryOn then OutfitTryOn.DefaultTryOnBodyColorsToggled else false
end