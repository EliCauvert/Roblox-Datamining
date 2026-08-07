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

local function _(p0) --[[ line: 67 | named "Color3ToVec3" ]]
	return Vector3.new(p0.r, p0.g, p0.b)
end

local function FindChildOfType(p1, p2) --[[ line: 71 ]]
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

local function HealthbarColorTransferFunction(p3) --[[ line: 87 ]]
	-- upvalues: color3_1 (ref), color3_3 (ref), t (ref)
	if p3 <= 0.1 then
		return color3_1
	elseif p3 >= 0.8 then
		return color3_3
	end
	local var28 = Vector3.new(0, 0, 0)
	local var29 = 0
	
	for i, v in pairs(t) do
		local var31 = p3 - v
		
		if var31 ~= 0 then
			local var32 = 1 / (var31 * var31)
			var28 += var32 * i
			var29 += var32
			continue
		end
		return Color3.new(i.x, i.y, i.z)
	end
	local var30 = var28 / var29
	
	return Color3.new(var30.x, var30.y, var30.z)
end

local _ = function(p4) --[[ line: 113 | named "UpdateHealth" ]]
	-- upvalues: healthbarFill (ref), HealthbarColorTransferFunction (ref)
	local var33 = p4.Health / p4.MaxHealth
	
	if var33 ~= var33 then
		var33 = 1
	end
	healthbarFill.ImageColor3 = HealthbarColorTransferFunction(var33)
	healthbarFill.Size = UDim2.new(var33, 0, 1, 0)
end

local var16 = nil
local var17 = nil

local function RegisterHumanoid(p5) --[[ line: 124 ]]
	-- upvalues: var17 (write), var16 (write), playersService (ref), RegisterHumanoid (ref), healthbarFill (ref), HealthbarColorTransferFunction (ref)
	if var17 then
		var17:disconnect()
		var17 = nil
	end
	if var16 then
		var16:disconnect()
		var16 = nil
	end
	if p5 then
		var17 = p5.AncestryChanged:connect(function(p6, p7) --[[ line: 135 ]]
			-- upvalues: playersService (copy), p5 (ref), RegisterHumanoid (copy)
			local localPlayer = playersService.LocalPlayer
			
			if p6 == p5 and (not localPlayer or p7 ~= localPlayer.Character) then
				RegisterHumanoid(nil)
			end
		end)
		var16 = p5.HealthChanged:connect(function() --[[ line: 141 ]]
			-- upvalues: p5 (ref), healthbarFill (copy), HealthbarColorTransferFunction (copy)
			local var35 = p5.Health / p5.MaxHealth
			
			if var35 ~= var35 then
				var35 = 1
			end
			healthbarFill.ImageColor3 = HealthbarColorTransferFunction(var35)
			healthbarFill.Size = UDim2.new(var35, 0, 1, 0)
		end)
		local var34 = p5.Health / p5.MaxHealth
		
		if var34 ~= var34 then
			var34 = 1
		end
		healthbarFill.ImageColor3 = HealthbarColorTransferFunction(var34)
		healthbarFill.Size = UDim2.new(var34, 0, 1, 0)
	end
end

local function OnCharacterChildAdded(p8) --[[ line: 146 ]]
	-- upvalues: playersService (ref), RegisterHumanoid (ref)
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer and p8.Parent == localPlayer.Character and p8:IsA("Humanoid") then
		RegisterHumanoid(p8)
	end
end

local childAddedConnection = nil

local function OnCharacterAdded(p9) --[[ line: 154 ]]
	-- upvalues: FindChildOfType (ref), RegisterHumanoid (ref), childAddedConnection (write), OnCharacterChildAdded (ref)
	local var36 = FindChildOfType(p9, "Humanoid")
	
	if var36 then
		RegisterHumanoid(var36)
	end
	if childAddedConnection then
		childAddedConnection:disconnect()
		childAddedConnection = nil
	end
	childAddedConnection = p9.ChildAdded:connect(OnCharacterChildAdded)
end

local _ = function(p10) --[[ line: 167 | named "OnPlayerAdded" ]]
	-- upvalues: playerName (ref), OnCharacterAdded (ref), FindChildOfType (ref), RegisterHumanoid (ref), childAddedConnection (write), OnCharacterChildAdded (ref)
	playerName.Text = p10.Name
	p10.CharacterAdded:connect(OnCharacterAdded)
	
	if p10.Character then
		local character = p10.Character
		local var37 = FindChildOfType(character, "Humanoid")
		
		if var37 then
			RegisterHumanoid(var37)
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
		local var22 = FindChildOfType(character, "Humanoid")
		
		if var22 then
			RegisterHumanoid(var22)
		end
		childAddedConnection = character.ChildAdded:connect(OnCharacterChildAdded)
	end
