local SelectAvatarPreviewColorsModule = require(script.Parent.selectAvatarPreviewColors)

return function(p1)
	-- upvalues: SelectAvatarPreviewColorsModule (copy)
	local SelectAvatarPreviewColorsModuleResult = SelectAvatarPreviewColorsModule(p1)
	
	if SelectAvatarPreviewColorsModuleResult then
		local TorsoColor3 = SelectAvatarPreviewColorsModuleResult.torsoColor3
		
		return SelectAvatarPreviewColorsModuleResult.headColor3 or (TorsoColor3 or Color3.new())
	else
		return Color3.new()
	end
end