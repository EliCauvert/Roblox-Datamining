local Players = game:GetService("Players")
local SetDialogInUse = Instance.new("RemoteEvent")
SetDialogInUse.Name = "SetDialogInUse"
SetDialogInUse.Parent = game:GetService("RobloxReplicatedStorage")
local t = {}

local function setDialogInUse(Player: Player, Dialog, IsUsing)
	-- upvalues: t (copy)
	if typeof(Dialog) ~= "Instance" or not Dialog:IsA("Dialog") then return end
	if type(IsUsing) ~= "boolean" then return end
	if typeof(Player) ~= "Instance" or not Player:IsA("Player") then return end
	if Dialog then
		Dialog:SetPlayerIsUsing(Player, IsUsing)
		t[Player] = IsUsing and Dialog or nil
	end
end

Players.PlayerRemoving:Connect(function(Player)
	-- upvalues: t (copy)
	local Entry = t[Player]
	
	if Entry then
		Entry:SetPlayerIsUsing(Player, false)
		t[Player] = nil
	end
end)
SetDialogInUse.OnServerEvent:Connect(setDialogInUse)