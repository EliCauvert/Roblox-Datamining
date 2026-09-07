local coreGuiService = game:GetService("CoreGui")
local httpService = game:GetService("HttpService")
local httpRbxApiService = game:GetService("HttpRbxApiService")
local IXPService = game:GetService("IXPService")
local playersService = game:GetService("Players")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local platformLeaderboardPushWaitTimeoutSeconds = game:DefineFastInt("PlatformLeaderboardPushWaitTimeoutSeconds", 30)
local platformLeaderboardsExposure2EnabledV2 = game:DefineFastFlag("PlatformLeaderboardsExposure2Enabled_V2", false)
local platformLeaderboardsExposure2Layer = game:DefineFastString("PlatformLeaderboardsExposure2Layer", "Social.PlatformLeaderboardsExposure2")
local platformLeaderboardLocalizedUnitEnabled = game:DefineFastFlag("PlatformLeaderboardLocalizedUnitEnabled", false)
local platformLeaderboardsIXPNoLeaderboardsShownV3 = game:DefineFastFlag("PlatformLeaderboardsIXPNoLeaderboardsShown_V3", false)
local parent = script.Parent.Parent
local signalsModule = require(parent.Signals)
local url = require(parent.CoreScriptsCommon).Url
local createSignalMap = require(parent.CoreScriptsRoactCommon).Utilities.createSignalMap

local function _()
	-- upvalues: coreGuiService (ref)
	local ok, status = pcall(function()
		-- upvalues: coreGuiService (copy)
		return require(coreGuiService:WaitForChild("RobloxGui").Modules.PlayerPermissionsModule)
	end)
	
	return if ok then status else nil
end

local _ = function()
	-- upvalues: playersService (ref), coreGuiService (ref)
	local localPlayer = playersService.LocalPlayer
	
	if not localPlayer then
		return false
	end
	local ok, status = pcall(function()
		-- upvalues: coreGuiService (copy)
		return require(coreGuiService:WaitForChild("RobloxGui").Modules.PlayerPermissionsModule)
	end)
	local var1 = if ok then status else nil
	
	if var1 then
		local ok_1, status_1 = pcall(function()
			-- upvalues: var1 (ref), localPlayer (ref)
			return var1.CanPlayerManagePlaceAsync(localPlayer)
		end)
		
		return ok_1 and status_1 == true
	end
	return false
end

local t = {}
t.__index = t

function t.new()
	-- upvalues: signalsModule (ref), createSignalMap (ref), t (ref), robloxReplicatedStorageService (ref), platformLeaderboardPushWaitTimeoutSeconds (ref)
	local var1, var2 = signalsModule.createSignal(false)
	local var3, var4 = signalsModule.createSignal(nil)
	local var5, var6 = signalsModule.createSignal(nil)
	local var7, var8 = signalsModule.createSignal(nil)
	local var9, var10 = signalsModule.createSignal(nil)
	local var11, var12 = signalsModule.createSignal(nil)
	local var13, var14 = signalsModule.createSignal(nil)
	local var15, var16 = signalsModule.createSignal(nil)
	local tbl = setmetatable({
		_conn = nil,
		getHasActiveLeaderboard = var1,
		globalEntries = createSignalMap(),
		friendsEntries = createSignalMap(),
		getGlobalLastRefreshedAt = var3,
		getFriendsLastRefreshedAt = var5,
		getUserScore = var7,
		getUserRank = var9,
		getUnit = var11,
		getUserFriendRank = var13,
		getUserFriendScore = var15,
		_setHasActiveLeaderboard = var2,
		_setGlobalLastRefreshedAt = var4,
		_setFriendsLastRefreshedAt = var6,
		_setUserScore = var8,
		_setUserRank = var10,
		_setUnit = var12,
		_setUserFriendRank = var14,
		_setUserFriendScore = var16,
		_globalEntrySetters = {},
		_friendsEntrySetters = {}
	}, t)
	task.spawn(function()
		-- upvalues: robloxReplicatedStorageService (copy), platformLeaderboardPushWaitTimeoutSeconds (copy), tbl (ref)
		local platformLeaderboardPush = robloxReplicatedStorageService:WaitForChild("PlatformLeaderboardPush", platformLeaderboardPushWaitTimeoutSeconds)
		
		if platformLeaderboardPush then
			tbl._conn = platformLeaderboardPush.OnClientEvent:Connect(function(p1)
				-- upvalues: tbl (copy)
				tbl:_handleEvent(p1)
			end)
			
			return
		end
	end)
	
	return tbl
end

function t._updateEntries(_, p1, p2, p3)
	-- upvalues: signalsModule (ref)
	local t = {}
	
	for i, v in ipairs(p3) do
		local userId = v.userId
		t[userId] = true
		local var1 = p2[userId]
		
		if var1 then
			var1.setScore(v.score)
			var1.setRank(v.rank)
			local data = p1.getData(userId, false)
			
			if data and data.displayName ~= v.displayName then
				p1.setData(userId, {
					getScore = data.getScore,
					getRank = data.getRank,
					displayName = v.displayName
				}, false)
			end
		else
			local var2, var3 = signalsModule.createSignal(v.score)
			local var4, var5 = signalsModule.createSignal(v.rank)
			p2[userId] = { setScore = var3, setRank = var5 }
			p1.setData(userId, {
				getScore = var2,
				getRank = var4,
				displayName = v.displayName
			}, false)
		end
	end
	for i_1, v_1 in pairs(p1.getAllData(false)) do
		if not t[i_1] then
			p1.removeData(i_1, false)
			p2[i_1] = nil
		end
	end
