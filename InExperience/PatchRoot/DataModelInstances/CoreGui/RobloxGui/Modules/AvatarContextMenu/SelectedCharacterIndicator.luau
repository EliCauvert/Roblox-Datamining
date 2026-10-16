local Module = {}
Module.__index = Module
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local _ = game:GetService("InsertService")
local CurrentCamera = game:GetService("Workspace").CurrentCamera

local function removeScripts(SelectedCharacterIndicator) --[[ Line: 22 ]]
	for _, ScriptObject in ipairs(SelectedCharacterIndicator:GetDescendants()) do
		if ScriptObject:IsA("LuaSourceContainer") then
			ScriptObject:Destroy()
		end
	end
end

local function ApplyArrow(Object, p1) --[[ Line: 30 ]]
	-- upvalues: CurrentCamera (copy), removeScripts (copy), TweenService (copy), RunService (copy)
	local ContextMenuArrow = Instance.new("Model")
	ContextMenuArrow.Name = "ContextMenuArrow"
	ContextMenuArrow.Parent = CurrentCamera
	local Humanoid = Object:FindFirstChildOfClass("Humanoid")
	
	if Humanoid == nil then
		Humanoid = Object:WaitForChild("Humanoid", 15)
		
		if Humanoid == nil then return end
	end
	local HumanoidRootPart = Object:WaitForChild("HumanoidRootPart")
	local SelectedCharacterIndicator = p1.SelectedCharacterIndicator:Clone()
	removeScripts(SelectedCharacterIndicator)
	SelectedCharacterIndicator.Anchored = true
	SelectedCharacterIndicator.Transparency = 0
	SelectedCharacterIndicator.CanCollide = false
	SelectedCharacterIndicator.Parent = ContextMenuArrow
	local Tween = TweenService:Create(SelectedCharacterIndicator, TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, false), { Orientation = vector.create(0, 360, 180) })
	Tween:Play()
	
	local function update() --[[ Line: 59 ]]
		-- upvalues: SelectedCharacterIndicator (copy), HumanoidRootPart (copy)
		SelectedCharacterIndicator.Position = HumanoidRootPart.Position + vector.create(0, 5, 0)
	end
	
	local Flag = false
	
	local function kill() --[[ Line: 64 ]]
		-- upvalues: Flag (ref), ContextMenuArrow (copy), Tween (copy), RunService (upval)
		if not Flag then
			Flag = true
			ContextMenuArrow:Destroy()
			Tween:Destroy()
			RunService:UnbindFromRenderStep("ContextActionMenuRenderArrow")
			
			return
		end
	end
	
	Humanoid.Died:Connect(kill)
	Object.AncestryChanged:Connect(kill)
	RunService:BindToRenderStep("ContextActionMenuRenderArrow", Enum.RenderPriority.Camera.Value + 1, update)
	ContextMenuArrow.Parent = CurrentCamera
	
	return kill
end

function Module.ChangeSelectedPlayer(p1, Player: Player, p2) --[[ Line: 82 ]]
	-- upvalues: ApplyArrow (copy)
	coroutine.wrap(function() --[[ Line: 83 ]]
		-- upvalues: p1 (copy), Player (copy), ApplyArrow (upval), p2 (copy)
		if p1.SelectedPlayer then
			p1.SelectedPlayer = nil
			p1.CharacterAddedConn:Disconnect()
			p1.CharacterAddedConn = nil
			
			if p1.KillOldRenderFunction then
				p1.KillOldRenderFunction()
				p1.KillOldRenderFunction = nil
			end
		end
		if Player then
			p1.SelectedPlayer = Player
			p1.CharacterAddedConn = Player.CharacterAdded:Connect(function(Character) --[[ Line: 96 ]]
				-- upvalues: p1 (upval), ApplyArrow (upval), p2 (upval)
				if p1.KillOldRenderFunction then
					p1.KillOldRenderFunction()
				end
				p1.KillOldRenderFunction = ApplyArrow(Character, p2)
			end)
			
			if Player.Character then
				p1.KillOldRenderFunction = ApplyArrow(Player.Character, p2)
			end
		end
	end)()
end

function Module.new() --[[ Line: 109 ]]
	-- upvalues: Module (copy)
	local self = setmetatable({}, Module)
	self.KillOldRenderFunction = nil
	self.SelectedPlayer = nil
	self.CharacterAddedConn = nil
	
	return self
end

return Module.new()