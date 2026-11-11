local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local _ = game:GetService("CorePackages")
while not Players.LocalPlayer do
	wait()
end
local LocalPlayer = Players.LocalPlayer
local v1 = nil
local HeartbeatConnection = nil
local ChangedConnection = nil
local RobloxGui = game:GetService("CoreGui").RobloxGui
local IsEnabled = require(RobloxGui.Modules.TenFootInterface):IsEnabled()
local v2: number = if IsEnabled then 100 else 70

local function _(Name, Size, Position, Image, Parent)
	local Image1 = Instance.new("ImageLabel")
	Image1.Name = Name
	Image1.Size = Size
	Image1.Position = Position
	Image1.BackgroundTransparency = 1
	Image1.Image = Image
	Image1.Parent = Parent
	
	return Image1
end

local function createTextLabel(Name, TextXAlignment, Text, Frame)
	-- upvalues: IsEnabled (copy)
	local Label = Instance.new("TextLabel")
	Label.Name = Name
	Label.Size = UDim2.new(1, -4, 0, if IsEnabled then 50 else 20)
	Label.Position = UDim2.new(0, 2, 0, if IsEnabled then -50 else -20)
	Label.BackgroundTransparency = 1
	Label.TextXAlignment = TextXAlignment
	Label.Font = Enum.Font.SourceSans
	Label.FontSize = IsEnabled and Enum.FontSize.Size48 or Enum.FontSize.Size18
	Label.TextColor3 = Color3.new(1, 1, 1)
	Label.TextStrokeTransparency = 0.5
	Label.TextStrokeColor3 = Color3.new(0.19215686274509805, 0.19215686274509805, 0.19215686274509805)
	Label.Text = Text
	Label.Parent = Frame
	
	return Label
end

local VehicleHudFrame = Instance.new("Frame")
VehicleHudFrame.Name = "VehicleHudFrame"
VehicleHudFrame.Size = UDim2.new(0, if IsEnabled then 316 else 158, 0, if IsEnabled then 50 else 14)
VehicleHudFrame.Position = UDim2.new(0.5, -(VehicleHudFrame.Size.X.Offset / 2), 1, -v2 - VehicleHudFrame.Size.Y.Offset)
VehicleHudFrame.BackgroundTransparency = 1
VehicleHudFrame.Visible = false
VehicleHudFrame.Parent = RobloxGui
local SpeedBarClippingFrame = Instance.new("Frame")
SpeedBarClippingFrame.Name = "SpeedBarClippingFrame"
SpeedBarClippingFrame.Size = UDim2.new(0, 0, 0, if IsEnabled then 24 else 4)
SpeedBarClippingFrame.Position = UDim2.new(0.5, if IsEnabled then -142 else -71, 0.5, if IsEnabled then -13 else -2)
SpeedBarClippingFrame.BackgroundTransparency = 1
SpeedBarClippingFrame.ClipsDescendants = true
SpeedBarClippingFrame.ZIndex = 2
SpeedBarClippingFrame.Parent = VehicleHudFrame
local _UDim2 = UDim2.new(0, 0, 0, 1)
local HudBG = Instance.new("ImageLabel")
HudBG.Name = "HudBG"
HudBG.Size = UDim2.new(1, 0, 1, 0)
HudBG.Position = _UDim2
HudBG.BackgroundTransparency = 1
HudBG.Image = "rbxasset://textures/ui/Vehicle/SpeedBarBKG.png"
HudBG.Parent = VehicleHudFrame
local _UDim21 = UDim2.new(0.5, if IsEnabled then -142 else -71, 0.5, if IsEnabled then -13 else -2)
local SpeedBG = Instance.new("ImageLabel")
SpeedBG.Name = "SpeedBG"
SpeedBG.Size = UDim2.new(0, if IsEnabled then 284 else 142, 0, if IsEnabled then 24 else 4)
SpeedBG.Position = _UDim21
SpeedBG.BackgroundTransparency = 1
SpeedBG.Image = "rbxasset://textures/ui/Vehicle/SpeedBarEmpty.png"
SpeedBG.Parent = VehicleHudFrame
local SpeedBarImage = Instance.new("ImageLabel")
SpeedBarImage.Name = "SpeedBarImage"
SpeedBarImage.Size = UDim2.new(0, if IsEnabled then 284 else 142, 1, 0)
SpeedBarImage.Position = UDim2.new(0, 0, 0, 0)
SpeedBarImage.BackgroundTransparency = 1
SpeedBarImage.Image = "rbxasset://textures/ui/Vehicle/SpeedBar.png"
SpeedBarImage.Parent = SpeedBarClippingFrame
createTextLabel("SpeedLabel", Enum.TextXAlignment.Left, "Speed", VehicleHudFrame)
local SpeedText = createTextLabel("SpeedText", Enum.TextXAlignment.Right, "0", VehicleHudFrame)