end

function t:_handleEvent(p4)
	-- upvalues: platformLeaderboardsExposure2EnabledV2 (ref), IXPService (ref), platformLeaderboardsExposure2Layer (ref), platformLeaderboardsIXPNoLeaderboardsShownV3 (ref), playersService (ref), coreGuiService (ref), platformLeaderboardLocalizedUnitEnabled (ref)
	if platformLeaderboardsExposure2EnabledV2 and p4.config ~= nil then
		IXPService:LogFlagLinkedUserLayerExposure(platformLeaderboardsExposure2Layer)
	end
	if platformLeaderboardsIXPNoLeaderboardsShownV3 then
		local var6
		local localPlayer = playersService.LocalPlayer
		
		if localPlayer then
			local ok, status = pcall(function()
				-- upvalues: coreGuiService (copy)
				return require(coreGuiService:WaitForChild("RobloxGui").Modules.PlayerPermissionsModule)
			end)
			local var7 = if ok then status else nil
			
			if var7 then
				local ok_1, status_1 = pcall(function()
					-- upvalues: var7 (ref), localPlayer (ref)
					return var7.CanPlayerManagePlaceAsync(localPlayer)
				end)
				var6 = ok_1 and status_1 == true
			else
				var6 = false
			end
		else
			var6 = false
		end
		if not var6 then return end
	end
	if p4.type == "CONFIG_UPDATE" then
		self._setHasActiveLeaderboard(p4.config ~= nil)
		self._setUnit(if p4.config then p4.config.unit else nil)
		
		if platformLeaderboardLocalizedUnitEnabled and p4.config then
			self:_fetchLocalizedUnit()
			
			return
		end
	elseif p4.type == "GLOBAL_LEADERBOARD_DATA" then
		if p4.data then
			self:_updateEntries(self.globalEntries, self._globalEntrySetters, p4.data.entries)
			self._setGlobalLastRefreshedAt(p4.data.lastRefreshedAt)
			
			return
		end
	elseif p4.type == "FRIENDS_LEADERBOARD_DATA" then
		if p4.data then
			self:_updateEntries(self.friendsEntries, self._friendsEntrySetters, p4.data.entries)
			self._setFriendsLastRefreshedAt(p4.data.lastRefreshedAt)
			
			if platformLeaderboardLocalizedUnitEnabled then
				self:_updateUserFriendRankAndScore(p4.data.entries)
				
				return
			end
		end
	elseif p4.type == "USER_SCORE" then
		if p4.entry then
			self._setUserScore(p4.entry.score)
			self._setUserRank(p4.entry.rank)
			
			return
		end
		self._setUserScore(nil)
		self._setUserRank(nil)
	end
end

function t:_updateUserFriendRankAndScore(p4)
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	
	if not localPlayer then return end
	local userId = localPlayer.UserId
	
	for i, v in ipairs(p4) do
		if v.userId == userId then
			self._setUserFriendRank(v.rank)
			self._setUserFriendScore(v.score)
			
			return
		end
	end
	self._setUserFriendRank(nil)
	self._setUserFriendScore(nil)
end

function t._fetchLocalizedUnit(p5)
	-- upvalues: url (ref), httpRbxApiService (ref), httpService (ref)
	task.spawn(function()
		-- upvalues: url (copy), httpRbxApiService (copy), httpService (copy), p5 (ref)
		local ok = `{url.APIS_URL}platform-leaderboards-api/v1/universes/{game.GameId}/leaderboard/localized`
		ok, status = pcall(function()
			-- upvalues: httpRbxApiService (copy), ok (ref)
			return httpRbxApiService:GetAsyncFullUrl(ok)
		end)
		
		if not ok then
			warn("[PlatformLeaderboard] Failed to fetch localized unit:", tostring(status))
			
			return
		end
		local ok_1, status_1 = pcall(function()
			-- upvalues: httpService (copy), status (ref)
			return httpService:JSONDecode(status)
		end)
		
		if not ok_1 or typeof(status_1) ~= "table" then
			warn("[PlatformLeaderboard] Failed to decode localized unit response")
			
			return
		end
		local localizedUnit = status_1.localizedUnit
		
		if typeof(localizedUnit) == "string" then
			p5._setUnit(localizedUnit)
		end
	end)
end

function t.fireTabOpened(_, p5)
	-- upvalues: robloxReplicatedStorageService (ref)
	local platformLeaderboardTabOpened = robloxReplicatedStorageService:FindFirstChild("PlatformLeaderboardTabOpened")
	
	if platformLeaderboardTabOpened then
		platformLeaderboardTabOpened:FireServer({ tabType = p5 })
	end
end

function t.fireTabClosed(_, p5)
	-- upvalues: robloxReplicatedStorageService (ref)
	local platformLeaderboardTabClosed = robloxReplicatedStorageService:FindFirstChild("PlatformLeaderboardTabClosed")
	
	if platformLeaderboardTabClosed then
		platformLeaderboardTabClosed:FireServer({ tabType = p5 })
	end
end

function t:destroy()
	if self._conn then
		self._conn:Disconnect()
		self._conn = nil
	end
end

return t