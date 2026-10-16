local ConstantsModule = require(script.Parent.Parent.Constants)

return function(Player, Callback: (any) -> ()): boolean --[[ Line: 16 | Named "MaybeSendEmoteFailureAnalyticsFromPlayer" ]]
	-- upvalues: ConstantsModule (copy)
	local Character = Player.Character
	
	if not Character then
		Callback(ConstantsModule.ErrorTypes.TemporarilyUnavailable)
		
		return true
	end
	local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid") or nil
	
	if not Humanoid then
		Callback(ConstantsModule.ErrorTypes.TemporarilyUnavailable)
		
		return true
	elseif Humanoid and Humanoid.RigType ~= Enum.HumanoidRigType.R15 then
		Callback(ConstantsModule.ErrorTypes.SwitchToR15)
		
		return true
	else
		local Animate = Character and Character:FindFirstChild("Animate") or nil
		local HumanoidDescription = Humanoid and Humanoid:FindFirstChildOfClass("HumanoidDescription") or nil
		
		if not Animate or not HumanoidDescription then
			Callback(ConstantsModule.ErrorTypes.NotSupported)
			
			return true
		end
		local PlayEmote = Animate and Animate:FindFirstChild("PlayEmote") or nil
		
		if PlayEmote and PlayEmote:IsA("BindableFunction") then
			return false
		else
			Callback(ConstantsModule.ErrorTypes.NotSupported)
			
			return true
		end
	end
end