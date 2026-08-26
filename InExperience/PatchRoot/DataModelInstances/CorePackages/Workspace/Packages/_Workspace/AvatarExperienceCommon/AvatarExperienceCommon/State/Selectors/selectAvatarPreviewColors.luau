local join = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.Dash).join
local selectHasBodyTryOnModule = require(script.Parent.selectHasBodyTryOn)
local selectDefaultTryOnBodyColorsModule = require(script.Parent.selectDefaultTryOnBodyColors)

return function(p1)
	-- upvalues: selectHasBodyTryOnModule (ref), selectDefaultTryOnBodyColorsModule (ref), join (ref)
	local outfitTryOn = p1.AvatarExperience.AvatarScene.OutfitTryOn
	local var1 = selectHasBodyTryOnModule(p1)
	local bodyColor3s = p1.AvatarExperience.AvatarEditor.Character.BodyColor3s
	local var2 = if outfitTryOn.DefaultTryOnBodyColorsToggled then selectDefaultTryOnBodyColorsModule(p1) else outfitTryOn.BodyColor3s
	
	return if var1 and bodyColor3s and var2 then join(bodyColor3s, var2) else bodyColor3s
end