local FFlagAXColorAdjustmentButtonShouldAccountForTryOns = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.AvatarExperienceFlags).FFlagAXColorAdjustmentButtonShouldAccountForTryOns
local SelectAvatarPreviewColorsModule = require(script.Parent.selectAvatarPreviewColors)

return function(p1) --[[ Line: 8 | Named "selectColorAdjustmentButtonColor" ]]
	-- upvalues: FFlagAXColorAdjustmentButtonShouldAccountForTryOns (copy), SelectAvatarPreviewColorsModule (copy)
	local SelectAvatarPreviewColorsModuleResult = if FFlagAXColorAdjustmentButtonShouldAccountForTryOns then SelectAvatarPreviewColorsModule(p1) else p1.AvatarExperience.AvatarEditor.Character.BodyColor3s
	
	if SelectAvatarPreviewColorsModuleResult then
		local TorsoColor3 = SelectAvatarPreviewColorsModuleResult.torsoColor3
		
		return SelectAvatarPreviewColorsModuleResult.headColor3 or (TorsoColor3 or Color3.new())
	else
		return Color3.new()
	end
end