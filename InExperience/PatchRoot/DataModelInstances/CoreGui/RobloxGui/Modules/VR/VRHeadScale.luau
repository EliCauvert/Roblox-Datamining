local VRHeadScaleModule = {
	SEATED_HEIGHT_RATIO = 0.8,
	getSubjectHeight = function(Object): number?
		local Humanoid = Object:FindFirstChild("Humanoid")
		
		if Humanoid and Humanoid:GetState() == Enum.HumanoidStateType.Dead then
			return nil
		end
		local RootPart = Humanoid and Humanoid.RootPart or Object:FindFirstChild("HumanoidRootPart")
		
		if RootPart and Humanoid then
			local HipHeight = if Humanoid.RigType == Enum.HumanoidRigType.R6 then 2 else Humanoid.HipHeight
			
			return if Humanoid.AutomaticScalingEnabled then RootPart.Size.Y / 2 + HipHeight + (RootPart.Size.Y / 2 + 0.5) + Humanoid.CameraOffset.Y else RootPart.Size.Y / 2 + HipHeight + 2 + Humanoid.CameraOffset.Y
		else
			return nil
		end
	end
}

function VRHeadScaleModule.computeHeadScale(p1, p2, p3)
	-- upvalues: VRHeadScaleModule (copy)
	return if p2 < VRHeadScaleModule.SEATED_HEIGHT_RATIO * p3 then p1 / p3 else p1 / p2
end

return VRHeadScaleModule