local assetService = game:GetService("AssetService")
local playersService = game:GetService("Players")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local teleportService = game:GetService("TeleportService")
local var1 = nil
local t = {}
local buildExperiencePlaytestTeleport = Instance.new("RemoteEvent")
buildExperiencePlaytestTeleport.Name = "BuildExperiencePlaytestTeleport"
buildExperiencePlaytestTeleport.Parent = robloxReplicatedStorageService
playersService.PlayerRemoving:Connect(function(p1)
	-- upvalues: t (ref)
	t[p1.UserId] = nil
end)

local function getCurrentExperiencePlaceIds()
	-- upvalues: var1 (write), assetService (ref)
	if var1 ~= nil then
		return var1
	end
	local t = {}
	local gamePlacesAsync = assetService:GetGamePlacesAsync()
	while true do
		for i, v in gamePlacesAsync:GetCurrentPage() do
			t[v.PlaceId] = true
		end
		if gamePlacesAsync.IsFinished then break end
		gamePlacesAsync:AdvanceToNextPageAsync()
	end
	var1 = t
	
	return t
end

buildExperiencePlaytestTeleport.OnServerEvent:Connect(function(p1, p2)
	-- upvalues: t (ref), getCurrentExperiencePlaceIds (ref), teleportService (ref)
	local userId = t[p1.UserId]
	
	if userId ~= nil and userId > 5 then return end
	if userId == nil then
		t[p1.UserId] = 1
	else
		t[p1.UserId] = userId + 1
	end
	if not p1:GetCanManageAsync() then return end
	if typeof(p2) ~= "number" or p2 <= 0 then return end
	if game.PlaceId == p2 or getCurrentExperiencePlaceIds()[p2] then
		local teleportOptions = Instance.new("TeleportOptions")
		teleportOptions.ShouldReserveServer = true
		teleportService:TeleportAsync(p2, { p1 }, teleportOptions)
		
		return
	end
end)