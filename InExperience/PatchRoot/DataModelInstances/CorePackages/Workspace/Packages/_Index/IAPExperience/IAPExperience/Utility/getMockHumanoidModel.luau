return function()
	local model = Instance.new("Model")
	Instance.new("Humanoid").Parent = model
	local humanoidRootPart = Instance.new("Part")
	humanoidRootPart.Name = "HumanoidRootPart"
	humanoidRootPart.Size = Vector3.new(2, 2, 1)
	humanoidRootPart.Position = Vector3.new(0, 2, 0)
	humanoidRootPart.Transparency = 1
	humanoidRootPart.Parent = model
	local head = Instance.new("Part")
	head.Name = "Head"
	head.Size = Vector3.new(2, 1, 1)
	head.Position = Vector3.new(0, 5, 0)
	head.Shape = Enum.PartType.Ball
	head.Parent = model
	local torso = Instance.new("Part")
	torso.Name = "Torso"
	torso.Size = Vector3.new(2, 2, 1)
	torso.Position = Vector3.new(0, 3.5, 0)
	torso.Parent = model
	model.PrimaryPart = humanoidRootPart
	
	return model
end