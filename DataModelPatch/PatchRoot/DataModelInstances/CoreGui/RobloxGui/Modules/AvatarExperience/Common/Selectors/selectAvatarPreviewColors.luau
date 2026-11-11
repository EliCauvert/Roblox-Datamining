local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local SelectHasBodyTryOnModule = require(script.Parent.selectHasBodyTryOn)

return function(p1)
	-- upvalues: SelectHasBodyTryOnModule (copy), CryoModule (copy)
	local OutfitTryOn = p1.AvatarExperience.AvatarScene.OutfitTryOn
	local BodyColor3s = p1.AvatarExperience.AvatarEditor.Character.BodyColor3s
	local BodyColor3s1 = if OutfitTryOn.DefaultTryOnBodyColorsToggled then nil else OutfitTryOn.BodyColor3s
	
	return if SelectHasBodyTryOnModule(p1) and BodyColor3s and BodyColor3s1 then CryoModule.Dictionary.join(BodyColor3s, BodyColor3s1) else BodyColor3s
end