local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")

if not game:GetService("RunService"):IsStudio() then return end
local function _(ChildName) --[[ Line: 16 | Named "ensureRemote" ]]
	-- upvalues: RobloxReplicatedStorage (copy)
	local ChildName1 = RobloxReplicatedStorage:FindFirstChild(ChildName)
	
	if ChildName1 and ChildName1:IsA("RemoteEvent") then
		return ChildName1
	else
		local RemoteEvent = Instance.new("RemoteEvent")
		RemoteEvent.Name = ChildName
		RemoteEvent.Parent = RobloxReplicatedStorage
		
		return RemoteEvent
	end
end

local _ = function(ChildName) --[[ Line: 27 | Named "waitForBindable" ]]
	-- upvalues: ReplicatedStorage (copy)
	local ChildName1 = ReplicatedStorage:WaitForChild(ChildName, 5)
	
	return if ChildName1 == nil or not ChildName1:IsA("BindableEvent") then nil else ChildName1
end

local PlatformLeaderboardPush = RobloxReplicatedStorage:FindFirstChild("PlatformLeaderboardPush")
local RemoteEvent = nil

if PlatformLeaderboardPush and PlatformLeaderboardPush:IsA("RemoteEvent") then
	RemoteEvent = PlatformLeaderboardPush
else
	local PlatformLeaderboardPush1 = Instance.new("RemoteEvent")
	PlatformLeaderboardPush1.Name = "PlatformLeaderboardPush"
	PlatformLeaderboardPush1.Parent = RobloxReplicatedStorage
	RemoteEvent = PlatformLeaderboardPush1
end
local PlatformLeaderboardTabOpened = RobloxReplicatedStorage:FindFirstChild("PlatformLeaderboardTabOpened")
local RemoteEvent1 = nil

if PlatformLeaderboardTabOpened and PlatformLeaderboardTabOpened:IsA("RemoteEvent") then
	RemoteEvent1 = PlatformLeaderboardTabOpened
else
	local PlatformLeaderboardTabOpened1 = Instance.new("RemoteEvent")
	PlatformLeaderboardTabOpened1.Name = "PlatformLeaderboardTabOpened"
	PlatformLeaderboardTabOpened1.Parent = RobloxReplicatedStorage
	RemoteEvent1 = PlatformLeaderboardTabOpened1
end
local PlatformLeaderboardTabClosed = RobloxReplicatedStorage:FindFirstChild("PlatformLeaderboardTabClosed")

if not PlatformLeaderboardTabClosed or not PlatformLeaderboardTabClosed:IsA("RemoteEvent") then
	local PlatformLeaderboardTabClosed1 = Instance.new("RemoteEvent")
	PlatformLeaderboardTabClosed1.Name = "PlatformLeaderboardTabClosed"
	PlatformLeaderboardTabClosed1.Parent = RobloxReplicatedStorage
end
local PlatformLeaderboardMockPushToAll = ReplicatedStorage:WaitForChild("PlatformLeaderboardMockPushToAll", 5)
local PlatformLeaderboardMockPushToAll1 = if PlatformLeaderboardMockPushToAll == nil or not PlatformLeaderboardMockPushToAll:IsA("BindableEvent") then nil else PlatformLeaderboardMockPushToAll

if PlatformLeaderboardMockPushToAll1 == nil then return end
local PlatformLeaderboardMockPushToPlayer = ReplicatedStorage:WaitForChild("PlatformLeaderboardMockPushToPlayer", 5)
local PlatformLeaderboardMockPushToPlayer1 = if PlatformLeaderboardMockPushToPlayer == nil or not PlatformLeaderboardMockPushToPlayer:IsA("BindableEvent") then nil else PlatformLeaderboardMockPushToPlayer
local PlatformLeaderboardMockTabOpened = ReplicatedStorage:WaitForChild("PlatformLeaderboardMockTabOpened", 5)
local PlatformLeaderboardMockTabOpened1 = if PlatformLeaderboardMockTabOpened == nil or not PlatformLeaderboardMockTabOpened:IsA("BindableEvent") then nil else PlatformLeaderboardMockTabOpened

if PlatformLeaderboardMockPushToPlayer1 ~= nil and PlatformLeaderboardMockTabOpened1 ~= nil then
	PlatformLeaderboardMockPushToAll1.Event:Connect(function(p1) --[[ Line: 52 ]]
		-- upvalues: RemoteEvent (copy)
		RemoteEvent:FireAllClients(p1)
	end)
	PlatformLeaderboardMockPushToPlayer1.Event:Connect(function(Player: Player, p1) --[[ Line: 56 ]]
		-- upvalues: RemoteEvent (copy)
		if typeof(Player) == "Instance" and Player:IsA("Player") then
			RemoteEvent:FireClient(Player, p1)
		end
	end)
	RemoteEvent1.OnServerEvent:Connect(function(Player, p1) --[[ Line: 62 ]]
		-- upvalues: PlatformLeaderboardMockTabOpened1 (copy)
		PlatformLeaderboardMockTabOpened1:Fire(Player, p1)
	end)
	
	return
end