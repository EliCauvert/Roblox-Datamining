local _Color3 = Color3.new(0.8941176470588236, 0.9254901960784314, 0.9647058823529412)
local _Color3_1 = Color3.new(1, 0.10980392156862745, 0)
local _Color3_2 = Color3.new(0.9803921568627451, 0.9215686274509803, 0)
local _Color3_3 = Color3.new(0.10588235294117647, 0.9882352941176471, 0.4196078431372549)
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local CorePackages = game:GetService("CorePackages")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local HealthbarContainer = Instance.new("Frame")
HealthbarContainer.Name = "HealthbarContainer"
HealthbarContainer.BackgroundTransparency = 1
HealthbarContainer.Size = UDim2.new(1, 0, 1, 0)
local HealthbarBack = Instance.new("ImageLabel")
HealthbarBack.ImageColor3 = _Color3
HealthbarBack.BackgroundTransparency = 1
HealthbarBack.ScaleType = Enum.ScaleType.Slice
HealthbarBack.SliceCenter = Rect.new(10, 10, 10, 10)
HealthbarBack.Name = "HealthbarBack"
HealthbarBack.Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png"
HealthbarBack.Size = UDim2.new(1, 0, 0.3, 0)
HealthbarBack.Position = UDim2.new(0, 0, 0.7, 0)
HealthbarBack.Parent = HealthbarContainer
local HealthbarFill = Instance.new("ImageLabel")
HealthbarFill.ImageColor3 = _Color3_3
HealthbarFill.BackgroundTransparency = 1
HealthbarFill.ScaleType = Enum.ScaleType.Slice
HealthbarFill.SliceCenter = Rect.new(10, 10, 10, 10)
HealthbarFill.Size = UDim2.new(1, 0, 1, 0)
HealthbarFill.Position = UDim2.new(0, 0, 0, 0)
HealthbarFill.Name = "HealthbarFill"
HealthbarFill.Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png"
HealthbarFill.Parent = HealthbarBack
local PlayerName = Instance.new("TextLabel")
PlayerName.Name = "PlayerName"
PlayerName.BackgroundTransparency = 1
PlayerName.TextColor3 = Color3.new(1, 1, 1)
PlayerName.Text = ""
PlayerName.Font = Enum.Font.SourceSansBold
PlayerName.FontSize = Enum.FontSize.Size24
PlayerName.TextXAlignment = Enum.TextXAlignment.Left
PlayerName.Size = UDim2.new(1, 0, 0, 14)
PlayerName.Parent = HealthbarContainer

local function _(p1): Vector3
	return (Vector3.new(p1.r, p1.g, p1.b))
end

local function FindChildOfType(Character, ClassName)
	for _, child in pairs(Character:GetChildren()) do
		if child:IsA(ClassName) then
			return child
		end
	end
end

local config = {
	[Vector3.new(_Color3_1.r, _Color3_1.g, _Color3_1.b)] = 0.1,
	[Vector3.new(_Color3_2.r, _Color3_2.g, _Color3_2.b)] = 0.5,
	[Vector3.new(_Color3_3.r, _Color3_3.g, _Color3_3.b)] = 0.8
}

local function HealthbarColorTransferFunction(HealthRatio: number)
	-- upvalues: _Color3_1 (copy), _Color3_3 (copy), config (copy)
	if HealthRatio <= 0.1 then
		return _Color3_1
	end
	if HealthRatio >= 0.8 then
		return _Color3_3
	end
	local Total: vector = vector.create(0, 0, 0)
	local Total1 = 0
	
	for i, value in pairs(config) do
		local HealthRatioDelta = HealthRatio - value
		
		if HealthRatioDelta == 0 then
			return Color3.new(i.x, i.y, i.z)
		end
		local Amount = 1 / (HealthRatioDelta * HealthRatioDelta)
		Total += Amount * i
		Total1 += Amount
	end
	local TotalRatio: vector = Total / Total1
	
	return Color3.new(TotalRatio.x, TotalRatio.y, TotalRatio.z)
end

local _ = function(Humanoid: Humanoid)
	-- upvalues: HealthbarFill (copy), HealthbarColorTransferFunction (copy)
	local HealthRatio = Humanoid.Health / Humanoid.MaxHealth
	
	if HealthRatio ~= HealthRatio then
		HealthRatio = 1
	end
	HealthbarFill.ImageColor3 = HealthbarColorTransferFunction(HealthRatio)
	HealthbarFill.Size = UDim2.new(HealthRatio, 0, 1, 0)
end

local HealthChangedConnection = nil
local AncestryChangedConnection = nil

