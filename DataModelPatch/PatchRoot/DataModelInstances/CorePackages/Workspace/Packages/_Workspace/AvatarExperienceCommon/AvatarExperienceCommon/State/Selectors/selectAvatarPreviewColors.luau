local JoinFunction = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.Dash).join
local SelectHasBodyTryOnModule = require(script.Parent.selectHasBodyTryOn)
local SelectDefaultTryOnBodyColorsModule = require(script.Parent.selectDefaultTryOnBodyColors)

return function(p1)
	-- upvalues: SelectHasBodyTryOnModule (copy), SelectDefaultTryOnBodyColorsModule (copy), JoinFunction (copy)
	local OutfitTryOn = p1.AvatarExperience.AvatarScene.OutfitTryOn
	local BodyColor3s = p1.AvatarExperience.AvatarEditor.Character.BodyColor3s
	local SelectDefaultTryOnBodyColorsModuleResult = if OutfitTryOn.DefaultTryOnBodyColorsToggled then SelectDefaultTryOnBodyColorsModule(p1) else OutfitTryOn.BodyColor3s
	
	return if SelectHasBodyTryOnModule(p1) and BodyColor3s and SelectDefaultTryOnBodyColorsModuleResult then JoinFunction(BodyColor3s, SelectDefaultTryOnBodyColorsModuleResult) else BodyColor3s
end