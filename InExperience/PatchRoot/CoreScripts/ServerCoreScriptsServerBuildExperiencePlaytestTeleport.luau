local assetService = game:GetService("AssetService")
local playersService = game:GetService("Players")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local teleportService = game:GetService("TeleportService")
local var4 = nil
local t = {}
local buildExperiencePlaytestTeleport = Instance.new("RemoteEvent")
buildExperiencePlaytestTeleport.Name = "BuildExperiencePlaytestTeleport"
buildExperiencePlaytestTeleport.Parent = robloxReplicatedStorageService
playersService.PlayerRemoving:Connect(function(p0) --[[ line: 14 ]]
	-- upvalues: t (ref)
	t[p0.UserId] = nil
end)

local function getCurrentExperiencePlaceIds() --[[ line: 18 ]]
	-- upvalues: var4 (write), assetService (ref)
	if var4 ~= nil then
		return var4
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
	var4 = t
	
	return t
end

buildExperiencePlaytestTeleport.OnServerEvent:Connect(function(p1, p2) --[[ line: 41 ]]
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