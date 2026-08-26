local playersService = game:GetService("Players")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local parent = script.Parent
local parent_1 = parent.Parent
local platformLeaderboardTypesModule = require(parent.PlatformLeaderboardTypes)
local platformLeaderboardCacheModule = require(parent.PlatformLeaderboardCache)
local _ = require(parent.PlatformLeaderboardConfigService)
local sharedFlagsModule = require(parent_1.SharedFlags)
local eventType = platformLeaderboardTypesModule.EventType
local leaderboardType = platformLeaderboardTypesModule.LeaderboardType
local remoteEventName = platformLeaderboardTypesModule.RemoteEventName
local platformLeaderboardTabEventRateLimit = game:DefineFastInt("PlatformLeaderboardTabEventRateLimit", 20)
local platformLeaderboardTabEventRateWindowSeconds = game:DefineFastInt("PlatformLeaderboardTabEventRateWindowSeconds", 10)
local fFlagPlatformLeaderboardDebugLogging = sharedFlagsModule.FFlagPlatformLeaderboardDebugLogging
local t = {}
t.__index = t

function t.new(p1, p2)
	-- upvalues: t (ref)
	return setmetatable({
		_cache = nil,
		_pushEvent = nil,
		_configService = p1,
		_fetcher = p2,
		_conns = {},
		_playerTabs = {},
		_rateLimits = {}
	}, t)
end

function t:_onConfigChanged(p1, p2)
	-- upvalues: eventType (ref)
	self:_pushToAll({ type = eventType.ConfigUpdate, config = p2 })
	
	if p2 then
		if not self._cache then
			self:_initializeCache(p2)
			
			return
		elseif p1 then
			self._cache:forceRefresh(p2, not (p1.leaderboardId == p2.leaderboardId))
		end
		return
	elseif self._cache then
		self._cache:teardown()
		self._cache = nil
	end
	table.clear(self._playerTabs)
end

function t:_initializeCache(p1)
	-- upvalues: platformLeaderboardCacheModule (ref), eventType (ref), playersService (ref)
	self._cache = platformLeaderboardCacheModule.new(self._fetcher, p1)
	local cache = self._cache
	table.insert(self._conns, cache:onGlobalUpdated(function(p2, p3)
		-- upvalues: self (ref), eventType (copy)
		self:_pushToGlobalViewers({ type = eventType.GlobalLeaderboardData, data = p2 })
		
		if p3 then
			self._configService:updateConfig(p3)
		end
	end))
	table.insert(self._conns, cache:onFriendsUpdated(function(p2, p3, p4)
		-- upvalues: playersService (copy), self (ref), eventType (copy)
		local var1 = playersService:GetPlayerByUserId(p2)
		
		if var1 then
			self:_pushToPlayer(var1, {
				type = eventType.FriendsLeaderboardData,
				userId = p2,
				data = p3
			})
		end
		if p4 then
			self._configService:updateConfig(p4)
		end
	end))
	table.insert(self._conns, cache:onUserScoreUpdated(function(p2, p3)
		-- upvalues: playersService (copy), self (ref), eventType (copy)
		local var1 = playersService:GetPlayerByUserId(p2)
		
		if var1 then
			self:_pushToPlayer(var1, { type = eventType.UserScore, userId = p2, entry = p3 })
		end
	end))
end

function t:initialize()
	-- upvalues: remoteEventName (ref), robloxReplicatedStorageService (ref), eventType (ref), playersService (ref)
	self._pushEvent = Instance.new("RemoteEvent")
	self._pushEvent.Name = remoteEventName.Push
	self._pushEvent.Parent = robloxReplicatedStorageService
	local remoteEvent = Instance.new("RemoteEvent")
	remoteEvent.Name = remoteEventName.TabOpened
	remoteEvent.Parent = robloxReplicatedStorageService
	local remoteEvent_1 = Instance.new("RemoteEvent")
	remoteEvent_1.Name = remoteEventName.TabClosed
	remoteEvent_1.Parent = robloxReplicatedStorageService
	self._pushEvent.OnServerEvent:Connect(function() end)
	local config = self._configService:getConfig()
	
	if config then
		self:_initializeCache(config)
	end
	table.insert(self._conns, self._configService:onConfigChanged(function(p1, p2)
		-- upvalues: self (ref)
		self:_onConfigChanged(p1, p2)
	end))
	self:_pushToAll({
		type = eventType.ConfigUpdate,
		config = self._configService:getConfig()
	})
	table.insert(self._conns, remoteEvent.OnServerEvent:Connect(function(p1, p2)
		-- upvalues: self (ref)
		if self:_isRateLimited(p1.UserId) then return end
		local var1 = self:_validateTabPayload(p1, p2)
		
		if var1 then
			self:_onTabOpened(p1, var1)
		end
	end))
	table.insert(self._conns, remoteEvent_1.OnServerEvent:Connect(function(p1, p2)
		-- upvalues: self (ref)
		if self:_isRateLimited(p1.UserId) then return end
		local var1 = self:_validateTabPayload(p1, p2)
		
		if var1 then
			self:_onTabClosed(p1, var1)
		end
	end))
	table.insert(self._conns, playersService.PlayerAdded:Connect(function(p1)
		-- upvalues: self (ref), eventType (copy)
		task.defer(function()
			-- upvalues: self (copy), p1 (ref), eventType (copy)
			self:_pushToPlayer(p1, {
				type = eventType.ConfigUpdate,
				config = self._configService:getConfig()
			})
		end)
	end))
	table.insert(self._conns, playersService.PlayerRemoving:Connect(function(p1)
		-- upvalues: self (ref)
		self:_removePlayerFromAllTabs(p1.UserId)
	end))
