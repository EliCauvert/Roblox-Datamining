local httpService = game:GetService("HttpService")
local httpRbxApiService = game:GetService("HttpRbxApiService")
local playersService = game:GetService("Players")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local _ = game:GetService("RunService")
local chatService = game:GetService("Chat")
local textChatService = game:GetService("TextChatService")
local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local url = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).Url
game:DefineFastFlag("EnableSetUserBlocklistInitialized", false)
local fFlagInExperienceUserProfileSettingsEnabledModule = require(robloxGui.Modules.Common.Flags.FFlagInExperienceUserProfileSettingsEnabled)
local fFlagInExperienceRequestProfileSettingsModule = require(robloxGui.Modules.Common.Flags.FFlagInExperienceRequestProfileSettings)
local fStringRccInExperienceNameEnabledAllowListModule = require(robloxGui.Modules.Common.Flags.FStringRccInExperienceNameEnabledAllowList)
local useNewDirectChatAPI = game:DefineFastFlag("UseNewDirectChatAPI", false)
local enableCreatePartyNudge = game:DefineFastFlag("EnableCreatePartyNudge", false)
local enableCreatePartyNudgeWithVersion = game:DefineFastFlag("EnableCreatePartyNudgeWithVersion", false)
local fFlagEnablePartyNudgeAfterJoin = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnablePartyNudgeAfterJoin
local fFlagBadgeVisibilitySettingEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagBadgeVisibilitySettingEnabled
local fFlagEnableModerateChatRemoteEvent = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableModerateChatRemoteEvent
local fFlagEnableSummarySystemMessageOnLua = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableSummarySystemMessageOnLua
local fFlagAIRephraseSettingEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagAIRephraseSettingEnabled
local fFlagChatSummariesSettingEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagChatSummariesSettingEnabled
local profileSettingsSlidingWindowRateLimit = game:DefineFastFlag("ProfileSettingsSlidingWindowRateLimit", false)
local profileSettingsRateLimitSeconds = game:DefineFastInt("ProfileSettingsRateLimitSeconds", 5)
local profileSettingsMaxRequestsPerWindow = game:DefineFastInt("ProfileSettingsMaxRequestsPerWindow", 3)
local profileSettingsRateLimitWindowSeconds = game:DefineFastInt("ProfileSettingsRateLimitWindowSeconds", 60)
local disableRCCAntiHarrasmentAllowList = game:DefineFastFlag("DisableRCCAntiHarrasmentAllowList", false)
local luaGetCanManageAsync = game:DefineFastFlag("UseGetCanManageAsync", false) and game:GetEngineFeature("LuaGetCanManageAsync")
local fFlagUserPresenceTokenRccCheckPermissionsLuaModule = require(robloxGui.Modules.Common.Flags.FFlagUserPresenceTokenRccCheckPermissionsLua)
local gatePrivateServerNudge = game:DefineFastFlag("GatePrivateServerNudge", false)
local globalUserBlockingLuaReadsFromSCMCache = game:DefineFastFlag("GlobalUserBlockingLuaReadsFromSCMCache", false)
local t = {}
local t_1 = {
	Admin = { GroupId = 1200769 },
	Intern = { GroupId = 2868472, GroupRank = 100 },
	Star = { GroupId = 4199740 },
	SpanishLocalizationExpert = { GroupId = 4265462, GroupRank = 252 },
	BrazilianLocalizationExpert = { GroupId = 4265456, GroupRank = 252 },
	FrenchLocalizationExpert = { GroupId = 4265443, GroupRank = 252 },
	GermanLocalizationExpert = { GroupId = 4265449, GroupRank = 252 }
}

if game.CreatorType == Enum.CreatorType.Group then
	t_1.PlaceCreator = { GroupRank = 255, GroupId = game.CreatorId }
