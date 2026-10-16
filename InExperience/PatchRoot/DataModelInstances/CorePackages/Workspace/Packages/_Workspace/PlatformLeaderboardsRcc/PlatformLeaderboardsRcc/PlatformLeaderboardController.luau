local Players = game:GetService("Players")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local Parent = script.Parent
local PlatformLeaderboardTypesModule = require(Parent.PlatformLeaderboardTypes)
local PlatformLeaderboardCacheModule = require(Parent.PlatformLeaderboardCache)
local _ = require(Parent.PlatformLeaderboardConfigService)
local EventType = PlatformLeaderboardTypesModule.EventType
local LeaderboardType = PlatformLeaderboardTypesModule.LeaderboardType
local RemoteEventName = PlatformLeaderboardTypesModule.RemoteEventName
local PlatformLeaderboardTabEventRateLimit = game:DefineFastInt("PlatformLeaderboardTabEventRateLimit", 20)
local PlatformLeaderboardTabEventRateWindowSeconds = game:DefineFastInt("PlatformLeaderboardTabEventRateWindowSeconds", 10)
local FFlagPlatformLeaderboardDebugLogging = require(Parent.Parent.SharedFlags).FFlagPlatformLeaderboardDebugLogging
local PlatformLeaderboardController = {}
PlatformLeaderboardController.__index = PlatformLeaderboardController

function PlatformLeaderboardController.new(_configService, _fetcher) --[[ Line: 51 ]]
	-- upvalues: PlatformLeaderboardController (copy)
	return (setmetatable({
		_cache = nil,
		_pushEvent = nil,
		_configService = _configService,
		_fetcher = _fetcher,
		_conns = {},
		_playerTabs = {},
		_rateLimits = {}
	}, PlatformLeaderboardController))
end

function PlatformLeaderboardController:_onConfigChanged(p1, Config) --[[ Line: 66 ]]
	-- upvalues: EventType (copy)
	self:_pushToAll({ type = EventType.ConfigUpdate, config = Config })
	
	if not Config then
		if self._cache then
			self._cache:teardown()
			self._cache = nil
		end
		table.clear(self._playerTabs)
		
		return
	elseif not self._cache then
		self:_initializeCache(Config)
		
		return
	else
		if p1 then
			self._cache:forceRefresh(Config, not (p1.leaderboardId == Config.leaderboardId))
		end
	end
end

function PlatformLeaderboardController:_initializeCache(Fetcher) --[[ Line: 86 ]]
	-- upvalues: PlatformLeaderboardCacheModule (copy), EventType (copy), Players (copy)
	self._cache = PlatformLeaderboardCacheModule.new(self._fetcher, Fetcher)
	local Cache = self._cache
	table.insert(self._conns, Cache:onGlobalUpdated(function(Data, p1) --[[ Line: 92 ]]
		-- upvalues: self (copy), EventType (upval)
		self:_pushToGlobalViewers({ type = EventType.GlobalLeaderboardData, data = Data })
		
		if p1 then
			self._configService:updateConfig(p1)
		end
	end))
	table.insert(self._conns, Cache:onFriendsUpdated(function(UserId, Data, p1) --[[ Line: 102 ]]
		-- upvalues: Players (upval), self (copy), EventType (upval)
		local Player = Players:GetPlayerByUserId(UserId)
		
		if Player then
			self:_pushToPlayer(Player, {
				type = EventType.FriendsLeaderboardData,
				userId = UserId,
				data = Data
			})
		end
		if p1 then
			self._configService:updateConfig(p1)
		end
	end))
	table.insert(self._conns, Cache:onUserScoreUpdated(function(UserId, Entry) --[[ Line: 118 ]]
		-- upvalues: Players (upval), self (copy), EventType (upval)
		local Player = Players:GetPlayerByUserId(UserId)
		
		if Player then
			self:_pushToPlayer(Player, {
				type = EventType.UserScore,
				userId = UserId,
				entry = Entry
			})
		end
	end))
end

