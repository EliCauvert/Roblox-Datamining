return function()
	local model = Instance.new("Model")
	local humanoidRootPart = Instance.new("Part")
	humanoidRootPart.Name = "HumanoidRootPart"
	humanoidRootPart.Parent = model
	local humanoid_1 = Instance.new("Humanoid")
	humanoid_1.Name = "Humanoid"
	humanoid_1.Parent = model
	local humanoidDescription_1 = Instance.new("HumanoidDescription")
	humanoidDescription_1.Name = "HumanoidDescription"
	humanoidDescription_1.Parent = humanoid_1
	
	return model
end