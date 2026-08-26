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

function t.new(p1, p2, p3)
	-- upvalues: _task (ref), signal (ref), t (ref)
	return setmetatable({
		_globalData = nil,
		_globalTimer = nil,
		_friendsTimer = nil,
		_fetcher = p1,
		_config = p2,
		_globalEntriesByUserId = {},
		_friendsData = {},
		_userScoreEntries = {},
		_currentlyActiveGlobalLeaderboardViewersByUserId = {},
		_currentFriendsLeaderboardViewersById = {},
		_scheduler = p3 or _task,
		_globalUpdated = signal.new(),
		_friendsUpdated = signal.new(),
		_userScoreUpdated = signal.new()
	}, t)
end

function t:onGlobalUpdated(p1)
	return self._globalUpdated:connect(p1)
end

function t:onFriendsUpdated(p1)
	return self._friendsUpdated:connect(p1)
end

function t:onUserScoreUpdated(p1)
	return self._userScoreUpdated:connect(p1)
end

function t:getGlobalData()
	return self._globalData
end

function t:getFriendsData(p1)
	return self._friendsData[p1]
end

function t:getUserScore(p1)
	return self._userScoreEntries[p1]
end

function t:_rebuildGlobalIndex()
	table.clear(self._globalEntriesByUserId)
	
	if not self._globalData then return end
	for i, v in self._globalData.entries do
		self._globalEntriesByUserId[v.userId] = v
	end
end

function t:resolveRankFromCache(p1)
	local var1 = self._globalEntriesByUserId[p1]
	
	return if var1 then var1.rank else nil
end

function t:_resolveEntryFromGlobalLeaderboard(p1)
	return self._globalEntriesByUserId[p1]
end

function t:_fetchUserScoreForUser(p1)
	if self._userScoreEntries[p1] then
		self._userScoreUpdated:fire(p1, self._userScoreEntries[p1])
		
		return
	end
	local var1 = self:_resolveEntryFromGlobalLeaderboard(p1)
	
	if var1 then
		self._userScoreEntries[p1] = var1
		self._userScoreUpdated:fire(p1, var1)
		
		return
	end
	local ok, status, var2 = pcall(self._fetcher.fetchUserScore, self._config.leaderboardId, p1)
	
	if ok and status then
		self._userScoreEntries[p1] = var2
		self._userScoreUpdated:fire(p1, var2)
	end
end

function t:_resolveUserScoresParallel()
	table.clear(self._userScoreEntries)
	
	for i in self._currentlyActiveGlobalLeaderboardViewersByUserId do
		self._scheduler.spawn(function()
			-- upvalues: self (ref), i (ref)
			self:_fetchUserScoreForUser(i)
		end)
	end
end

function t:_fetchFriendsLeaderboardForUser(p1)
	local ok, status, var1 = pcall(self._fetcher.fetchFriendsLeaderboard, self._config.leaderboardId, p1)
	
	if ok and status and var1 then
		local t = { entries = var1.entries, lastRefreshedAt = os.time() }
		self._friendsData[p1] = t
		self._friendsUpdated:fire(p1, t, var1.config)
	end
end

function t:startGlobalRefresh(p1)
	-- upvalues: platformLeaderboardGlobalJitterSeconds (ref), platformLeaderboardGlobalIntervalSeconds (ref)
	local var1 = self._currentlyActiveGlobalLeaderboardViewersByUserId[p1]
	self._currentlyActiveGlobalLeaderboardViewersByUserId[p1] = true
	
	if self._globalTimer then
		if not var1 then
			self:_fetchUserScoreForUser(p1)
		end
		return
	else
		local var2 = nil
		
		local function loop()
			-- upvalues: self (ref), platformLeaderboardGlobalJitterSeconds (copy), platformLeaderboardGlobalIntervalSeconds (copy), var2 (write)
			repeat
				local ok, status, var3 = pcall(self._fetcher.fetchGlobalLeaderboard, self._config.leaderboardId)
				if ok and status and var3 then
					local t = { entries = var3.entries, lastRefreshedAt = os.time() }
					self._globalData = t
					self:_rebuildGlobalIndex()
					self._globalUpdated:fire(t, var3.config)
				end
				self:_resolveUserScoresParallel()
				self._scheduler.wait(math.max(1, platformLeaderboardGlobalIntervalSeconds + math.random(-platformLeaderboardGlobalJitterSeconds, platformLeaderboardGlobalJitterSeconds)))
			until self._globalTimer ~= var2
		end
		
		self._globalTimer = self._scheduler.defer(function()
			-- upvalues: loop (ref), self (ref), var2 (write)
			if not pcall(loop) and self._globalTimer == var2 then
				self._globalTimer = nil
			end
		end)
	end
