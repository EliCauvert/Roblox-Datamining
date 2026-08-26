local color3 = Color3.new(0.894117647059, 0.925490196078, 0.964705882353)
local color3_1 = Color3.new(1, 0.109803921569, 0)
local color3_2 = Color3.new(0.980392156863, 0.921568627451, 0)
local color3_3 = Color3.new(0.105882352941, 0.988235294118, 0.419607843137)
local playersService = game:GetService("Players")
local coreGuiService = game:GetService("CoreGui")
local starterGuiService = game:GetService("StarterGui")
local userInputService = game:GetService("UserInputService")
local corePackagesService = game:GetService("CorePackages")
local _ = coreGuiService:WaitForChild("RobloxGui")
local healthbarContainer = Instance.new("Frame")
healthbarContainer.Name = "HealthbarContainer"
healthbarContainer.BackgroundTransparency = 1
healthbarContainer.Size = UDim2.new(1, 0, 1, 0)
local healthbarBack = Instance.new("ImageLabel")
healthbarBack.ImageColor3 = color3
healthbarBack.BackgroundTransparency = 1
healthbarBack.ScaleType = Enum.ScaleType.Slice
healthbarBack.SliceCenter = Rect.new(10, 10, 10, 10)
healthbarBack.Name = "HealthbarBack"
healthbarBack.Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png"
healthbarBack.Size = UDim2.new(1, 0, 0.3, 0)
healthbarBack.Position = UDim2.new(0, 0, 0.7, 0)
healthbarBack.Parent = healthbarContainer
local healthbarFill = Instance.new("ImageLabel")
healthbarFill.ImageColor3 = color3_3
healthbarFill.BackgroundTransparency = 1
healthbarFill.ScaleType = Enum.ScaleType.Slice
healthbarFill.SliceCenter = Rect.new(10, 10, 10, 10)
healthbarFill.Size = UDim2.new(1, 0, 1, 0)
healthbarFill.Position = UDim2.new(0, 0, 0, 0)
healthbarFill.Name = "HealthbarFill"
healthbarFill.Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png"
healthbarFill.Parent = healthbarBack
local playerName = Instance.new("TextLabel")
playerName.Name = "PlayerName"
playerName.BackgroundTransparency = 1
playerName.TextColor3 = Color3.new(1, 1, 1)
playerName.Text = ""
playerName.Font = Enum.Font.SourceSansBold
playerName.FontSize = Enum.FontSize.Size24
playerName.TextXAlignment = Enum.TextXAlignment.Left
playerName.Size = UDim2.new(1, 0, 0, 14)
playerName.Parent = healthbarContainer

local function _(p1)
	return Vector3.new(p1.r, p1.g, p1.b)
end

local function FindChildOfType(p1, p2)
	for i, v in pairs(p1:GetChildren()) do
		if v:IsA(p2) then
			return v
		end
	end
end

local t = {
	[Vector3.new(color3_1.r, color3_1.g, color3_1.b)] = 0.1,
	[Vector3.new(color3_2.r, color3_2.g, color3_2.b)] = 0.5,
	[Vector3.new(color3_3.r, color3_3.g, color3_3.b)] = 0.8
}

local function HealthbarColorTransferFunction(p3)
	-- upvalues: color3_1 (ref), color3_3 (ref), t (ref)
	if p3 <= 0.1 then
		return color3_1
	elseif p3 >= 0.8 then
		return color3_3
	end
	local var1 = Vector3.new(0, 0, 0)
	local var2 = 0
	
	for i, v in pairs(t) do
		local var3 = p3 - v
		
		if var3 ~= 0 then
			local var4 = 1 / (var3 * var3)
			var1 += var4 * i
			var2 += var4
			continue
		end
		return Color3.new(i.x, i.y, i.z)
	end
	local var5 = var1 / var2
	
	return Color3.new(var5.x, var5.y, var5.z)
end

local _ = function(p4)
	-- upvalues: healthbarFill (ref), HealthbarColorTransferFunction (ref)
	local var6 = p4.Health / p4.MaxHealth
	
	if var6 ~= var6 then
		var6 = 1
	end
	healthbarFill.ImageColor3 = HealthbarColorTransferFunction(var6)
	healthbarFill.Size = UDim2.new(var6, 0, 1, 0)
end

local var6 = nil
local var7 = nil

