local runService = game:GetService("RunService")
local playersService = game:GetService("Players")
local _ = game:GetService("CorePackages")
while not playersService.LocalPlayer do
	wait()
end
local localPlayer = playersService.LocalPlayer
local var2 = nil
local var3 = nil
local var4 = nil
local robloxGui = game:GetService("CoreGui").RobloxGui
local var5 = require(robloxGui.Modules.TenFootInterface):IsEnabled()
local var6 = if var5 then 100 else 70

local function _(p0, p1, p2, p3, p4) --[[ line: 34 | named "createImageLabel" ]]
	local imageLabel = Instance.new("ImageLabel")
	imageLabel.Name = p0
	imageLabel.Size = p1
	imageLabel.Position = p2
	imageLabel.BackgroundTransparency = 1
	imageLabel.Image = p3
	imageLabel.Parent = p4
	
	return imageLabel
end

local function createTextLabel(p5, p6, p7, p8) --[[ line: 46 ]]
	-- upvalues: var5 (ref)
	local textLabel = Instance.new("TextLabel")
	textLabel.Name = p5
	textLabel.Size = UDim2.new(1, -4, 0, if var5 then 50 else 20)
	textLabel.Position = UDim2.new(0, 2, 0, if var5 then -50 else -20)
	textLabel.BackgroundTransparency = 1
	textLabel.TextXAlignment = p6
	textLabel.Font = Enum.Font.SourceSans
	textLabel.FontSize = if var5 then Enum.FontSize.Size48 else Enum.FontSize.Size18
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.TextStrokeTransparency = 0.5
	textLabel.TextStrokeColor3 = Color3.new(0.192156862745, 0.192156862745, 0.192156862745)
	textLabel.Text = p7
	textLabel.Parent = p8
	
	return textLabel
end

local vehicleHudFrame = Instance.new("Frame")
vehicleHudFrame.Name = "VehicleHudFrame"
vehicleHudFrame.Size = UDim2.new(0, if var5 then 316 else 158, 0, if var5 then 50 else 14)
vehicleHudFrame.Position = UDim2.new(0.5, -(vehicleHudFrame.Size.X.Offset / 2), 1, (-var6) - vehicleHudFrame.Size.Y.Offset)
vehicleHudFrame.BackgroundTransparency = 1
vehicleHudFrame.Visible = false
vehicleHudFrame.Parent = robloxGui
local speedBarClippingFrame = Instance.new("Frame")
speedBarClippingFrame.Name = "SpeedBarClippingFrame"
speedBarClippingFrame.Size = UDim2.new(0, 0, 0, if var5 then 24 else 4)
speedBarClippingFrame.Position = UDim2.new(0.5, if var5 then -142 else -71, 0.5, if var5 then -13 else -2)
speedBarClippingFrame.BackgroundTransparency = 1
speedBarClippingFrame.ClipsDescendants = true
speedBarClippingFrame.ZIndex = 2
speedBarClippingFrame.Parent = vehicleHudFrame
local uDim2 = UDim2.new(1, 0, 1, 0)
local uDim2_1 = UDim2.new(0, 0, 0, 1)
local hudBG = Instance.new("ImageLabel")
hudBG.Name = "HudBG"
hudBG.Size = uDim2
hudBG.Position = uDim2_1
hudBG.BackgroundTransparency = 1
hudBG.Image = "rbxasset://textures/ui/Vehicle/SpeedBarBKG.png"
hudBG.Parent = vehicleHudFrame
local uDim2_2 = UDim2.new(0, if var5 then 284 else 142, 0, if var5 then 24 else 4)
local uDim2_3 = UDim2.new(0.5, if var5 then -142 else -71, 0.5, if var5 then -13 else -2)
local speedBG = Instance.new("ImageLabel")
speedBG.Name = "SpeedBG"
speedBG.Size = uDim2_2
speedBG.Position = uDim2_3
speedBG.BackgroundTransparency = 1
speedBG.Image = "rbxasset://textures/ui/Vehicle/SpeedBarEmpty.png"
speedBG.Parent = vehicleHudFrame
local uDim2_4 = UDim2.new(0, if var5 then 284 else 142, 1, 0)
local uDim2_5 = UDim2.new(0, 0, 0, 0)
local speedBarImage = Instance.new("ImageLabel")
speedBarImage.Name = "SpeedBarImage"
speedBarImage.Size = uDim2_4
speedBarImage.Position = uDim2_5
speedBarImage.BackgroundTransparency = 1
speedBarImage.Image = "rbxasset://textures/ui/Vehicle/SpeedBar.png"
speedBarImage.Parent = speedBarClippingFrame
createTextLabel("SpeedLabel", Enum.TextXAlignment.Left, "Speed", vehicleHudFrame)
local var19 = createTextLabel("SpeedText", Enum.TextXAlignment.Right, "0", vehicleHudFrame)

