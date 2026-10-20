return function()
	local Model = Instance.new("Model")
	Instance.new("Humanoid").Parent = Model
	local HumanoidRootPart = Instance.new("Part")
	HumanoidRootPart.Name = "HumanoidRootPart"
	HumanoidRootPart.Size = vector.create(2, 2, 1)
	HumanoidRootPart.Position = vector.create(0, 2, 0)
	HumanoidRootPart.Transparency = 1
	HumanoidRootPart.Parent = Model
	local Head = Instance.new("Part")
	Head.Name = "Head"
	Head.Size = vector.create(2, 1, 1)
	Head.Position = vector.create(0, 5, 0)
	Head.Shape = Enum.PartType.Ball
	Head.Parent = Model
	local Torso = Instance.new("Part")
	Torso.Name = "Torso"
	Torso.Size = vector.create(2, 2, 1)
	Torso.Position = vector.create(0, 3.5, 0)
	Torso.Parent = Model
	Model.PrimaryPart = HumanoidRootPart
	
	return Model
end