end

function t:_isRateLimited(p1)
	-- upvalues: platformLeaderboardTabEventRateWindowSeconds (ref), platformLeaderboardTabEventRateLimit (ref)
	local processTime = os.clock()
	local var1 = self._rateLimits[p1]
	
	if var1 == nil or platformLeaderboardTabEventRateWindowSeconds <= processTime - var1.windowStart then
		self._rateLimits[p1] = { count = 1, windowStart = processTime }
		
		return false
	elseif platformLeaderboardTabEventRateLimit <= var1.count then
		return true
	end
	var1.count += 1
	
	return false
end

function t._validateTabPayload(_, p1, p2)
	if typeof(p2) ~= "table" then
		return nil
	end
	local tabType = p2.tabType
	
	if typeof(tabType) ~= "string" then
		return nil
	end
	local userId = p2.userId
	
	return if userId == nil or userId == p1.UserId then { tabType = tabType } else nil
end

function t:_removePlayerFromAllTabs(p1)
	if self._cache then
		self._cache:cleanupForUserId(p1)
	end
	self._playerTabs[p1] = nil
	self._rateLimits[p1] = nil
end

function t:_onTabOpened(p1, p2)
	-- upvalues: leaderboardType (ref), eventType (ref), fFlagPlatformLeaderboardDebugLogging (ref)
	local cache = self._cache
	
	if not cache then return end
	local userId = self._playerTabs[p1.UserId] or {}
	self._playerTabs[p1.UserId] = userId
	
	if p2.tabType == leaderboardType.Global then
		if not userId.global then
			userId.global = true
			cache:startGlobalRefresh(p1.UserId)
			local globalData = cache:getGlobalData()
			
			if globalData then
				self:_pushToPlayer(p1, {
					type = eventType.GlobalLeaderboardData,
					data = globalData
				})
			end
			local userIdUserScore = cache:getUserScore(p1.UserId)
			
			if userIdUserScore then
				self:_pushToPlayer(p1, {
					type = eventType.UserScore,
					userId = p1.UserId,
					entry = userIdUserScore
				})
				
				return
			end
		end
	elseif p2.tabType == leaderboardType.Friends then
		if not userId.friends then
			userId.friends = true
			cache:startFriendsRefresh(p1.UserId)
			local userIdFriendsData = cache:getFriendsData(p1.UserId)
			
			if userIdFriendsData then
				self:_pushToPlayer(p1, {
					type = eventType.FriendsLeaderboardData,
					userId = p1.UserId,
					data = userIdFriendsData
				})
				
				return
			end
		end
	elseif fFlagPlatformLeaderboardDebugLogging then
		warn("[PlatformLeaderboard] Unknown tabType:", p2.tabType)
	end
end

function t:_onTabClosed(p1, p2)
	-- upvalues: leaderboardType (ref)
	if not self._cache then return end
	local cache = self._cache
	local userId = self._playerTabs[p1.UserId]
	
	if p2.tabType == leaderboardType.Global and userId and userId.global then
		userId.global = nil
		cache:stopGlobalRefresh(p1.UserId)
		
		return
	elseif p2.tabType == leaderboardType.Friends and userId and userId.friends then
		userId.friends = nil
		cache:stopFriendsRefresh(p1.UserId)
	end
end

function t:_pushToAll(p1)
	if self._pushEvent then
		self._pushEvent:FireAllClients(p1)
	end
end

function t:_pushToGlobalViewers(p1)
	-- upvalues: playersService (ref)
	if not self._pushEvent then return end
	for i, v in playersService:GetPlayers() do
		local userId = self._playerTabs[v.UserId]
		
		if userId and userId.global then
			self._pushEvent:FireClient(v, p1)
		end
	end
end

function t:_pushToPlayer(p2, p3)
	if self._pushEvent then
		self._pushEvent:FireClient(p2, p3)
	end
end

function t:destroy()
	for i, v in self._conns do
		if typeof(v) == "table" and v.disconnect then
			v:disconnect()
		elseif typeof(v) == "RBXScriptConnection" then
			v:Disconnect()
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

return t