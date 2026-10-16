local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")

if not RobloxGui:FindFirstChild("SendNotificationInfo") then
	local SendNotificationInfo = Instance.new("BindableEvent")
	SendNotificationInfo.Name = "SendNotificationInfo"
	SendNotificationInfo.Parent = RobloxGui
end