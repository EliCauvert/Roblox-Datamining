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

function t.new(p0, p1) --[[ line: 51 ]]
	-- upvalues: t (ref)
	return setmetatable({
		_cache = nil,
		_pushEvent = nil,
		_configService = p0,
		_fetcher = p1,
		_conns = {},
		_playerTabs = {},
		_rateLimits = {}
	}, t)
end

function t:_onConfigChanged(p2, p3) --[[ line: 66 ]]
	-- upvalues: eventType (ref)
	self:_pushToAll({ type = eventType.ConfigUpdate, config = p3 })
	
	if p3 then
		if not self._cache then
			self:_initializeCache(p3)
			
			return
		elseif p2 then
			self._cache:forceRefresh(p3, not (p2.leaderboardId == p3.leaderboardId))
		end
		return
	elseif self._cache then
		self._cache:teardown()
		self._cache = nil
	end
	table.clear(self._playerTabs)
end

function t:_initializeCache(p4) --[[ line: 86 ]]
	-- upvalues: platformLeaderboardCacheModule (ref), eventType (ref), playersService (ref)
	self._cache = platformLeaderboardCacheModule.new(self._fetcher, p4)
	local cache = self._cache
	table.insert(self._conns, cache:onGlobalUpdated(function(p5, p6) --[[ line: 92 ]]
		-- upvalues: self (ref), eventType (copy)
		self:_pushToGlobalViewers({ type = eventType.GlobalLeaderboardData, data = p5 })
		
		if p6 then
			self._configService:updateConfig(p6)
		end
	end))
	table.insert(self._conns, cache:onFriendsUpdated(function(p7, p8, p9) --[[ line: 102 ]]
		-- upvalues: playersService (copy), self (ref), eventType (copy)
		local var8 = playersService:GetPlayerByUserId(p7)
		
		if var8 then
			self:_pushToPlayer(var8, {
				type = eventType.FriendsLeaderboardData,
				userId = p7,
				data = p8
			})
		end
		if p9 then
			self._configService:updateConfig(p9)
		end
	end))
	table.insert(self._conns, cache:onUserScoreUpdated(function(p10, p11) --[[ line: 118 ]]
		-- upvalues: playersService (copy), self (ref), eventType (copy)
		local var9 = playersService:GetPlayerByUserId(p10)
		
		if var9 then
			self:_pushToPlayer(var9, { type = eventType.UserScore, userId = p10, entry = p11 })
		end
	end))
end

function t:initialize() --[[ line: 127 ]]
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
	self._pushEvent.OnServerEvent:Connect(function() --[[ line: 143 ]] end)
	local config = self._configService:getConfig()
	
	if config then
		self:_initializeCache(config)
	end
	table.insert(self._conns, self._configService:onConfigChanged(function(p12, p13) --[[ line: 155 ]]
		-- upvalues: self (ref)
		self:_onConfigChanged(p12, p13)
	end))
	self:_pushToAll({
		type = eventType.ConfigUpdate,
		config = self._configService:getConfig()
	})
	table.insert(self._conns, remoteEvent.OnServerEvent:Connect(function(p14, p15) --[[ line: 167 ]]
		-- upvalues: self (ref)
		if self:_isRateLimited(p14.UserId) then return end
		local var13 = self:_validateTabPayload(p14, p15)
		
		if var13 then
			self:_onTabOpened(p14, var13)
		end
	end))
	table.insert(self._conns, remoteEvent_1.OnServerEvent:Connect(function(p16, p17) --[[ line: 179 ]]
		-- upvalues: self (ref)
		if self:_isRateLimited(p16.UserId) then return end
		local var14 = self:_validateTabPayload(p16, p17)
		
		if var14 then
			self:_onTabClosed(p16, var14)
		end
	end))
	table.insert(self._conns, playersService.PlayerAdded:Connect(function(p18) --[[ line: 192 ]]
		-- upvalues: self (ref), eventType (copy)
		task.defer(function() --[[ line: 193 ]]
			-- upvalues: self (copy), p18 (ref), eventType (copy)
			self:_pushToPlayer(p18, {
				type = eventType.ConfigUpdate,
				config = self._configService:getConfig()
			})
		end)
	end))
	table.insert(self._conns, playersService.PlayerRemoving:Connect(function(p19) --[[ line: 204 ]]
		-- upvalues: self (ref)
		self:_removePlayerFromAllTabs(p19.UserId)
	end))