end
local t_2 = {}
local t_3 = {}
local t_4 = {}
local t_5 = {}
local t_6 = {}
game:DefineFastInt("MaxBlockListSize", 500)
local canChatWith = Instance.new("RemoteEvent")
canChatWith.Name = "CanChatWith"
canChatWith.Parent = robloxReplicatedStorageService
local setPlayerBlockList = Instance.new("RemoteEvent")
setPlayerBlockList.Name = "SetPlayerBlockList"
setPlayerBlockList.Parent = robloxReplicatedStorageService
local updatePlayerBlockList = Instance.new("RemoteEvent")
updatePlayerBlockList.Name = "UpdatePlayerBlockList"
updatePlayerBlockList.Parent = robloxReplicatedStorageService
local newPlayerGroupDetails = Instance.new("RemoteEvent")
newPlayerGroupDetails.Name = "NewPlayerGroupDetails"
newPlayerGroupDetails.Parent = robloxReplicatedStorageService
local newPlayerCanManageDetails = Instance.new("RemoteEvent")
newPlayerCanManageDetails.Name = "NewPlayerCanManageDetails"
newPlayerCanManageDetails.Parent = robloxReplicatedStorageService
local sendPlayerBlockList = Instance.new("RemoteEvent")
sendPlayerBlockList.Name = "SendPlayerBlockList"
sendPlayerBlockList.Parent = robloxReplicatedStorageService
local updateLocalPlayerBlockList = Instance.new("RemoteEvent")
updateLocalPlayerBlockList.Name = "UpdateLocalPlayerBlockList"
updateLocalPlayerBlockList.Parent = robloxReplicatedStorageService
local sendPlayerProfileSettings = Instance.new("RemoteEvent")
sendPlayerProfileSettings.Name = "SendPlayerProfileSettings"
sendPlayerProfileSettings.Parent = robloxReplicatedStorageService
local requestPlayerProfileSettings = nil

if fFlagInExperienceRequestProfileSettingsModule then
	requestPlayerProfileSettings = Instance.new("RemoteEvent")
	requestPlayerProfileSettings.Name = "RequestPlayerProfileSettings"
	requestPlayerProfileSettings.Parent = robloxReplicatedStorageService
end
local updatePlayerProfileSettings = nil

if fFlagBadgeVisibilitySettingEnabled then
	updatePlayerProfileSettings = Instance.new("RemoteEvent")
	updatePlayerProfileSettings.Name = "UpdatePlayerProfileSettings"
	updatePlayerProfileSettings.Parent = robloxReplicatedStorageService
end
local showFriendJoinedPlayerToast = nil
local showPlayerJoinedFriendsToast = nil

if fFlagEnablePartyNudgeAfterJoin then
	showPlayerJoinedFriendsToast = Instance.new("RemoteEvent")
	showPlayerJoinedFriendsToast.Name = "ShowPlayerJoinedFriendsToast"
	showPlayerJoinedFriendsToast.Parent = robloxReplicatedStorageService
	showFriendJoinedPlayerToast = Instance.new("RemoteEvent")
	showFriendJoinedPlayerToast.Name = "ShowFriendJoinedPlayerToast"
	showFriendJoinedPlayerToast.Parent = robloxReplicatedStorageService
end
local createOrJoinParty = Instance.new("RemoteEvent")
createOrJoinParty.Name = "CreateOrJoinParty"
createOrJoinParty.Parent = robloxReplicatedStorageService
local moderateChatSettingUpdated = nil

if fFlagEnableModerateChatRemoteEvent then
	moderateChatSettingUpdated = Instance.new("RemoteEvent")
	moderateChatSettingUpdated.Name = "ModerateChatSettingUpdated"
	moderateChatSettingUpdated.Parent = robloxReplicatedStorageService
end
local expChatFeatureValueChanged = nil

if fFlagEnableSummarySystemMessageOnLua or fFlagAIRephraseSettingEnabled or fFlagChatSummariesSettingEnabled then
	expChatFeatureValueChanged = Instance.new("RemoteEvent")
	expChatFeatureValueChanged.Name = "ExpChatFeatureValueChanged"
	expChatFeatureValueChanged.Parent = robloxReplicatedStorageService
end
local t_7 = {}

local function _(p0) --[[ line: 173 | named "verifyUserId" ]]
	return type(p0) == "number"
end

local function verifyBlockList(p1) --[[ line: 177 ]]
	if #p1 == 0 or game:GetFastInt("MaxBlockListSize") < #p1 then
		return false
	end
	for i, v in pairs(p1) do
		if type(v) ~= "number" then
			return false
		end
	end
	return true
