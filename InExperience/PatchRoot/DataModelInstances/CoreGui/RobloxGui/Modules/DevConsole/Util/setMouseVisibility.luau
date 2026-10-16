local UserInputService = game:GetService("UserInputService")
local VRService = game:GetService("VRService")

return function(p1) --[[ Line: 6 ]]
	-- upvalues: UserInputService (copy), VRService (copy)
	if p1 then
		UserInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceShow
		
		return
	end
	if VRService.VREnabled then
		UserInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
		
		return
	else
		UserInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
	end
end