local _ = function() --[[ line: 89 | named "getHumanoid" ]]
	-- upvalues: localPlayer (ref)
	local character = localPlayer and localPlayer.Character
	
	if character then
		for i, v in pairs(character:GetChildren()) do
			if v:IsA("Humanoid") then
				return v
			end
		end
	end
end

speedBG = function() --[[ line: 100 | named "onHeartbeat" ]]
	-- upvalues: var2 (write), var19 (ref), speedBG (ref), speedBarClippingFrame (ref), var5 (ref)
	if var2 then
		local magnitude = var2.Velocity.magnitude
		var19.Text = tostring(math.min(math.floor(magnitude), 9999))
		speedBarClippingFrame.Size = UDim2.new(0, math.min(math.floor(magnitude / var2.MaxSpeed * speedBG.Size.X.Offset), speedBG.Size.X.Offset), 0, if var5 then 24 else 4)
	end
end

local function onVehicleSeatChanged(p9) --[[ line: 110 ]]
	-- upvalues: vehicleHudFrame (ref)
	if p9 == "HeadsUpDisplay" then
		vehicleHudFrame.Visible = not vehicleHudFrame.Visible
	end
end

local function onSeated(p10, p11) --[[ line: 116 ]]
	-- upvalues: var2 (write), vehicleHudFrame (ref), var3 (write), runService (ref), speedBG (ref), var4 (write), onVehicleSeatChanged (ref)
	if p10 then
		if p11 and p11:IsA("VehicleSeat") then
			var2 = p11
			vehicleHudFrame.Visible = var2.HeadsUpDisplay
			var3 = runService.Heartbeat:connect(speedBG)
			var4 = var2.Changed:connect(onVehicleSeatChanged)
			
			return
		end
	elseif var2 then
		vehicleHudFrame.Visible = false
		var2 = nil
		
		if var3 then
			var3:disconnect()
			var3 = nil
		end
		if var4 then
			var4:disconnect()
			var4 = nil
		end
	end
end

local var22 = nil
local var23 = nil

local _ = function() --[[ line: 143 | named "disconnectSeatedConnection" ]]
	-- upvalues: var22 (write)
	if var22 then
		var22:Disconnect()
		var22 = nil
	end
end

local _ = function() --[[ line: 150 | named "disconnectChildAddedConnection" ]]
	-- upvalues: var23 (write)
	if var23 then
		var23:Disconnect()
		var23 = nil
	end
end

local function characterAdded(p12) --[[ line: 157 ]]
	-- upvalues: var22 (write), var23 (write), onSeated (ref)
	if var22 then
		var22:Disconnect()
		var22 = nil
	end
	if var23 then
		var23:Disconnect()
		var23 = nil
	end
	local humanoid = p12:FindFirstChildWhichIsA("Humanoid")
	
	if humanoid then
		var22 = humanoid.Seated:connect(onSeated)
		
		return
	end
	var23 = p12.ChildAdded:Connect(function(p13) --[[ line: 167 ]]
		-- upvalues: var22 (copy), var23 (copy), onSeated (copy)
		if p13:IsA("Humanoid") then
			if var22 then
				var22:Disconnect()
				var22 = nil
			end
			if var23 then
				var23:Disconnect()
				var23 = nil
			end
			var22 = p13.Seated:connect(onSeated)
		end
	end)
end

if localPlayer.Character then
	characterAdded(localPlayer.Character)
end
localPlayer.CharacterAdded:connect(function(p14) --[[ line: 178 ]]
	-- upvalues: var2 (write), vehicleHudFrame (ref), var3 (write), var4 (write), characterAdded (ref)
	if var2 then
		vehicleHudFrame.Visible = false
		var2 = nil
		
		if var3 then
			var3:disconnect()
			var3 = nil
		end
		if var4 then
			var4:disconnect()
			var4 = nil
		end
	end
	characterAdded(p14)
end)