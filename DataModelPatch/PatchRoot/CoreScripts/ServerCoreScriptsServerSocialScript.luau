local HttpService = game:GetService("HttpService")
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local Players = game:GetService("Players")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local _ = game:GetService("RunService")
local Chat = game:GetService("Chat")
local TextChatService = game:GetService("TextChatService")
local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Url = require(CorePackages.Workspace.Packages.CoreScriptsCommon).Url
game:DefineFastFlag("EnableSetUserBlocklistInitialized", false)
local FFlagInExperienceUserProfileSettingsEnabledModule = require(RobloxGui.Modules.Common.Flags.FFlagInExperienceUserProfileSettingsEnabled)
local FFlagInExperienceRequestProfileSettingsModule = require(RobloxGui.Modules.Common.Flags.FFlagInExperienceRequestProfileSettings)
local FStringRccInExperienceNameEnabledAllowListModule = require(RobloxGui.Modules.Common.Flags.FStringRccInExperienceNameEnabledAllowList)
local UseNewDirectChatAPI = game:DefineFastFlag("UseNewDirectChatAPI", false)
local EnableCreatePartyNudge = game:DefineFastFlag("EnableCreatePartyNudge", false)
local EnableCreatePartyNudgeWithVersion = game:DefineFastFlag("EnableCreatePartyNudgeWithVersion", false)
local FFlagEnablePartyNudgeAfterJoin = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnablePartyNudgeAfterJoin
local FFlagBadgeVisibilitySettingEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagBadgeVisibilitySettingEnabled
local FFlagEnableModerateChatRemoteEvent = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableModerateChatRemoteEvent
local FFlagEnableSummarySystemMessageOnLua = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableSummarySystemMessageOnLua
local FFlagAIRephraseSettingEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAIRephraseSettingEnabled
local FFlagChatSummariesSettingEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagChatSummariesSettingEnabled
local ProfileSettingsSlidingWindowRateLimit = game:DefineFastFlag("ProfileSettingsSlidingWindowRateLimit", false)
local ProfileSettingsRateLimitSeconds = game:DefineFastInt("ProfileSettingsRateLimitSeconds", 5)
local ProfileSettingsMaxRequestsPerWindow = game:DefineFastInt("ProfileSettingsMaxRequestsPerWindow", 3)
local ProfileSettingsRateLimitWindowSeconds = game:DefineFastInt("ProfileSettingsRateLimitWindowSeconds", 60)
local DisableRCCAntiHarrasmentAllowList = game:DefineFastFlag("DisableRCCAntiHarrasmentAllowList", false)
local LuaGetCanManageAsyncEngineFeature = game:DefineFastFlag("UseGetCanManageAsync", false) and game:GetEngineFeature("LuaGetCanManageAsync")
local FFlagUserPresenceTokenRccCheckPermissionsLuaModule = require(RobloxGui.Modules.Common.Flags.FFlagUserPresenceTokenRccCheckPermissionsLua)
local GatePrivateServerNudge = game:DefineFastFlag("GatePrivateServerNudge", false)
local GlobalUserBlockingLuaReadsFromSCMCache = game:DefineFastFlag("GlobalUserBlockingLuaReadsFromSCMCache", false)
local t = {}
local config = {
	Admin = { GroupId = 1200769 },
	Intern = { GroupId = 2868472, GroupRank = 100 },
	Star = { GroupId = 4199740 },
	SpanishLocalizationExpert = { GroupId = 4265462, GroupRank = 252 },
	BrazilianLocalizationExpert = { GroupId = 4265456, GroupRank = 252 },
	FrenchLocalizationExpert = { GroupId = 4265443, GroupRank = 252 },
	GermanLocalizationExpert = { GroupId = 4265449, GroupRank = 252 }
}

if game.CreatorType == Enum.CreatorType.Group then
	config.PlaceCreator = { GroupRank = 255, GroupId = game.CreatorId }
