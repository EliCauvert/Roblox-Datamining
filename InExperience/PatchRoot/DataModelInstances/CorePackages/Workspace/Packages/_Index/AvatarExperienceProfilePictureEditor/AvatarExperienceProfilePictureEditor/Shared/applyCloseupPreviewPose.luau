local EmoteUtility = require(script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent.Thumbnailing).EmoteUtility

return function(Object, p1)
	-- upvalues: EmoteUtility (copy)
	local KeyframesForPose = EmoteUtility.LoadKeyframesForPose(Object, if p1 then tonumber(p1) else nil, nil, true, true)
	
	if KeyframesForPose then
		EmoteUtility.ApplyKeyframesForPose(Object, KeyframesForPose)
	else
		EmoteUtility.SetPlayerCharacterNeutralPose(Object)
		local Humanoid = Object:FindFirstChildOfClass("Humanoid")
		
		if Humanoid and Humanoid.RigType == Enum.HumanoidRigType.R6 then
			EmoteUtility.AdjustArmOnR6ForTool(Object)
		end
	end
	local RunService = game:GetService("RunService")
	RunService.PreAnimation:Wait()
	RunService.PostSimulation:Wait()
end