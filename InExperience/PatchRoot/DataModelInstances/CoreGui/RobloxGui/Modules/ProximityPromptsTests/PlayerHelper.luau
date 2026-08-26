local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local guiService = game:GetService("GuiService")
local t = {
	initStarted = false,
	TestModel = nil,
	hrp = nil,
	humanoid = nil,
	player = nil
}

function t.Init()
	-- upvalues: t (ref), playersService (ref), runService (ref)
	if t.initStarted then return end
	t.initStarted = true
	local var1 = t.WaitForExpression(function()
		-- upvalues: playersService (copy)
		return playersService.LocalPlayer
	end, 10, "Players.LocalPlayer not found")
	t.player = var1
	
	if var1.Character == nil and runService:IsServer() then
		var1:LoadCharacterAsync()
	end
	t.WaitForExpression(function()
		-- upvalues: var1 (ref)
		return var1.Character
	end, 10, "LocalPlayer.Character not found")
	t.hrp = var1.Character:WaitForChild("HumanoidRootPart")
	t.humanoid = var1.Character:WaitForChild("Humanoid")
	
	if t.TestModel == nil then
		t.TestModel = Instance.new("Model")
		t.TestModel.Name = "_TestContainer"
		t.TestModel.Parent = workspace
	end
	t.PlayerGui = playersService.LocalPlayer:WaitForChild("PlayerGui")
end

function t.AddInstance(p1)
	-- upvalues: t (ref)
	local var1 = Instance.new(p1)
	var1.Parent = t.TestModel
	
	return var1
end

function t.CleanUpAfterTest()
	-- upvalues: t (ref)
	t.TestModel:ClearAllChildren()
end

function t.SetCameraFOV(value)
	workspace.CurrentCamera.FieldOfView = value
end

function t.IsPartOnscreen(p1)
	local _, position = workspace.CurrentCamera:WorldToViewportPoint(p1.Position)
	
	return position
end

function t.GetPartViewportPixelPosition(p1)
	local position, _ = workspace.CurrentCamera:WorldToViewportPoint(p1.Position)
	
	return Vector2.new(position.x, position.y)
end

function t.MovePlayerToPosition(p1)
	-- upvalues: t (ref)
	if t.hrp ~= nil then
		t.hrp.CFrame = CFrame.new() + p1 + Vector3.new(0, 1 + t.humanoid.HipHeight, 0)
	end
end

function t.SetPlayerCamera(value, p1)
	-- upvalues: t (ref)
	local var1 = CFrame.new(Vector3.new(), value) + t.player.Character:WaitForChild("Head", 10).Position - p1 * value.Unit
	local currentCamera = workspace.CurrentCamera
	currentCamera.CameraType = Enum.CameraType.Scriptable
	currentCamera.CFrame = var1
end

function t.WaitNFrames(p1)
	-- upvalues: runService (ref)
	for _ = 1, p1 do
		runService.RenderStepped:Wait()
	end
end

function t.WaitWallTime(p2)
	-- upvalues: t (ref)
	local currentTime = tick()
	
	if p2 > 2 then
		warn("Requested wait time too long, waiting 2s")
		p2 = 2
	end
	while true do
		if p2 >= tick() - currentTime then
			t.WaitNFrames(1)
			continue
		end
	end
end

function t.WaitGameTime(p3)
	-- upvalues: runService (ref)
	local var1, var2 = runService.Stepped:Wait()
	local var3 = var1
	while var3 - var1 < p3 do
		local var4, var5 = runService.Stepped:Wait()
		var3 = var4
		var2 = var5
	end
end

function t.WaitForExpression(p4, p5, p6)
	-- upvalues: t (ref)
	local currentTime = tick()
	local var6 = p4()
	while not var6 and tick() - currentTime < p5 do
		t.WaitNFrames(1)
		var6 = p4()
	end
	if not var6 then
		error(p6)
	end
	return var6
end

function t.GetCornersOfBillboardGui(p7)
	-- upvalues: t (ref), guiService (ref)
	local var7 = t.GetPartViewportPixelPosition(p7.Adornee) - guiService:GetGuiInset() + Vector2.new(p7.SizeOffset.x * p7.AbsoluteSize.x, p7.SizeOffset.y * p7.AbsoluteSize.y)
	local absoluteSize = p7.AbsoluteSize
	
	return {
		center = var7,
		topLeft = var7 - absoluteSize / 2 + Vector2.new(1, 1),
		topRight = var7 + Vector2.new(absoluteSize.x / 2 - 1, -absoluteSize.y / 2 + 1),
		bottomRight = var7 + Vector2.new(absoluteSize.x / 2 - 1, absoluteSize.y / 2 - 1),
		bottomLeft = var7 + Vector2.new(-absoluteSize.x / 2 + 1, absoluteSize.y / 2 - 1)
	}
end

return t