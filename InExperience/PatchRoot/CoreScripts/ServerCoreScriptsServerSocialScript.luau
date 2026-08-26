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

local function _(p1)
	return type(p1) == "number"
end

local function verifyBlockList(p1)
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

local _ = function(p2)
	-- upvalues: newPlayerGroupDetails (ref), t_2 (ref)
	newPlayerGroupDetails:FireClient(p2, t_2)
end

local function getPlayerGroupDetails(p2)
	-- upvalues: t_1 (ref), t_2 (ref), newPlayerGroupDetails (ref)
	local t = {}
	
	for i, v in pairs(t_1) do
		if v.GroupRank == nil then
			local ok, status = pcall(function()
				-- upvalues: p2 (ref), v (ref)
				return p2:IsInGroupAsync(v.GroupId)
			end)
			t[i] = ok and status
		else
			local ok, status = pcall(function()
				-- upvalues: p2 (ref), v (ref)
				return v.GroupRank <= p2:GetRankInGroupAsync(v.GroupId)
			end)
			t[i] = ok and status
		end
	end
	if p2.Parent then
		local var1 = tostring(p2.UserId)
		t_2[var1] = t
		newPlayerGroupDetails:FireAllClients({ [var1] = t })
	end
end

local function sendCanChatWith(p3)
	-- upvalues: playersService (ref), useNewDirectChatAPI (ref), textChatService (ref), canChatWith (ref), chatService (ref)
	local t = {}
	
	for i, v in ipairs(playersService:GetPlayers()) do
		if useNewDirectChatAPI then
			local ok, status = pcall(function()
				-- upvalues: textChatService (copy), p3 (ref), v (ref)
				return textChatService:CanUsersDirectChatAsync(p3.UserId, { v.UserId })
			end)
			t[v.UserId] = ok and #status > 0
			canChatWith:FireClient(v, { [p3.UserId] = ok and #status > 0 })
		else
			local ok, status = pcall(function()
				-- upvalues: chatService (copy), p3 (ref), v (ref)
				return chatService:CanUsersChatAsync(p3.UserId, v.UserId)
			end)
			t[v.userId] = ok and status
			canChatWith:FireClient(v, { [p3.userId] = ok and status })
		end
	end
	canChatWith:FireClient(p3, t)
end

local function sendPlayerAllCanManage(p4)
	-- upvalues: t_3 (ref), newPlayerCanManageDetails (ref)
	for i, v in pairs(t_3) do
		newPlayerCanManageDetails:FireClient(p4, i, v)
	end
end

local function getPlayerCanManage(p5)
	-- upvalues: luaGetCanManageAsync (ref), t_3 (ref), newPlayerCanManageDetails (ref), url (ref), httpService (ref), fFlagUserPresenceTokenRccCheckPermissionsLuaModule (ref), httpRbxApiService (ref)
	if luaGetCanManageAsync then
		if p5.UserId <= 0 or not p5.Parent then return end
		local var2 = false
		local ok, status = pcall(p5.GetCanManageAsync, p5)
		
		if ok and status then
			var2 = true
		end
		local var3 = tostring(p5.UserId)
		t_3[var3] = var2
		newPlayerCanManageDetails:FireAllClients(var3, var2)
		
		return
	else
		local var4 = false
		
		if p5.UserId > 0 then
			local ok, status = pcall(function()
				-- upvalues: url (copy), httpService (copy), p5 (ref), fFlagUserPresenceTokenRccCheckPermissionsLuaModule (copy), httpRbxApiService (copy)
				local formattedText = string.format(url.APIS_URL .. "asset-permissions-api/v1/rcc/assets/check-permissions")
				local var5 = httpService:JSONEncode({
					requests = {
						{
							action = "Edit",
							subject = { subjectType = "User", subjectId = p5.UserId },
							assetId = game.PlaceId
						}
					}
				})
				
				return httpService:JSONDecode(if fFlagUserPresenceTokenRccCheckPermissionsLuaModule then httpRbxApiService:PostAsyncFullUrlForPlayer(formattedText, var5, p5) else httpRbxApiService:PostAsyncFullUrl(formattedText, var5))
			end)
			
			if ok then
				status = status.results[1]
				
				if status.value and status.value.status == "HasPermission" then
					var4 = true
				end
			end
		end
		if p5.Parent then
			local var5 = tostring(p5.UserId)
			t_3[var5] = var4
			newPlayerCanManageDetails:FireAllClients(var5, var4)
		end
	end
end

local _ = function(p5, p6)
	-- upvalues: url (ref), httpService (ref), httpRbxApiService (ref)
	return pcall(function()
		-- upvalues: url (copy), httpService (copy), p6 (ref), p5 (ref), httpRbxApiService (copy)
		return httpService:JSONDecode(httpRbxApiService:PostAsyncFullUrl(string.format(url.APIS_URL .. "user-blocking-api/v1/users/rcc/batch-check-reciprocal-block"), httpService:JSONEncode({ userIds = p6, requesterUserId = p5.UserId })))
	end)
end

local function sendPlayerBlockList_1(p5)
	-- upvalues: globalUserBlockingLuaReadsFromSCMCache (ref), playersService (ref), updateLocalPlayerBlockList (ref), sendPlayerBlockList (ref), url (ref), httpService (ref), httpRbxApiService (ref)
	local t
	if p5.UserId <= 0 then return end
	if globalUserBlockingLuaReadsFromSCMCache then
		local function scanAndSendBlockList(p6)
			-- upvalues: p5 (ref), playersService (copy), updateLocalPlayerBlockList (copy), sendPlayerBlockList (copy)
			if not p5.Parent then return end
			local t = {}
			
			for i, v in playersService:GetPlayers() do
				if v ~= p5 then
					if p5:HasBlockedPlayer(v.UserId) then
						t[v.UserId] = true
					end
					if p6 and v:HasBlockedPlayer(p5.UserId) then
						updateLocalPlayerBlockList:FireClient(v, p5.UserId, true)
					end
				end
			end
			sendPlayerBlockList:FireClient(p5, t)
		end
		
		t = false
		p5.BlockListChanged:Connect(function()
			-- upvalues: t (write), scanAndSendBlockList (ref)
			if t then
				scanAndSendBlockList(false)
				
				return
			end
			scanAndSendBlockList(true)
			t = true
		end)
		
		if p5:GetBlockListInitialized() then
			scanAndSendBlockList(true)
			t = true
		end
		return
	else
		t = {}
		
		for i, v in playersService:GetPlayers() do
			if p5 ~= v then
				table.insert(t, v.UserId)
			end
		end
		local ok, status = pcall(function()
			-- upvalues: url (copy), httpService (copy), t (ref), p5 (ref), httpRbxApiService (copy)
			return httpService:JSONDecode(httpRbxApiService:PostAsyncFullUrl(string.format(url.APIS_URL .. "user-blocking-api/v1/users/rcc/batch-check-reciprocal-block"), httpService:JSONEncode({ userIds = t, requesterUserId = p5.UserId })))
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
					userIdPlayerByUserId:UpdatePlayerBlocked(p5.UserId, true)
					updateLocalPlayerBlockList:FireClient(userIdPlayerByUserId, p5.UserId, true)
				end
			end
		end
		p5:AddToBlockList(t_1)
		
		if game:GetFastFlag("EnableSetUserBlocklistInitialized") then
			p5:SetBlockListInitialized()
		end
		sendPlayerBlockList:FireClient(p5, t_2)
	end
end

local function sendPlayerAllInExperienceNameEnabled(p7)
	-- upvalues: t_4 (ref), sendPlayerProfileSettings (ref)
	for i, v in pairs(t_4) do
		sendPlayerProfileSettings:FireClient(p7, i, { isInExperienceNameEnabled = v })
	end
end

local _ = function(p8)
	-- upvalues: url (ref), httpRbxApiService (ref), httpService (ref)
	return pcall(function()
		-- upvalues: p8 (ref), url (copy), httpRbxApiService (copy), httpService (copy)
		return httpService:JSONDecode(httpRbxApiService:GetAsyncFullUrl(url.APIS_URL .. `user-profile-api/v1/user/profiles/rcc/settings?userId={p8.UserId}`, Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players))
	end)
end

local var2 = function(p8)
	-- upvalues: fStringRccInExperienceNameEnabledAllowListModule (ref), disableRCCAntiHarrasmentAllowList (ref), url (ref), httpRbxApiService (ref), httpService (ref), t_4 (ref), sendPlayerProfileSettings (ref)
	if p8.UserId <= 0 then return end
	local var3 = false
	
	if fStringRccInExperienceNameEnabledAllowListModule.isAllowListedUserId(p8.UserId) or disableRCCAntiHarrasmentAllowList then
		local ok, status = pcall(function()
			-- upvalues: p8 (ref), url (copy), httpRbxApiService (copy), httpService (copy)
			return httpService:JSONDecode(httpRbxApiService:GetAsyncFullUrl(url.APIS_URL .. `user-profile-api/v1/user/profiles/rcc/settings?userId={p8.UserId}`, Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players))
		end)
		local var4 = status
		
		if ok and var4 then
			ok = var4.isSettingsEnabled and (var4.userProfileSettings and var4.userProfileSettings.isInExperienceNameEnabled)
			var3 = ok
		end
	end
	local var5 = tostring(p8.UserId)
	t_4[var5] = var3
	sendPlayerProfileSettings:FireAllClients(var5, { isInExperienceNameEnabled = var3 })
end

if fFlagInExperienceRequestProfileSettingsModule then
	requestPlayerProfileSettings.OnServerEvent:Connect(function(p8)
		-- upvalues: t_4 (ref), sendPlayerProfileSettings (ref), var2 (ref)
		local var3 = tostring(p8.UserId)
		local var4 = t_4[var3]
		
		if var4 == nil then
			coroutine.wrap(var2)(p8)
			
			return
		end
		sendPlayerProfileSettings:FireClient(p8, var3, { isInExperienceNameEnabled = var4 })
	end)
end
local _ = function(p8, p9, p10)
	-- upvalues: url (ref), httpService (ref), enableCreatePartyNudgeWithVersion (ref), gatePrivateServerNudge (ref), httpRbxApiService (ref)
	return pcall(function()
		-- upvalues: url (copy), httpService (copy), p8 (ref), p9 (ref), p10 (ref), enableCreatePartyNudgeWithVersion (copy), gatePrivateServerNudge (copy), httpRbxApiService (copy)
		return httpService:JSONDecode(httpRbxApiService:PostAsyncFullUrl(string.format(url.APIS_URL .. "group-up/v1/create-party-nudge"), httpService:JSONEncode({
			inviterId = p8,
			inviteeId = p9,
			nudgeType = p10,
			placeId = game.PlaceId,
			gameInstanceId = game.JobId,
			universeId = game.GameId,
			version = if enableCreatePartyNudgeWithVersion then 1 else nil,
			privateServerId = if gatePrivateServerNudge then game.PrivateServerId else nil,
			privateServerOwnerId = if gatePrivateServerNudge then game.PrivateServerOwnerId else nil
		})))
	end)
end

local function canCreatePartyNudge(p8)
	return if p8 then p8.PartyId == "" and (p8.VRDevice == "" and (typeof(p8.OsPlatform) == "string" and ({
		Windows = true,
		iOS = true,
		Android = true,
		OSX = true,
		Win32 = true,
		Windows_Universal = true
	})[p8.OsPlatform])) else false
end

local var3 = function(p8)
	-- upvalues: playersService (ref), enableCreatePartyNudge (ref), canCreatePartyNudge (ref), url (ref), httpService (ref), enableCreatePartyNudgeWithVersion (ref), gatePrivateServerNudge (ref), httpRbxApiService (ref), createOrJoinParty (ref), showFriendJoinedPlayerToast (write), showPlayerJoinedFriendsToast (write)
	local v
	local var4 = nil
	local players = playersService:GetPlayers()
	
	for i, v in players do
		if v.UserId == p8.FollowUserId then
			var4 = v
			break
		end
	end
	local var5 = false
	
	if enableCreatePartyNudge and canCreatePartyNudge(var4) and canCreatePartyNudge(p8) then
		local _ = nil
		v = p8.UserId
		local userId = var4.UserId
		local var6 = "OneToOneNudgeInExperience"
		local ok, status = pcall(function()
			-- upvalues: url (copy), httpService (copy), v (ref), userId (ref), var6 (ref), enableCreatePartyNudgeWithVersion (copy), gatePrivateServerNudge (copy), httpRbxApiService (copy)
			return httpService:JSONDecode(httpRbxApiService:PostAsyncFullUrl(string.format(url.APIS_URL .. "group-up/v1/create-party-nudge"), httpService:JSONEncode({
				inviterId = v,
				inviteeId = userId,
				nudgeType = var6,
				placeId = game.PlaceId,
				gameInstanceId = game.JobId,
				universeId = game.GameId,
				version = if enableCreatePartyNudgeWithVersion then 1 else nil,
				privateServerId = if gatePrivateServerNudge then game.PrivateServerId else nil,
				privateServerOwnerId = if gatePrivateServerNudge then game.PrivateServerOwnerId else nil
			})))
		end)
		var5 = ok
		local var7 = status
		
		if var5 and var7 and var7.shouldAutoCreateOrJoinGroupUp then
			createOrJoinParty:FireClient(p8, "PartyNudge", var7.nudge)
		end
	end
	if not var5 and #players > 0 then
		if var4 then
			showFriendJoinedPlayerToast:FireClient(var4, p8)
		end
		showPlayerJoinedFriendsToast:FireClient(p8)
	end
end

local function onPlayerAdded(p9)
	-- upvalues: sendPlayerBlockList_1 (ref), newPlayerGroupDetails (ref), t_2 (ref), getPlayerGroupDetails (ref), fFlagInExperienceUserProfileSettingsEnabledModule (ref), sendPlayerAllInExperienceNameEnabled (ref), var2 (ref), sendPlayerAllCanManage (ref), getPlayerCanManage (ref), sendCanChatWith (ref), fFlagEnablePartyNudgeAfterJoin (ref), var3 (ref)
	coroutine.wrap(sendPlayerBlockList_1)(p9)
	newPlayerGroupDetails:FireClient(p9, t_2)
	
	if p9.UserId > 0 then
		coroutine.wrap(getPlayerGroupDetails)(p9)
	end
	if fFlagInExperienceUserProfileSettingsEnabledModule then
		sendPlayerAllInExperienceNameEnabled(p9)
		coroutine.wrap(var2)(p9)
	end
	sendPlayerAllCanManage(p9)
	coroutine.wrap(getPlayerCanManage)(p9)
	sendCanChatWith(p9)
	
	if fFlagEnablePartyNudgeAfterJoin then
		coroutine.wrap(var3)(p9)
	end
end

setPlayerBlockList.OnServerEvent:Connect(function(p9, p10)
	-- upvalues: verifyBlockList (ref)
	if game:GetFastFlag("EnableSetUserBlocklistInitialized") then
		p9:SetBlockListInitialized()
	end
	if type(p10) == "table" and verifyBlockList(p10) then
		p9:AddToBlockList(p10)
	end
end)
updatePlayerBlockList.OnServerEvent:Connect(function(p9, p10, p11)
	if type(p11) == "boolean" and type(p10) == "number" then
		p9:UpdatePlayerBlocked(p10, p11)
	end
end)

if fFlagBadgeVisibilitySettingEnabled then
	updatePlayerProfileSettings.OnServerEvent:Connect(function(p9, p10)
		-- upvalues: profileSettingsSlidingWindowRateLimit (ref), t_6 (ref), profileSettingsRateLimitWindowSeconds (ref), profileSettingsMaxRequestsPerWindow (ref), t_5 (ref), profileSettingsRateLimitSeconds (ref), t_4 (ref), sendPlayerProfileSettings (ref)
		if type(p10) ~= "table" then return end
		local t = {}
		
		if type(p10.isInExperienceNameEnabled) == "boolean" then
			t.isInExperienceNameEnabled = p10.isInExperienceNameEnabled
		else
			return
		end
		local var8 = tostring(p9.UserId)
		local currentTime = tick()
		
		if profileSettingsSlidingWindowRateLimit then
			if not t_6[var8] then
				t_6[var8] = {}
			end
			local var9 = t_6[var8]
			local var10 = currentTime - profileSettingsRateLimitWindowSeconds
			
			for i = #var9, 1, -1 do
				if var9[i] < var10 then
					table.remove(var9, i)
				end
			end
			if profileSettingsMaxRequestsPerWindow <= #var9 then return end
			table.insert(var9, currentTime)
		else
			local var11 = t_5[var8]
			
			if var11 and currentTime - var11 < profileSettingsRateLimitSeconds then return end
			t_5[var8] = currentTime
		end
		t_4[var8] = t.isInExperienceNameEnabled
		sendPlayerProfileSettings:FireAllClients(var8, t)
	end)
end
if fFlagEnableModerateChatRemoteEvent then
	moderateChatSettingUpdated.OnServerEvent:Connect(function(p9, p10)
		-- upvalues: textChatService (ref), moderateChatSettingUpdated (write)
		if typeof(p10) == "boolean" and textChatService:setModerationModeEnabled(p9.UserId, p10) then
			moderateChatSettingUpdated:FireClient(p9, p10)
		end
	end)
end
if fFlagEnableSummarySystemMessageOnLua or fFlagAIRephraseSettingEnabled or fFlagChatSummariesSettingEnabled then
	textChatService.ExpChatFeatureValueChanged:Connect(function(p9, p10, p11)
		-- upvalues: playersService (ref), expChatFeatureValueChanged (write)
		local var8 = playersService:GetPlayerByUserId(p9)
		
		if var8 then
			expChatFeatureValueChanged:FireClient(var8, p9, p10, p11)
		end
	end)
end
playersService.PlayerAdded:connect(onPlayerAdded)

for i, v in pairs(playersService:GetPlayers()) do
	onPlayerAdded(v)
end
playersService.PlayerRemoving:connect(function(p9)
	-- upvalues: t (ref), t_7 (ref), t_2 (ref), t_3 (ref), t_4 (ref), fFlagBadgeVisibilitySettingEnabled (ref), profileSettingsSlidingWindowRateLimit (ref), t_6 (ref), t_5 (ref)
	local var8 = tostring(p9.UserId)
	
	if t[var8] then
		t[var8] = nil
		t_7[var8] = nil
	end
	if t_2[var8] then
		t_2[var8] = nil
	end
	if t_3[var8] ~= nil then
		t_3[var8] = nil
	end
	if t_4[var8] ~= nil then
		t_4[var8] = nil
	end
	if fFlagBadgeVisibilitySettingEnabled then
		if profileSettingsSlidingWindowRateLimit then
			if t_6[var8] == nil then
				return
			else
				t_6[var8] = nil
				
				return
			end
		elseif t_5[var8] ~= nil then
			t_5[var8] = nil
		end
	end
end)

local var8 = function() end

for i_1, v_1 in ipairs(robloxReplicatedStorageService:GetChildren()) do
	if v_1:IsA("RemoteEvent") then
		v_1.OnServerEvent:Connect(var8)
	end
end