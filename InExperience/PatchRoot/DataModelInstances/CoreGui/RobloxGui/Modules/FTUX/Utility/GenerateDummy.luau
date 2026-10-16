local NewInstances = {}
local t = {}
local config = {
	ID = 0,
	Type = "Model",
	Properties = { Name = "Safety Bubble Dummy", PrimaryPart = "_R:1_" },
	Children = {
		{
			ID = 1,
			Type = "Part",
			Properties = {
				Transparency = 0.5,
				Name = "HumanoidRootPart",
				Size = vector.create(2, 2, 1),
				Anchored = true,
				BottomSurface = Enum.SurfaceType.Smooth,
				TopSurface = Enum.SurfaceType.Smooth
			},
			Children = {
				{
					ID = 2,
					Type = "Motor6D",
					Properties = {
						Part1 = "_R:3_",
						Name = "Root Hip",
						Part0 = "_R:1_",
						MaxVelocity = 0.10000000149011612,
						C1 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
						C0 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
					},
					Children = {}
				}
			}
		},
		{
			ID = 3,
			Type = "Part",
			Properties = {
				Size = vector.create(2, 2, 1),
				Name = "Torso",
				BottomSurface = Enum.SurfaceType.Smooth,
				TopSurface = Enum.SurfaceType.Smooth
			},
			Children = {
				{
					ID = 4,
					Type = "Motor6D",
					Properties = {
						Part1 = "_R:9_",
						Name = "Left Hip",
						Part0 = "_R:3_",
						MaxVelocity = 0.10000000149011612,
						C1 = CFrame.new(-0.5, 1, 0, -4.371138828673793e-08, 0, -1, 0, 0.9999999403953552, 0, 1, 0, -4.371138828673793e-08),
						C0 = CFrame.new(-1, -1, 0, -4.371138828673793e-08, 0, -1, 0, 0.9999999403953552, 0, 1, 0, -4.371138828673793e-08)
					},
					Children = {}
				},
				{
					ID = 5,
					Type = "Motor6D",
					Properties = {
						Part1 = "_R:10_",
						Name = "Right Hip",
						Part0 = "_R:3_",
						MaxVelocity = 0.10000000149011612,
						C1 = CFrame.new(0.5, 1, 0, -4.371138828673793e-08, 0, 1, 0, 0.9999999403953552, 0, -1, 0, -4.371138828673793e-08),
						C0 = CFrame.new(1, -1, 0, -4.371138828673793e-08, 0, 1, -0, 0.9999999403953552, 0, -1, 0, -4.371138828673793e-08)
					},
					Children = {}
				},
				{
					ID = 6,
					Type = "Motor6D",
					Properties = {
						Part1 = "_R:11_",
						Name = "Left Shoulder",
						Part0 = "_R:3_",
						MaxVelocity = 0.10000000149011612,
						C1 = CFrame.new(0.5, 0.5, 0, -4.371138828673793e-08, 0, -1, 0, 0.9999999403953552, 0, 1, 0, -4.371138828673793e-08),
						C0 = CFrame.new(-1, 0.5, 0, -4.371138828673793e-08, 0, -1, 0, 0.9999999403953552, 0, 1, 0, -4.371138828673793e-08)
					},
					Children = {}
				},
				{
					ID = 7,
					Type = "Motor6D",
					Properties = {
						Part1 = "_R:12_",
						Name = "Right Shoulder",
						Part0 = "_R:3_",
						MaxVelocity = 0.10000000149011612,
						C1 = CFrame.new(-0.5, 0.5, 0, -4.371138828673793e-08, 0, 1, 0, 0.9999999403953552, 0, -1, 0, -4.371138828673793e-08),
						C0 = CFrame.new(1, 0.5, 0, -4.371138828673793e-08, 0, 1, -0, 0.9999999403953552, 0, -1, 0, -4.371138828673793e-08)
					},
					Children = {}
				},
				{
					ID = 8,
					Type = "Motor6D",
					Properties = {
						Part1 = "_R:13_",
						Name = "Neck",
						Part0 = "_R:3_",
						MaxVelocity = 0.10000000149011612,
						C1 = CFrame.new(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
						C0 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
					},
					Children = {}
				}
			}
		},
		{
			ID = 9,
			Type = "Part",
			Properties = {
				Size = vector.create(1, 2, 1),
				Name = "Left Leg",
				CanCollide = false,
				Position = vector.create(-0.5, -1.9999998807907104, 0),
				BottomSurface = Enum.SurfaceType.Smooth,
				CFrame = CFrame.new(-0.5, -1.9999998807907104, 0, 1, 0, 0, 0, 0.9999998807907104, 0, 0, 0, 1),
				TopSurface = Enum.SurfaceType.Smooth
			},
			Children = {}
		},
		{
			ID = 10,
			Type = "Part",
			Properties = {
				Size = vector.create(1, 2, 1),
				Name = "Right Leg",
				CanCollide = false,
				Position = vector.create(0.5, -1.9999998807907104, 0),
				BottomSurface = Enum.SurfaceType.Smooth,
				CFrame = CFrame.new(0.5, -1.9999998807907104, 0, 1, 0, 0, 0, 0.9999998807907104, 0, 0, 0, 1),
				TopSurface = Enum.SurfaceType.Smooth
			},
			Children = {}
		},
		{
			ID = 11,
			Type = "Part",
			Properties = {
				Size = vector.create(1, 2, 1),
				Name = "Left Arm",
				CanCollide = false,
				Position = vector.create(-1.5, 5.960464477539063e-08, 0),
				BottomSurface = Enum.SurfaceType.Smooth,
				CFrame = CFrame.new(-1.5, 5.960464477539063e-08, 0, 1, 0, 0, 0, 0.9999998807907104, 0, 0, 0, 1),
				TopSurface = Enum.SurfaceType.Smooth
			},
			Children = {}
		},
		{
			ID = 12,
			Type = "Part",
			Properties = {
				Size = vector.create(1, 2, 1),
				Name = "Right Arm",
				CanCollide = false,
				Position = vector.create(1.5, 5.960464477539063e-08, 0),
				BottomSurface = Enum.SurfaceType.Smooth,
				CFrame = CFrame.new(1.5, 5.960464477539063e-08, 0, 1, 0, 0, 0, 0.9999998807907104, 0, 0, 0, 1),
				TopSurface = Enum.SurfaceType.Smooth
			},
			Children = {}
		},
		{
			ID = 13,
			Type = "Part",
			Properties = {
				Name = "Head",
				Position = vector.create(0, 1.5, 0),
				Size = vector.create(2, 1, 1),
				CFrame = CFrame.new(0, 1.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				BottomSurface = Enum.SurfaceType.Smooth,
				TopSurface = Enum.SurfaceType.Smooth
			},
			Children = {
				{
					ID = 14,
					Type = "Decal",
					Properties = { Name = "Face", Texture = "rbxasset://textures/face.png" },
					Children = {}
				},
				{
					ID = 15,
					Type = "SpecialMesh",
					Properties = { Scale = vector.create(1.25, 1.25, 1.25) },
					Children = {}
				}
			}
		},
		{
			ID = 16,
			Type = "Humanoid",
			Properties = {},
			Children = {}
		}
	}
}

local function Scan(p1, Parent, p2, p3) --[[ Line: 316 ]]
	-- upvalues: t (copy), NewInstances (copy), Scan (copy)
	local NewInstance = Instance.new(p1.Type)
	
	if p1.ID then
		local Entry = t[p1.ID]
		
		if Entry then
			Entry[1][Entry[2]] = NewInstance
			t[p1.ID] = nil
		else
			NewInstances[p1.ID] = NewInstance
		end
	end
	for i, property in pairs(p1.Properties) do
		if type(property) == "string" then
			local Number: number? = tonumber(property:match("^_R:(%w+)_$"))
			
			if Number then
				if NewInstances[Number] then
					property = NewInstances[Number]
				else
					t[Number] = { NewInstance, i }
					property = nil
				end
			end
		end
		NewInstance[i] = property
	end
	for _, child in pairs(p1.Children) do
		Scan(child, NewInstance, p2, p3)
	end
	NewInstance.Parent = Parent
	
	if NewInstance:IsA("Part") then
		NewInstance.Position += p2
		NewInstance.Orientation += p3
		NewInstance.Anchored = true
	end
	return NewInstance
end

return function(p4, p5) --[[ Line: 354 ]]
	-- upvalues: Scan (copy), config (copy)
	return (Scan(config, nil, p4, p5))
end