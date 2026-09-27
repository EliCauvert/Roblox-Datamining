local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")

if not robloxGui:FindFirstChild("SendNotificationInfo") then
	local sendNotificationInfo = Instance.new("BindableEvent")
	sendNotificationInfo.Name = "SendNotificationInfo"
	sendNotificationInfo.Parent = robloxGui
end