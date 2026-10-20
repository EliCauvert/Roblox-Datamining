local _ = require(script.Parent.Parent.Types)

return function(Model)
	Model:PivotTo(CFrame.new())
	local HumanoidRootPart = Model:FindFirstChild("HumanoidRootPart")
	
	if HumanoidRootPart and HumanoidRootPart:IsA("BasePart") then
		Model.PrimaryPart = HumanoidRootPart
		HumanoidRootPart.Anchored = true
	end
	local Humanoid = Model:FindFirstChildOfClass("Humanoid")
	local Animator = if Humanoid then Humanoid:FindFirstChildOfClass("Animator") else nil
	
	if Humanoid and not Animator then
		local Animator1 = Instance.new("Animator")
		Animator1.Parent = Humanoid
		Animator = Animator1
	end
	return { model = Model, humanoid = Humanoid, animator = Animator }
end