local function RegisterHumanoid(Humanoid: Humanoid)
	-- upvalues: AncestryChangedConnection (ref), HealthChangedConnection (ref), Players (copy), RegisterHumanoid (copy), HealthbarFill (copy), HealthbarColorTransferFunction (copy)
	if AncestryChangedConnection then
		AncestryChangedConnection:disconnect()
		AncestryChangedConnection = nil
	end
	if HealthChangedConnection then
		HealthChangedConnection:disconnect()
		HealthChangedConnection = nil
	end
	if Humanoid then
		AncestryChangedConnection = Humanoid.AncestryChanged:connect(function(Child, NewParent)
			-- upvalues: Players (upval), Humanoid (copy), RegisterHumanoid (upval)
			local LocalPlayer = Players.LocalPlayer
			
			if Child == Humanoid and (not LocalPlayer or NewParent ~= LocalPlayer.Character) then
				RegisterHumanoid(nil)
			end
		end)
		HealthChangedConnection = Humanoid.HealthChanged:connect(function()
			-- upvalues: Humanoid (copy), HealthbarFill (upval), HealthbarColorTransferFunction (upval)
			local HealthRatio = Humanoid.Health / Humanoid.MaxHealth
			
			if HealthRatio ~= HealthRatio then
				HealthRatio = 1
			end
			HealthbarFill.ImageColor3 = HealthbarColorTransferFunction(HealthRatio)
			HealthbarFill.Size = UDim2.new(HealthRatio, 0, 1, 0)
		end)
		local HealthRatio = Humanoid.Health / Humanoid.MaxHealth
		
		if HealthRatio ~= HealthRatio then
			HealthRatio = 1
		end
		HealthbarFill.ImageColor3 = HealthbarColorTransferFunction(HealthRatio)
		HealthbarFill.Size = UDim2.new(HealthRatio, 0, 1, 0)
	end
end

local function OnCharacterChildAdded(Child: Humanoid)
	-- upvalues: Players (copy), RegisterHumanoid (copy)
	local LocalPlayer = Players.LocalPlayer
	
	if LocalPlayer and Child.Parent == LocalPlayer.Character and Child:IsA("Humanoid") then
		RegisterHumanoid(Child)
	end
end

local ChildAddedConnection = nil

local function OnCharacterAdded(Character)
	-- upvalues: FindChildOfType (copy), RegisterHumanoid (copy), ChildAddedConnection (ref), OnCharacterChildAdded (copy)
	local Humanoid = FindChildOfType(Character, "Humanoid")
	
	if Humanoid then
		RegisterHumanoid(Humanoid)
	end
	if ChildAddedConnection then
		ChildAddedConnection:disconnect()
		ChildAddedConnection = nil
	end
	ChildAddedConnection = Character.ChildAdded:connect(OnCharacterChildAdded)
end

local _ = function(Player: Player)
	-- upvalues: PlayerName (copy), OnCharacterAdded (copy), FindChildOfType (copy), RegisterHumanoid (copy), ChildAddedConnection (ref), OnCharacterChildAdded (copy)
	PlayerName.Text = Player.Name
	Player.CharacterAdded:connect(OnCharacterAdded)
	
	if Player.Character then
		local Character = Player.Character
		local Humanoid = FindChildOfType(Character, "Humanoid")
		
		if Humanoid then
			RegisterHumanoid(Humanoid)
		end
		if ChildAddedConnection then
			ChildAddedConnection:disconnect()
			ChildAddedConnection = nil
		end
		ChildAddedConnection = Character.ChildAdded:connect(OnCharacterChildAdded)
	end
end

if Players.LocalPlayer then
	local LocalPlayer = Players.LocalPlayer
	PlayerName.Text = LocalPlayer.Name
	LocalPlayer.CharacterAdded:connect(OnCharacterAdded)
	
	if LocalPlayer.Character then
		local Character = LocalPlayer.Character
		local Humanoid = FindChildOfType(Character, "Humanoid")
		
		if Humanoid then
			RegisterHumanoid(Humanoid)
		end
		if ChildAddedConnection then
			ChildAddedConnection:disconnect()
			ChildAddedConnection = nil
		end
		ChildAddedConnection = Character.ChildAdded:connect(OnCharacterChildAdded)
	end
else
	spawn(function()
		-- upvalues: Players (copy), PlayerName (copy), OnCharacterAdded (copy), FindChildOfType (copy), RegisterHumanoid (copy), ChildAddedConnection (ref), OnCharacterChildAdded (copy)
		while not Players.LocalPlayer do
			Players.ChildAdded:wait()
		end
		local LocalPlayer = Players.LocalPlayer
		PlayerName.Text = LocalPlayer.Name
		LocalPlayer.CharacterAdded:connect(OnCharacterAdded)
		
		if LocalPlayer.Character then
			local Character = LocalPlayer.Character
			local Humanoid = FindChildOfType(Character, "Humanoid")
			
			if Humanoid then
				RegisterHumanoid(Humanoid)
			end
			if ChildAddedConnection then
				ChildAddedConnection:disconnect()
				ChildAddedConnection = nil
			end
			ChildAddedConnection = Character.ChildAdded:connect(OnCharacterChildAdded)
		end
	end)
