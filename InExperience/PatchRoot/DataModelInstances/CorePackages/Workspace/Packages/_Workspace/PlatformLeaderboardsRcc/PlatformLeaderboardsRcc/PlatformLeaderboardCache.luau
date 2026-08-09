local parent = script.Parent
local signal = require(parent.Parent.AppCommonLib).Signal
local _ = require(parent.PlatformLeaderboardTypes)
local platformLeaderboardGlobalIntervalSeconds = game:DefineFastInt("PlatformLeaderboardGlobalIntervalSeconds", 180)
local platformLeaderboardGlobalJitterSeconds = game:DefineFastInt("PlatformLeaderboardGlobalJitterSeconds", 30)
local platformLeaderboardFriendsIntervalSeconds = game:DefineFastInt("PlatformLeaderboardFriendsIntervalSeconds", 180)
local platformLeaderboardFriendsJitterSeconds = game:DefineFastInt("PlatformLeaderboardFriendsJitterSeconds", 30)
local t = {}
t.__index = t
local _task = task

function t.new(p0, p1, p2) --[[ line: 63 ]]
	-- upvalues: _task (ref), signal (ref), t (ref)
	return setmetatable({
		_globalData = nil,
		_globalTimer = nil,
		_friendsTimer = nil,
		_fetcher = p0,
		_config = p1,
		_globalEntriesByUserId = {},
		_friendsData = {},
		_userScoreEntries = {},
		_currentlyActiveGlobalLeaderboardViewersByUserId = {},
		_currentFriendsLeaderboardViewersById = {},
		_scheduler = p2 or _task,
		_globalUpdated = signal.new(),
		_friendsUpdated = signal.new(),
		_userScoreUpdated = signal.new()
	}, t)
end

function t:onGlobalUpdated(p3) --[[ line: 86 ]]
	return self._globalUpdated:connect(p3)
end

function t:onFriendsUpdated(p4) --[[ line: 93 ]]
	return self._friendsUpdated:connect(p4)
end

function t:onUserScoreUpdated(p5) --[[ line: 100 ]]
	return self._userScoreUpdated:connect(p5)
end

function t:getGlobalData() --[[ line: 107 ]]
	return self._globalData
end

function t:getFriendsData(p6) --[[ line: 111 ]]
	return self._friendsData[p6]
end

function t:getUserScore(p7) --[[ line: 118 ]]
	return self._userScoreEntries[p7]
end

function t:_rebuildGlobalIndex() --[[ line: 125 ]]
	table.clear(self._globalEntriesByUserId)
	
	if not self._globalData then return end
	for i, v in self._globalData.entries do
		self._globalEntriesByUserId[v.userId] = v
	end
end

function t:resolveRankFromCache(p8) --[[ line: 135 ]]
	local var6 = self._globalEntriesByUserId[p8]
	
	return if var6 then var6.rank else nil
end

function t:_resolveEntryFromGlobalLeaderboard(p9) --[[ line: 140 ]]
	return self._globalEntriesByUserId[p9]
end

function t:_fetchUserScoreForUser(p10) --[[ line: 147 ]]
	if self._userScoreEntries[p10] then
		self._userScoreUpdated:fire(p10, self._userScoreEntries[p10])
		
		return
	end
	local var7 = self:_resolveEntryFromGlobalLeaderboard(p10)
	
	if var7 then
		self._userScoreEntries[p10] = var7
		self._userScoreUpdated:fire(p10, var7)
		
		return
	end
	local ok, status, var8 = pcall(self._fetcher.fetchUserScore, self._config.leaderboardId, p10)
	
	if ok and status then
		self._userScoreEntries[p10] = var8
		self._userScoreUpdated:fire(p10, var8)
	end
end

function t:_resolveUserScoresParallel() --[[ line: 167 ]]
	table.clear(self._userScoreEntries)
	
	for i in self._currentlyActiveGlobalLeaderboardViewersByUserId do
		self._scheduler.spawn(function() --[[ line: 170 ]]
			-- upvalues: self (ref), i (ref)
			self:_fetchUserScoreForUser(i)
		end)
	end
end

function t:_fetchFriendsLeaderboardForUser(p11) --[[ line: 176 ]]
	local ok, status, var9 = pcall(self._fetcher.fetchFriendsLeaderboard, self._config.leaderboardId, p11)
	
	if ok and status and var9 then
		local t = { entries = var9.entries, lastRefreshedAt = os.time() }
		self._friendsData[p11] = t
		self._friendsUpdated:fire(p11, t, var9.config)
	end
end

