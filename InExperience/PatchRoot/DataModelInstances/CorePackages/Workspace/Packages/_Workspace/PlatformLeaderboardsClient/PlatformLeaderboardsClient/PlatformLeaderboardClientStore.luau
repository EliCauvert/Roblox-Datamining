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

local function _() --[[ line: 79 | named "getPlayerPermissionsModule" ]]
	-- upvalues: coreGuiService (ref)
	local ok, status = pcall(function() --[[ line: 80 ]]
		-- upvalues: coreGuiService (copy)
		return require(coreGuiService:WaitForChild("RobloxGui").Modules.PlayerPermissionsModule)
	end)
	
	return if ok then status else nil
end

local _ = function() --[[ line: 87 | named "resolveIsLocalPlayerCreator" ]]
	-- upvalues: playersService (ref), coreGuiService (ref)
	local localPlayer = playersService.LocalPlayer
	
	if not localPlayer then
		return false
	end
	local ok, status = pcall(function() --[[ line: 80 ]]
		-- upvalues: coreGuiService (copy)
		return require(coreGuiService:WaitForChild("RobloxGui").Modules.PlayerPermissionsModule)
	end)
	local var13 = if ok then status else nil
	
	if var13 then
		local ok_1, status_1 = pcall(function() --[[ line: 96 ]]
			-- upvalues: var13 (ref), localPlayer (ref)
			return var13.CanPlayerManagePlaceAsync(localPlayer)
		end)
		
		return ok_1 and status_1 == true
	end
	return false
end

local t = {}
t.__index = t

function t.new() --[[ line: 132 ]]
	-- upvalues: signalsModule (ref), createSignalMap (ref), t (ref), robloxReplicatedStorageService (ref), platformLeaderboardPushWaitTimeoutSeconds (ref)
	local var14, var15 = signalsModule.createSignal(false)
	local var16, var17 = signalsModule.createSignal(nil)
	local var18, var19 = signalsModule.createSignal(nil)
	local var20, var21 = signalsModule.createSignal(nil)
	local var22, var23 = signalsModule.createSignal(nil)
	local var24, var25 = signalsModule.createSignal(nil)
	local var26, var27 = signalsModule.createSignal(nil)
	local var28, var29 = signalsModule.createSignal(nil)
	local tbl = setmetatable({
		_conn = nil,
		getHasActiveLeaderboard = var14,
		globalEntries = createSignalMap(),
		friendsEntries = createSignalMap(),
		getGlobalLastRefreshedAt = var16,
		getFriendsLastRefreshedAt = var18,
		getUserScore = var20,
		getUserRank = var22,
		getUnit = var24,
		getUserFriendRank = var26,
		getUserFriendScore = var28,
		_setHasActiveLeaderboard = var15,
		_setGlobalLastRefreshedAt = var17,
		_setFriendsLastRefreshedAt = var19,
		_setUserScore = var21,
		_setUserRank = var23,
		_setUnit = var25,
		_setUserFriendRank = var27,
		_setUserFriendScore = var29,
		_globalEntrySetters = {},
		_friendsEntrySetters = {}
	}, t)
	task.spawn(function() --[[ line: 166 ]]
		-- upvalues: robloxReplicatedStorageService (copy), platformLeaderboardPushWaitTimeoutSeconds (copy), tbl (ref)
		local platformLeaderboardPush = robloxReplicatedStorageService:WaitForChild("PlatformLeaderboardPush", platformLeaderboardPushWaitTimeoutSeconds)
		
		if platformLeaderboardPush then
			tbl._conn = platformLeaderboardPush.OnClientEvent:Connect(function(p0) --[[ line: 174 ]]
				-- upvalues: tbl (copy)
				tbl:_handleEvent(p0)
			end)
			
			return
		end
	end)
	
	return tbl
end

