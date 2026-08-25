local join = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.Dash).join
local selectHasBodyTryOnModule = require(script.Parent.selectHasBodyTryOn)
local selectDefaultTryOnBodyColorsModule = require(script.Parent.selectDefaultTryOnBodyColors)

return function(p0)
	-- upvalues: selectHasBodyTryOnModule (ref), selectDefaultTryOnBodyColorsModule (ref), join (ref)
	local outfitTryOn = p0.AvatarExperience.AvatarScene.OutfitTryOn
	local var2 = selectHasBodyTryOnModule(p0)
	local bodyColor3s = p0.AvatarExperience.AvatarEditor.Character.BodyColor3s
	local var3 = if outfitTryOn.DefaultTryOnBodyColorsToggled then selectDefaultTryOnBodyColorsModule(p0) else outfitTryOn.BodyColor3s
	
	return if var2 and bodyColor3s and var3 then join(bodyColor3s, var3) else bodyColor3s
end