end
local t1 = {}
local t2 = {}
local t3 = {}
local CurrentTimes = {}
local t4 = {}
game:DefineFastInt("MaxBlockListSize", 500)
local CanChatWith = Instance.new("RemoteEvent")
CanChatWith.Name = "CanChatWith"
CanChatWith.Parent = RobloxReplicatedStorage
local SetPlayerBlockList = Instance.new("RemoteEvent")
SetPlayerBlockList.Name = "SetPlayerBlockList"
SetPlayerBlockList.Parent = RobloxReplicatedStorage
local UpdatePlayerBlockList = Instance.new("RemoteEvent")
UpdatePlayerBlockList.Name = "UpdatePlayerBlockList"
UpdatePlayerBlockList.Parent = RobloxReplicatedStorage
local NewPlayerGroupDetails = Instance.new("RemoteEvent")
NewPlayerGroupDetails.Name = "NewPlayerGroupDetails"
NewPlayerGroupDetails.Parent = RobloxReplicatedStorage
local NewPlayerCanManageDetails = Instance.new("RemoteEvent")
NewPlayerCanManageDetails.Name = "NewPlayerCanManageDetails"
NewPlayerCanManageDetails.Parent = RobloxReplicatedStorage
local SendPlayerBlockList = Instance.new("RemoteEvent")
SendPlayerBlockList.Name = "SendPlayerBlockList"
SendPlayerBlockList.Parent = RobloxReplicatedStorage
local UpdateLocalPlayerBlockList = Instance.new("RemoteEvent")
UpdateLocalPlayerBlockList.Name = "UpdateLocalPlayerBlockList"
UpdateLocalPlayerBlockList.Parent = RobloxReplicatedStorage
local SendPlayerProfileSettings = Instance.new("RemoteEvent")
SendPlayerProfileSettings.Name = "SendPlayerProfileSettings"
SendPlayerProfileSettings.Parent = RobloxReplicatedStorage
local RequestPlayerProfileSettings = nil

if FFlagInExperienceRequestProfileSettingsModule then
	RequestPlayerProfileSettings = Instance.new("RemoteEvent")
	RequestPlayerProfileSettings.Name = "RequestPlayerProfileSettings"
	RequestPlayerProfileSettings.Parent = RobloxReplicatedStorage
end
local UpdatePlayerProfileSettings = nil

if FFlagBadgeVisibilitySettingEnabled then
	UpdatePlayerProfileSettings = Instance.new("RemoteEvent")
	UpdatePlayerProfileSettings.Name = "UpdatePlayerProfileSettings"
	UpdatePlayerProfileSettings.Parent = RobloxReplicatedStorage
end
local ShowFriendJoinedPlayerToast = nil
local ShowPlayerJoinedFriendsToast = nil

if FFlagEnablePartyNudgeAfterJoin then
	ShowPlayerJoinedFriendsToast = Instance.new("RemoteEvent")
	ShowPlayerJoinedFriendsToast.Name = "ShowPlayerJoinedFriendsToast"
	ShowPlayerJoinedFriendsToast.Parent = RobloxReplicatedStorage
	ShowFriendJoinedPlayerToast = Instance.new("RemoteEvent")
	ShowFriendJoinedPlayerToast.Name = "ShowFriendJoinedPlayerToast"
	ShowFriendJoinedPlayerToast.Parent = RobloxReplicatedStorage
end
local CreateOrJoinParty = Instance.new("RemoteEvent")
CreateOrJoinParty.Name = "CreateOrJoinParty"
CreateOrJoinParty.Parent = RobloxReplicatedStorage
local ModerateChatSettingUpdated = nil

if FFlagEnableModerateChatRemoteEvent then
	ModerateChatSettingUpdated = Instance.new("RemoteEvent")
	ModerateChatSettingUpdated.Name = "ModerateChatSettingUpdated"
	ModerateChatSettingUpdated.Parent = RobloxReplicatedStorage
end
local ExpChatFeatureValueChanged = nil

if FFlagEnableSummarySystemMessageOnLua or FFlagAIRephraseSettingEnabled or FFlagChatSummariesSettingEnabled then
	ExpChatFeatureValueChanged = Instance.new("RemoteEvent")
	ExpChatFeatureValueChanged.Name = "ExpChatFeatureValueChanged"
	ExpChatFeatureValueChanged.Parent = RobloxReplicatedStorage
end
local t5 = {}

local function _(p1): boolean
	return type(p1) == "number"
end

