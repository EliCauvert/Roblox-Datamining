local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.AccessoryAdjustment.Constants)
local AxisTypeModule = require(Modules.AvatarExperience.AccessoryAdjustment.Enum.AxisType)
local config = {
	[AxisTypeModule.X] = true,
	[AxisTypeModule.Y] = true,
	[AxisTypeModule.Z] = true
}

local function makeAxisLabel(Name, AxisPositionLabelOffset, Vector, XAxisColor, Parent, XOffset)
	-- upvalues: ConstantsModule (copy)
	local Billboard = Instance.new("BillboardGui")
	Billboard.Size = UDim2.new(0, XOffset, 0, XOffset)
	Billboard.AlwaysOnTop = true
	Billboard.StudsOffsetWorldSpace = AxisPositionLabelOffset
	Billboard.SizeOffset = Vector
	Billboard.Name = Name
	local Label = Instance.new("TextLabel")
	Label.Name = Name
	Label.Size = UDim2.new(1, 0, 1, 0)
	Label.Text = Name
	Label.TextColor3 = XAxisColor
	Label.TextScaled = true
	Label.BackgroundTransparency = 1
	Label.Parent = Billboard
	Label.FontFace = ConstantsModule.FontFace
	Billboard.Parent = Parent
end

local GimbalUtils = {
	setPositionAdornee = function(Object, Adornee, Adornee1)
		-- upvalues: config (copy)
		for _, BillboardGui in Object:GetChildren() do
			if BillboardGui.Name == "Line" then
				BillboardGui:FindFirstChild("Weld").Part1 = Adornee1
			elseif BillboardGui:IsA("BillboardGui") and config[BillboardGui.Name] then
				BillboardGui.Adornee = Adornee1
			elseif BillboardGui:IsA("BillboardGui") and BillboardGui.Name == "Selection" then
				BillboardGui.Adornee = Adornee
			end
		end
	end,
	setRotationAdornee = function(Object, Adornee)
		for _, child in Object:GetChildren() do
			if child:IsA("MeshPart") then
				child:FindFirstChild("Weld").Part1 = Adornee
			elseif child:IsA("BillboardGui") then
				child.Adornee = Adornee
			elseif child:IsA("LineHandleAdornment") then
				child.Adornee = Adornee
			end
		end
	end,
	setScaleAdornee = function(Object, Adornee)
		for _, BillboardGui in Object:GetChildren() do
			if BillboardGui:IsA("BillboardGui") then
				BillboardGui.Adornee = Adornee
			end
		end
	end,
	getAxisPositionLabelOffset = function(X, Y): Vector3
		-- upvalues: AxisTypeModule (copy)
		return if X == AxisTypeModule.X then Vector3.new(-Y, 0, 0) elseif X == AxisTypeModule.Y then Vector3.new(0, Y, 0) else Vector3.new(0, 0, -Y)
	end
}

function GimbalUtils.createPositionAxis(Parent, p1, p2: number, p3, p4)
	-- upvalues: ConstantsModule (copy), makeAxisLabel (copy), AxisTypeModule (copy), GimbalUtils (copy)
	local v1 = p2 / 2
	
	for _, value in ConstantsModule.LineHandleData do
		local X: number = if value.Direction > 0 then v1 + math.abs(p4[value.LimitKey]) else v1 + math.abs(p3[value.LimitKey])
		local Line = Instance.new("Part")
		Line.Shape = Enum.PartType.Cylinder
		Line.Name = "Line"
		Line.Color = value.Color3
		Line.CFrame = value.Orientation
		Line.Transparency = 0.15
		Line.Size = Vector3.new(X, ConstantsModule.LineDiameter, ConstantsModule.LineDiameter)
		local Weld = Instance.new("Weld")
		Weld.Part0 = Line
		Weld.C0 = CFrame.new((Vector3.new(-X / 2, 0, 0))) * value.Orientation
		Weld.Parent = Line
		Line.Parent = Parent
	end
	local _Vector2 = Vector2.new(0, 0.5)
	makeAxisLabel(AxisTypeModule.X, GimbalUtils.getAxisPositionLabelOffset(AxisTypeModule.X, v1 + p4.xPosition), _Vector2, ConstantsModule.XAxisColor, Parent, p1)
	makeAxisLabel(AxisTypeModule.Y, GimbalUtils.getAxisPositionLabelOffset(AxisTypeModule.Y, v1 + p4.yPosition), Vector2.new(0, 0.5), ConstantsModule.YAxisColor, Parent, p1)
	makeAxisLabel(AxisTypeModule.Z, GimbalUtils.getAxisPositionLabelOffset(AxisTypeModule.Z, v1 + p4.zPosition), _Vector2, ConstantsModule.ZAxisColor, Parent, p1)
end

function GimbalUtils.getLargestAxisSize(Size): number
	local Magnitude = math.abs(Size.X)
	local Magnitude1 = math.abs(Size.Y)
	local Magnitude2 = math.abs(Size.Z)
	
	return if Magnitude1 <= Magnitude and Magnitude2 <= Magnitude then Magnitude elseif Magnitude <= Magnitude1 and Magnitude2 <= Magnitude1 then Magnitude1 else Magnitude2
end