function t:startGlobalRefresh(p12) --[[ line: 187 ]]
	-- upvalues: platformLeaderboardGlobalJitterSeconds (ref), platformLeaderboardGlobalIntervalSeconds (ref)
	local var11 = self._currentlyActiveGlobalLeaderboardViewersByUserId[p12]
	self._currentlyActiveGlobalLeaderboardViewersByUserId[p12] = true
	
	if self._globalTimer then
		if not var11 then
			self:_fetchUserScoreForUser(p12)
		end
		return
	else
		local var12 = nil
		
		local function loop() --[[ line: 198 ]]
			-- upvalues: self (ref), platformLeaderboardGlobalJitterSeconds (copy), platformLeaderboardGlobalIntervalSeconds (copy), var12 (write)
			repeat
				local ok, status, var14 = pcall(self._fetcher.fetchGlobalLeaderboard, self._config.leaderboardId)
				if ok and status and var14 then
					local t = { entries = var14.entries, lastRefreshedAt = os.time() }
					self._globalData = t
					self:_rebuildGlobalIndex()
					self._globalUpdated:fire(t, var14.config)
				end
				self:_resolveUserScoresParallel()
				self._scheduler.wait(math.max(1, platformLeaderboardGlobalIntervalSeconds + math.random(-platformLeaderboardGlobalJitterSeconds, platformLeaderboardGlobalJitterSeconds)))
			until self._globalTimer ~= var12
		end
		
		self._globalTimer = self._scheduler.defer(function() --[[ line: 216 ]]
			-- upvalues: loop (ref), self (ref), var12 (write)
			if not pcall(loop) and self._globalTimer == var12 then
				self._globalTimer = nil
			end
		end)
	end
end

function t:stopGlobalRefresh(p13) --[[ line: 225 ]]
	self._currentlyActiveGlobalLeaderboardViewersByUserId[p13] = nil
	self._userScoreEntries[p13] = nil
	
	if next(self._currentlyActiveGlobalLeaderboardViewersByUserId) then return end
	if self._globalTimer then
		pcall(self._scheduler.cancel, self._globalTimer)
		self._globalTimer = nil
	end
	self._globalData = nil
	table.clear(self._globalEntriesByUserId)
end

function t:startFriendsRefresh(p14) --[[ line: 240 ]]
	-- upvalues: platformLeaderboardFriendsJitterSeconds (ref), platformLeaderboardFriendsIntervalSeconds (ref)
	self._currentFriendsLeaderboardViewersById[p14] = true
	
	if self._friendsTimer then
		if not self._friendsData[p14] then
			self:_fetchFriendsLeaderboardForUser(p14)
		end
		return
	else
		local var16 = nil
		
		local function loop() --[[ line: 250 ]]
			-- upvalues: self (ref), platformLeaderboardFriendsJitterSeconds (copy), platformLeaderboardFriendsIntervalSeconds (copy), var16 (write)
			repeat
				table.clear(self._friendsData)
				for i in self._currentFriendsLeaderboardViewersById do
					local randomValue = math.random(0, platformLeaderboardFriendsJitterSeconds)
					self._scheduler.spawn(function() --[[ line: 255 ]]
						-- upvalues: self (copy), randomValue (ref), i (ref)
						self._scheduler.wait(randomValue)
						
						if self._currentFriendsLeaderboardViewersById[i] then
							self:_fetchFriendsLeaderboardForUser(i)
						end
					end)
				end
				self._scheduler.wait(math.max(1, platformLeaderboardFriendsIntervalSeconds))
			until self._friendsTimer ~= var16
		end
		
		self._friendsTimer = self._scheduler.defer(function() --[[ line: 267 ]]
			-- upvalues: loop (ref), self (ref), var16 (write)
			if not pcall(loop) and self._friendsTimer == var16 then
				self._friendsTimer = nil
			end
		end)
	end
end

function t:stopFriendsRefresh(p15) --[[ line: 276 ]]
	self._currentFriendsLeaderboardViewersById[p15] = nil
	
	if next(self._currentFriendsLeaderboardViewersById) then return end
	if self._friendsTimer then
		pcall(self._scheduler.cancel, self._friendsTimer)
		self._friendsTimer = nil
	end
end

function t:forceRefresh(p16, p17) --[[ line: 288 ]]
	self._config = p16
	
	if p17 then
		self._globalData = nil
		table.clear(self._globalEntriesByUserId)
		table.clear(self._friendsData)
		table.clear(self._userScoreEntries)
	end
	local var19 = next(self._currentlyActiveGlobalLeaderboardViewersByUserId)
	
	if self._globalTimer and var19 then
		pcall(self._scheduler.cancel, self._globalTimer)
		self._globalTimer = nil
		self:startGlobalRefresh(var19)
	end
	if self._friendsTimer then
		pcall(self._scheduler.cancel, self._friendsTimer)
		self._friendsTimer = nil
		local t = {}
		
		for i in self._currentFriendsLeaderboardViewersById do
			table.insert(t, i)
		end
		table.clear(self._currentFriendsLeaderboardViewersById)
		
		for i_1, v in t do
			self:startFriendsRefresh(v)
		end
	end
end

function t:cleanupForUserId(p18) --[[ line: 325 ]]
	self:stopGlobalRefresh(p18)
	self:stopFriendsRefresh(p18)
end

function t:teardown() --[[ line: 330 ]]
	if self._globalTimer then
		pcall(self._scheduler.cancel, self._globalTimer)
	end
	self._globalTimer = nil
	self._globalData = nil
	table.clear(self._globalEntriesByUserId)
	table.clear(self._currentlyActiveGlobalLeaderboardViewersByUserId)
	
	if self._friendsTimer then
		pcall(self._scheduler.cancel, self._friendsTimer)
	end
	self._friendsTimer = nil
	table.clear(self._currentFriendsLeaderboardViewersById)
	table.clear(self._friendsData)
	table.clear(self._userScoreEntries)
end

function t:destroy() --[[ line: 347 ]]
	self:teardown()
end

return t