end
local Healthbar3DModule = {
	ModuleName = "Healthbar",
	KeepVRTopbarOpen = false,
	VRIsExclusive = false,
	VRClosesNonExclusive = false
}
local CoreGuiChangedSignalConnection = nil
local EventConnection = nil
local EventConnection1 = nil

local function OnVREnabled(Property)
	-- upvalues: UserInputService (copy), CorePackages (copy), HealthbarBack (copy), HealthbarFill (copy), PlayerName (copy), StarterGui (copy), CoreGuiChangedSignalConnection (ref), EventConnection (ref), EventConnection1 (ref), HealthbarContainer (copy), Healthbar3DModule (copy)
	if Property == "VREnabled" then
		if UserInputService.VREnabled then
			local VRHub = require(CorePackages.Workspace.Packages.VrCommon).VRHub
			local Panel3D = require(CorePackages.Workspace.Packages.VrCommon).Panel3D
			local Healthbar = Panel3D.Get("Healthbar")
			Healthbar:ResizeStuds(1.5, 0.25, 128)
			Healthbar:SetType(Panel3D.Type.Fixed, { CFrame = CFrame.new(0, 0, -5) })
			Healthbar:SetVisible(true)
			
			function Healthbar.PreUpdate(p1, _, _, _, _)
				-- upvalues: Panel3D (copy), Healthbar (copy)
				local Backpack = Panel3D.Get("Backpack") or Panel3D.Get("Topbar3D")
				local Topbar3D = Panel3D.Get("Topbar3D")
				
				if Backpack and Topbar3D then
					p1.localCF = (Backpack.localCF or CFrame.new()) * CFrame.new(math.max(Topbar3D.width, Backpack.width) / 2 - Healthbar.width / 2 - 0.11, 0.25, 0.1)
				end
			end
			
			function Healthbar:CalculateTransparency(): number
				-- upvalues: Panel3D (copy), HealthbarBack (upval), HealthbarFill (upval), PlayerName (upval)
				local Backpack = Panel3D.Get("Backpack")
				local Topbar3D = Panel3D.Get("Topbar3D")
				local Smallest = math.min(Backpack and Backpack:IsVisible() and Backpack:CalculateTransparency() or 1, Topbar3D and Topbar3D:IsVisible() and Topbar3D:CalculateTransparency() or 1)
				HealthbarBack.ImageTransparency = Smallest
				HealthbarFill.ImageTransparency = Smallest
				PlayerName.TextTransparency = Smallest
				
				return Smallest
			end
			
			local Flag = false
			
			local function _()
				-- upvalues: VRHub (copy), Flag (ref)
				for _, openedModule in pairs(VRHub:GetOpenedModules()) do
					if openedModule.VRIsExclusive then
						Flag = true
						
						return
					end
				end
				Flag = false
			end
			
			local _ = function(): boolean
				-- upvalues: StarterGui (upval), Flag (ref)
				return StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Health) and not Flag
			end
			
			CoreGuiChangedSignalConnection = StarterGui.CoreGuiChangedSignal:connect(function()
				-- upvalues: Healthbar (copy), StarterGui (upval), Flag (ref)
				Healthbar:SetVisible(StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Health) and not Flag)
			end)
			EventConnection = VRHub.ModuleOpened.Event:connect(function(_)
				-- upvalues: VRHub (copy), Flag (ref), Healthbar (copy), StarterGui (upval)
				Flag = false
				
				for _, openedModule in pairs(VRHub:GetOpenedModules()) do
					if openedModule.VRIsExclusive then
						Flag = true
						break
					end
				end
				Healthbar:SetVisible(StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Health) and not Flag)
			end)
			EventConnection1 = VRHub.ModuleClosed.Event:connect(function(_)
				-- upvalues: VRHub (copy), Flag (ref), Healthbar (copy), StarterGui (upval)
				Flag = false
				
				for _, openedModule in pairs(VRHub:GetOpenedModules()) do
					if openedModule.VRIsExclusive then
						Flag = true
						break
					end
				end
				Healthbar:SetVisible(StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Health) and not Flag)
			end)
			Flag = false
			
			for _, openedModule in pairs(VRHub:GetOpenedModules()) do
				if openedModule.VRIsExclusive then
					Flag = true
					break
				end
			end
			Healthbar:SetVisible(StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Health) and not Flag)
			HealthbarContainer.Parent = Healthbar:GetGUI()
			VRHub:RegisterModule(Healthbar3DModule)
			
			return
		else
			if CoreGuiChangedSignalConnection then
				CoreGuiChangedSignalConnection:disconnect()
				CoreGuiChangedSignalConnection = nil
			end
			if EventConnection then
				EventConnection:disconnect()
				EventConnection = nil
			end
			if EventConnection1 then
				EventConnection1:disconnect()
				EventConnection1 = nil
			end
			HealthbarContainer.Parent = nil
		end
	end
end

UserInputService.Changed:connect(OnVREnabled)

if UserInputService.VREnabled then
	OnVREnabled("VREnabled")
end
return Healthbar3DModule