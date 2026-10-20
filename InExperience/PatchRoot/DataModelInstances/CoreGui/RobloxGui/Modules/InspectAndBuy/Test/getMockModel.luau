return function()
	local Model = Instance.new("Model")
	local HumanoidRootPart = Instance.new("Part")
	HumanoidRootPart.Name = "HumanoidRootPart"
	HumanoidRootPart.Parent = Model
	local Humanoid = Instance.new("Humanoid")
	Humanoid.Name = "Humanoid"
	Humanoid.Parent = Model
	local HumanoidDescription = Instance.new("HumanoidDescription")
	HumanoidDescription.Name = "HumanoidDescription"
	HumanoidDescription.Parent = Humanoid
	
	return Model
end