function t._updateEntries(_, p1, p2, p3) --[[ line: 182 ]]
	-- upvalues: signalsModule (ref)
	local t = {}
	
	for i, v in ipairs(p3) do
		local userId = v.userId
		t[userId] = true
		local var33 = p2[userId]
		
		if var33 then
			var33.setScore(v.score)
			var33.setRank(v.rank)
			local data = p1.getData(userId, false)
			
			if data and data.displayName ~= v.displayName then
				p1.setData(userId, {
					getScore = data.getScore,
					getRank = data.getRank,
					displayName = v.displayName
				}, false)
			end
		else
			local var35, var36 = signalsModule.createSignal(v.score)
			local var37, var38 = signalsModule.createSignal(v.rank)
			p2[userId] = { setScore = var36, setRank = var38 }
			p1.setData(userId, {
				getScore = var35,
				getRank = var37,
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

function t:_handleEvent(p4) --[[ line: 231 ]]
	-- upvalues: platformLeaderboardsExposure2EnabledV2 (ref), IXPService (ref), platformLeaderboardsExposure2Layer (ref), platformLeaderboardsIXPNoLeaderboardsShownV3 (ref), playersService (ref), coreGuiService (ref), platformLeaderboardLocalizedUnitEnabled (ref)
	if platformLeaderboardsExposure2EnabledV2 and p4.config ~= nil then
		IXPService:LogFlagLinkedUserLayerExposure(platformLeaderboardsExposure2Layer)
	end
	if platformLeaderboardsIXPNoLeaderboardsShownV3 then
		local var39
		local localPlayer = playersService.LocalPlayer
		
		if localPlayer then
			local ok, status = pcall(function() --[[ line: 80 ]]
				-- upvalues: coreGuiService (copy)
				return require(coreGuiService:WaitForChild("RobloxGui").Modules.PlayerPermissionsModule)
			end)
			local var40 = if ok then status else nil
			
			if var40 then
				local ok_1, status_1 = pcall(function() --[[ line: 96 ]]
					-- upvalues: var40 (ref), localPlayer (ref)
					return var40.CanPlayerManagePlaceAsync(localPlayer)
				end)
				var39 = ok_1 and status_1 == true
			else
				var39 = false
			end
		else
			var39 = false
		end
		if not var39 then return end
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

function t:_updateUserFriendRankAndScore(p5) --[[ line: 269 ]]
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	
	if not localPlayer then return end
	local userId = localPlayer.UserId
	
	for i, v in ipairs(p5) do
		if v.userId == userId then
			self._setUserFriendRank(v.rank)
			self._setUserFriendScore(v.score)
			
			return
		end
	end
	self._setUserFriendRank(nil)
	self._setUserFriendScore(nil)
end

function t._fetchLocalizedUnit(p6) --[[ line: 286 ]]
	-- upvalues: url (ref), httpRbxApiService (ref), httpService (ref)
	task.spawn(function() --[[ line: 287 ]]
		-- upvalues: url (copy), httpRbxApiService (copy), httpService (copy), p6 (ref)
		local ok = `{url.APIS_URL}platform-leaderboards-api/v1/universes/{game.GameId}/leaderboard/localized`
		ok, status = pcall(function() --[[ line: 291 ]]
			-- upvalues: httpRbxApiService (copy), ok (ref)
			return httpRbxApiService:GetAsyncFullUrl(ok)
		end)
		
		if not ok then
			warn("[PlatformLeaderboard] Failed to fetch localized unit:", tostring(status))
			
			return
		end
		local ok_1, status_1 = pcall(function() --[[ line: 299 ]]
			-- upvalues: httpService (copy), status (ref)
			return httpService:JSONDecode(status)
		end)
		
		if not ok_1 or typeof(status_1) ~= "table" then
			warn("[PlatformLeaderboard] Failed to decode localized unit response")
			
			return
		end
		local localizedUnit = status_1.localizedUnit
		
		if typeof(localizedUnit) == "string" then
			p6._setUnit(localizedUnit)
		end
	end)
end

function t.fireTabOpened(_, p7) --[[ line: 314 ]]
	-- upvalues: robloxReplicatedStorageService (ref)
	local platformLeaderboardTabOpened = robloxReplicatedStorageService:FindFirstChild("PlatformLeaderboardTabOpened")
	
	if platformLeaderboardTabOpened then
		platformLeaderboardTabOpened:FireServer({ tabType = p7 })
	end
end

function t.fireTabClosed(_, p8) --[[ line: 321 ]]
	-- upvalues: robloxReplicatedStorageService (ref)
	local platformLeaderboardTabClosed = robloxReplicatedStorageService:FindFirstChild("PlatformLeaderboardTabClosed")
	
	if platformLeaderboardTabClosed then
		platformLeaderboardTabClosed:FireServer({ tabType = p8 })
	end
end

function t:destroy() --[[ line: 328 ]]
	if self._conn then
		self._conn:Disconnect()
		self._conn = nil
	end
end

return t