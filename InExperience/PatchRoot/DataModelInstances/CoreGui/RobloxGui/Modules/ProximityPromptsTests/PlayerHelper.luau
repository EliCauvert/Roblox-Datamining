local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local PlayerHelper = {
	initStarted = false,
	TestModel = nil,
	hrp = nil,
	humanoid = nil,
	player = nil
}

function PlayerHelper.Init() --[[ Line: 15 ]]
	-- upvalues: PlayerHelper (copy), Players (copy), RunService (copy)
	if PlayerHelper.initStarted then return end
	PlayerHelper.initStarted = true
	local PlayersLocalPlayerNotFound = PlayerHelper.WaitForExpression(function() --[[ Line: 23 ]]
		-- upvalues: Players (upval)
		return Players.LocalPlayer
	end, 10, "Players.LocalPlayer not found")
	PlayerHelper.player = PlayersLocalPlayerNotFound
	
	if PlayersLocalPlayerNotFound.Character == nil and RunService:IsServer() then
		PlayersLocalPlayerNotFound:LoadCharacterAsync()
	end
	PlayerHelper.WaitForExpression(function() --[[ Line: 33 ]]
		-- upvalues: PlayersLocalPlayerNotFound (copy)
		return PlayersLocalPlayerNotFound.Character
	end, 10, "LocalPlayer.Character not found")
	PlayerHelper.hrp = PlayersLocalPlayerNotFound.Character:WaitForChild("HumanoidRootPart")
	PlayerHelper.humanoid = PlayersLocalPlayerNotFound.Character:WaitForChild("Humanoid")
	
	if PlayerHelper.TestModel == nil then
		PlayerHelper.TestModel = Instance.new("Model")
		PlayerHelper.TestModel.Name = "_TestContainer"
		PlayerHelper.TestModel.Parent = workspace
	end
	PlayerHelper.PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
end

function PlayerHelper.AddInstance(p1) --[[ Line: 50 ]]
	-- upvalues: PlayerHelper (copy)
	local NewInstance = Instance.new(p1)
	NewInstance.Parent = PlayerHelper.TestModel
	
	return NewInstance
end

function PlayerHelper.CleanUpAfterTest() --[[ Line: 57 ]]
	-- upvalues: PlayerHelper (copy)
	PlayerHelper.TestModel:ClearAllChildren()
end

function PlayerHelper.SetCameraFOV(FieldOfView) --[[ Line: 61 ]]
	workspace.CurrentCamera.FieldOfView = FieldOfView
end

function PlayerHelper.IsPartOnscreen(p1) --[[ Line: 65 ]]
	local _, OnScreen = workspace.CurrentCamera:WorldToViewportPoint(p1.Position)
	
	return OnScreen
end

function PlayerHelper.GetPartViewportPixelPosition(Adornee): Vector2 --[[ Line: 71 ]]
	local ViewportPosition, _ = workspace.CurrentCamera:WorldToViewportPoint(Adornee.Position)
	
	return Vector2.new(ViewportPosition.x, ViewportPosition.y)
end

function PlayerHelper.MovePlayerToPosition(p1) --[[ Line: 78 ]]
	-- upvalues: PlayerHelper (copy)
	if PlayerHelper.hrp ~= nil then
		PlayerHelper.hrp.CFrame = CFrame.new() + p1 + Vector3.new(0, 1 + PlayerHelper.humanoid.HipHeight, 0)
	end
end

function PlayerHelper.SetPlayerCamera(Y, p1) --[[ Line: 87 ]]
	-- upvalues: PlayerHelper (copy)
	local PositionDelta = CFrame.new(Vector3.new(), Y) + PlayerHelper.player.Character:WaitForChild("Head", 10).Position - p1 * Y.Unit
	local CurrentCamera = workspace.CurrentCamera
	CurrentCamera.CameraType = Enum.CameraType.Scriptable
	CurrentCamera.CFrame = PositionDelta
end

function PlayerHelper.WaitNFrames(p1) --[[ Line: 98 ]]
	-- upvalues: RunService (copy)
	for _ = 1, p1 do
		RunService.RenderStepped:Wait()
	end
end

function PlayerHelper.WaitWallTime(p2: number) --[[ Line: 107 ]]
	-- upvalues: PlayerHelper (copy)
	local CurrentTime = tick()
	
	if p2 > 2 then
		warn("Requested wait time too long, waiting 2s")
		p2 = 2
	end
	while true do
		if p2 < tick() - CurrentTime then return end
		PlayerHelper.WaitNFrames(1)
	end
end

function PlayerHelper.WaitGameTime(p3) --[[ Line: 125 ]]
	-- upvalues: RunService (copy)
	local Time, _ = RunService.Stepped:Wait()
	local Time1 = Time
	while Time1 - Time < p3 do
		local _
		Time1, _ = RunService.Stepped:Wait()
	end
end

function PlayerHelper.WaitForExpression(Callback, p4, p5) --[[ Line: 134 ]]
	-- upvalues: PlayerHelper (copy)
	local CurrentTime = tick()
	local CallbackResult = Callback()
	while not CallbackResult and tick() - CurrentTime < p4 do
		PlayerHelper.WaitNFrames(1)
		CallbackResult = Callback()
	end
	if not CallbackResult then
		error(p5)
	end
	return CallbackResult
end

function PlayerHelper.GetCornersOfBillboardGui(Frame: Frame) --[[ Line: 152 ]]
	-- upvalues: PlayerHelper (copy), GuiService (copy)
	local NewPartViewportPixelPosition = PlayerHelper.GetPartViewportPixelPosition(Frame.Adornee) - GuiService:GetGuiInset() + Vector2.new(Frame.SizeOffset.x * Frame.AbsoluteSize.x, Frame.SizeOffset.y * Frame.AbsoluteSize.y)
	local AbsoluteSize: number = Frame.AbsoluteSize
	
	return {
		center = NewPartViewportPixelPosition,
		topLeft = NewPartViewportPixelPosition - AbsoluteSize / 2 + Vector2.new(1, 1),
		topRight = NewPartViewportPixelPosition + Vector2.new(AbsoluteSize.x / 2 - 1, -AbsoluteSize.y / 2 + 1),
		bottomRight = NewPartViewportPixelPosition + Vector2.new(AbsoluteSize.x / 2 - 1, AbsoluteSize.y / 2 - 1),
		bottomLeft = NewPartViewportPixelPosition + Vector2.new(-AbsoluteSize.x / 2 + 1, AbsoluteSize.y / 2 - 1)
	}
end

return PlayerHelper