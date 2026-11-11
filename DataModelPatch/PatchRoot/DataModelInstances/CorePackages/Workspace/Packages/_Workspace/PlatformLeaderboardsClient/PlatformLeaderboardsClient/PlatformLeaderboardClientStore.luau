local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local PlatformLeaderboardPushWaitTimeoutSeconds = game:DefineFastInt("PlatformLeaderboardPushWaitTimeoutSeconds", 30)
local Parent = script.Parent.Parent
local SignalsModule = require(Parent.Signals)
local CreateSignalMapFunction = require(Parent.CoreScriptsRoactCommon).Utilities.createSignalMap
local PlatformLeaderboardClientStore = {}
PlatformLeaderboardClientStore.__index = PlatformLeaderboardClientStore

function PlatformLeaderboardClientStore.new()
	-- upvalues: SignalsModule (copy), CreateSignalMapFunction (copy), PlatformLeaderboardClientStore (copy), RobloxReplicatedStorage (copy), PlatformLeaderboardPushWaitTimeoutSeconds (copy)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	local Signal1, Signal2_1 = SignalsModule.createSignal(nil)
	local Signal3, Signal2_2 = SignalsModule.createSignal(nil)
	local Signal4, Signal2_3 = SignalsModule.createSignal(nil)
	local Signal5, Signal2_4 = SignalsModule.createSignal(nil)
	local Signal6, Signal2_5 = SignalsModule.createSignal(nil)
	local self = setmetatable({
		_conn = nil,
		getHasActiveLeaderboard = Signal,
		globalEntries = CreateSignalMapFunction(),
		friendsEntries = CreateSignalMapFunction(),
		getGlobalLastRefreshedAt = Signal1,
		getFriendsLastRefreshedAt = Signal3,
		getUserScore = Signal4,
		getUserRank = Signal5,
		getUnit = Signal6,
		_setHasActiveLeaderboard = Signal2,
		_setGlobalLastRefreshedAt = Signal2_1,
		_setFriendsLastRefreshedAt = Signal2_2,
		_setUserScore = Signal2_3,
		_setUserRank = Signal2_4,
		_setUnit = Signal2_5,
		_globalEntrySetters = {},
		_friendsEntrySetters = {}
	}, PlatformLeaderboardClientStore)
	task.spawn(function()
		-- upvalues: RobloxReplicatedStorage (upval), PlatformLeaderboardPushWaitTimeoutSeconds (upval), self (copy)
		local PlatformLeaderboardPush = RobloxReplicatedStorage:WaitForChild("PlatformLeaderboardPush", PlatformLeaderboardPushWaitTimeoutSeconds)
		
		if PlatformLeaderboardPush then
			self._conn = PlatformLeaderboardPush.OnClientEvent:Connect(function(p1)
				-- upvalues: self (upval)
				self:_handleEvent(p1)
			end)
			
			return
		end
	end)
	
	return self
end

function PlatformLeaderboardClientStore:_updateEntries(FriendsEntries, FriendsEntrySetters, Entries)
	-- upvalues: SignalsModule (copy)
	local t = {}
	
	for _, entry in ipairs(Entries) do
		local UserId = entry.userId
		t[UserId] = true
		local FriendsEntrySetter = FriendsEntrySetters[UserId]
		
		if FriendsEntrySetter then
			FriendsEntrySetter.setScore(entry.score)
			FriendsEntrySetter.setRank(entry.rank)
			local Data = FriendsEntries.getData(UserId, false)
			
			if Data and Data.displayName ~= entry.displayName then
				FriendsEntries.setData(UserId, {
					getScore = Data.getScore,
					getRank = Data.getRank,
					displayName = entry.displayName
				}, false)
			end
		else
			local Signal, Signal2 = SignalsModule.createSignal(entry.score)
			local Signal1, Signal2_1 = SignalsModule.createSignal(entry.rank)
			FriendsEntrySetters[UserId] = { setScore = Signal2, setRank = Signal2_1 }
			FriendsEntries.setData(UserId, {
				getScore = Signal,
				getRank = Signal1,
				displayName = entry.displayName
			}, false)
		end
	end
	for i, _ in pairs((FriendsEntries.getAllData(false))) do
		if not t[i] then
			FriendsEntries.removeData(i, false)
			FriendsEntrySetters[i] = nil
		end
	end
end

function PlatformLeaderboardClientStore:_handleEvent(p1)
	if p1.type == "CONFIG_UPDATE" then
		self._setHasActiveLeaderboard(p1.config ~= nil)
		self._setUnit(if p1.config then p1.config.unit else nil)
		
		return
	end
	if p1.type == "GLOBAL_LEADERBOARD_DATA" then
		if p1.data then
			self:_updateEntries(self.globalEntries, self._globalEntrySetters, p1.data.entries)
			self._setGlobalLastRefreshedAt(p1.data.lastRefreshedAt)
			
			return
		end
	elseif p1.type == "FRIENDS_LEADERBOARD_DATA" then
		if p1.data then
			self:_updateEntries(self.friendsEntries, self._friendsEntrySetters, p1.data.entries)
			self._setFriendsLastRefreshedAt(p1.data.lastRefreshedAt)
			
			return
		end
	elseif p1.type == "USER_SCORE" then
		if p1.entry then
			self._setUserScore(p1.entry.score)
			self._setUserRank(p1.entry.rank)
			
			return
		end
		self._setUserScore(nil)
		self._setUserRank(nil)
	end
end

function PlatformLeaderboardClientStore:fireTabOpened(TabType)
	-- upvalues: RobloxReplicatedStorage (copy)
	local PlatformLeaderboardTabOpened = RobloxReplicatedStorage:FindFirstChild("PlatformLeaderboardTabOpened")
	
	if PlatformLeaderboardTabOpened then
		PlatformLeaderboardTabOpened:FireServer({ tabType = TabType })
	end
end

function PlatformLeaderboardClientStore:fireTabClosed(TabType)
	-- upvalues: RobloxReplicatedStorage (copy)
	local PlatformLeaderboardTabClosed = RobloxReplicatedStorage:FindFirstChild("PlatformLeaderboardTabClosed")
	
	if PlatformLeaderboardTabClosed then
		PlatformLeaderboardTabClosed:FireServer({ tabType = TabType })
	end
end

function PlatformLeaderboardClientStore:destroy()
	if self._conn then
		self._conn:Disconnect()
		self._conn = nil
	end
end

return PlatformLeaderboardClientStore