else
	spawn(function() --[[ line: 179 ]]
		-- upvalues: playersService (ref), playerName (ref), OnCharacterAdded (ref), FindChildOfType (ref), RegisterHumanoid (ref), childAddedConnection (write), OnCharacterChildAdded (ref)
		while not playersService.LocalPlayer do
			playersService.ChildAdded:wait()
		end
		local localPlayer = playersService.LocalPlayer
		playerName.Text = localPlayer.Name
		localPlayer.CharacterAdded:connect(OnCharacterAdded)
		
		if localPlayer.Character then
			local character = localPlayer.Character
			local var38 = FindChildOfType(character, "Humanoid")
			
			if var38 then
				RegisterHumanoid(var38)
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
local var24 = nil
local var25 = nil
local var26 = nil

local function OnVREnabled(p11) --[[ line: 195 ]]
	-- upvalues: userInputService (ref), corePackagesService (ref), healthbarBack (ref), healthbarFill (ref), playerName (ref), starterGuiService (ref), var24 (write), var25 (write), var26 (write), healthbarContainer (ref), t_1 (ref)
	if p11 == "VREnabled" then
		if userInputService.VREnabled then
			local VRHub = require(corePackagesService.Workspace.Packages.VrCommon).VRHub
			local panel3D = require(corePackagesService.Workspace.Packages.VrCommon).Panel3D
			local healthbar = panel3D.Get("Healthbar")
			healthbar:ResizeStuds(1.5, 0.25, 128)
			healthbar:SetType(panel3D.Type.Fixed, { CFrame = CFrame.new(0, 0, -5) })
			healthbar:SetVisible(true)
			
			function healthbar.PreUpdate(p12, _, _, _, _) --[[ line: 207 ]]
				-- upvalues: panel3D (ref), healthbar (ref)
				local backpack = panel3D.Get("Backpack") or panel3D.Get("Topbar3D")
				local topbar3D = panel3D.Get("Topbar3D")
				
				if backpack and topbar3D then
					p12.localCF = (backpack.localCF or CFrame.new()) * CFrame.new(math.max(topbar3D.width, backpack.width) / 2 - healthbar.width / 2 - 0.11, 0.25, 0.1)
				end
			end
			
			function healthbar.CalculateTransparency(_) --[[ line: 217 ]]
				-- upvalues: panel3D (ref), healthbarBack (copy), healthbarFill (copy), playerName (copy)
				local var45
				local backpack = panel3D.Get("Backpack")
				local topbar3D = panel3D.Get("Topbar3D")
				
				if backpack then
					var45 = backpack:IsVisible() and (backpack:CalculateTransparency() or 1)
				end
				local minValue = math.min(var45, topbar3D and (topbar3D:IsVisible() and (topbar3D:CalculateTransparency() or 1)))
				healthbarBack.ImageTransparency = minValue
				healthbarFill.ImageTransparency = minValue
				playerName.TextTransparency = minValue
				
				return minValue
			end
			
			local var40 = false
			
			local function _() --[[ line: 232 | named "UpdateExclusivePanelOpen" ]]
				-- upvalues: VRHub (ref), var40 (write)
				for i, v in pairs(VRHub:GetOpenedModules()) do
					if v.VRIsExclusive then
						var40 = true
						
						return
					end
				end
				var40 = false
			end
			
			local _ = function() --[[ line: 242 | named "CalculateVisibility" ]]
				-- upvalues: starterGuiService (copy), var40 (write)
				return starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Health) and not var40
			end
			
			var24 = starterGuiService.CoreGuiChangedSignal:connect(function() --[[ line: 248 ]]
				-- upvalues: healthbar (ref), starterGuiService (copy), var40 (write)
				healthbar:SetVisible(starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Health) and not var40)
			end)
			var25 = VRHub.ModuleOpened.Event:connect(function(_) --[[ line: 252 ]]
				-- upvalues: VRHub (ref), var40 (write), healthbar (ref), starterGuiService (copy)
				for i, v in pairs(VRHub:GetOpenedModules()) do
					if v.VRIsExclusive then
						var40 = true
						healthbar:SetVisible(starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Health) and not var40)
						
						return
					end
				end
				var40 = false
			end)
			var26 = VRHub.ModuleClosed.Event:connect(function(_) --[[ line: 256 ]]
				-- upvalues: VRHub (ref), var40 (write), healthbar (ref), starterGuiService (copy)
				for i, v in pairs(VRHub:GetOpenedModules()) do
					if v.VRIsExclusive then
						var40 = true
						healthbar:SetVisible(starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Health) and not var40)
						
						return
					end
				end
				var40 = false
			end)
			
			for i, v in pairs(VRHub:GetOpenedModules()) do
				if v.VRIsExclusive then
					var40 = true
					healthbar:SetVisible(starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Health) and not var40)
					healthbarContainer.Parent = healthbar:GetGUI()
					VRHub:RegisterModule(t_1)
					
					return
				end
			end
			var40 = false
		elseif var24 then
			var24:disconnect()
			var24 = nil
		end
		if var25 then
			var25:disconnect()
			var25 = nil
		end
		if var26 then
			var26:disconnect()
			var26 = nil
		end
		healthbarContainer.Parent = nil
	end
end

userInputService.Changed:connect(OnVREnabled)

if userInputService.VREnabled then
	OnVREnabled("VREnabled")
end
return t_1