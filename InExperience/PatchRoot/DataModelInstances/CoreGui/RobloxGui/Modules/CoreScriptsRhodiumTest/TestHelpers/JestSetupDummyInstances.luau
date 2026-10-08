local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")

if not robloxGui:FindFirstChild("SendNotificationInfo") then
	local sendNotificationInfo = Instance.new("BindableEvent")
	sendNotificationInfo.Name = "SendNotificationInfo"
	sendNotificationInfo.Parent = robloxGui
end
if not robloxGui:FindFirstChild("Sounds") then
	local sounds = Instance.new("Folder")
	sounds.Name = "Sounds"
	sounds.Parent = robloxGui
end
if not robloxReplicatedStorageService:FindFirstChild("NewPlayerGroupDetails") then
	local newPlayerGroupDetails = Instance.new("RemoteEvent")
	newPlayerGroupDetails.Name = "NewPlayerGroupDetails"
	newPlayerGroupDetails.Parent = robloxReplicatedStorageService
end
if not robloxReplicatedStorageService:FindFirstChild("UpdatePlayerBlockList") then
	local updatePlayerBlockList = Instance.new("RemoteEvent")
	updatePlayerBlockList.Name = "UpdatePlayerBlockList"
	updatePlayerBlockList.Parent = robloxReplicatedStorageService
end
if not robloxReplicatedStorageService:FindFirstChild("NewPlayerCanManageDetails") then
	local newPlayerCanManageDetails = Instance.new("RemoteEvent")
	newPlayerCanManageDetails.Name = "NewPlayerCanManageDetails"
	newPlayerCanManageDetails.Parent = robloxReplicatedStorageService
end