function GimbalUtils.getScreenDiameter(p5): number
	-- upvalues: GimbalUtils (copy)
	local Position = p5.Position
	local Y = GimbalUtils.getLargestAxisSize(p5.Size) / 2
	local NewPosition = Position + Vector3.new(0, Y, 0)
	local PositionDelta = Position - Vector3.new(0, Y, 0)
	local Camera = workspace:FindFirstChild("Camera")
	assert(Camera, "Assert camera not nil")
	
	return (Camera:WorldToScreenPoint(NewPosition) - Camera:WorldToScreenPoint(PositionDelta)).magnitude + 20
end

function GimbalUtils.createBillboardRing(p5, Parent, Image, Name)
	-- upvalues: GimbalUtils (copy), ConstantsModule (copy)
	local Billboard = Instance.new("BillboardGui")
	local ScreenDiameter = GimbalUtils.getScreenDiameter(p5)
	Billboard.Size = UDim2.new(0, ScreenDiameter, 0, ScreenDiameter)
	Billboard.AlwaysOnTop = true
	Billboard.Name = Name
	local Image1 = Instance.new("ImageLabel")
	Image1.Size = UDim2.new(1, 0, 1, 0)
	Image1.Image = Image
	Image1.BackgroundTransparency = 1
	Image1.Parent = Billboard
	Image1.ImageColor3 = ConstantsModule.ZAxisColor
	Billboard.Parent = Parent
end

function GimbalUtils.createSelectionDot(Parent, Image, Name)
	local Billboard = Instance.new("BillboardGui")
	Billboard.Size = UDim2.new(0, 10, 0, 10)
	Billboard.AlwaysOnTop = true
	Billboard.Name = Name
	local Image1 = Instance.new("ImageLabel")
	Image1.Size = UDim2.new(1, 0, 1, 0)
	Image1.Image = Image
	Image1.BackgroundTransparency = 1
	Image1.Parent = Billboard
	Image1.ImageColor3 = Color3.new(1, 1, 1)
	Billboard.Parent = Parent
end

function GimbalUtils.getAxisRotationLabelOffset(X1, p5: number): Vector3
	-- upvalues: AxisTypeModule (copy)
	local Y = p5 + 0.2
	
	if X1 == AxisTypeModule.X then
		return (Vector3.new(0, Y, 0))
	elseif X1 == AxisTypeModule.Y then
		return (Vector3.new(Y, 0, 0))
	else
		local X = Y / 1.4142135623730951
		
		return (Vector3.new(X, X, 0))
	end
end

function GimbalUtils.createRotationAxis(Parent, p5: number, p6, Object)
	-- upvalues: ConstantsModule (copy), makeAxisLabel (copy), AxisTypeModule (copy), GimbalUtils (copy)
	local X = p5 + 0.25
	
	for _, value in ConstantsModule.RingData do
		local RotationAxis = Object:Clone()
		RotationAxis.Name = "RotationAxis"
		RotationAxis.Color = value.Color3
		local Weld = Instance.new("Weld")
		Weld.Part0 = RotationAxis
		Weld.C0 = value.Orientation
		local OriginalOrientation = Instance.new("CFrameValue")
		OriginalOrientation.Value = value.Orientation
		OriginalOrientation.Name = "OriginalOrientation"
		OriginalOrientation.Parent = RotationAxis
		Weld.Parent = RotationAxis
		RotationAxis.Size = Vector3.new(X, X * 0.02040816326530612, X)
		RotationAxis.Parent = Parent
	end
	local XRatio = X / 2
	makeAxisLabel(AxisTypeModule.X, GimbalUtils.getAxisRotationLabelOffset(AxisTypeModule.X, XRatio), Vector2.new(), ConstantsModule.XAxisColor, Parent, p6)
	makeAxisLabel(AxisTypeModule.Y, GimbalUtils.getAxisRotationLabelOffset(AxisTypeModule.Y, XRatio), Vector2.new(), ConstantsModule.YAxisColor, Parent, p6)
	makeAxisLabel(AxisTypeModule.Z, GimbalUtils.getAxisRotationLabelOffset(AxisTypeModule.Z, XRatio), Vector2.new(), ConstantsModule.ZAxisColor, Parent, p6)
end

function GimbalUtils.setUpCameraConnection(p7, Object)
	-- upvalues: GimbalUtils (copy)
	local Camera = workspace:FindFirstChild("Camera")
	assert(Camera, "Assert camera not nil")
	
	return Camera:GetPropertyChangedSignal("CFrame"):Connect(function()
		-- upvalues: GimbalUtils (upval), p7 (copy), Object (copy)
		local ScreenDiameter = GimbalUtils.getScreenDiameter(p7)
		
		for _, child in Object:GetChildren() do
			if child.Name == "Selection" or child.Name == "Scale" then
				child.Size = UDim2.fromOffset(ScreenDiameter, ScreenDiameter)
			end
		end
	end)
end

function GimbalUtils.setUpSizeConnection(Object, Object1)
	-- upvalues: GimbalUtils (copy)
	return Object:GetPropertyChangedSignal("Size"):Connect(function()
		-- upvalues: Object1 (copy), GimbalUtils (upval), Object (copy)
		for _, child in Object1:GetChildren() do
			local ScreenDiameter = GimbalUtils.getScreenDiameter(Object)
			
			if child.Name == "Scale" then
				child.Size = UDim2.fromOffset(ScreenDiameter, ScreenDiameter)
			end
		end
	end)
end

return GimbalUtils