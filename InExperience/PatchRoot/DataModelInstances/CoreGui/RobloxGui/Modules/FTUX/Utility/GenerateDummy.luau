local t = {}
local t_1 = {}
local t_2 = {
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
				Size = Vector3.new(2, 2, 1),
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
						MaxVelocity = 0.10000000149,
						C1 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0),
						C0 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0)
					},
					Children = {}
				}
			}
		},
		{
			ID = 3,
			Type = "Part",
			Properties = {
				Size = Vector3.new(2, 2, 1),
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
						MaxVelocity = 0.10000000149,
						C1 = CFrame.new(-0.5, 1, 0, -0.000000043711, 0, -1, 0, 0.999999940395, 0, 1, 0, -0.000000043711),
						C0 = CFrame.new(-1, -1, 0, -0.000000043711, 0, -1, 0, 0.999999940395, 0, 1, 0, -0.000000043711)
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
						MaxVelocity = 0.10000000149,
						C1 = CFrame.new(0.5, 1, 0, -0.000000043711, 0, 1, 0, 0.999999940395, 0, -1, 0, -0.000000043711),
						C0 = CFrame.new(1, -1, 0, -0.000000043711, 0, 1, 0, 0.999999940395, 0, -1, 0, -0.000000043711)
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
						MaxVelocity = 0.10000000149,
						C1 = CFrame.new(0.5, 0.5, 0, -0.000000043711, 0, -1, 0, 0.999999940395, 0, 1, 0, -0.000000043711),
						C0 = CFrame.new(-1, 0.5, 0, -0.000000043711, 0, -1, 0, 0.999999940395, 0, 1, 0, -0.000000043711)
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
						MaxVelocity = 0.10000000149,
						C1 = CFrame.new(-0.5, 0.5, 0, -0.000000043711, 0, 1, 0, 0.999999940395, 0, -1, 0, -0.000000043711),
						C0 = CFrame.new(1, 0.5, 0, -0.000000043711, 0, 1, 0, 0.999999940395, 0, -1, 0, -0.000000043711)
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
						MaxVelocity = 0.10000000149,
						C1 = CFrame.new(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0),
						C0 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0)
					},
					Children = {}
				}
			}
		},
		{
			ID = 9,
			Type = "Part",
			Properties = {
				Size = Vector3.new(1, 2, 1),
				Name = "Left Leg",
				CanCollide = false,
				Position = Vector3.new(-0.5, -1.999999880791, 0),
				BottomSurface = Enum.SurfaceType.Smooth,
				CFrame = CFrame.new(-0.5, -1.999999880791, 0, 1, 0, 0, 0, 0.999999880791, 0, 0, 0, 1),
				TopSurface = Enum.SurfaceType.Smooth
			},
			Children = {}
		},
		{
			ID = 10,
			Type = "Part",
			Properties = {
				Size = Vector3.new(1, 2, 1),
				Name = "Right Leg",
				CanCollide = false,
				Position = Vector3.new(0.5, -1.999999880791, 0),
				BottomSurface = Enum.SurfaceType.Smooth,
				CFrame = CFrame.new(0.5, -1.999999880791, 0, 1, 0, 0, 0, 0.999999880791, 0, 0, 0, 1),
				TopSurface = Enum.SurfaceType.Smooth
			},
			Children = {}
		},
		{
			ID = 11,
			Type = "Part",
			Properties = {
				Size = Vector3.new(1, 2, 1),
				Name = "Left Arm",
				CanCollide = false,
				Position = Vector3.new(-1.5, 0.000000059605, 0),
				BottomSurface = Enum.SurfaceType.Smooth,
				CFrame = CFrame.new(-1.5, 0.000000059605, 0, 1, 0, 0, 0, 0.999999880791, 0, 0, 0, 1),
				TopSurface = Enum.SurfaceType.Smooth
			},
			Children = {}
		},
		{
			ID = 12,
			Type = "Part",
			Properties = {
				Size = Vector3.new(1, 2, 1),
				Name = "Right Arm",
				CanCollide = false,
				Position = Vector3.new(1.5, 0.000000059605, 0),
				BottomSurface = Enum.SurfaceType.Smooth,
				CFrame = CFrame.new(1.5, 0.000000059605, 0, 1, 0, 0, 0, 0.999999880791, 0, 0, 0, 1),
				TopSurface = Enum.SurfaceType.Smooth
			},
			Children = {}
		},
		{
			ID = 13,
			Type = "Part",
			Properties = {
				Name = "Head",
				Position = Vector3.new(0, 1.5, 0),
				Size = Vector3.new(2, 1, 1),
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
					Properties = { Scale = Vector3.new(1.25, 1.25, 1.25) },
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

local function Scan(p0, p1, p2, p3)
	-- upvalues: t_1 (ref), t (ref), Scan (ref)
	local var4 = Instance.new(p0.Type)
	
	if p0.ID then
		local ID = t_1[p0.ID]
		
		if ID then
			ID[1][ID[2]] = var4
			t_1[p0.ID] = nil
		else
			t[p0.ID] = var4
		end
	end
	for i, v in pairs(p0.Properties) do
		local v
		if type(v) == "string" then
			local var5 = tonumber(v:match("^_R:(%w+)_$"))
			
			if var5 then
				if t[var5] then
					v = t[var5]
				else
					t_1[var5] = { var4, i }
					v = nil
				end
			end
		end
		var4[i] = v
	end
	for i_1, v_1 in pairs(p0.Children) do
		Scan(v_1, var4, p2, p3)
	end
	var4.Parent = p1
	
	if var4:IsA("Part") then
		var4.Position += p2
		var4.Orientation += p3
		var4.Anchored = true
	end
	return var4
end

return function(p4, p5)
	-- upvalues: Scan (ref), t_2 (ref)
	return Scan(t_2, nil, p4, p5)
end