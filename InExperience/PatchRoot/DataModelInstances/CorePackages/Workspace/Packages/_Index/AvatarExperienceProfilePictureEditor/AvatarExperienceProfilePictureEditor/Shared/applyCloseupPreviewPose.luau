local emoteUtility = require(script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent.Thumbnailing).EmoteUtility

return function(p1, p2)
	-- upvalues: emoteUtility (ref)
	local var1 = emoteUtility.LoadKeyframesForPose(p1, if p2 then tonumber(p2) else nil, nil, true, true)
	
	if var1 then
		emoteUtility.ApplyKeyframesForPose(p1, var1)
	else
		emoteUtility.SetPlayerCharacterNeutralPose(p1)
		local humanoid = p1:FindFirstChildOfClass("Humanoid")
		
		if humanoid and humanoid.RigType == Enum.HumanoidRigType.R6 then
			emoteUtility.AdjustArmOnR6ForTool(p1)
		end
	end
	local runService = game:GetService("RunService")
	runService.PreAnimation:Wait()
	runService.PostSimulation:Wait()
end