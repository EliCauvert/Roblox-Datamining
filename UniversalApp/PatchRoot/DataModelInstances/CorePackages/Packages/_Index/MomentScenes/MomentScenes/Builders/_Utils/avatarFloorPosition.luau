local function heightForCharacter(Object)
	local Humanoid = Object:FindFirstChildOfClass("Humanoid")
	local HumanoidRootPart = Object:FindFirstChild("HumanoidRootPart")
	
	if Humanoid == nil or HumanoidRootPart == nil or not HumanoidRootPart:IsA("BasePart") then
		return nil
	end
	local NewHipHeight = Humanoid.HipHeight + 0.5 * HumanoidRootPart.Size.Y
	
	if Humanoid.RigType == Enum.HumanoidRigType.R6 then
		local LeftLeg = Object:FindFirstChild("Left Leg")
		
		if LeftLeg ~= nil and LeftLeg:IsA("BasePart") then
			NewHipHeight += LeftLeg.Size.Y
		end
	end
	return NewHipHeight
end

return {
	heightForCharacter = heightForCharacter,
	positionOnFloor = function(Object, X, p1)
		-- upvalues: heightForCharacter (copy)
		local P2 = p1 or CFrame.new()
		local HeightForCharacterResult = heightForCharacter(Object)
		
		if HeightForCharacterResult == nil then
			Object:PivotTo(P2 * CFrame.new(X, 0, 0) * CFrame.Angles(0, 3.141592653589793, 0))
			
			return
		else
			local HumanoidRootPart = Object:FindFirstChild("HumanoidRootPart")
			HumanoidRootPart.Anchored = true
			Object.PrimaryPart = HumanoidRootPart
			Object:PivotTo(P2 * CFrame.new(X, HeightForCharacterResult, 0) * CFrame.Angles(0, 3.141592653589793, 0))
		end
	end
}