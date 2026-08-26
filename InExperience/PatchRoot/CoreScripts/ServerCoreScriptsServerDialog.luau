local playersService = game:GetService("Players")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local setDialogInUse = Instance.new("RemoteEvent")
setDialogInUse.Name = "SetDialogInUse"
setDialogInUse.Parent = robloxReplicatedStorageService
local t = {}

local function setDialogInUse_1(value, p1, p2)
	-- upvalues: t (ref)
	if typeof(p1) ~= "Instance" or not p1:IsA("Dialog") then return end
	if type(p2) ~= "boolean" then return end
	if typeof(value) ~= "Instance" or not value:IsA("Player") then return end
	if p1 then
		p1:SetPlayerIsUsing(value, p2)
		t[value] = if p2 then p1 else nil
	end
end

playersService.PlayerRemoving:Connect(function(p1)
	-- upvalues: t (ref)
	local var1 = t[p1]
	
	if var1 then
		var1:SetPlayerIsUsing(p1, false)
		t[p1] = nil
	end
end)
setDialogInUse.OnServerEvent:Connect(setDialogInUse_1)