function PlatformLeaderboardController:initialize() --[[ Line: 127 ]]
	-- upvalues: RemoteEventName (copy), RobloxReplicatedStorage (copy), EventType (copy), Players (copy)
	self._pushEvent = Instance.new("RemoteEvent")
	self._pushEvent.Name = RemoteEventName.Push
	self._pushEvent.Parent = RobloxReplicatedStorage
	local RemoteEvent = Instance.new("RemoteEvent")
	RemoteEvent.Name = RemoteEventName.TabOpened
	RemoteEvent.Parent = RobloxReplicatedStorage
	local RemoteEvent1 = Instance.new("RemoteEvent")
	RemoteEvent1.Name = RemoteEventName.TabClosed
	RemoteEvent1.Parent = RobloxReplicatedStorage
	self._pushEvent.OnServerEvent:Connect(function() --[[ Line: 143 ]] end)
	local Config = self._configService:getConfig()
	
	if Config then
		self:_initializeCache(Config)
	end
	table.insert(self._conns, self._configService:onConfigChanged(function(p1, p2) --[[ Line: 155 ]]
		-- upvalues: self (copy)
		self:_onConfigChanged(p1, p2)
	end))
	self:_pushToAll({
		type = EventType.ConfigUpdate,
		config = self._configService:getConfig()
	})
	table.insert(self._conns, RemoteEvent.OnServerEvent:Connect(function(Player: Player, p1) --[[ Line: 167 ]]
		-- upvalues: self (copy)
		if self:_isRateLimited(Player.UserId) then return end
		local ValidateTabPayloadResult = self:_validateTabPayload(Player, p1)
		
		if ValidateTabPayloadResult then
			self:_onTabOpened(Player, ValidateTabPayloadResult)
		end
	end))
	table.insert(self._conns, RemoteEvent1.OnServerEvent:Connect(function(Player: Player, p1) --[[ Line: 179 ]]
		-- upvalues: self (copy)
		if self:_isRateLimited(Player.UserId) then return end
		local ValidateTabPayloadResult = self:_validateTabPayload(Player, p1)
		
		if ValidateTabPayloadResult then
			self:_onTabClosed(Player, ValidateTabPayloadResult)
		end
	end))
	table.insert(self._conns, Players.PlayerAdded:Connect(function(Player) --[[ Line: 192 ]]
		-- upvalues: self (copy), EventType (upval)
		task.defer(function() --[[ Line: 193 ]]
			-- upvalues: self (upval), Player (copy), EventType (upval)
			self:_pushToPlayer(Player, {
				type = EventType.ConfigUpdate,
				config = self._configService:getConfig()
			})
		end)
	end))
	table.insert(self._conns, Players.PlayerRemoving:Connect(function(Player) --[[ Line: 204 ]]
		-- upvalues: self (copy)
		self:_removePlayerFromAllTabs(Player.UserId)
	end))
end

function PlatformLeaderboardController:_isRateLimited(UserId): boolean --[[ Line: 215 ]]
	-- upvalues: PlatformLeaderboardTabEventRateWindowSeconds (copy), PlatformLeaderboardTabEventRateLimit (copy)
	local ClockTime = os.clock()
	local RateLimit = self._rateLimits[UserId]
	
	if RateLimit == nil or PlatformLeaderboardTabEventRateWindowSeconds <= ClockTime - RateLimit.windowStart then
		self._rateLimits[UserId] = { count = 1, windowStart = ClockTime }
		
		return false
	elseif PlatformLeaderboardTabEventRateLimit <= RateLimit.count then
		return true
	else
		RateLimit.count += 1
		
		return false
	end
end

function PlatformLeaderboardController:_validateTabPayload(Player, p1) --[[ Line: 232 ]]
	if typeof(p1) ~= "table" then
		return nil
	end
	local TabType = p1.tabType
	
	if typeof(TabType) == "string" then
		local UserId = p1.userId
		
		return if UserId == nil or UserId == Player.UserId then { tabType = TabType } else nil
	else
		return nil
	end
end

