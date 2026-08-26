local t = {}
t.__index = t
local runService = game:GetService("RunService")
local workspaceService = game:GetService("Workspace")
local tweenService = game:GetService("TweenService")
local _ = game:GetService("InsertService")
local currentCamera = workspaceService.CurrentCamera

local function removeScripts(p1)
	for i, v in ipairs(p1:GetDescendants()) do
		if v:IsA("LuaSourceContainer") then
			v:Destroy()
		end
	end
end

local function ApplyArrow(p2, p3)
	-- upvalues: currentCamera (ref), removeScripts (ref), tweenService (ref), runService (ref)
	local contextMenuArrow = Instance.new("Model")
	contextMenuArrow.Name = "ContextMenuArrow"
	contextMenuArrow.Parent = currentCamera
	local humanoid = p2:FindFirstChildOfClass("Humanoid")
	
	if humanoid == nil then
		humanoid = p2:WaitForChild("Humanoid", 15)
		
		if humanoid == nil then
			return
		end
	end
	local humanoidRootPart = p2:WaitForChild("HumanoidRootPart")
	local var1 = p3.SelectedCharacterIndicator:Clone()
	removeScripts(var1)
	var1.Anchored = true
	var1.Transparency = 0
	var1.CanCollide = false
	var1.Parent = contextMenuArrow
	local var2 = tweenService:Create(var1, TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, false), { Orientation = Vector3.new(0, 360, 180) })
	var2:Play()
	
	local function update()
		-- upvalues: var1 (ref), humanoidRootPart (ref)
		var1.Position = humanoidRootPart.Position + Vector3.new(0, 5, 0)
	end
	
	local var3 = false
	
	local function kill()
		-- upvalues: var3 (write), contextMenuArrow (ref), var2 (ref), runService (copy)
		if var3 then
			return
		end
		var3 = true
		contextMenuArrow:Destroy()
		var2:Destroy()
		runService:UnbindFromRenderStep("ContextActionMenuRenderArrow")
	end
	
	humanoid.Died:Connect(kill)
	p2.AncestryChanged:Connect(kill)
	runService:BindToRenderStep("ContextActionMenuRenderArrow", Enum.RenderPriority.Camera.Value + 1, update)
	contextMenuArrow.Parent = currentCamera
	
	return kill
end

function t.ChangeSelectedPlayer(p2, p3, p4)
	-- upvalues: ApplyArrow (ref)
	coroutine.wrap(function()
		-- upvalues: p2 (ref), p3 (ref), ApplyArrow (copy), p4 (ref)
		if p2.SelectedPlayer then
			p2.SelectedPlayer = nil
			p2.CharacterAddedConn:Disconnect()
			p2.CharacterAddedConn = nil
			
			if p2.KillOldRenderFunction then
				p2.KillOldRenderFunction()
				p2.KillOldRenderFunction = nil
			end
		end
		if p3 then
			p2.SelectedPlayer = p3
			p2.CharacterAddedConn = p3.CharacterAdded:Connect(function(p5)
				-- upvalues: p2 (copy), ApplyArrow (copy), p4 (copy)
				if p2.KillOldRenderFunction then
					p2.KillOldRenderFunction()
				end
				p2.KillOldRenderFunction = ApplyArrow(p5, p4)
			end)
			
			if p3.Character then
				p2.KillOldRenderFunction = ApplyArrow(p3.Character, p4)
			end
		end
	end)()
end

function t.new()
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl.KillOldRenderFunction = nil
	tbl.SelectedPlayer = nil
	tbl.CharacterAddedConn = nil
	
	return tbl
end

return t.new()