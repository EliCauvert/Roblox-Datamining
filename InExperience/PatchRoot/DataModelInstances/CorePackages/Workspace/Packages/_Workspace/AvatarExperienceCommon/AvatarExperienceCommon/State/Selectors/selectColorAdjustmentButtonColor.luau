local fFlagAXColorAdjustmentButtonShouldAccountForTryOns = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.AvatarExperienceFlags).FFlagAXColorAdjustmentButtonShouldAccountForTryOns
local selectAvatarPreviewColorsModule = require(script.Parent.selectAvatarPreviewColors)

return function(p1)
	-- upvalues: fFlagAXColorAdjustmentButtonShouldAccountForTryOns (ref), selectAvatarPreviewColorsModule (ref)
	local var1 = if fFlagAXColorAdjustmentButtonShouldAccountForTryOns then selectAvatarPreviewColorsModule(p1) else p1.AvatarExperience.AvatarEditor.Character.BodyColor3s
	
	return if var1 then var1.headColor3 or (var1.torsoColor3 or Color3.new()) else Color3.new()
end