local function verifyBlockList(UserIds): boolean
	if #UserIds == 0 or game:GetFastInt("MaxBlockListSize") < #UserIds then
		return false
	end
	for _, userId in pairs(UserIds) do
		if type(userId) ~= "number" then
			return false
		end
	end
	return true
end

local _ = function(Player)
	-- upvalues: NewPlayerGroupDetails (copy), t1 (copy)
	NewPlayerGroupDetails:FireClient(Player, t1)
end

local function getPlayerGroupDetails(Player: Player)
	-- upvalues: config (copy), t1 (copy), NewPlayerGroupDetails (copy)
	local t = {}
	
	for i, PlaceCreator in pairs(config) do
		if PlaceCreator.GroupRank == nil then
			local Success1, Result1 = pcall(function()
				-- upvalues: Player (copy), PlaceCreator (copy)
				return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then Player:IsInGroupAsync(PlaceCreator.GroupId) else Player:IsInGroup(PlaceCreator.GroupId)
			end)
			t[i] = Success1 and Result1
		else
			local Success, Result = pcall(function(): boolean
				-- upvalues: Player (copy), PlaceCreator (copy)
				return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then PlaceCreator.GroupRank <= Player:GetRankInGroupAsync(PlaceCreator.GroupId) else PlaceCreator.GroupRank <= Player:GetRankInGroup(PlaceCreator.GroupId)
			end)
			t[i] = Success and Result
		end
	end
	if Player.Parent then
		local Text = tostring(Player.UserId)
		t1[Text] = t
		NewPlayerGroupDetails:FireAllClients({ [Text] = t })
	end
end

