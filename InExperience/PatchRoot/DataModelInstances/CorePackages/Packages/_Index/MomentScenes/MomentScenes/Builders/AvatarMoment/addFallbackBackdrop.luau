return function(Parent)
	local Floor = Instance.new("Part")
	Floor.Name = "Floor"
	Floor.Anchored = true
	Floor.Size = vector.create(40, 1, 40)
	Floor.Position = vector.create(0, -0.5, 0)
	Floor.Color = Color3.fromRGB(40, 40, 48)
	Floor.Material = Enum.Material.SmoothPlastic
	Floor.Parent = Parent
	local SkyDome = Instance.new("Part")
	SkyDome.Name = "SkyDome"
	SkyDome.Anchored = true
	SkyDome.Shape = Enum.PartType.Ball
	SkyDome.Size = vector.create(80, 80, 80)
	SkyDome.Position = vector.create(0, 10, 0)
	SkyDome.Color = Color3.fromRGB(18, 22, 40)
	SkyDome.Material = Enum.Material.SmoothPlastic
	SkyDome.CastShadow = false
	local Mesh = Instance.new("SpecialMesh")
	Mesh.MeshType = Enum.MeshType.Sphere
	Mesh.Scale = vector.create(-1, -1, -1)
	Mesh.Parent = SkyDome
	SkyDome.Parent = Parent
end