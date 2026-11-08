local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local Url = require(game:GetService("CorePackages").Workspace.Packages.CoreScriptsCommon).Url
local t = {}
local RootPlaceId = nil
local TeleportToPurchasedVIPServer = Instance.new("RemoteEvent")
TeleportToPurchasedVIPServer.Name = "TeleportToPurchasedVIPServer"
TeleportToPurchasedVIPServer.Parent = game:GetService("RobloxReplicatedStorage")

local function getRootPlaceId()
	-- upvalues: RootPlaceId (ref), HttpRbxApiService (copy), Url (copy), HttpService (copy)
	if RootPlaceId == nil then
		local Data = HttpService:JSONDecode((HttpRbxApiService:GetAsyncFullUrl(`{Url.DEVELOP_URL}v1/universes/{game.GameId}`, Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Default)))
		
		if typeof(Data) ~= "table" or typeof(Data.rootPlaceId) ~= "number" then
			error("The universe response has no root place")
		end
		RootPlaceId = Data.rootPlaceId
	end
	return RootPlaceId
end

Players.PlayerRemoving:Connect(function(Player)
	-- upvalues: t (copy)
	t[Player.UserId] = nil
end)
TeleportToPurchasedVIPServer.OnServerEvent:Connect(function(Player: Player, VipServerId)
	-- upvalues: t (copy), TeleportToPurchasedVIPServer (copy), TeleportService (copy), getRootPlaceId (copy)
	local v1 = (t[Player.UserId] or 0) + 1
	t[Player.UserId] = v1
	
	if v1 > 3 or typeof(VipServerId) ~= "string" or #VipServerId == 0 or #VipServerId > 64 then
		TeleportToPurchasedVIPServer:FireClient(Player)
		
		return
	end
	if not pcall(function()
		-- upvalues: VipServerId (copy), TeleportService (upval), getRootPlaceId (upval), Player (copy)
		local TeleportOptions = Instance.new("TeleportOptions")
		TeleportOptions.VipServerId = VipServerId
		TeleportService:TeleportAsync(getRootPlaceId(), { Player }, TeleportOptions)
	end) then
		TeleportToPurchasedVIPServer:FireClient(Player)
	end
end)