end

function t:stopGlobalRefresh(p1)
	self._currentlyActiveGlobalLeaderboardViewersByUserId[p1] = nil
	self._userScoreEntries[p1] = nil
	
	if next(self._currentlyActiveGlobalLeaderboardViewersByUserId) then return end
	if self._globalTimer then
		pcall(self._scheduler.cancel, self._globalTimer)
		self._globalTimer = nil
	end
	self._globalData = nil
	table.clear(self._globalEntriesByUserId)
end

function t:startFriendsRefresh(p1)
	-- upvalues: platformLeaderboardFriendsJitterSeconds (ref), platformLeaderboardFriendsIntervalSeconds (ref)
	self._currentFriendsLeaderboardViewersById[p1] = true
	
	if self._friendsTimer then
		if not self._friendsData[p1] then
			self:_fetchFriendsLeaderboardForUser(p1)
		end
		return
	else
		local var1 = nil
		local var2 = true
		
		local function loop()
			-- upvalues: self (ref), var2 (write), platformLeaderboardFriendsJitterSeconds (copy), platformLeaderboardFriendsIntervalSeconds (copy), var1 (write)
			repeat
				table.clear(self._friendsData)
				for i in self._currentFriendsLeaderboardViewersById do
					local var3 = if var2 then 0 else math.random(0, platformLeaderboardFriendsJitterSeconds)
					self._scheduler.spawn(function()
						-- upvalues: self (copy), var3 (ref), i (ref)
						self._scheduler.wait(var3)
						
						if self._currentFriendsLeaderboardViewersById[i] then
							self:_fetchFriendsLeaderboardForUser(i)
						end
					end)
				end
				var2 = false
				self._scheduler.wait(math.max(1, platformLeaderboardFriendsIntervalSeconds))
			until self._friendsTimer ~= var1
		end
		
		self._friendsTimer = self._scheduler.defer(function()
			-- upvalues: loop (ref), self (ref), var1 (write)
			if not pcall(loop) and self._friendsTimer == var1 then
				self._friendsTimer = nil
			end
		end)
	end
end

function t:stopFriendsRefresh(p1)
	self._currentFriendsLeaderboardViewersById[p1] = nil
	
	if next(self._currentFriendsLeaderboardViewersById) then return end
	if self._friendsTimer then
		pcall(self._scheduler.cancel, self._friendsTimer)
		self._friendsTimer = nil
	end
end

function t:forceRefresh(p1, p2)
	self._config = p1
	
	if p2 then
		self._globalData = nil
		table.clear(self._globalEntriesByUserId)
		table.clear(self._friendsData)
		table.clear(self._userScoreEntries)
	end
	local var1 = next(self._currentlyActiveGlobalLeaderboardViewersByUserId)
	
	if self._globalTimer and var1 then
		pcall(self._scheduler.cancel, self._globalTimer)
		self._globalTimer = nil
		self:startGlobalRefresh(var1)
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

function t:cleanupForUserId(p3)
	self:stopGlobalRefresh(p3)
	self:stopFriendsRefresh(p3)
end

function t:teardown()
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

function t:destroy()
	self:teardown()
end

return t