local _ = function()
	-- upvalues: LocalPlayer (copy)
	local Character = LocalPlayer and LocalPlayer.Character
	
	if Character then
		for _, Humanoid in pairs(Character:GetChildren()) do
			if Humanoid:IsA("Humanoid") then
				return Humanoid
			end
		end
	end
end

local function onHeartbeat()
	-- upvalues: v1 (ref), SpeedText (copy), SpeedBG (copy), SpeedBarClippingFrame (copy), IsEnabled (copy)
	if v1 then
		local Magnitude: number = v1.Velocity.magnitude
		SpeedText.Text = tostring((math.min(math.floor(Magnitude), 9999)))
		SpeedBarClippingFrame.Size = UDim2.new(0, math.min(math.floor(Magnitude / v1.MaxSpeed * SpeedBG.Size.X.Offset), SpeedBG.Size.X.Offset), 0, if IsEnabled then 24 else 4)
	end
end

local function onVehicleSeatChanged(p1)
	-- upvalues: VehicleHudFrame (copy)
	if p1 == "HeadsUpDisplay" then
		VehicleHudFrame.Visible = not VehicleHudFrame.Visible
	end
end

local function onSeated(Active, SeatPart)
	-- upvalues: v1 (ref), VehicleHudFrame (copy), HeartbeatConnection (ref), RunService (copy), onHeartbeat (copy), ChangedConnection (ref), onVehicleSeatChanged (copy)
	if not Active then
		if v1 then
			VehicleHudFrame.Visible = false
			v1 = nil
			
			if HeartbeatConnection then
				HeartbeatConnection:disconnect()
				HeartbeatConnection = nil
			end
			if ChangedConnection then
				ChangedConnection:disconnect()
				ChangedConnection = nil
			end
		end
	elseif SeatPart and SeatPart:IsA("VehicleSeat") then
		v1 = SeatPart
		VehicleHudFrame.Visible = v1.HeadsUpDisplay
		HeartbeatConnection = RunService.Heartbeat:connect(onHeartbeat)
		ChangedConnection = v1.Changed:connect(onVehicleSeatChanged)
		
		return
	end
end

local SeatedConnection = nil
local ChildAddedConnection = nil

local _ = function()
	-- upvalues: SeatedConnection (ref)
	if SeatedConnection then
		SeatedConnection:Disconnect()
		SeatedConnection = nil
	end
end

local _ = function()
	-- upvalues: ChildAddedConnection (ref)
	if ChildAddedConnection then
		ChildAddedConnection:Disconnect()
		ChildAddedConnection = nil
	end
end

local function characterAdded(Character)
	-- upvalues: SeatedConnection (ref), ChildAddedConnection (ref), onSeated (copy)
	if SeatedConnection then
		SeatedConnection:Disconnect()
		SeatedConnection = nil
	end
	if ChildAddedConnection then
		ChildAddedConnection:Disconnect()
		ChildAddedConnection = nil
	end
	local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
	
	if Humanoid then
		SeatedConnection = Humanoid.Seated:connect(onSeated)
		
		return
	else
		ChildAddedConnection = Character.ChildAdded:Connect(function(Child: Humanoid)
			-- upvalues: SeatedConnection (upval), ChildAddedConnection (upval), onSeated (upval)
			if Child:IsA("Humanoid") then
				if SeatedConnection then
					SeatedConnection:Disconnect()
					SeatedConnection = nil
				end
				if ChildAddedConnection then
					ChildAddedConnection:Disconnect()
					ChildAddedConnection = nil
				end
				SeatedConnection = Child.Seated:connect(onSeated)
			end
		end)
	end
end

if LocalPlayer.Character then
	characterAdded(LocalPlayer.Character)
end
LocalPlayer.CharacterAdded:connect(function(Character)
	-- upvalues: v1 (ref), VehicleHudFrame (copy), HeartbeatConnection (ref), ChangedConnection (ref), characterAdded (copy)
	if v1 then
		VehicleHudFrame.Visible = false
		v1 = nil
		
		if HeartbeatConnection then
			HeartbeatConnection:disconnect()
			HeartbeatConnection = nil
		end
		if ChangedConnection then
			ChangedConnection:disconnect()
			ChangedConnection = nil
		end
	end
	characterAdded(Character)
end)