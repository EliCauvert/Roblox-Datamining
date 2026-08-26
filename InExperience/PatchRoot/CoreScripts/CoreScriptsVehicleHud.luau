local runService = game:GetService("RunService")
local playersService = game:GetService("Players")
local _ = game:GetService("CorePackages")
while not playersService.LocalPlayer do
	wait()
end
local localPlayer = playersService.LocalPlayer
local var1 = nil
local var2 = nil
local var3 = nil
local robloxGui = game:GetService("CoreGui").RobloxGui
local var4 = require(robloxGui.Modules.TenFootInterface):IsEnabled()
local var5 = if var4 then 100 else 70

local function _(p1, p2, p3, p4, p5)
	local imageLabel = Instance.new("ImageLabel")
	imageLabel.Name = p1
	imageLabel.Size = p2
	imageLabel.Position = p3
	imageLabel.BackgroundTransparency = 1
	imageLabel.Image = p4
	imageLabel.Parent = p5
	
	return imageLabel
end

local function createTextLabel(p1, p2, p3, p4)
	-- upvalues: var4 (ref)
	local textLabel = Instance.new("TextLabel")
	textLabel.Name = p1
	textLabel.Size = UDim2.new(1, -4, 0, if var4 then 50 else 20)
	textLabel.Position = UDim2.new(0, 2, 0, if var4 then -50 else -20)
	textLabel.BackgroundTransparency = 1
	textLabel.TextXAlignment = p2
	textLabel.Font = Enum.Font.SourceSans
	textLabel.FontSize = if var4 then Enum.FontSize.Size48 else Enum.FontSize.Size18
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.TextStrokeTransparency = 0.5
	textLabel.TextStrokeColor3 = Color3.new(0.192156862745, 0.192156862745, 0.192156862745)
	textLabel.Text = p3
	textLabel.Parent = p4
	
	return textLabel
end

local vehicleHudFrame = Instance.new("Frame")
vehicleHudFrame.Name = "VehicleHudFrame"
vehicleHudFrame.Size = UDim2.new(0, if var4 then 316 else 158, 0, if var4 then 50 else 14)
vehicleHudFrame.Position = UDim2.new(0.5, -(vehicleHudFrame.Size.X.Offset / 2), 1, (-var5) - vehicleHudFrame.Size.Y.Offset)
vehicleHudFrame.BackgroundTransparency = 1
vehicleHudFrame.Visible = false
vehicleHudFrame.Parent = robloxGui
local speedBarClippingFrame = Instance.new("Frame")
speedBarClippingFrame.Name = "SpeedBarClippingFrame"
speedBarClippingFrame.Size = UDim2.new(0, 0, 0, if var4 then 24 else 4)
speedBarClippingFrame.Position = UDim2.new(0.5, if var4 then -142 else -71, 0.5, if var4 then -13 else -2)
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
local uDim2_2 = UDim2.new(0, if var4 then 284 else 142, 0, if var4 then 24 else 4)
local uDim2_3 = UDim2.new(0.5, if var4 then -142 else -71, 0.5, if var4 then -13 else -2)
local speedBG = Instance.new("ImageLabel")
speedBG.Name = "SpeedBG"
speedBG.Size = uDim2_2
speedBG.Position = uDim2_3
speedBG.BackgroundTransparency = 1
speedBG.Image = "rbxasset://textures/ui/Vehicle/SpeedBarEmpty.png"
speedBG.Parent = vehicleHudFrame
local uDim2_4 = UDim2.new(0, if var4 then 284 else 142, 1, 0)
local uDim2_5 = UDim2.new(0, 0, 0, 0)
local speedBarImage = Instance.new("ImageLabel")
speedBarImage.Name = "SpeedBarImage"
speedBarImage.Size = uDim2_4
speedBarImage.Position = uDim2_5
speedBarImage.BackgroundTransparency = 1
speedBarImage.Image = "rbxasset://textures/ui/Vehicle/SpeedBar.png"
speedBarImage.Parent = speedBarClippingFrame
createTextLabel("SpeedLabel", Enum.TextXAlignment.Left, "Speed", vehicleHudFrame)
local var6 = createTextLabel("SpeedText", Enum.TextXAlignment.Right, "0", vehicleHudFrame)

local _ = function()
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

speedBG = function()
	-- upvalues: var1 (write), var6 (ref), speedBG (ref), speedBarClippingFrame (ref), var4 (ref)
	if var1 then
		local magnitude = var1.Velocity.magnitude
		var6.Text = tostring(math.min(math.floor(magnitude), 9999))
		speedBarClippingFrame.Size = UDim2.new(0, math.min(math.floor(magnitude / var1.MaxSpeed * speedBG.Size.X.Offset), speedBG.Size.X.Offset), 0, if var4 then 24 else 4)
	end
end

local function onVehicleSeatChanged(p1)
	-- upvalues: vehicleHudFrame (ref)
	if p1 == "HeadsUpDisplay" then
		vehicleHudFrame.Visible = not vehicleHudFrame.Visible
	end
end

local function onSeated(p1, p2)
	-- upvalues: var1 (write), vehicleHudFrame (ref), var2 (write), runService (ref), speedBG (ref), var3 (write), onVehicleSeatChanged (ref)
	if p1 then
		if p2 and p2:IsA("VehicleSeat") then
			var1 = p2
			vehicleHudFrame.Visible = var1.HeadsUpDisplay
			var2 = runService.Heartbeat:connect(speedBG)
			var3 = var1.Changed:connect(onVehicleSeatChanged)
			
			return
		end
	elseif var1 then
		vehicleHudFrame.Visible = false
		var1 = nil
		
		if var2 then
			var2:disconnect()
			var2 = nil
		end
		if var3 then
			var3:disconnect()
			var3 = nil
		end
	end
end

local var7 = nil
local var8 = nil

local _ = function()
	-- upvalues: var7 (write)
	if var7 then
		var7:Disconnect()
		var7 = nil
	end
end

local _ = function()
	-- upvalues: var8 (write)
	if var8 then
		var8:Disconnect()
		var8 = nil
	end
end

local function characterAdded(p1)
	-- upvalues: var7 (write), var8 (write), onSeated (ref)
	if var7 then
		var7:Disconnect()
		var7 = nil
	end
	if var8 then
		var8:Disconnect()
		var8 = nil
	end
	local humanoid = p1:FindFirstChildWhichIsA("Humanoid")
	
	if humanoid then
		var7 = humanoid.Seated:connect(onSeated)
		
		return
	end
	var8 = p1.ChildAdded:Connect(function(p2)
		-- upvalues: var7 (copy), var8 (copy), onSeated (copy)
		if p2:IsA("Humanoid") then
			if var7 then
				var7:Disconnect()
				var7 = nil
			end
			if var8 then
				var8:Disconnect()
				var8 = nil
			end
			var7 = p2.Seated:connect(onSeated)
		end
	end)
end

if localPlayer.Character then
	characterAdded(localPlayer.Character)
end
localPlayer.CharacterAdded:connect(function(p1)
	-- upvalues: var1 (write), vehicleHudFrame (ref), var2 (write), var3 (write), characterAdded (ref)
	if var1 then
		vehicleHudFrame.Visible = false
		var1 = nil
		
		if var2 then
			var2:disconnect()
			var2 = nil
		end
		if var3 then
			var3:disconnect()
			var3 = nil
		end
	end
	characterAdded(p1)
end)