function PlatformLeaderboardController:_removePlayerFromAllTabs(UserId) --[[ Line: 247 ]]
	if self._cache then
		self._cache:cleanupForUserId(UserId)
	end
	self._playerTabs[UserId] = nil
	self._rateLimits[UserId] = nil
end

function PlatformLeaderboardController:_onTabOpened(Player: Player, ValidateTabPayloadResult) --[[ Line: 255 ]]
	-- upvalues: LeaderboardType (copy), EventType (copy), FFlagPlatformLeaderboardDebugLogging (copy)
	local Cache = self._cache
	
	if not Cache then return end
	local PlayerTab = self._playerTabs[Player.UserId] or {}
	self._playerTabs[Player.UserId] = PlayerTab
	
	if ValidateTabPayloadResult.tabType == LeaderboardType.Global then
		if not PlayerTab.global then
			PlayerTab.global = true
			Cache:startGlobalRefresh(Player.UserId)
			local GlobalData = Cache:getGlobalData()
			
			if GlobalData then
				self:_pushToPlayer(Player, {
					type = EventType.GlobalLeaderboardData,
					data = GlobalData
				})
			end
			local UserScore = Cache:getUserScore(Player.UserId)
			
			if UserScore then
				self:_pushToPlayer(Player, {
					type = EventType.UserScore,
					userId = Player.UserId,
					entry = UserScore
				})
				
				return
			end
		end
	elseif ValidateTabPayloadResult.tabType == LeaderboardType.Friends then
		if not PlayerTab.friends then
			PlayerTab.friends = true
			Cache:startFriendsRefresh(Player.UserId)
			local FriendsData = Cache:getFriendsData(Player.UserId)
			
			if FriendsData then
				self:_pushToPlayer(Player, {
					type = EventType.FriendsLeaderboardData,
					userId = Player.UserId,
					data = FriendsData
				})
				
				return
			end
		end
	elseif FFlagPlatformLeaderboardDebugLogging then
		warn("[PlatformLeaderboard] Unknown tabType:", ValidateTabPayloadResult.tabType)
	end
end

function PlatformLeaderboardController:_onTabClosed(Player: Player, ValidateTabPayloadResult) --[[ Line: 294 ]]
	-- upvalues: LeaderboardType (copy)
	if not self._cache then return end
	local Cache = self._cache
	local PlayerTab = self._playerTabs[Player.UserId]
	
	if ValidateTabPayloadResult.tabType == LeaderboardType.Global and PlayerTab and PlayerTab.global then
		PlayerTab.global = nil
		Cache:stopGlobalRefresh(Player.UserId)
		
		return
	end
	if ValidateTabPayloadResult.tabType == LeaderboardType.Friends and PlayerTab and PlayerTab.friends then
		PlayerTab.friends = nil
		Cache:stopFriendsRefresh(Player.UserId)
	end
end

function PlatformLeaderboardController:_pushToAll(p1) --[[ Line: 310 ]]
	if self._pushEvent then
		self._pushEvent:FireAllClients(p1)
	end
end

function PlatformLeaderboardController:_pushToGlobalViewers(p1) --[[ Line: 316 ]]
	-- upvalues: Players (copy)
	if not self._pushEvent then return end
	for _, player in Players:GetPlayers() do
		local PlayerTab = self._playerTabs[player.UserId]
		
		if PlayerTab and PlayerTab.global then
			self._pushEvent:FireClient(player, p1)
		end
	end
end

function PlatformLeaderboardController:_pushToPlayer(Player, p2) --[[ Line: 328 ]]
	if self._pushEvent then
		self._pushEvent:FireClient(Player, p2)
	end
end

function PlatformLeaderboardController:destroy() --[[ Line: 334 ]]
	for _, conn in self._conns do
		if typeof(conn) == "table" and conn.disconnect then
			conn:disconnect()
		elseif typeof(conn) == "RBXScriptConnection" then
			conn:Disconnect()
		end
	end
	table.clear(self._conns)
	self._configService:teardown()
	
	if self._cache then
		self._cache:destroy()
	end
	if self._pushEvent then
		self._pushEvent:Destroy()
	end
end

return PlatformLeaderboardController