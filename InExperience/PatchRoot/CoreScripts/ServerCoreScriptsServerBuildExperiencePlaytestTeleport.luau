local AssetService = game:GetService("AssetService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local BuildPlaytestReservedServerId = game:DefineFastFlag("BuildPlaytestReservedServerId", false)
local v1 = nil
local t = {}
local BuildExperiencePlaytestTeleport = Instance.new("RemoteEvent")
BuildExperiencePlaytestTeleport.Name = "BuildExperiencePlaytestTeleport"
BuildExperiencePlaytestTeleport.Parent = game:GetService("RobloxReplicatedStorage")
Players.PlayerRemoving:Connect(function(Player) --[[ Line: 21 ]]
	-- upvalues: t (copy)
	t[Player.UserId] = nil
end)

local function getCurrentExperiencePlaceIds() --[[ Line: 25 ]]
	-- upvalues: v1 (ref), AssetService (copy)
	if v1 ~= nil then
		return v1
	end
	local t = {}
	local GamePlacesAsync = AssetService:GetGamePlacesAsync()
	while true do
		for _, value in GamePlacesAsync:GetCurrentPage() do
			t[value.PlaceId] = true
		end
		if GamePlacesAsync.IsFinished then break end
		GamePlacesAsync:AdvanceToNextPageAsync()
	end
	v1 = t
	
	return t
end

BuildExperiencePlaytestTeleport.OnServerEvent:Connect(function(Player: Player, PlaceId: number) --[[ Line: 48 ]]
	-- upvalues: t (copy), getCurrentExperiencePlaceIds (copy), BuildPlaytestReservedServerId (copy), HttpService (copy), TeleportService (copy)
	local Entry: number = t[Player.UserId]
	
	if Entry ~= nil and Entry > 5 then return end
	if Entry == nil then
		t[Player.UserId] = 1
	else
		t[Player.UserId] = Entry + 1
	end
	if not Player:GetCanManageAsync() then return end
	if typeof(PlaceId) ~= "number" or PlaceId <= 0 then return end
	if game.PlaceId ~= PlaceId and not getCurrentExperiencePlaceIds()[PlaceId] then return end
	local TeleportOptions = Instance.new("TeleportOptions")
	
	if BuildPlaytestReservedServerId then
		TeleportOptions.ReservedServerId = HttpService:GenerateGUID(false)
	else
		TeleportOptions.ShouldReserveServer = true
	end
	TeleportService:TeleportAsync(PlaceId, { Player }, TeleportOptions)
end)