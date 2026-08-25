local fFlagAXColorAdjustmentButtonShouldAccountForTryOns = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.AvatarExperienceFlags).FFlagAXColorAdjustmentButtonShouldAccountForTryOns
local selectAvatarPreviewColorsModule = require(script.Parent.selectAvatarPreviewColors)

return function(p0)
	-- upvalues: fFlagAXColorAdjustmentButtonShouldAccountForTryOns (ref), selectAvatarPreviewColorsModule (ref)
	local var1 = if fFlagAXColorAdjustmentButtonShouldAccountForTryOns then selectAvatarPreviewColorsModule(p0) else p0.AvatarExperience.AvatarEditor.Character.BodyColor3s
	
	return if var1 then var1.headColor3 or (var1.torsoColor3 or Color3.new()) else Color3.new()
end