local function sendCanChatWith(Player: Player)
	-- upvalues: Players (copy), UseNewDirectChatAPI (copy), TextChatService (copy), CanChatWith (copy), Chat (copy)
	local t = {}
	
	for _, player in ipairs(Players:GetPlayers()) do
		if UseNewDirectChatAPI then
			local Success, Result = pcall(function()
				-- upvalues: TextChatService (upval), Player (copy), player (copy)
				return TextChatService:CanUsersDirectChatAsync(Player.UserId, { player.UserId })
			end)
			t[player.UserId] = Success and #Result > 0
			CanChatWith:FireClient(player, { [Player.UserId] = Success and #Result > 0 })
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: Chat (upval), Player (copy), player (copy)
				return Chat:CanUsersChatAsync(Player.UserId, player.UserId)
			end)
			t[player.userId] = Success1 and Result1
			CanChatWith:FireClient(player, { [Player.userId] = Success1 and Result1 })
		end
	end
	CanChatWith:FireClient(Player, t)
end

local function sendPlayerAllCanManage(Player)
	-- upvalues: t2 (copy), NewPlayerCanManageDetails (copy)
	for i, value in pairs(t2) do
		NewPlayerCanManageDetails:FireClient(Player, i, value)
	end
end

local function getPlayerCanManage(Player: Player)
	-- upvalues: LuaGetCanManageAsyncEngineFeature (copy), t2 (copy), NewPlayerCanManageDetails (copy), Url (copy), HttpService (copy), FFlagUserPresenceTokenRccCheckPermissionsLuaModule (copy), HttpRbxApiService (copy)
	if LuaGetCanManageAsyncEngineFeature then
		if Player.UserId <= 0 or not Player.Parent then return end
		local Flag1 = false
		local Success, Result = pcall(Player.GetCanManageAsync, Player)
		
		if Success and Result then
			Flag1 = true
		end
		local Text = tostring(Player.UserId)
		t2[Text] = Flag1
		NewPlayerCanManageDetails:FireAllClients(Text, Flag1)
		
		return
	else
		local Flag = false
		
		if Player.UserId > 0 then
			local Success1, Result1 = pcall(function()
				-- upvalues: Url (upval), HttpService (upval), Player (copy), FFlagUserPresenceTokenRccCheckPermissionsLuaModule (upval), HttpRbxApiService (upval)
				local Formatted = string.format(Url.APIS_URL .. "asset-permissions-api/v1/rcc/assets/check-permissions")
				local Json = HttpService:JSONEncode({
					requests = {
						{
							action = "Edit",
							subject = { subjectType = "User", subjectId = Player.UserId },
							assetId = game.PlaceId
						}
					}
				})
				
				return HttpService:JSONDecode(if FFlagUserPresenceTokenRccCheckPermissionsLuaModule then HttpRbxApiService:PostAsyncFullUrlForPlayer(Formatted, Json, Player) else HttpRbxApiService:PostAsyncFullUrl(Formatted, Json))
			end)
			
			if Success1 then
				local Result2 = Result1.results[1]
				
				if Result2.value and Result2.value.status == "HasPermission" then
					Flag = true
				end
			end
		end
		if Player.Parent then
			local Text = tostring(Player.UserId)
			t2[Text] = Flag
			NewPlayerCanManageDetails:FireAllClients(Text, Flag)
		end
	end
end

local _ = function(Player: Player, UserIds)
	-- upvalues: Url (copy), HttpService (copy), HttpRbxApiService (copy)
	return pcall(function()
		-- upvalues: Url (upval), HttpService (upval), UserIds (copy), Player (copy), HttpRbxApiService (upval)
		return HttpService:JSONDecode((HttpRbxApiService:PostAsyncFullUrl(string.format(Url.APIS_URL .. "user-blocking-api/v1/users/rcc/batch-check-reciprocal-block"), (HttpService:JSONEncode({ userIds = UserIds, requesterUserId = Player.UserId })))))
	end)
end

local function sendPlayerBlockList(Player: Player)
	-- upvalues: GlobalUserBlockingLuaReadsFromSCMCache (copy), Players (copy), UpdateLocalPlayerBlockList (copy), SendPlayerBlockList (copy), Url (copy), HttpService (copy), HttpRbxApiService (copy)
	if Player.UserId <= 0 then return end
	if GlobalUserBlockingLuaReadsFromSCMCache then
		local function scanAndSendBlockList(p1)
			-- upvalues: Player (copy), Players (upval), UpdateLocalPlayerBlockList (upval), SendPlayerBlockList (upval)
			if not Player.Parent then return end
			local t = {}
			
			for _, player in Players:GetPlayers() do
				if player ~= Player then
					if Player:HasBlockedPlayer(player.UserId) then
						t[player.UserId] = true
					end
					if p1 and player:HasBlockedPlayer(Player.UserId) then
						UpdateLocalPlayerBlockList:FireClient(player, Player.UserId, true)
					end
				end
			end
			SendPlayerBlockList:FireClient(Player, t)
		end
		
		local UserIds = false
		Player.BlockListChanged:Connect(function()
			-- upvalues: UserIds (ref), scanAndSendBlockList (copy)
			if UserIds then
				scanAndSendBlockList(false)
				
				return
			else
				scanAndSendBlockList(true)
				UserIds = true
			end
		end)
		
		if Player:GetBlockListInitialized() then
			scanAndSendBlockList(true)
			UserIds = true
		end
		return
	else
		local UserIds = {}
		
		for _, player in Players:GetPlayers() do
			if Player ~= player then
				table.insert(UserIds, player.UserId)
			end
		end
		local Success, Result = pcall(function()
			-- upvalues: Url (upval), HttpService (upval), UserIds (copy), Player (copy), HttpRbxApiService (upval)
			return HttpService:JSONDecode((HttpRbxApiService:PostAsyncFullUrl(string.format(Url.APIS_URL .. "user-blocking-api/v1/users/rcc/batch-check-reciprocal-block"), (HttpService:JSONEncode({ userIds = UserIds, requesterUserId = Player.UserId })))))
		end)
		local List = {}
		local t = {}
		
		if Success and Result then
			for _, user in Result.users do
				if user.isBlocked then
					t[user.userId] = true
					table.insert(List, user.userId)
				end
				if user.isBlockingViewer then
					local Player1 = Players:GetPlayerByUserId(user.userId)
					Player1:UpdatePlayerBlocked(Player.UserId, true)
					UpdateLocalPlayerBlockList:FireClient(Player1, Player.UserId, true)
				end
			end
		end
		Player:AddToBlockList(List)
		
		if game:GetFastFlag("EnableSetUserBlocklistInitialized") then
			Player:SetBlockListInitialized()
		end
		SendPlayerBlockList:FireClient(Player, t)
	end
end

local function sendPlayerAllInExperienceNameEnabled(Player)
	-- upvalues: t3 (copy), SendPlayerProfileSettings (copy)
	for i, IsInExperienceNameEnabled in pairs(t3) do
		SendPlayerProfileSettings:FireClient(Player, i, { isInExperienceNameEnabled = IsInExperienceNameEnabled })
	end
end

local _ = function(Player: Player)
	-- upvalues: Url (copy), HttpRbxApiService (copy), HttpService (copy)
	return pcall(function()
		-- upvalues: Player (copy), Url (upval), HttpRbxApiService (upval), HttpService (upval)
		return HttpService:JSONDecode((HttpRbxApiService:GetAsyncFullUrl(Url.APIS_URL .. `user-profile-api/v1/user/profiles/rcc/settings?userId={Player.UserId}`, Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players)))
	end)
end

local function Callback(Player: Player)
	-- upvalues: FStringRccInExperienceNameEnabledAllowListModule (copy), DisableRCCAntiHarrasmentAllowList (copy), Url (copy), HttpRbxApiService (copy), HttpService (copy), t3 (copy), SendPlayerProfileSettings (copy)
	if Player.UserId <= 0 then return end
	local IsInExperienceNameEnabled = false
	
	if FStringRccInExperienceNameEnabledAllowListModule.isAllowListedUserId(Player.UserId) or DisableRCCAntiHarrasmentAllowList then
		local Success, Result = pcall(function()
			-- upvalues: Player (copy), Url (upval), HttpRbxApiService (upval), HttpService (upval)
			return HttpService:JSONDecode((HttpRbxApiService:GetAsyncFullUrl(Url.APIS_URL .. `user-profile-api/v1/user/profiles/rcc/settings?userId={Player.UserId}`, Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players)))
		end)
		
		if Success and Result then
			IsInExperienceNameEnabled = Result.isSettingsEnabled and (Result.userProfileSettings and Result.userProfileSettings.isInExperienceNameEnabled)
		end
	end
	local Text = tostring(Player.UserId)
	t3[Text] = IsInExperienceNameEnabled
	SendPlayerProfileSettings:FireAllClients(Text, { isInExperienceNameEnabled = IsInExperienceNameEnabled })
end

if FFlagInExperienceRequestProfileSettingsModule then
	RequestPlayerProfileSettings.OnServerEvent:Connect(function(Player: Player)
		-- upvalues: t3 (copy), SendPlayerProfileSettings (copy), Callback (copy)
		local Text = tostring(Player.UserId)
		local Entry = t3[Text]
		
		if Entry == nil then
			coroutine.wrap(Callback)(Player)
			
			return
		else
			SendPlayerProfileSettings:FireClient(Player, Text, { isInExperienceNameEnabled = Entry })
		end
	end)
end
local _ = function(InviterId, InviteeId, NudgeType)
	-- upvalues: Url (copy), HttpService (copy), EnableCreatePartyNudgeWithVersion (copy), GatePrivateServerNudge (copy), HttpRbxApiService (copy)
	return pcall(function()
		-- upvalues: Url (upval), HttpService (upval), InviterId (copy), InviteeId (copy), NudgeType (copy), EnableCreatePartyNudgeWithVersion (upval), GatePrivateServerNudge (upval), HttpRbxApiService (upval)
		return HttpService:JSONDecode((HttpRbxApiService:PostAsyncFullUrl(string.format(Url.APIS_URL .. "group-up/v1/create-party-nudge"), (HttpService:JSONEncode({
			inviterId = InviterId,
			inviteeId = InviteeId,
			nudgeType = NudgeType,
			placeId = game.PlaceId,
			gameInstanceId = game.JobId,
			universeId = game.GameId,
			version = if EnableCreatePartyNudgeWithVersion then 1 else nil,
			privateServerId = if GatePrivateServerNudge then game.PrivateServerId else nil,
			privateServerOwnerId = if GatePrivateServerNudge then game.PrivateServerOwnerId else nil
		})))))
	end)
end

local function canCreatePartyNudge(Player)
	if Player then
		local config = {
			Windows = true,
			iOS = true,
			Android = true,
			OSX = true,
			Win32 = true,
			Windows_Universal = true
		}
		
		return Player.PartyId == "" and (Player.VRDevice == "" and typeof(Player.OsPlatform) == "string") and config[Player.OsPlatform]
	else
		return false
	end
end

local function Callback1(Player: Player)
	-- upvalues: Players (copy), EnableCreatePartyNudge (copy), canCreatePartyNudge (copy), Url (copy), HttpService (copy), EnableCreatePartyNudgeWithVersion (copy), GatePrivateServerNudge (copy), HttpRbxApiService (copy), CreateOrJoinParty (copy), ShowFriendJoinedPlayerToast (ref), ShowPlayerJoinedFriendsToast (ref)
	local Player1 = nil
	local Players1 = Players:GetPlayers()
	
	for _, Player2 in Players1 do
		if Player2.UserId == Player.FollowUserId then
			Player1 = Player2
			break
		end
	end
	local v1 = false
	
	if EnableCreatePartyNudge and canCreatePartyNudge(Player1) and canCreatePartyNudge(Player) then
		local UserId = Player.UserId
		local UserId1 = Player1.UserId
		local NudgeType = "OneToOneNudgeInExperience"
		local Result
		v1, Result = pcall(function()
			-- upvalues: Url (upval), HttpService (upval), UserId (copy), UserId1 (copy), NudgeType (copy), EnableCreatePartyNudgeWithVersion (upval), GatePrivateServerNudge (upval), HttpRbxApiService (upval)
			return HttpService:JSONDecode((HttpRbxApiService:PostAsyncFullUrl(string.format(Url.APIS_URL .. "group-up/v1/create-party-nudge"), (HttpService:JSONEncode({
				inviterId = UserId,
				inviteeId = UserId1,
				nudgeType = NudgeType,
				placeId = game.PlaceId,
				gameInstanceId = game.JobId,
				universeId = game.GameId,
				version = if EnableCreatePartyNudgeWithVersion then 1 else nil,
				privateServerId = if GatePrivateServerNudge then game.PrivateServerId else nil,
				privateServerOwnerId = if GatePrivateServerNudge then game.PrivateServerOwnerId else nil
			})))))
		end)
		
		if v1 and Result and Result.shouldAutoCreateOrJoinGroupUp then
			CreateOrJoinParty:FireClient(Player, "PartyNudge", Result.nudge)
		end
	end
	if not v1 and #Players1 > 0 then
		if Player1 then
			ShowFriendJoinedPlayerToast:FireClient(Player1, Player)
		end
		ShowPlayerJoinedFriendsToast:FireClient(Player)
	end
end

local function onPlayerAdded(Player: Player)
	-- upvalues: sendPlayerBlockList (copy), NewPlayerGroupDetails (copy), t1 (copy), getPlayerGroupDetails (copy), FFlagInExperienceUserProfileSettingsEnabledModule (copy), sendPlayerAllInExperienceNameEnabled (copy), Callback (copy), sendPlayerAllCanManage (copy), getPlayerCanManage (copy), sendCanChatWith (copy), FFlagEnablePartyNudgeAfterJoin (copy), Callback1 (copy)
	coroutine.wrap(sendPlayerBlockList)(Player)
	NewPlayerGroupDetails:FireClient(Player, t1)
	
	if Player.UserId > 0 then
		coroutine.wrap(getPlayerGroupDetails)(Player)
	end
	if FFlagInExperienceUserProfileSettingsEnabledModule then
		sendPlayerAllInExperienceNameEnabled(Player)
		coroutine.wrap(Callback)(Player)
	end
	sendPlayerAllCanManage(Player)
	coroutine.wrap(getPlayerCanManage)(Player)
	sendCanChatWith(Player)
	
	if FFlagEnablePartyNudgeAfterJoin then
		coroutine.wrap(Callback1)(Player)
	end
end

SetPlayerBlockList.OnServerEvent:Connect(function(Player, UserIds)
	-- upvalues: verifyBlockList (copy)
	if game:GetFastFlag("EnableSetUserBlocklistInitialized") then
		Player:SetBlockListInitialized()
	end
	if type(UserIds) == "table" and verifyBlockList(UserIds) then
		Player:AddToBlockList(UserIds)
	end
end)
UpdatePlayerBlockList.OnServerEvent:Connect(function(Player, UserId, Blocked)
	if type(Blocked) == "boolean" and type(UserId) == "number" then
		Player:UpdatePlayerBlocked(UserId, Blocked)
	end
end)

if FFlagBadgeVisibilitySettingEnabled then
	UpdatePlayerProfileSettings.OnServerEvent:Connect(function(Player, p2)
		-- upvalues: ProfileSettingsSlidingWindowRateLimit (copy), t4 (copy), ProfileSettingsRateLimitWindowSeconds (copy), ProfileSettingsMaxRequestsPerWindow (copy), CurrentTimes (copy), ProfileSettingsRateLimitSeconds (copy), t3 (copy), SendPlayerProfileSettings (copy)
		if type(p2) ~= "table" then return end
		local t = {}
		
		if type(p2.isInExperienceNameEnabled) ~= "boolean" then return end
		t.isInExperienceNameEnabled = p2.isInExperienceNameEnabled
		local Text = tostring(Player.UserId)
		local CurrentTime = tick()
		
		if ProfileSettingsSlidingWindowRateLimit then
			if not t4[Text] then
				t4[Text] = {}
			end
			local Entry = t4[Text]
			local CurrentTimeDelta = CurrentTime - ProfileSettingsRateLimitWindowSeconds
			
			for i = #Entry, 1, -1 do
				if Entry[i] < CurrentTimeDelta then
					table.remove(Entry, i)
				end
			end
			if ProfileSettingsMaxRequestsPerWindow <= #Entry then return end
			table.insert(Entry, CurrentTime)
		else
			local CurrentTime1: number = CurrentTimes[Text]
			
			if CurrentTime1 and CurrentTime - CurrentTime1 < ProfileSettingsRateLimitSeconds then return end
			CurrentTimes[Text] = CurrentTime
		end
		t3[Text] = t.isInExperienceNameEnabled
		SendPlayerProfileSettings:FireAllClients(Text, t)
	end)
end
if FFlagEnableModerateChatRemoteEvent then
	ModerateChatSettingUpdated.OnServerEvent:Connect(function(Player: Player, p2)
		-- upvalues: TextChatService (copy), ModerateChatSettingUpdated (ref)
		if typeof(p2) == "boolean" and TextChatService:setModerationModeEnabled(Player.UserId, p2) then
			ModerateChatSettingUpdated:FireClient(Player, p2)
		end
	end)
end
if FFlagEnableSummarySystemMessageOnLua or (FFlagAIRephraseSettingEnabled or FFlagChatSummariesSettingEnabled) then
	TextChatService.ExpChatFeatureValueChanged:Connect(function(UserId, FeatureName, FeatureValue)
		-- upvalues: Players (copy), ExpChatFeatureValueChanged (ref)
		local Player = Players:GetPlayerByUserId(UserId)
		
		if Player then
			ExpChatFeatureValueChanged:FireClient(Player, UserId, FeatureName, FeatureValue)
		end
	end)
end
Players.PlayerAdded:connect(onPlayerAdded)

for _, player in pairs(Players:GetPlayers()) do
	onPlayerAdded(player)
end
Players.PlayerRemoving:connect(function(Player)
	-- upvalues: t (copy), t5 (copy), t1 (copy), t2 (copy), t3 (copy), FFlagBadgeVisibilitySettingEnabled (copy), ProfileSettingsSlidingWindowRateLimit (copy), t4 (copy), CurrentTimes (copy)
	local Text = tostring(Player.UserId)
	
	if t[Text] then
		t[Text] = nil
		t5[Text] = nil
	end
	if t1[Text] then
		t1[Text] = nil
	end
	if t2[Text] ~= nil then
		t2[Text] = nil
	end
	if t3[Text] ~= nil then
		t3[Text] = nil
	end
	if FFlagBadgeVisibilitySettingEnabled then
		if ProfileSettingsSlidingWindowRateLimit then
			if t4[Text] ~= nil then
				t4[Text] = nil
				
				return
			end
		elseif CurrentTimes[Text] ~= nil then
			CurrentTimes[Text] = nil
		end
	end
end)

local function Callback2() end

for _, RemoteEvent in ipairs(RobloxReplicatedStorage:GetChildren()) do
	if RemoteEvent:IsA("RemoteEvent") then
		RemoteEvent.OnServerEvent:Connect(Callback2)
	end
end