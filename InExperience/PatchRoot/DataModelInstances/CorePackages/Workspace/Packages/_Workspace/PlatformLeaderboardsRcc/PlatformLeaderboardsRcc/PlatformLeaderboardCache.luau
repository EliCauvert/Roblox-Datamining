local Parent = script.Parent
local Signal = require(Parent.Parent.AppCommonLib).Signal
local _ = require(Parent.PlatformLeaderboardTypes)
local PlatformLeaderboardGlobalIntervalSeconds = game:DefineFastInt("PlatformLeaderboardGlobalIntervalSeconds", 180)
local PlatformLeaderboardGlobalJitterSeconds = game:DefineFastInt("PlatformLeaderboardGlobalJitterSeconds", 30)
local PlatformLeaderboardFriendsIntervalSeconds = game:DefineFastInt("PlatformLeaderboardFriendsIntervalSeconds", 180)
local PlatformLeaderboardFriendsJitterSeconds = game:DefineFastInt("PlatformLeaderboardFriendsJitterSeconds", 30)
local PlatformLeaderboardCache = {}
PlatformLeaderboardCache.__index = PlatformLeaderboardCache
local v1 = task

function PlatformLeaderboardCache.new(_fetcher, _config, p1) --[[ Line: 63 ]]
	-- upvalues: v1 (copy), Signal (copy), PlatformLeaderboardCache (copy)
	return (setmetatable({
		_globalData = nil,
		_globalTimer = nil,
		_friendsTimer = nil,
		_fetcher = _fetcher,
		_config = _config,
		_globalEntriesByUserId = {},
		_friendsData = {},
		_userScoreEntries = {},
		_currentlyActiveGlobalLeaderboardViewersByUserId = {},
		_currentFriendsLeaderboardViewersById = {},
		_scheduler = p1 or v1,
		_globalUpdated = Signal.new(),
		_friendsUpdated = Signal.new(),
		_userScoreUpdated = Signal.new()
	}, PlatformLeaderboardCache))
end

function PlatformLeaderboardCache:onGlobalUpdated(p1) --[[ Line: 86 ]]
	return self._globalUpdated:connect(p1)
end

function PlatformLeaderboardCache:onFriendsUpdated(p1) --[[ Line: 93 ]]
	return self._friendsUpdated:connect(p1)
end

function PlatformLeaderboardCache:onUserScoreUpdated(p1) --[[ Line: 100 ]]
	return self._userScoreUpdated:connect(p1)
end

function PlatformLeaderboardCache:getGlobalData() --[[ Line: 107 ]]
	return self._globalData
end

function PlatformLeaderboardCache:getFriendsData(p1) --[[ Line: 111 ]]
	return self._friendsData[p1]
end

function PlatformLeaderboardCache:getUserScore(p1) --[[ Line: 118 ]]
	return self._userScoreEntries[p1]
end

function PlatformLeaderboardCache:_rebuildGlobalIndex() --[[ Line: 125 ]]
	table.clear(self._globalEntriesByUserId)
	
	if not self._globalData then return end
	for _, entry in self._globalData.entries do
		self._globalEntriesByUserId[entry.userId] = entry
	end
end

function PlatformLeaderboardCache:resolveRankFromCache(p1) --[[ Line: 135 ]]
	local GlobalEntriesByUserIdEntry = self._globalEntriesByUserId[p1]
	
	return if GlobalEntriesByUserIdEntry then GlobalEntriesByUserIdEntry.rank else nil
end

function PlatformLeaderboardCache:_resolveEntryFromGlobalLeaderboard(p1) --[[ Line: 140 ]]
	return self._globalEntriesByUserId[p1]
end

function PlatformLeaderboardCache:_fetchUserScoreForUser(p1) --[[ Line: 147 ]]
	if self._userScoreEntries[p1] then
		self._userScoreUpdated:fire(p1, self._userScoreEntries[p1])
		
		return
	end
	local ResolveEntryFromGlobalLeaderboardResult = self:_resolveEntryFromGlobalLeaderboard(p1)
	
	if ResolveEntryFromGlobalLeaderboardResult then
		self._userScoreEntries[p1] = ResolveEntryFromGlobalLeaderboardResult
		self._userScoreUpdated:fire(p1, ResolveEntryFromGlobalLeaderboardResult)
		
		return
	end
	local Success, Result, Result3 = pcall(self._fetcher.fetchUserScore, self._config.leaderboardId, p1)
	
	if Success and Result then
		self._userScoreEntries[p1] = Result3
		self._userScoreUpdated:fire(p1, Result3)
	end
end

function PlatformLeaderboardCache:_resolveUserScoresParallel() --[[ Line: 167 ]]
	table.clear(self._userScoreEntries)
	
	for i in self._currentlyActiveGlobalLeaderboardViewersByUserId do
		self._scheduler.spawn(function() --[[ Line: 170 ]]
			-- upvalues: self (copy), i (copy)
			self:_fetchUserScoreForUser(i)
		end)
	end
end

function PlatformLeaderboardCache:_fetchFriendsLeaderboardForUser(p1) --[[ Line: 176 ]]
	local Success, Result, Result3 = pcall(self._fetcher.fetchFriendsLeaderboard, self._config.leaderboardId, p1)
	
	if Success and Result and Result3 then
		local config = { entries = Result3.entries, lastRefreshedAt = os.time() }
		self._friendsData[p1] = config
		self._friendsUpdated:fire(p1, config, Result3.config)
	end
end

