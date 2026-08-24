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
	local var4 = t.WaitForExpression(function()
		-- upvalues: playersService (copy)
		return playersService.LocalPlayer
	end, 10, "Players.LocalPlayer not found")
	t.player = var4
	
	if var4.Character == nil and runService:IsServer() then
		if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
			var4:LoadCharacterAsync()
		else
			var4:LoadCharacter()
		end
	end
	t.WaitForExpression(function()
		-- upvalues: var4 (ref)
		return var4.Character
	end, 10, "LocalPlayer.Character not found")
	t.hrp = var4.Character:WaitForChild("HumanoidRootPart")
	t.humanoid = var4.Character:WaitForChild("Humanoid")
	
	if t.TestModel == nil then
		t.TestModel = Instance.new("Model")
		t.TestModel.Name = "_TestContainer"
		t.TestModel.Parent = workspace
	end
	t.PlayerGui = playersService.LocalPlayer:WaitForChild("PlayerGui")
end

function t.AddInstance(p0)
	-- upvalues: t (ref)
	local var5 = Instance.new(p0)
	var5.Parent = t.TestModel
	
	return var5
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

function t.GetPartViewportPixelPosition(p2)
	local position, _ = workspace.CurrentCamera:WorldToViewportPoint(p2.Position)
	
	return Vector2.new(position.x, position.y)
end

function t.MovePlayerToPosition(p3)
	-- upvalues: t (ref)
	if t.hrp ~= nil then
		t.hrp.CFrame = CFrame.new() + p3 + Vector3.new(0, 1 + t.humanoid.HipHeight, 0)
	end
end

function t.SetPlayerCamera(value, p4)
	-- upvalues: t (ref)
	local var8 = CFrame.new(Vector3.new(), value) + t.player.Character:WaitForChild("Head", 10).Position - p4 * value.Unit
	local currentCamera = workspace.CurrentCamera
	currentCamera.CameraType = Enum.CameraType.Scriptable
	currentCamera.CFrame = var8
end

function t.WaitNFrames(p5)
	-- upvalues: runService (ref)
	for _ = 1, p5 do
		runService.RenderStepped:Wait()
	end
end

function t.WaitWallTime(p6)
	-- upvalues: t (ref)
	local currentTime = tick()
	
	if p6 > 2 then
		warn("Requested wait time too long, waiting 2s")
		p6 = 2
	end
	while true do
		if p6 >= tick() - currentTime then
			t.WaitNFrames(1)
			continue
		end
	end
end

function t.WaitGameTime(p7)
	-- upvalues: runService (ref)
	local var10, var11 = runService.Stepped:Wait()
	local var12 = var10
	while var12 - var10 < p7 do
		local var13, var14 = runService.Stepped:Wait()
		var12 = var13
		var11 = var14
	end
end

function t.WaitForExpression(p8, p9, p10)
	-- upvalues: t (ref)
	local currentTime = tick()
	local var16 = p8()
	while not var16 and tick() - currentTime < p9 do
		t.WaitNFrames(1)
		var16 = p8()
	end
	if not var16 then
		error(p10)
	end
	return var16
end

function t.GetCornersOfBillboardGui(p11)
	-- upvalues: t (ref), guiService (ref)
	local var17 = t.GetPartViewportPixelPosition(p11.Adornee) - guiService:GetGuiInset() + Vector2.new(p11.SizeOffset.x * p11.AbsoluteSize.x, p11.SizeOffset.y * p11.AbsoluteSize.y)
	local absoluteSize = p11.AbsoluteSize
	
	return {
		center = var17,
		topLeft = var17 - absoluteSize / 2 + Vector2.new(1, 1),
		topRight = var17 + Vector2.new(absoluteSize.x / 2 - 1, -absoluteSize.y / 2 + 1),
		bottomRight = var17 + Vector2.new(absoluteSize.x / 2 - 1, absoluteSize.y / 2 - 1),
		bottomLeft = var17 + Vector2.new(-absoluteSize.x / 2 + 1, absoluteSize.y / 2 - 1)
	}
end

return t