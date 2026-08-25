local userInputService = game:GetService("UserInputService")
local VRService = game:GetService("VRService")

return function(p0)
	-- upvalues: userInputService (ref), VRService (ref)
	if p0 then
		userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceShow
		
		return
	elseif VRService.VREnabled then
		userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
		
		return
	end
	userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
end