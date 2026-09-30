local replicatedStorageService = game:GetService("ReplicatedStorage")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")

if not game:GetService("RunService"):IsStudio() then return end
local var1
local function _(p1)
	-- upvalues: robloxReplicatedStorageService (ref)
	local var2 = robloxReplicatedStorageService:FindFirstChild(p1)
	
	if var2 and var2:IsA("RemoteEvent") then
		return var2
	end
	local remoteEvent = Instance.new("RemoteEvent")
	remoteEvent.Name = p1
	remoteEvent.Parent = robloxReplicatedStorageService
	
	return remoteEvent
end

local _ = function(p1)
	-- upvalues: replicatedStorageService (ref)
	local var2 = replicatedStorageService:WaitForChild(p1, 5)
	
	return if var2 == nil or not var2:IsA("BindableEvent") then nil else var2
end

local platformLeaderboardPush = robloxReplicatedStorageService:FindFirstChild("PlatformLeaderboardPush")

if platformLeaderboardPush and platformLeaderboardPush:IsA("RemoteEvent") then
	var1 = platformLeaderboardPush
else
	local platformLeaderboardPush_1 = Instance.new("RemoteEvent")
	platformLeaderboardPush_1.Name = "PlatformLeaderboardPush"
	platformLeaderboardPush_1.Parent = robloxReplicatedStorageService
	var1 = platformLeaderboardPush_1
end
local platformLeaderboardTabOpened = robloxReplicatedStorageService:FindFirstChild("PlatformLeaderboardTabOpened")

if platformLeaderboardTabOpened and platformLeaderboardTabOpened:IsA("RemoteEvent") then
	platformLeaderboardPush = platformLeaderboardTabOpened
else
	local platformLeaderboardTabOpened_1 = Instance.new("RemoteEvent")
	platformLeaderboardTabOpened_1.Name = "PlatformLeaderboardTabOpened"
	platformLeaderboardTabOpened_1.Parent = robloxReplicatedStorageService
	platformLeaderboardPush = platformLeaderboardTabOpened_1
end
platformLeaderboardTabOpened = robloxReplicatedStorageService:FindFirstChild("PlatformLeaderboardTabClosed")

if not platformLeaderboardTabOpened or not platformLeaderboardTabOpened:IsA("RemoteEvent") then
	local platformLeaderboardTabClosed = Instance.new("RemoteEvent")
	platformLeaderboardTabClosed.Name = "PlatformLeaderboardTabClosed"
	platformLeaderboardTabClosed.Parent = robloxReplicatedStorageService
end
local platformLeaderboardMockPushToAll = replicatedStorageService:WaitForChild("PlatformLeaderboardMockPushToAll", 5)
platformLeaderboardTabOpened = if platformLeaderboardMockPushToAll == nil or not platformLeaderboardMockPushToAll:IsA("BindableEvent") then nil else platformLeaderboardMockPushToAll

if platformLeaderboardTabOpened == nil then return end
local platformLeaderboardMockPushToPlayer = replicatedStorageService:WaitForChild("PlatformLeaderboardMockPushToPlayer", 5)
platformLeaderboardMockPushToAll = if platformLeaderboardMockPushToPlayer == nil or not platformLeaderboardMockPushToPlayer:IsA("BindableEvent") then nil else platformLeaderboardMockPushToPlayer
local platformLeaderboardMockTabOpened = replicatedStorageService:WaitForChild("PlatformLeaderboardMockTabOpened", 5)
platformLeaderboardMockPushToPlayer = if platformLeaderboardMockTabOpened == nil or not platformLeaderboardMockTabOpened:IsA("BindableEvent") then nil else platformLeaderboardMockTabOpened

if platformLeaderboardMockPushToAll == nil or platformLeaderboardMockPushToPlayer == nil then
	return
end
platformLeaderboardTabOpened.Event:Connect(function(p1)
	-- upvalues: var1 (ref)
	var1:FireAllClients(p1)
end)
platformLeaderboardMockPushToAll.Event:Connect(function(p1, p2)
	-- upvalues: var1 (ref)
	if typeof(p1) == "Instance" and p1:IsA("Player") then
		var1:FireClient(p1, p2)
	end
end)
platformLeaderboardPush.OnServerEvent:Connect(function(p1, p2)
	-- upvalues: platformLeaderboardMockPushToPlayer (ref)
	platformLeaderboardMockPushToPlayer:Fire(p1, p2)
end)