local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")

if not RobloxGui:FindFirstChild("Sounds") then
	local Sounds = Instance.new("Folder")
	Sounds.Name = "Sounds"
	Sounds.Parent = RobloxGui
end