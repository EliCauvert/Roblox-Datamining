local playersService = game:GetService("Players")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local setDialogInUse = Instance.new("RemoteEvent")
setDialogInUse.Name = "SetDialogInUse"
setDialogInUse.Parent = robloxReplicatedStorageService
local t = {}

local function setDialogInUse_1(value, p0, p1) --[[ line: 10 | named "setDialogInUse" ]]
	-- upvalues: t (ref)
	if typeof(p0) ~= "Instance" or not p0:IsA("Dialog") then return end
	if type(p1) ~= "boolean" then return end
	if typeof(value) ~= "Instance" or not value:IsA("Player") then return end
	if p0 then
		p0:SetPlayerIsUsing(value, p1)
		t[value] = if p1 then p0 else nil
	end
end

playersService.PlayerRemoving:Connect(function(p2) --[[ line: 29 ]]
	-- upvalues: t (ref)
	local var5 = t[p2]
	
	if var5 then
		var5:SetPlayerIsUsing(p2, false)
		t[p2] = nil
	end
end)
setDialogInUse.OnServerEvent:Connect(setDialogInUse_1)