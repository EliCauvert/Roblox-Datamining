local emoteUtility = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.Thumbnailing).EmoteUtility

return function(p0, p1) --[[ line: 10 | named "applyCloseupPreviewPose" ]]
	-- upvalues: emoteUtility (ref)
	local var0 = emoteUtility.LoadKeyframesForPose(p0, if p1 then tonumber(p1) else nil, nil, true, true)
	
	if var0 then
		emoteUtility.ApplyKeyframesForPose(p0, var0)
	else
		emoteUtility.SetPlayerCharacterNeutralPose(p0)
		local humanoid = p0:FindFirstChildOfClass("Humanoid")
		
		if humanoid and humanoid.RigType == Enum.HumanoidRigType.R6 then
			emoteUtility.AdjustArmOnR6ForTool(p0)
		end
	end
	local runService = game:GetService("RunService")
	runService.PreAnimation:Wait()
	runService.PostSimulation:Wait()
end