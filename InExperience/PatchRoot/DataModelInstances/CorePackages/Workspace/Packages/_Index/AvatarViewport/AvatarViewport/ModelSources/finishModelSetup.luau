local _ = require(script.Parent.Parent.Types)

return function(value)
	value:PivotTo(CFrame.new())
	local humanoidRootPart = value:FindFirstChild("HumanoidRootPart")
	
	if humanoidRootPart and humanoidRootPart:IsA("BasePart") then
		value.PrimaryPart = humanoidRootPart
		humanoidRootPart.Anchored = true
	end
	local humanoid = value:FindFirstChildOfClass("Humanoid")
	local var1 = if humanoid then humanoid:FindFirstChildOfClass("Animator") else nil
	
	if humanoid and not var1 then
		local animator = Instance.new("Animator")
		animator.Parent = humanoid
		var1 = animator
	end
	return { model = value, humanoid = humanoid, animator = var1 }
end