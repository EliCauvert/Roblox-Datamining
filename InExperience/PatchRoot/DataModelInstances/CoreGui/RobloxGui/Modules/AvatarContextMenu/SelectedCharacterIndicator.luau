local t = {}
t.__index = t
local runService = game:GetService("RunService")
local workspaceService = game:GetService("Workspace")
local tweenService = game:GetService("TweenService")
local _ = game:GetService("InsertService")
local currentCamera = workspaceService.CurrentCamera

local function removeScripts(p0)
	for i, v in ipairs(p0:GetDescendants()) do
		if v:IsA("LuaSourceContainer") then
			v:Destroy()
		end
	end
end

local function ApplyArrow(p1, p2)
	-- upvalues: currentCamera (ref), removeScripts (ref), tweenService (ref), runService (ref)
	local contextMenuArrow = Instance.new("Model")
	contextMenuArrow.Name = "ContextMenuArrow"
	contextMenuArrow.Parent = currentCamera
	local humanoid = p1:FindFirstChildOfClass("Humanoid")
	
	if humanoid == nil then
		humanoid = p1:WaitForChild("Humanoid", 15)
		
		if humanoid == nil then
			return
		end
	end
	local humanoidRootPart = p1:WaitForChild("HumanoidRootPart")
	local var9 = p2.SelectedCharacterIndicator:Clone()
	removeScripts(var9)
	var9.Anchored = true
	var9.Transparency = 0
	var9.CanCollide = false
	var9.Parent = contextMenuArrow
	local var10 = tweenService:Create(var9, TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, false), { Orientation = Vector3.new(0, 360, 180) })
	var10:Play()
	
	local function update()
		-- upvalues: var9 (ref), humanoidRootPart (ref)
		var9.Position = humanoidRootPart.Position + Vector3.new(0, 5, 0)
	end
	
	local var12 = false
	
	local function kill()
		-- upvalues: var12 (write), contextMenuArrow (ref), var10 (ref), runService (copy)
		if var12 then
			return
		end
		var12 = true
		contextMenuArrow:Destroy()
		var10:Destroy()
		runService:UnbindFromRenderStep("ContextActionMenuRenderArrow")
	end
	
	humanoid.Died:Connect(kill)
	p1.AncestryChanged:Connect(kill)
	runService:BindToRenderStep("ContextActionMenuRenderArrow", Enum.RenderPriority.Camera.Value + 1, update)
	contextMenuArrow.Parent = currentCamera
	
	return kill
end

function t.ChangeSelectedPlayer(p3, p4, p5)
	-- upvalues: ApplyArrow (ref)
	coroutine.wrap(function()
		-- upvalues: p3 (ref), p4 (ref), ApplyArrow (copy), p5 (ref)
		if p3.SelectedPlayer then
			p3.SelectedPlayer = nil
			p3.CharacterAddedConn:Disconnect()
			p3.CharacterAddedConn = nil
			
			if p3.KillOldRenderFunction then
				p3.KillOldRenderFunction()
				p3.KillOldRenderFunction = nil
			end
		end
		if p4 then
			p3.SelectedPlayer = p4
			p3.CharacterAddedConn = p4.CharacterAdded:Connect(function(p6)
				-- upvalues: p3 (copy), ApplyArrow (copy), p5 (copy)
				if p3.KillOldRenderFunction then
					p3.KillOldRenderFunction()
				end
				p3.KillOldRenderFunction = ApplyArrow(p6, p5)
			end)
			
			if p4.Character then
				p3.KillOldRenderFunction = ApplyArrow(p4.Character, p5)
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