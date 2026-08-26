local constantsModule = require(script.Parent.Parent.Constants)

return function(p1, p2)
	-- upvalues: constantsModule (ref)
	local character = p1.Character
	
	if not character then
		p2(constantsModule.ErrorTypes.TemporarilyUnavailable)
		
		return true
	end
	local humanoid = character and character:FindFirstChildOfClass("Humanoid") or nil
	
	if not humanoid then
		p2(constantsModule.ErrorTypes.TemporarilyUnavailable)
		
		return true
	elseif humanoid and humanoid.RigType ~= Enum.HumanoidRigType.R15 then
		p2(constantsModule.ErrorTypes.SwitchToR15)
		
		return true
	end
	local animate = character and character:FindFirstChild("Animate") or nil
	
	if not animate or not (humanoid and humanoid:FindFirstChildOfClass("HumanoidDescription") or nil) then
		p2(constantsModule.ErrorTypes.NotSupported)
		
		return true
	end
	local playEmote = animate and animate:FindFirstChild("PlayEmote") or nil
	
	if playEmote and playEmote:IsA("BindableFunction") then
		return false
	end
	p2(constantsModule.ErrorTypes.NotSupported)
	
	return true
end