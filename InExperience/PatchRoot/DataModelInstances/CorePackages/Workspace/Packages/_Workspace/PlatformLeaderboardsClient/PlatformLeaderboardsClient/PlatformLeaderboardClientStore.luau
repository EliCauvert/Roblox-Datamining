local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local IXPService = game:GetService("IXPService")
local Players = game:GetService("Players")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local PlatformLeaderboardPushWaitTimeoutSeconds = game:DefineFastInt("PlatformLeaderboardPushWaitTimeoutSeconds", 30)
local PlatformLeaderboardsExposure2EnabledV2 = game:DefineFastFlag("PlatformLeaderboardsExposure2Enabled_V2", false)
local PlatformLeaderboardsExposure2Layer = game:DefineFastString("PlatformLeaderboardsExposure2Layer", "Social.PlatformLeaderboardsExposure2")
local PlatformLeaderboardLocalizedUnitEnabled = game:DefineFastFlag("PlatformLeaderboardLocalizedUnitEnabled", false)
local PlatformLeaderboardBadgeMetadataEnabled = game:DefineFastFlag("PlatformLeaderboardBadgeMetadataEnabled", false)
local PlatformLeaderboardsIXPNoLeaderboardsShownV3 = game:DefineFastFlag("PlatformLeaderboardsIXPNoLeaderboardsShown_V3", false)
local Parent = script.Parent.Parent
local SignalsModule = require(Parent.Signals)
local Url = require(Parent.CoreScriptsCommon).Url
local CreateSignalMapFunction = require(Parent.CoreScriptsRoactCommon).Utilities.createSignalMap

local function _() --[[ Line: 85 | Named "getPlayerPermissionsModule" ]]
	-- upvalues: CoreGui (copy)
	local Success, Result = pcall(function() --[[ Line: 86 ]]
		-- upvalues: CoreGui (upval)
		return require(CoreGui:WaitForChild("RobloxGui").Modules.PlayerPermissionsModule)
	end)
	
	return if Success then Result else nil
end

local _ = function(): boolean --[[ Line: 93 | Named "resolveIsLocalPlayerCreator" ]]
	-- upvalues: Players (copy), CoreGui (copy)
	local LocalPlayer = Players.LocalPlayer
	
	if not LocalPlayer then
		return false
	end
	local Success, Result = pcall(function() --[[ Line: 86 ]]
		-- upvalues: CoreGui (upval)
		return require(CoreGui:WaitForChild("RobloxGui").Modules.PlayerPermissionsModule)
	end)
	local Result1 = if Success then Result else nil
	
	if Result1 then
		local Success1, Result2 = pcall(function() --[[ Line: 102 ]]
			-- upvalues: Result1 (copy), LocalPlayer (copy)
			return Result1.CanPlayerManagePlaceAsync(LocalPlayer)
		end)
		
		return Success1 and Result2 == true
	else
		return false
	end
end

local PlatformLeaderboardClientStore = {}
PlatformLeaderboardClientStore.__index = PlatformLeaderboardClientStore

function PlatformLeaderboardClientStore.new() --[[ Line: 143 ]]
	-- upvalues: SignalsModule (copy), PlatformLeaderboardBadgeMetadataEnabled (copy), CreateSignalMapFunction (copy), PlatformLeaderboardClientStore (copy), RobloxReplicatedStorage (copy), PlatformLeaderboardPushWaitTimeoutSeconds (copy)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	local Signal1, Signal2_1 = SignalsModule.createSignal(nil)
	local Signal3, Signal2_2 = SignalsModule.createSignal(nil)
	local Signal4, Signal2_3 = SignalsModule.createSignal(nil)
	local Signal5, Signal2_4 = SignalsModule.createSignal(nil)
	local Signal6, Signal2_5 = SignalsModule.createSignal(nil)
	local Signal7, Signal2_6 = SignalsModule.createSignal(nil)
	local Signal8, Signal2_7 = SignalsModule.createSignal(nil)
	local GetUserIsVerified = nil
	local _setUserIsVerified = nil
	local GetUserHasRobloxSubscription = nil
	local _setUserHasRobloxSubscription = nil
	
	if PlatformLeaderboardBadgeMetadataEnabled then
		GetUserIsVerified, _setUserIsVerified = SignalsModule.createSignal(nil)
		GetUserHasRobloxSubscription, _setUserHasRobloxSubscription = SignalsModule.createSignal(nil)
	end
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
		getUserFriendRank = Signal7,
		getUserFriendScore = Signal8,
		getUserIsVerified = GetUserIsVerified,
		getUserHasRobloxSubscription = GetUserHasRobloxSubscription,
		_setHasActiveLeaderboard = Signal2,
		_setGlobalLastRefreshedAt = Signal2_1,
		_setFriendsLastRefreshedAt = Signal2_2,
		_setUserScore = Signal2_3,
		_setUserRank = Signal2_4,
		_setUnit = Signal2_5,
		_setUserFriendRank = Signal2_6,
		_setUserFriendScore = Signal2_7,
		_setUserIsVerified = _setUserIsVerified,
		_setUserHasRobloxSubscription = _setUserHasRobloxSubscription,
		_globalEntrySetters = {},
		_friendsEntrySetters = {}
	}, PlatformLeaderboardClientStore)
	task.spawn(function() --[[ Line: 187 ]]
		-- upvalues: RobloxReplicatedStorage (upval), PlatformLeaderboardPushWaitTimeoutSeconds (upval), self (copy)
		local PlatformLeaderboardPush = RobloxReplicatedStorage:WaitForChild("PlatformLeaderboardPush", PlatformLeaderboardPushWaitTimeoutSeconds)
		
		if PlatformLeaderboardPush then
			self._conn = PlatformLeaderboardPush.OnClientEvent:Connect(function(p1) --[[ Line: 195 ]]
				-- upvalues: self (upval)
				self:_handleEvent(p1)
			end)
			
			return
		end
	end)
	
	return self