local function RegisterHumanoid(p4)
	-- upvalues: var7 (write), var6 (write), playersService (ref), RegisterHumanoid (ref), healthbarFill (ref), HealthbarColorTransferFunction (ref)
	if var7 then
		var7:disconnect()
		var7 = nil
	end
	if var6 then
		var6:disconnect()
		var6 = nil
	end
	if p4 then
		var7 = p4.AncestryChanged:connect(function(p5, p6)
			-- upvalues: playersService (copy), p4 (ref), RegisterHumanoid (copy)
			local localPlayer = playersService.LocalPlayer
			
			if p5 == p4 and (not localPlayer or p6 ~= localPlayer.Character) then
				RegisterHumanoid(nil)
			end
		end)
		var6 = p4.HealthChanged:connect(function()
			-- upvalues: p4 (ref), healthbarFill (copy), HealthbarColorTransferFunction (copy)
			local var8 = p4.Health / p4.MaxHealth
			
			if var8 ~= var8 then
				var8 = 1
			end
			healthbarFill.ImageColor3 = HealthbarColorTransferFunction(var8)
			healthbarFill.Size = UDim2.new(var8, 0, 1, 0)
		end)
		local var8 = p4.Health / p4.MaxHealth
		
		if var8 ~= var8 then
			var8 = 1
		end
		healthbarFill.ImageColor3 = HealthbarColorTransferFunction(var8)
		healthbarFill.Size = UDim2.new(var8, 0, 1, 0)
	end
end

local function OnCharacterChildAdded(p4)
	-- upvalues: playersService (ref), RegisterHumanoid (ref)
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer and p4.Parent == localPlayer.Character and p4:IsA("Humanoid") then
		RegisterHumanoid(p4)
	end
end

local childAddedConnection = nil

local function OnCharacterAdded(p4)
	-- upvalues: FindChildOfType (ref), RegisterHumanoid (ref), childAddedConnection (write), OnCharacterChildAdded (ref)
	local var8 = FindChildOfType(p4, "Humanoid")
	
	if var8 then
		RegisterHumanoid(var8)
	end
	if childAddedConnection then
		childAddedConnection:disconnect()
		childAddedConnection = nil
	end
	childAddedConnection = p4.ChildAdded:connect(OnCharacterChildAdded)
end

local _ = function(p4)
	-- upvalues: playerName (ref), OnCharacterAdded (ref), FindChildOfType (ref), RegisterHumanoid (ref), childAddedConnection (write), OnCharacterChildAdded (ref)
	playerName.Text = p4.Name
	p4.CharacterAdded:connect(OnCharacterAdded)
	
	if p4.Character then
		local character = p4.Character
		local var8 = FindChildOfType(character, "Humanoid")
		
		if var8 then
			RegisterHumanoid(var8)
		end
		if childAddedConnection then
			childAddedConnection:disconnect()
			childAddedConnection = nil
		end
		childAddedConnection = character.ChildAdded:connect(OnCharacterChildAdded)
	end
end

if playersService.LocalPlayer then
	local localPlayer = playersService.LocalPlayer
	playerName.Text = localPlayer.Name
	localPlayer.CharacterAdded:connect(OnCharacterAdded)
	
	if localPlayer.Character then
		local character = localPlayer.Character
		local var8 = FindChildOfType(character, "Humanoid")
		
		if var8 then
			RegisterHumanoid(var8)
		end
		childAddedConnection = character.ChildAdded:connect(OnCharacterChildAdded)
	end
else
	spawn(function()
		-- upvalues: playersService (ref), playerName (ref), OnCharacterAdded (ref), FindChildOfType (ref), RegisterHumanoid (ref), childAddedConnection (write), OnCharacterChildAdded (ref)
		while not playersService.LocalPlayer do
			playersService.ChildAdded:wait()
		end
		local localPlayer = playersService.LocalPlayer
		playerName.Text = localPlayer.Name
		localPlayer.CharacterAdded:connect(OnCharacterAdded)
		
		if localPlayer.Character then
			local character = localPlayer.Character
			local var9 = FindChildOfType(character, "Humanoid")
			
			if var9 then
				RegisterHumanoid(var9)
			end
			if childAddedConnection then
				childAddedConnection:disconnect()
				childAddedConnection = nil
			end
			childAddedConnection = character.ChildAdded:connect(OnCharacterChildAdded)
		end
	end)
end
local t_1 = {
	ModuleName = "Healthbar",
	KeepVRTopbarOpen = false,
	VRIsExclusive = false,
	VRClosesNonExclusive = false
}
local var9 = nil
local var10 = nil
local var11 = nil