function PlatformLeaderboardCache:startGlobalRefresh(NextEntry) --[[ Line: 187 ]]
	-- upvalues: PlatformLeaderboardGlobalJitterSeconds (copy), PlatformLeaderboardGlobalIntervalSeconds (copy)
	local CurrentlyActiveGlobalLeaderboardViewersByUserIdEntry = self._currentlyActiveGlobalLeaderboardViewersByUserId[NextEntry]
	self._currentlyActiveGlobalLeaderboardViewersByUserId[NextEntry] = true
	
	if not self._globalTimer then
		local DeferResult = nil
		
		local function loop() --[[ Line: 198 ]]
			-- upvalues: self (copy), PlatformLeaderboardGlobalJitterSeconds (upval), PlatformLeaderboardGlobalIntervalSeconds (upval), DeferResult (ref)
			repeat
				local Success, Result, Result3 = pcall(self._fetcher.fetchGlobalLeaderboard, self._config.leaderboardId)
				if Success and Result and Result3 then
					local config = { entries = Result3.entries, lastRefreshedAt = os.time() }
					self._globalData = config
					self:_rebuildGlobalIndex()
					self._globalUpdated:fire(config, Result3.config)
				end
				self:_resolveUserScoresParallel()
				self._scheduler.wait((math.max(1, PlatformLeaderboardGlobalIntervalSeconds + math.random(-PlatformLeaderboardGlobalJitterSeconds, PlatformLeaderboardGlobalJitterSeconds))))
			until self._globalTimer ~= DeferResult
		end
		
		DeferResult = self._scheduler.defer(function() --[[ Line: 216 ]]
			-- upvalues: loop (copy), self (copy), DeferResult (ref)
			if not pcall(loop) and self._globalTimer == DeferResult then
				self._globalTimer = nil
			end
		end)
		self._globalTimer = DeferResult
		
		return
	elseif not CurrentlyActiveGlobalLeaderboardViewersByUserIdEntry then
		self:_fetchUserScoreForUser(NextEntry)
	end
end

function PlatformLeaderboardCache:stopGlobalRefresh(p1) --[[ Line: 225 ]]
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

function PlatformLeaderboardCache:startFriendsRefresh(p1) --[[ Line: 240 ]]
	-- upvalues: PlatformLeaderboardFriendsJitterSeconds (copy), PlatformLeaderboardFriendsIntervalSeconds (copy)
	self._currentFriendsLeaderboardViewersById[p1] = true
	
	if not self._friendsTimer then
		local DeferResult = nil
		local Flag = true
		
		local function loop() --[[ Line: 253 ]]
			-- upvalues: self (copy), Flag (ref), PlatformLeaderboardFriendsJitterSeconds (upval), PlatformLeaderboardFriendsIntervalSeconds (upval), DeferResult (ref)
			repeat
				table.clear(self._friendsData)
				for i in self._currentFriendsLeaderboardViewersById do
					local RandomValue: number = if Flag then 0 else math.random(0, PlatformLeaderboardFriendsJitterSeconds)
					self._scheduler.spawn(function() --[[ Line: 258 ]]
						-- upvalues: self (upval), RandomValue (copy), i (copy)
						self._scheduler.wait(RandomValue)
						
						if self._currentFriendsLeaderboardViewersById[i] then
							self:_fetchFriendsLeaderboardForUser(i)
						end
					end)
				end
				Flag = false
				self._scheduler.wait((math.max(1, PlatformLeaderboardFriendsIntervalSeconds)))
			until self._friendsTimer ~= DeferResult
		end
		
		DeferResult = self._scheduler.defer(function() --[[ Line: 271 ]]
			-- upvalues: loop (copy), self (copy), DeferResult (ref)
			if not pcall(loop) and self._friendsTimer == DeferResult then
				self._friendsTimer = nil
			end
		end)
		self._friendsTimer = DeferResult
		
		return
	elseif not self._friendsData[p1] then
		self:_fetchFriendsLeaderboardForUser(p1)
	end
end

function PlatformLeaderboardCache:stopFriendsRefresh(p1) --[[ Line: 280 ]]
	self._currentFriendsLeaderboardViewersById[p1] = nil
	
	if next(self._currentFriendsLeaderboardViewersById) then return end
	if self._friendsTimer then
		pcall(self._scheduler.cancel, self._friendsTimer)
		self._friendsTimer = nil
	end
end

function PlatformLeaderboardCache:forceRefresh(_config, p1) --[[ Line: 292 ]]
	self._config = _config
	
	if p1 then
		self._globalData = nil
		table.clear(self._globalEntriesByUserId)
		table.clear(self._friendsData)
		table.clear(self._userScoreEntries)
	end
	local NextEntry = next(self._currentlyActiveGlobalLeaderboardViewersByUserId)
	
	if self._globalTimer and NextEntry then
		pcall(self._scheduler.cancel, self._globalTimer)
		self._globalTimer = nil
		self:startGlobalRefresh(NextEntry)
	end
	if self._friendsTimer then
		pcall(self._scheduler.cancel, self._friendsTimer)
		self._friendsTimer = nil
		local List = {}
		
		for i in self._currentFriendsLeaderboardViewersById do
			table.insert(List, i)
		end
		table.clear(self._currentFriendsLeaderboardViewersById)
		
		for _, value in List do
			self:startFriendsRefresh(value)
		end
	end
end

function PlatformLeaderboardCache:cleanupForUserId(p2) --[[ Line: 329 ]]
	self:stopGlobalRefresh(p2)
	self:stopFriendsRefresh(p2)
end

function PlatformLeaderboardCache:teardown() --[[ Line: 334 ]]
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

function PlatformLeaderboardCache:destroy() --[[ Line: 351 ]]
	self:teardown()
end

return PlatformLeaderboardCache