return function(Parent)
	local KeyLight = Instance.new("Part")
	KeyLight.Name = "KeyLight"
	KeyLight.Anchored = true
	KeyLight.Transparency = 1
	KeyLight.CanCollide = false
	KeyLight.Size = vector.create(1, 1, 1)
	KeyLight.Position = vector.create(-4, 8, 6)
	KeyLight.Parent = Parent
	local PointLight = Instance.new("PointLight")
	PointLight.Brightness = 0.7
	PointLight.Range = 16
	PointLight.Color = Color3.fromRGB(255, 244, 220)
	PointLight.Parent = KeyLight
end