end

function t:_isRateLimited(p20) --[[ line: 215 ]]
	-- upvalues: platformLeaderboardTabEventRateWindowSeconds (ref), platformLeaderboardTabEventRateLimit (ref)
	local processTime = os.clock()
	local var16 = self._rateLimits[p20]
	
	if var16 == nil or platformLeaderboardTabEventRateWindowSeconds <= processTime - var16.windowStart then
		self._rateLimits[p20] = { count = 1, windowStart = processTime }
		
		return false
	elseif platformLeaderboardTabEventRateLimit <= var16.count then
		return true
	end
	var16.count += 1
	
	return false
end

function t._validateTabPayload(_, p21, p22) --[[ line: 232 ]]
	if typeof(p22) ~= "table" then
		return nil
	end
	local tabType = p22.tabType
	
	if typeof(tabType) ~= "string" then
		return nil
	end
	local userId = p22.userId
	
	return if userId == nil or userId == p21.UserId then { tabType = tabType } else nil
end

function t:_removePlayerFromAllTabs(p23) --[[ line: 247 ]]
	if self._cache then
		self._cache:cleanupForUserId(p23)
	end
	self._playerTabs[p23] = nil
	self._rateLimits[p23] = nil
end

function t:_onTabOpened(p24, p25) --[[ line: 255 ]]
	-- upvalues: leaderboardType (ref), eventType (ref), fFlagPlatformLeaderboardDebugLogging (ref)
	local cache = self._cache
	
	if not cache then return end
	local userId = self._playerTabs[p24.UserId] or {}
	self._playerTabs[p24.UserId] = userId
	
	if p25.tabType == leaderboardType.Global then
		if not userId.global then
			userId.global = true
			cache:startGlobalRefresh(p24.UserId)
			local globalData = cache:getGlobalData()
			
			if globalData then
				self:_pushToPlayer(p24, {
					type = eventType.GlobalLeaderboardData,
					data = globalData
				})
			end
			local userIdUserScore = cache:getUserScore(p24.UserId)
			
			if userIdUserScore then
				self:_pushToPlayer(p24, {
					type = eventType.UserScore,
					userId = p24.UserId,
					entry = userIdUserScore
				})
				
				return
			end
		end
	elseif p25.tabType == leaderboardType.Friends then
		if not userId.friends then
			userId.friends = true
			cache:startFriendsRefresh(p24.UserId)
			local userIdFriendsData = cache:getFriendsData(p24.UserId)
			
			if userIdFriendsData then
				self:_pushToPlayer(p24, {
					type = eventType.FriendsLeaderboardData,
					userId = p24.UserId,
					data = userIdFriendsData
				})
				
				return
			end
		end
	elseif fFlagPlatformLeaderboardDebugLogging then
		warn("[PlatformLeaderboard] Unknown tabType:", p25.tabType)
	end
end

function t:_onTabClosed(p26, p27) --[[ line: 294 ]]
	-- upvalues: leaderboardType (ref)
	if not self._cache then return end
	local cache = self._cache
	local userId = self._playerTabs[p26.UserId]
	
	if p27.tabType == leaderboardType.Global and userId and userId.global then
		userId.global = nil
		cache:stopGlobalRefresh(p26.UserId)
		
		return
	elseif p27.tabType == leaderboardType.Friends and userId and userId.friends then
		userId.friends = nil
		cache:stopFriendsRefresh(p26.UserId)
	end
end

function t:_pushToAll(p28) --[[ line: 310 ]]
	if self._pushEvent then
		self._pushEvent:FireAllClients(p28)
	end
end

function t:_pushToGlobalViewers(p29) --[[ line: 316 ]]
	-- upvalues: playersService (ref)
	if not self._pushEvent then return end
	for i, v in playersService:GetPlayers() do
		local userId = self._playerTabs[v.UserId]
		
		if userId and userId.global then
			self._pushEvent:FireClient(v, p29)
		end
	end
end

function t:_pushToPlayer(p30, p31) --[[ line: 328 ]]
	if self._pushEvent then
		self._pushEvent:FireClient(p30, p31)
	end
end

function t:destroy() --[[ line: 334 ]]
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