end

local _ = function(p2) --[[ line: 190 | named "sendPlayerAllGroupDetails" ]]
	-- upvalues: newPlayerGroupDetails (ref), t_2 (ref)
	newPlayerGroupDetails:FireClient(p2, t_2)
end

local function getPlayerGroupDetails(p3) --[[ line: 194 ]]
	-- upvalues: t_1 (ref), t_2 (ref), newPlayerGroupDetails (ref)
	local t = {}
	
	for i, v in pairs(t_1) do
		if v.GroupRank == nil then
			local ok, status = pcall(function() --[[ line: 204 ]]
				-- upvalues: p3 (ref), v (ref)
				return p3:IsInGroupAsync(v.GroupId)
			end)
			t[i] = ok and status
		else
			local ok, status = pcall(function() --[[ line: 198 ]]
				-- upvalues: p3 (ref), v (ref)
				return v.GroupRank <= p3:GetRankInGroupAsync(v.GroupId)
			end)
			t[i] = ok and status
		end
	end
	if p3.Parent then
		local var59 = tostring(p3.UserId)
		t_2[var59] = t
		newPlayerGroupDetails:FireAllClients({ [var59] = t })
	end
end

local function sendCanChatWith(p4) --[[ line: 221 ]]
	-- upvalues: playersService (ref), useNewDirectChatAPI (ref), textChatService (ref), canChatWith (ref), chatService (ref)
	local t = {}
	
	for i, v in ipairs(playersService:GetPlayers()) do
		if useNewDirectChatAPI then
			local ok, status = pcall(function() --[[ line: 226 ]]
				-- upvalues: textChatService (copy), p4 (ref), v (ref)
				return textChatService:CanUsersDirectChatAsync(p4.UserId, { v.UserId })
			end)
			t[v.UserId] = ok and #status > 0
			canChatWith:FireClient(v, { [p4.UserId] = ok and #status > 0 })
		else
			local ok, status = pcall(function() --[[ line: 235 ]]
				-- upvalues: chatService (copy), p4 (ref), v (ref)
				return chatService:CanUsersChatAsync(p4.UserId, v.UserId)
			end)
			t[v.userId] = ok and status
			canChatWith:FireClient(v, { [p4.userId] = ok and status })
		end
	end
	canChatWith:FireClient(p4, t)
end

local function sendPlayerAllCanManage(p5) --[[ line: 249 ]]
	-- upvalues: t_3 (ref), newPlayerCanManageDetails (ref)
	for i, v in pairs(t_3) do
		newPlayerCanManageDetails:FireClient(p5, i, v)
	end
end

local function getPlayerCanManage(p6) --[[ line: 255 ]]
	-- upvalues: luaGetCanManageAsync (ref), t_3 (ref), newPlayerCanManageDetails (ref), url (ref), httpService (ref), fFlagUserPresenceTokenRccCheckPermissionsLuaModule (ref), httpRbxApiService (ref)
	if luaGetCanManageAsync then
		if p6.UserId <= 0 or not p6.Parent then return end
		local var61 = false
		local ok, status = pcall(p6.GetCanManageAsync, p6)
		
		if ok and status then
			var61 = true
		end
		local var62 = tostring(p6.UserId)
		t_3[var62] = var61
		newPlayerCanManageDetails:FireAllClients(var62, var61)
		
		return
	else
		local var63 = false
		
		if p6.UserId > 0 then
			local ok, status = pcall(function() --[[ line: 274 ]]
				-- upvalues: url (copy), httpService (copy), p6 (ref), fFlagUserPresenceTokenRccCheckPermissionsLuaModule (copy), httpRbxApiService (copy)
				local formattedText = string.format(url.APIS_URL .. "asset-permissions-api/v1/rcc/assets/check-permissions")
				local var66 = httpService:JSONEncode({
					requests = {
						{
							action = "Edit",
							subject = { subjectType = "User", subjectId = p6.UserId },
							assetId = game.PlaceId
						}
					}
				})
				
				return httpService:JSONDecode(if fFlagUserPresenceTokenRccCheckPermissionsLuaModule then httpRbxApiService:PostAsyncFullUrlForPlayer(formattedText, var66, p6) else httpRbxApiService:PostAsyncFullUrl(formattedText, var66))
			end)
			
			if ok then
				status = status.results[1]
				
				if status.value and status.value.status == "HasPermission" then
					var63 = true
				end
			end
		end
		if p6.Parent then
			local var64 = tostring(p6.UserId)
			t_3[var64] = var63
			newPlayerCanManageDetails:FireAllClients(var64, var63)
		end
	end
end

local _ = function(p7, p8) --[[ line: 315 ]]
	-- upvalues: url (ref), httpService (ref), httpRbxApiService (ref)
	return pcall(function() --[[ line: 316 ]]
		-- upvalues: url (copy), httpService (copy), p8 (ref), p7 (ref), httpRbxApiService (copy)
		return httpService:JSONDecode(httpRbxApiService:PostAsyncFullUrl(string.format(url.APIS_URL .. "user-blocking-api/v1/users/rcc/batch-check-reciprocal-block"), httpService:JSONEncode({ userIds = p8, requesterUserId = p7.UserId })))
	end)
end

local function sendPlayerBlockList_1(p9) --[[ line: 330 | named "sendPlayerBlockList" ]]
	-- upvalues: globalUserBlockingLuaReadsFromSCMCache (ref), playersService (ref), updateLocalPlayerBlockList (ref), sendPlayerBlockList (ref), url (ref), httpService (ref), httpRbxApiService (ref)
	local t
	if p9.UserId <= 0 then return end
	if globalUserBlockingLuaReadsFromSCMCache then
		local function scanAndSendBlockList(p10) --[[ line: 336 ]]
			-- upvalues: p9 (ref), playersService (copy), updateLocalPlayerBlockList (copy), sendPlayerBlockList (copy)
			if not p9.Parent then return end
			local t = {}
			
			for i, v in playersService:GetPlayers() do
				if v ~= p9 then
					if p9:HasBlockedPlayer(v.UserId) then
						t[v.UserId] = true
					end
					if p10 and v:HasBlockedPlayer(p9.UserId) then
						updateLocalPlayerBlockList:FireClient(v, p9.UserId, true)
					end
				end
			end
			sendPlayerBlockList:FireClient(p9, t)
		end
		
		t = false
		p9.BlockListChanged:Connect(function() --[[ line: 361 ]]
			-- upvalues: t (write), scanAndSendBlockList (ref)
			if t then
				scanAndSendBlockList(false)
				
				return
			end
			scanAndSendBlockList(true)
			t = true
		end)
		
		if p9:GetBlockListInitialized() then
			scanAndSendBlockList(true)
			t = true
		end
		return
	else
		t = {}
		
		for i, v in playersService:GetPlayers() do
			if p9 ~= v then
				table.insert(t, v.UserId)
			end
		end
		local ok, status = pcall(function() --[[ line: 316 ]]
			-- upvalues: url (copy), httpService (copy), t (ref), p9 (ref), httpRbxApiService (copy)
			return httpService:JSONDecode(httpRbxApiService:PostAsyncFullUrl(string.format(url.APIS_URL .. "user-blocking-api/v1/users/rcc/batch-check-reciprocal-block"), httpService:JSONEncode({ userIds = t, requesterUserId = p9.UserId })))
		end)
		local t_1 = {}
		local t_2 = {}
		
		if ok and status then
			for i_1, v_1 in status.users do
				if v_1.isBlocked then
					t_2[v_1.userId] = true
					table.insert(t_1, v_1.userId)
				end
				if v_1.isBlockingViewer then
					local userIdPlayerByUserId = playersService:GetPlayerByUserId(v_1.userId)
					userIdPlayerByUserId:UpdatePlayerBlocked(p9.UserId, true)
					updateLocalPlayerBlockList:FireClient(userIdPlayerByUserId, p9.UserId, true)
				end
			end
		end
		p9:AddToBlockList(t_1)
		
		if game:GetFastFlag("EnableSetUserBlocklistInitialized") then
			p9:SetBlockListInitialized()
		end
		sendPlayerBlockList:FireClient(p9, t_2)
	end
end

local function sendPlayerAllInExperienceNameEnabled(p11) --[[ line: 411 ]]
	-- upvalues: t_4 (ref), sendPlayerProfileSettings (ref)
	for i, v in pairs(t_4) do
		sendPlayerProfileSettings:FireClient(p11, i, { isInExperienceNameEnabled = v })
	end
end

local _ = function(p12) --[[ line: 421 ]]
	-- upvalues: url (ref), httpRbxApiService (ref), httpService (ref)
	return pcall(function() --[[ line: 422 ]]
		-- upvalues: p12 (ref), url (copy), httpRbxApiService (copy), httpService (copy)
		return httpService:JSONDecode(httpRbxApiService:GetAsyncFullUrl(url.APIS_URL .. `user-profile-api/v1/user/profiles/rcc/settings?userId={p12.UserId}`, Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players))
	end)
end

local var53 = function(p13) --[[ line: 432 ]]
	-- upvalues: fStringRccInExperienceNameEnabledAllowListModule (ref), disableRCCAntiHarrasmentAllowList (ref), url (ref), httpRbxApiService (ref), httpService (ref), t_4 (ref), sendPlayerProfileSettings (ref)
	if p13.UserId <= 0 then return end
	local var73 = false
	
	if fStringRccInExperienceNameEnabledAllowListModule.isAllowListedUserId(p13.UserId) or disableRCCAntiHarrasmentAllowList then
		local ok, status = pcall(function() --[[ line: 422 ]]
			-- upvalues: p13 (ref), url (copy), httpRbxApiService (copy), httpService (copy)
			return httpService:JSONDecode(httpRbxApiService:GetAsyncFullUrl(url.APIS_URL .. `user-profile-api/v1/user/profiles/rcc/settings?userId={p13.UserId}`, Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players))
		end)
		local var74 = status
		
		if ok and var74 then
			ok = var74.isSettingsEnabled and (var74.userProfileSettings and var74.userProfileSettings.isInExperienceNameEnabled)
			var73 = ok
		end
	end
	local var75 = tostring(p13.UserId)
	t_4[var75] = var73
	sendPlayerProfileSettings:FireAllClients(var75, { isInExperienceNameEnabled = var73 })
end

if fFlagInExperienceRequestProfileSettingsModule then
	requestPlayerProfileSettings.OnServerEvent:Connect(function(p14) --[[ line: 459 ]]
		-- upvalues: t_4 (ref), sendPlayerProfileSettings (ref), var53 (ref)
		local var76 = tostring(p14.UserId)
		local var77 = t_4[var76]
		
		if var77 == nil then
			coroutine.wrap(var53)(p14)
			
			return
		end
		sendPlayerProfileSettings:FireClient(p14, var76, { isInExperienceNameEnabled = var77 })
	end)
end
local _ = function(p15, p16, p17) --[[ line: 476 ]]
	-- upvalues: url (ref), httpService (ref), enableCreatePartyNudgeWithVersion (ref), gatePrivateServerNudge (ref), httpRbxApiService (ref)
	return pcall(function() --[[ line: 477 ]]
		-- upvalues: url (copy), httpService (copy), p15 (ref), p16 (ref), p17 (ref), enableCreatePartyNudgeWithVersion (copy), gatePrivateServerNudge (copy), httpRbxApiService (copy)
		return httpService:JSONDecode(httpRbxApiService:PostAsyncFullUrl(string.format(url.APIS_URL .. "group-up/v1/create-party-nudge"), httpService:JSONEncode({
			inviterId = p15,
			inviteeId = p16,
			nudgeType = p17,
			placeId = game.PlaceId,
			gameInstanceId = game.JobId,
			universeId = game.GameId,
			version = if enableCreatePartyNudgeWithVersion then 1 else nil,
			privateServerId = if gatePrivateServerNudge then game.PrivateServerId else nil,
			privateServerOwnerId = if gatePrivateServerNudge then game.PrivateServerOwnerId else nil
		})))
	end)
end

local function canCreatePartyNudge(p18) --[[ line: 498 ]]
	return if p18 then p18.PartyId == "" and (p18.VRDevice == "" and (typeof(p18.OsPlatform) == "string" and ({
		Windows = true,
		iOS = true,
		Android = true,
		OSX = true,
		Win32 = true,
		Windows_Universal = true
	})[p18.OsPlatform])) else false
end

local var55 = function(p19) --[[ line: 520 ]]
	-- upvalues: playersService (ref), enableCreatePartyNudge (ref), canCreatePartyNudge (ref), url (ref), httpService (ref), enableCreatePartyNudgeWithVersion (ref), gatePrivateServerNudge (ref), httpRbxApiService (ref), createOrJoinParty (ref), showFriendJoinedPlayerToast (write), showPlayerJoinedFriendsToast (write)
	local v
	local var78 = nil
	local players = playersService:GetPlayers()
	
	for i, v in players do
		if v.UserId == p19.FollowUserId then
			var78 = v
			break
		end
	end
	local var80 = false
	
	if enableCreatePartyNudge and canCreatePartyNudge(var78) and canCreatePartyNudge(p19) then
		local _ = nil
		v = p19.UserId
		local userId = var78.UserId
		local var81 = "OneToOneNudgeInExperience"
		local ok, status = pcall(function() --[[ line: 477 ]]
			-- upvalues: url (copy), httpService (copy), v (ref), userId (ref), var81 (ref), enableCreatePartyNudgeWithVersion (copy), gatePrivateServerNudge (copy), httpRbxApiService (copy)
			return httpService:JSONDecode(httpRbxApiService:PostAsyncFullUrl(string.format(url.APIS_URL .. "group-up/v1/create-party-nudge"), httpService:JSONEncode({
				inviterId = v,
				inviteeId = userId,
				nudgeType = var81,
				placeId = game.PlaceId,
				gameInstanceId = game.JobId,
				universeId = game.GameId,
				version = if enableCreatePartyNudgeWithVersion then 1 else nil,
				privateServerId = if gatePrivateServerNudge then game.PrivateServerId else nil,
				privateServerOwnerId = if gatePrivateServerNudge then game.PrivateServerOwnerId else nil
			})))
		end)
		var80 = ok
		local var82 = status
		
		if var80 and var82 and var82.shouldAutoCreateOrJoinGroupUp then
			createOrJoinParty:FireClient(p19, "PartyNudge", var82.nudge)
		end
	end
	if not var80 and #players > 0 then
		if var78 then
			showFriendJoinedPlayerToast:FireClient(var78, p19)
		end
		showPlayerJoinedFriendsToast:FireClient(p19)
	end
end

local function onPlayerAdded(p20) --[[ line: 550 ]]
	-- upvalues: sendPlayerBlockList_1 (ref), newPlayerGroupDetails (ref), t_2 (ref), getPlayerGroupDetails (ref), fFlagInExperienceUserProfileSettingsEnabledModule (ref), sendPlayerAllInExperienceNameEnabled (ref), var53 (ref), sendPlayerAllCanManage (ref), getPlayerCanManage (ref), sendCanChatWith (ref), fFlagEnablePartyNudgeAfterJoin (ref), var55 (ref)
	coroutine.wrap(sendPlayerBlockList_1)(p20)
	newPlayerGroupDetails:FireClient(p20, t_2)
	
	if p20.UserId > 0 then
		coroutine.wrap(getPlayerGroupDetails)(p20)
	end
	if fFlagInExperienceUserProfileSettingsEnabledModule then
		sendPlayerAllInExperienceNameEnabled(p20)
		coroutine.wrap(var53)(p20)
	end
	sendPlayerAllCanManage(p20)
	coroutine.wrap(getPlayerCanManage)(p20)
	sendCanChatWith(p20)
	
	if fFlagEnablePartyNudgeAfterJoin then
		coroutine.wrap(var55)(p20)
	end
end

setPlayerBlockList.OnServerEvent:Connect(function(p21, p22) --[[ line: 571 ]]
	-- upvalues: verifyBlockList (ref)
	if game:GetFastFlag("EnableSetUserBlocklistInitialized") then
		p21:SetBlockListInitialized()
	end
	if type(p22) == "table" and verifyBlockList(p22) then
		p21:AddToBlockList(p22)
	end
end)
updatePlayerBlockList.OnServerEvent:Connect(function(p23, p24, p25) --[[ line: 582 ]]
	if type(p25) == "boolean" and type(p24) == "number" then
		p23:UpdatePlayerBlocked(p24, p25)
	end
end)

if fFlagBadgeVisibilitySettingEnabled then
	updatePlayerProfileSettings.OnServerEvent:Connect(function(p26, p27) --[[ line: 591 ]]
		-- upvalues: profileSettingsSlidingWindowRateLimit (ref), t_6 (ref), profileSettingsRateLimitWindowSeconds (ref), profileSettingsMaxRequestsPerWindow (ref), t_5 (ref), profileSettingsRateLimitSeconds (ref), t_4 (ref), sendPlayerProfileSettings (ref)
		if type(p27) ~= "table" then return end
		local t = {}
		
		if type(p27.isInExperienceNameEnabled) == "boolean" then
			t.isInExperienceNameEnabled = p27.isInExperienceNameEnabled
		else
			return
		end
		local var84 = tostring(p26.UserId)
		local currentTime = tick()
		
		if profileSettingsSlidingWindowRateLimit then
			if not t_6[var84] then
				t_6[var84] = {}
			end
			local var86 = t_6[var84]
			local var87 = currentTime - profileSettingsRateLimitWindowSeconds
			
			for i = #var86, 1, -1 do
				if var86[i] < var87 then
					table.remove(var86, i)
				end
			end
			if profileSettingsMaxRequestsPerWindow <= #var86 then return end
			table.insert(var86, currentTime)
		else
			local var88 = t_5[var84]
			
			if var88 and currentTime - var88 < profileSettingsRateLimitSeconds then return end
			t_5[var84] = currentTime
		end
		t_4[var84] = t.isInExperienceNameEnabled
		sendPlayerProfileSettings:FireAllClients(var84, t)
	end)
end
if fFlagEnableModerateChatRemoteEvent then
	moderateChatSettingUpdated.OnServerEvent:Connect(function(p28, p29) --[[ line: 639 ]]
		-- upvalues: textChatService (ref), moderateChatSettingUpdated (write)
		if typeof(p29) == "boolean" and textChatService:setModerationModeEnabled(p28.UserId, p29) then
			moderateChatSettingUpdated:FireClient(p28, p29)
		end
	end)
end
if fFlagEnableSummarySystemMessageOnLua or fFlagAIRephraseSettingEnabled or fFlagChatSummariesSettingEnabled then
	textChatService.ExpChatFeatureValueChanged:Connect(function(p30, p31, p32) --[[ line: 649 ]]
		-- upvalues: playersService (ref), expChatFeatureValueChanged (write)
		local var89 = playersService:GetPlayerByUserId(p30)
		
		if var89 then
			expChatFeatureValueChanged:FireClient(var89, p30, p31, p32)
		end
	end)
end
playersService.PlayerAdded:connect(onPlayerAdded)

for i, v in pairs(playersService:GetPlayers()) do
	onPlayerAdded(v)
end
playersService.PlayerRemoving:connect(function(p33) --[[ line: 663 ]]
	-- upvalues: t (ref), t_7 (ref), t_2 (ref), t_3 (ref), t_4 (ref), fFlagBadgeVisibilitySettingEnabled (ref), profileSettingsSlidingWindowRateLimit (ref), t_6 (ref), t_5 (ref)
	local var90 = tostring(p33.UserId)
	
	if t[var90] then
		t[var90] = nil
		t_7[var90] = nil
	end
	if t_2[var90] then
		t_2[var90] = nil
	end
	if t_3[var90] ~= nil then
		t_3[var90] = nil
	end
	if t_4[var90] ~= nil then
		t_4[var90] = nil
	end
	if fFlagBadgeVisibilitySettingEnabled then
		if profileSettingsSlidingWindowRateLimit then
			if t_6[var90] == nil then
				return
			else
				t_6[var90] = nil
				
				return
			end
		elseif t_5[var90] ~= nil then
			t_5[var90] = nil
		end
	end
end)

local var57 = function() --[[ line: 691 ]] end

for i_1, v_1 in ipairs(robloxReplicatedStorageService:GetChildren()) do
	if v_1:IsA("RemoteEvent") then
		v_1.OnServerEvent:Connect(var57)
	end
end