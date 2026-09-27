local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")

if not robloxGui:FindFirstChild("Sounds") then
	local sounds = Instance.new("Folder")
	sounds.Name = "Sounds"
	sounds.Parent = robloxGui
end