local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")

if not RobloxGui:FindFirstChild("SendNotificationInfo") then
	local SendNotificationInfo = Instance.new("BindableEvent")
	SendNotificationInfo.Name = "SendNotificationInfo"
	SendNotificationInfo.Parent = RobloxGui
end
if not RobloxGui:FindFirstChild("Sounds") then
	local Sounds = Instance.new("Folder")
	Sounds.Name = "Sounds"
	Sounds.Parent = RobloxGui
end
if not RobloxReplicatedStorage:FindFirstChild("NewPlayerGroupDetails") then
	local NewPlayerGroupDetails = Instance.new("RemoteEvent")
	NewPlayerGroupDetails.Name = "NewPlayerGroupDetails"
	NewPlayerGroupDetails.Parent = RobloxReplicatedStorage
end
if not RobloxReplicatedStorage:FindFirstChild("UpdatePlayerBlockList") then
	local UpdatePlayerBlockList = Instance.new("RemoteEvent")
	UpdatePlayerBlockList.Name = "UpdatePlayerBlockList"
	UpdatePlayerBlockList.Parent = RobloxReplicatedStorage
end
if not RobloxReplicatedStorage:FindFirstChild("NewPlayerCanManageDetails") then
	local NewPlayerCanManageDetails = Instance.new("RemoteEvent")
	NewPlayerCanManageDetails.Name = "NewPlayerCanManageDetails"
	NewPlayerCanManageDetails.Parent = RobloxReplicatedStorage
end