end

function PlatformLeaderboardClientStore:_updateEntries(FriendsEntries, FriendsEntrySetters, Entries) --[[ Line: 203 ]]
	-- upvalues: PlatformLeaderboardBadgeMetadataEnabled (copy), SignalsModule (copy)
	local t = {}
	
	for _, entry in ipairs(Entries) do
		local UserId = entry.userId
		t[UserId] = true
		local FriendsEntrySetter = FriendsEntrySetters[UserId]
		
		if FriendsEntrySetter then
			FriendsEntrySetter.setScore(entry.score)
			FriendsEntrySetter.setRank(entry.rank)
			local Data = FriendsEntries.getData(UserId, false)
			
			if Data and (Data.displayName ~= entry.displayName or PlatformLeaderboardBadgeMetadataEnabled and (Data.isVerified ~= entry.isVerified or Data.hasRobloxSubscription ~= entry.hasRobloxSubscription)) then
				FriendsEntries.setData(UserId, {
					getScore = Data.getScore,
					getRank = Data.getRank,
					displayName = entry.displayName,
					isVerified = if PlatformLeaderboardBadgeMetadataEnabled then entry.isVerified else nil,
					hasRobloxSubscription = if PlatformLeaderboardBadgeMetadataEnabled then entry.hasRobloxSubscription else nil
				}, false)
			end
		else
			local Signal, Signal2 = SignalsModule.createSignal(entry.score)
			local Signal1, Signal2_1 = SignalsModule.createSignal(entry.rank)
			FriendsEntrySetters[UserId] = { setScore = Signal2, setRank = Signal2_1 }
			FriendsEntries.setData(UserId, {
				getScore = Signal,
				getRank = Signal1,
				displayName = entry.displayName,
				isVerified = if PlatformLeaderboardBadgeMetadataEnabled then entry.isVerified else nil,
				hasRobloxSubscription = if PlatformLeaderboardBadgeMetadataEnabled then entry.hasRobloxSubscription else nil
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

function PlatformLeaderboardClientStore:_handleEvent(p1) --[[ Line: 272 ]]
	-- upvalues: PlatformLeaderboardsExposure2EnabledV2 (copy), IXPService (copy), PlatformLeaderboardsExposure2Layer (copy), PlatformLeaderboardsIXPNoLeaderboardsShownV3 (copy), Players (copy), CoreGui (copy), PlatformLeaderboardLocalizedUnitEnabled (copy), PlatformLeaderboardBadgeMetadataEnabled (copy)
	if PlatformLeaderboardsExposure2EnabledV2 and p1.config ~= nil then
		IXPService:LogFlagLinkedUserLayerExposure(PlatformLeaderboardsExposure2Layer)
	end
	if PlatformLeaderboardsIXPNoLeaderboardsShownV3 then
		local LocalPlayer = Players.LocalPlayer
		local Flag = nil
		
		if LocalPlayer then
			local Success, Result = pcall(function() --[[ Line: 86 ]]
				-- upvalues: CoreGui (upval)
				return require(CoreGui:WaitForChild("RobloxGui").Modules.PlayerPermissionsModule)
			end)
			local Result1 = if Success then Result else nil
			
			if Result1 then
				local Result2
				Flag, Result2 = pcall(function() --[[ Line: 102 ]]
					-- upvalues: Result1 (copy), LocalPlayer (copy)
					return Result1.CanPlayerManagePlaceAsync(LocalPlayer)
				end)
				
				if Flag then
					Flag = Result2 == true
				end
			else
				Flag = false
			end
		else
			Flag = false
		end
		if not Flag then return end
	end
	if p1.type == "CONFIG_UPDATE" then
		self._setHasActiveLeaderboard(p1.config ~= nil)
		self._setUnit(if p1.config then p1.config.unit else nil)
		
		if PlatformLeaderboardLocalizedUnitEnabled and p1.config then
			self:_fetchLocalizedUnit()
			
			return
		end
	elseif p1.type == "GLOBAL_LEADERBOARD_DATA" then
		if p1.data then
			self:_updateEntries(self.globalEntries, self._globalEntrySetters, p1.data.entries)
			self._setGlobalLastRefreshedAt(p1.data.lastRefreshedAt)
			
			return
		end
	elseif p1.type == "FRIENDS_LEADERBOARD_DATA" then
		if p1.data then
			self:_updateEntries(self.friendsEntries, self._friendsEntrySetters, p1.data.entries)
			self._setFriendsLastRefreshedAt(p1.data.lastRefreshedAt)
			
			if PlatformLeaderboardLocalizedUnitEnabled then
				self:_updateUserFriendRankAndScore(p1.data.entries)
				
				return
			end
		end
	elseif p1.type == "USER_SCORE" then
		if p1.entry then
			self._setUserScore(p1.entry.score)
			self._setUserRank(p1.entry.rank)
			
			if PlatformLeaderboardBadgeMetadataEnabled then
				self._setUserIsVerified(p1.entry.isVerified)
				self._setUserHasRobloxSubscription(p1.entry.hasRobloxSubscription)
				
				return
			end
		else
			self._setUserScore(nil)
			self._setUserRank(nil)
			
			if PlatformLeaderboardBadgeMetadataEnabled then
				self._setUserIsVerified(nil)
				self._setUserHasRobloxSubscription(nil)
			end
		end
	end
end

function PlatformLeaderboardClientStore:_updateUserFriendRankAndScore(Entries) --[[ Line: 318 ]]
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	
	if not LocalPlayer then return end
	local UserId = LocalPlayer.UserId
	
	for _, entry in ipairs(Entries) do
		if entry.userId == UserId then
			self._setUserFriendRank(entry.rank)
			self._setUserFriendScore(entry.score)
			
			return
		end
	end
	self._setUserFriendRank(nil)
	self._setUserFriendScore(nil)
end

function PlatformLeaderboardClientStore._fetchLocalizedUnit(p1) --[[ Line: 335 ]]
	-- upvalues: Url (copy), HttpRbxApiService (copy), HttpService (copy)
	task.spawn(function() --[[ Line: 336 ]]
		-- upvalues: Url (upval), HttpRbxApiService (upval), HttpService (upval), p1 (copy)
		local LeaderboardsName: string = `{Url.APIS_URL}platform-leaderboards-api/v1/universes/{game.GameId}/leaderboard/localized`
		local Success, Result = pcall(function() --[[ Line: 340 ]]
			-- upvalues: HttpRbxApiService (upval), LeaderboardsName (copy)
			return HttpRbxApiService:GetAsyncFullUrl(LeaderboardsName)
		end)
		
		if not Success then
			warn("[PlatformLeaderboard] Failed to fetch localized unit:", (tostring(Result)))
			
			return
		end
		local Success1, Result1 = pcall(function() --[[ Line: 348 ]]
			-- upvalues: HttpService (upval), Result (copy)
			return HttpService:JSONDecode(Result)
		end)
		
		if not Success1 or typeof(Result1) ~= "table" then
			warn("[PlatformLeaderboard] Failed to decode localized unit response")
			
			return
		end
		local LocalizedUnit = Result1.localizedUnit
		
		if typeof(LocalizedUnit) == "string" then
			p1._setUnit(LocalizedUnit)
		end
	end)
end

function PlatformLeaderboardClientStore:fireTabOpened(TabType) --[[ Line: 363 ]]
	-- upvalues: RobloxReplicatedStorage (copy)
	local PlatformLeaderboardTabOpened = RobloxReplicatedStorage:FindFirstChild("PlatformLeaderboardTabOpened")
	
	if PlatformLeaderboardTabOpened then
		PlatformLeaderboardTabOpened:FireServer({ tabType = TabType })
	end
end

function PlatformLeaderboardClientStore:fireTabClosed(TabType) --[[ Line: 370 ]]
	-- upvalues: RobloxReplicatedStorage (copy)
	local PlatformLeaderboardTabClosed = RobloxReplicatedStorage:FindFirstChild("PlatformLeaderboardTabClosed")
	
	if PlatformLeaderboardTabClosed then
		PlatformLeaderboardTabClosed:FireServer({ tabType = TabType })
	end
end

function PlatformLeaderboardClientStore:destroy() --[[ Line: 377 ]]
	if self._conn then
		self._conn:Disconnect()
		self._conn = nil
	end
end

return PlatformLeaderboardClientStore