local function OnVREnabled(p4)
	-- upvalues: userInputService (ref), corePackagesService (ref), healthbarBack (ref), healthbarFill (ref), playerName (ref), starterGuiService (ref), var9 (write), var10 (write), var11 (write), healthbarContainer (ref), t_1 (ref)
	if p4 == "VREnabled" then
		if userInputService.VREnabled then
			local VRHub = require(corePackagesService.Workspace.Packages.VrCommon).VRHub
			local panel3D = require(corePackagesService.Workspace.Packages.VrCommon).Panel3D
			local healthbar = panel3D.Get("Healthbar")
			healthbar:ResizeStuds(1.5, 0.25, 128)
			healthbar:SetType(panel3D.Type.Fixed, { CFrame = CFrame.new(0, 0, -5) })
			healthbar:SetVisible(true)
			
			function healthbar.PreUpdate(p5, _, _, _, _)
				-- upvalues: panel3D (ref), healthbar (ref)
				local backpack = panel3D.Get("Backpack") or panel3D.Get("Topbar3D")
				local topbar3D = panel3D.Get("Topbar3D")
				
				if backpack and topbar3D then
					p5.localCF = (backpack.localCF or CFrame.new()) * CFrame.new(math.max(topbar3D.width, backpack.width) / 2 - healthbar.width / 2 - 0.11, 0.25, 0.1)
				end
			end
			
			function healthbar.CalculateTransparency(_)
				-- upvalues: panel3D (ref), healthbarBack (copy), healthbarFill (copy), playerName (copy)
				local var12
				local backpack = panel3D.Get("Backpack")
				local topbar3D = panel3D.Get("Topbar3D")
				
				if backpack then
					var12 = backpack:IsVisible() and (backpack:CalculateTransparency() or 1)
				end
				local minValue = math.min(var12, topbar3D and (topbar3D:IsVisible() and (topbar3D:CalculateTransparency() or 1)))
				healthbarBack.ImageTransparency = minValue
				healthbarFill.ImageTransparency = minValue
				playerName.TextTransparency = minValue
				
				return minValue
			end
			
			local var12 = false
			
			local function _()
				-- upvalues: VRHub (ref), var12 (write)
				for i, v in pairs(VRHub:GetOpenedModules()) do
					if v.VRIsExclusive then
						var12 = true
						
						return
					end
				end
				var12 = false
			end
			
			local _ = function()
				-- upvalues: starterGuiService (copy), var12 (write)
				return starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Health) and not var12
			end
			
			var9 = starterGuiService.CoreGuiChangedSignal:connect(function()
				-- upvalues: healthbar (ref), starterGuiService (copy), var12 (write)
				healthbar:SetVisible(starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Health) and not var12)
			end)
			var10 = VRHub.ModuleOpened.Event:connect(function(_)
				-- upvalues: VRHub (ref), var12 (write), healthbar (ref), starterGuiService (copy)
				for i, v in pairs(VRHub:GetOpenedModules()) do
					if v.VRIsExclusive then
						var12 = true
						healthbar:SetVisible(starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Health) and not var12)
						
						return
					end
				end
				var12 = false
			end)
			var11 = VRHub.ModuleClosed.Event:connect(function(_)
				-- upvalues: VRHub (ref), var12 (write), healthbar (ref), starterGuiService (copy)
				for i, v in pairs(VRHub:GetOpenedModules()) do
					if v.VRIsExclusive then
						var12 = true
						healthbar:SetVisible(starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Health) and not var12)
						
						return
					end
				end
				var12 = false
			end)
			
			for i, v in pairs(VRHub:GetOpenedModules()) do
				if v.VRIsExclusive then
					var12 = true
					healthbar:SetVisible(starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Health) and not var12)
					healthbarContainer.Parent = healthbar:GetGUI()
					VRHub:RegisterModule(t_1)
					
					return
				end
			end
			var12 = false
		elseif var9 then
			var9:disconnect()
			var9 = nil
		end
		if var10 then
			var10:disconnect()
			var10 = nil
		end
		if var11 then
			var11:disconnect()
			var11 = nil
		end
		healthbarContainer.Parent = nil
	end
end

userInputService.Changed:connect(OnVREnabled)

if userInputService.VREnabled then
	OnVREnabled("VREnabled")
end
return t_1