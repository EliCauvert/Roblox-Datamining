local replicatedStorageService = game:GetService("ReplicatedStorage")
local _script = script
local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local chatService = game:GetService("Chat")
local chatServiceModule = require(_script:WaitForChild("ChatService"))
local chatSettingsModule = require(chatService:WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"))
local var7 = nil
pcall(function() --[[ line: 20 ]]
	-- upvalues: var7 (write), chatService (ref)
	var7 = require(chatService.ClientChatModules.ChatLocalization)
end)
var7 = var7 or {}
local maxChannelNameCheckLength = chatSettingsModule.MaxChannelNameCheckLength or 50
local maximumMessageLength = chatSettingsModule.MaximumMessageLength

if not var7.FormatMessageToSend or not var7.LocalizeFormattedMessage then
	function var7.FormatMessageToSend(_, _, p0) --[[ line: 28 ]]
		return p0
	end
end
local t = {}
local defaultChatSystemChatEvents_1 = replicatedStorageService:FindFirstChild("DefaultChatSystemChatEvents")

if not defaultChatSystemChatEvents_1 then
	defaultChatSystemChatEvents_1 = Instance.new("Folder")
	defaultChatSystemChatEvents_1.Name = "DefaultChatSystemChatEvents"
	defaultChatSystemChatEvents_1.Archivable = false
	defaultChatSystemChatEvents_1.Parent = replicatedStorageService
end
local function validateMessageLength(p1) --[[ line: 43 ]]
	-- upvalues: maximumMessageLength (ref)
	return if maximumMessageLength * 6 < p1:len() then false elseif utf8.len(p1) == nil then false else maximumMessageLength >= utf8.len(utf8.nfcnormalize(p1))
end

local function validateChannelNameLength(p2) --[[ line: 59 ]]
	-- upvalues: maxChannelNameCheckLength (ref)
	return if maxChannelNameCheckLength * 6 < p2:len() then false elseif utf8.len(p2) == nil then false else maxChannelNameCheckLength >= utf8.len(utf8.nfcnormalize(p2))
end

local function emptyFunction() --[[ line: 77 ]] end

local function GetObjectWithNameAndType(p3, p4, p5) --[[ line: 81 ]]
	for i, v in pairs(p3:GetChildren()) do
		if v:IsA(p5) and v.Name == p4 then
			return v
		end
	end
	return nil
end

local function _(p6, p7, p8) --[[ line: 91 | named "CreateIfDoesntExist" ]]
	-- upvalues: GetObjectWithNameAndType (ref), t (ref)
	local var52 = GetObjectWithNameAndType(p6, p7, p8)
	
	if not var52 then
		var52 = Instance.new(p8)
		var52.Name = p7
		var52.Parent = p6
	end
	t[p7] = var52
	
	return var52
end

local _ = function(p9, p10) --[[ line: 104 | named "CreateEventIfItDoesntExist" ]]
	-- upvalues: GetObjectWithNameAndType (ref), t (ref), emptyFunction (ref)
	local var53 = GetObjectWithNameAndType(p9, p10, "RemoteEvent")
	
	if not var53 then
		var53 = Instance.new("RemoteEvent")
		var53.Name = p10
		var53.Parent = p9
	end
	t[p10] = var53
	var53.OnServerEvent:Connect(emptyFunction)
	
	return var53
end

local var15 = defaultChatSystemChatEvents_1
local onNewMessage = GetObjectWithNameAndType(var15, "OnNewMessage", "RemoteEvent")

if not onNewMessage then
	onNewMessage = Instance.new("RemoteEvent")
	onNewMessage.Name = "OnNewMessage"
	onNewMessage.Parent = var15
end
t.OnNewMessage = onNewMessage
onNewMessage.OnServerEvent:Connect(emptyFunction)
local var17 = defaultChatSystemChatEvents_1
local onMessageDoneFiltering = GetObjectWithNameAndType(var17, "OnMessageDoneFiltering", "RemoteEvent")

if not onMessageDoneFiltering then
	onMessageDoneFiltering = Instance.new("RemoteEvent")
	onMessageDoneFiltering.Name = "OnMessageDoneFiltering"
	onMessageDoneFiltering.Parent = var17
end
t.OnMessageDoneFiltering = onMessageDoneFiltering
onMessageDoneFiltering.OnServerEvent:Connect(emptyFunction)
local var19 = defaultChatSystemChatEvents_1
local onNewSystemMessage = GetObjectWithNameAndType(var19, "OnNewSystemMessage", "RemoteEvent")

if not onNewSystemMessage then
	onNewSystemMessage = Instance.new("RemoteEvent")
	onNewSystemMessage.Name = "OnNewSystemMessage"
	onNewSystemMessage.Parent = var19
end
t.OnNewSystemMessage = onNewSystemMessage
onNewSystemMessage.OnServerEvent:Connect(emptyFunction)
local var21 = defaultChatSystemChatEvents_1
local onChannelJoined = GetObjectWithNameAndType(var21, "OnChannelJoined", "RemoteEvent")

if not onChannelJoined then
	onChannelJoined = Instance.new("RemoteEvent")
	onChannelJoined.Name = "OnChannelJoined"
	onChannelJoined.Parent = var21
end
t.OnChannelJoined = onChannelJoined
onChannelJoined.OnServerEvent:Connect(emptyFunction)
local var23 = defaultChatSystemChatEvents_1
local onChannelLeft = GetObjectWithNameAndType(var23, "OnChannelLeft", "RemoteEvent")

if not onChannelLeft then
	onChannelLeft = Instance.new("RemoteEvent")
	onChannelLeft.Name = "OnChannelLeft"
	onChannelLeft.Parent = var23
end
t.OnChannelLeft = onChannelLeft
onChannelLeft.OnServerEvent:Connect(emptyFunction)
local var25 = defaultChatSystemChatEvents_1
local onMuted = GetObjectWithNameAndType(var25, "OnMuted", "RemoteEvent")

if not onMuted then
	onMuted = Instance.new("RemoteEvent")
	onMuted.Name = "OnMuted"
	onMuted.Parent = var25
end
t.OnMuted = onMuted
onMuted.OnServerEvent:Connect(emptyFunction)
local var27 = defaultChatSystemChatEvents_1
local onUnmuted = GetObjectWithNameAndType(var27, "OnUnmuted", "RemoteEvent")

if not onUnmuted then
	onUnmuted = Instance.new("RemoteEvent")
	onUnmuted.Name = "OnUnmuted"
	onUnmuted.Parent = var27
end
t.OnUnmuted = onUnmuted
onUnmuted.OnServerEvent:Connect(emptyFunction)
local var29 = defaultChatSystemChatEvents_1
local onMainChannelSet = GetObjectWithNameAndType(var29, "OnMainChannelSet", "RemoteEvent")

if not onMainChannelSet then
	onMainChannelSet = Instance.new("RemoteEvent")
	onMainChannelSet.Name = "OnMainChannelSet"
	onMainChannelSet.Parent = var29
end
t.OnMainChannelSet = onMainChannelSet
onMainChannelSet.OnServerEvent:Connect(emptyFunction)
local var31 = defaultChatSystemChatEvents_1
local channelNameColorUpdated = GetObjectWithNameAndType(var31, "ChannelNameColorUpdated", "RemoteEvent")

if not channelNameColorUpdated then
	channelNameColorUpdated = Instance.new("RemoteEvent")
	channelNameColorUpdated.Name = "ChannelNameColorUpdated"
	channelNameColorUpdated.Parent = var31
end
t.ChannelNameColorUpdated = channelNameColorUpdated
channelNameColorUpdated.OnServerEvent:Connect(emptyFunction)
local var33 = defaultChatSystemChatEvents_1
local sayMessageRequest = GetObjectWithNameAndType(var33, "SayMessageRequest", "RemoteEvent")

if not sayMessageRequest then
	sayMessageRequest = Instance.new("RemoteEvent")
	sayMessageRequest.Name = "SayMessageRequest"
	sayMessageRequest.Parent = var33
end
t.SayMessageRequest = sayMessageRequest
sayMessageRequest.OnServerEvent:Connect(emptyFunction)
local var35 = defaultChatSystemChatEvents_1
local setBlockedUserIdsRequest = GetObjectWithNameAndType(var35, "SetBlockedUserIdsRequest", "RemoteEvent")

if not setBlockedUserIdsRequest then
	setBlockedUserIdsRequest = Instance.new("RemoteEvent")
	setBlockedUserIdsRequest.Name = "SetBlockedUserIdsRequest"
	setBlockedUserIdsRequest.Parent = var35
end
t.SetBlockedUserIdsRequest = setBlockedUserIdsRequest
setBlockedUserIdsRequest.OnServerEvent:Connect(emptyFunction)
local var37 = defaultChatSystemChatEvents_1
local getInitDataRequest = GetObjectWithNameAndType(var37, "GetInitDataRequest", "RemoteFunction")

if not getInitDataRequest then
	getInitDataRequest = Instance.new("RemoteFunction")
	getInitDataRequest.Name = "GetInitDataRequest"
	getInitDataRequest.Parent = var37
end
t.GetInitDataRequest = getInitDataRequest
local var39 = defaultChatSystemChatEvents_1
local mutePlayerRequest = GetObjectWithNameAndType(var39, "MutePlayerRequest", "RemoteFunction")

if not mutePlayerRequest then
	mutePlayerRequest = Instance.new("RemoteFunction")
	mutePlayerRequest.Name = "MutePlayerRequest"
	mutePlayerRequest.Parent = var39
end
t.MutePlayerRequest = mutePlayerRequest
local var41 = defaultChatSystemChatEvents_1
local unMutePlayerRequest = GetObjectWithNameAndType(var41, "UnMutePlayerRequest", "RemoteFunction")

if not unMutePlayerRequest then
	unMutePlayerRequest = Instance.new("RemoteFunction")
	unMutePlayerRequest.Name = "UnMutePlayerRequest"
	unMutePlayerRequest.Parent = var41
end
t.UnMutePlayerRequest = unMutePlayerRequest
local var43 = t

local function CreatePlayerSpeakerObject(p11) --[[ line: 128 ]]
	-- upvalues: chatServiceModule (ref), var43 (write)
	if chatServiceModule:GetSpeaker(p11.Name) then
		chatServiceModule:RemoveSpeaker(p11.Name)
	end
	local name = chatServiceModule:InternalAddSpeakerWithPlayerObject(p11.Name, p11, false)
	
	for i, v in pairs(chatServiceModule:GetAutoJoinChannelList()) do
		name:JoinChannel(v.Name)
	end
	name:InternalAssignEventFolder(var43)
	name.ChannelJoined:connect(function(p12, p13) --[[ line: 145 ]]
		-- upvalues: chatServiceModule (copy), name (write), var43 (copy), p11 (ref)
		local var55 = nil
		local channelNameColor = nil
		local var56 = chatServiceModule:GetChannel(p12)
		
		if var56 then
			var55 = var56:GetHistoryLogForSpeaker(name)
			channelNameColor = var56.ChannelNameColor
		end
		var43.OnChannelJoined:FireClient(p11, p12, p13, var55, channelNameColor)
	end)
	name.Muted:connect(function(p14, p15, p16) --[[ line: 157 ]]
		-- upvalues: var43 (copy), p11 (ref)
		var43.OnMuted:FireClient(p11, p14, p15, p16)
	end)
	name.Unmuted:connect(function(p17) --[[ line: 161 ]]
		-- upvalues: var43 (copy), p11 (ref)
		var43.OnUnmuted:FireClient(p11, p17)
	end)
	chatServiceModule:InternalFireSpeakerAdded(name.Name)
end

var43.SayMessageRequest.OnServerEvent:connect(function(p18, p19, p20) --[[ line: 168 ]]
	-- upvalues: validateMessageLength (ref), validateChannelNameLength (ref), chatServiceModule (ref)
	if type(p19) ~= "string" then return end
	if not validateMessageLength(p19) then return end
	if type(p20) ~= "string" then return end
	if not validateChannelNameLength(p20) then return end
	local nameSpeaker = chatServiceModule:GetSpeaker(p18.Name)
	
	return if nameSpeaker then nameSpeaker:SayMessage(p19, p20) else nil
end)

function var43.MutePlayerRequest.OnServerInvoke(p21, p22) --[[ line: 189 ]]
	-- upvalues: chatServiceModule (ref)
	if type(p22) ~= "string" then return end
	local nameSpeaker = chatServiceModule:GetSpeaker(p21.Name)
	
	if nameSpeaker then
		local var59 = chatServiceModule:GetSpeaker(p22)
		
		if var59 then
			nameSpeaker:AddMutedSpeaker(var59.Name)
			
			return true
		end
	end
	return false
end

function var43.UnMutePlayerRequest.OnServerInvoke(p23, p24) --[[ line: 205 ]]
	-- upvalues: chatServiceModule (ref)
	if type(p24) ~= "string" then return end
	local nameSpeaker = chatServiceModule:GetSpeaker(p23.Name)
	
	if nameSpeaker then
		local var61 = chatServiceModule:GetSpeaker(p24)
		
		if var61 then
			nameSpeaker:RemoveMutedSpeaker(var61.Name)
			
			return true
		end
	end
	return false
end

local t_1 = {}
playersService.PlayerAdded:connect(function(p25) --[[ line: 224 ]]
	-- upvalues: t_1 (ref), chatServiceModule (ref)
	for i, v in pairs(t_1) do
		local nameSpeaker = chatServiceModule:GetSpeaker(i.Name)
		
		if nameSpeaker then
			for i_1 = 1, #v do
				if v[i_1] == p25.UserId then
					nameSpeaker:AddMutedSpeaker(p25.Name)
				end
			end
		end
	end
end)
playersService.PlayerRemoving:connect(function(p26) --[[ line: 238 ]]
	-- upvalues: t_1 (ref)
	t_1[p26] = nil
end)
var43.SetBlockedUserIdsRequest.OnServerEvent:Connect(function(p27, p28) --[[ line: 242 ]]
	-- upvalues: chatServiceModule (ref), playersService (ref), t_1 (ref)
	if type(p28) ~= "table" then return end
	local t = {}
	local nameSpeaker = chatServiceModule:GetSpeaker(p27.Name)
	
	if nameSpeaker then
		for i = 1, math.min(#p28, 50) do
			if type(p28[i]) == "number" then
				table.insert(t, p28[i])
				local var65 = playersService:GetPlayerByUserId(p28[i])
				
				if var65 then
					nameSpeaker:AddMutedSpeaker(var65.Name)
				end
			end
		end
		t_1[p27] = t
	end
end)

function var43.GetInitDataRequest.OnServerInvoke(p29) --[[ line: 268 ]]
	-- upvalues: chatServiceModule (ref), CreatePlayerSpeakerObject (ref)
	local nameSpeaker = chatServiceModule:GetSpeaker(p29.Name)
	
	if not nameSpeaker or not nameSpeaker:GetPlayer() then
		CreatePlayerSpeakerObject(p29)
		nameSpeaker = chatServiceModule:GetSpeaker(p29.Name)
	end
	local t = { Channels = {}, SpeakerExtraData = {} }
	
	for i, v in pairs(nameSpeaker:GetChannelList()) do
		local var68 = chatServiceModule:GetChannel(v)
		
		if var68 then
			table.insert(t.Channels, {
				v,
				var68:GetWelcomeMessageForSpeaker(nameSpeaker),
				var68:GetHistoryLogForSpeaker(nameSpeaker),
				var68.ChannelNameColor
			})
		end
	end
	for i, v_1 in pairs(chatServiceModule:GetSpeakerList()) do
		t.SpeakerExtraData[v_1] = chatServiceModule:GetSpeaker(v_1).ExtraData
	end
	return t
end

local function DoJoinCommand(p30, p31, p32) --[[ line: 302 ]]
	-- upvalues: chatServiceModule (ref), var7 (write)
	local var69 = chatServiceModule:GetSpeaker(p30)
	local var70 = chatServiceModule:GetChannel(p31)
	
	if var69 then
		if var70 then
			if not var70.Joinable then
				var69:SendSystemMessage(var7:FormatMessageToSend("GameChat_ChatServiceRunner_YouCannotJoinChannel", "You cannot join channel '" .. p31 .. "'.", "RBX_NAME", p31), p32)
				
				return
			elseif var69:IsInChannel(var70.Name) then
				var69:SetMainChannel(var70.Name)
				var69:SendSystemMessage(var7:FormatMessageToSend("GameChat_SwitchChannel_NowInChannel", string.format("You are now chatting in channel: '%s'", var70.Name), "RBX_NAME", var70.Name), var70.Name)
				
				return
			end
			var69:JoinChannel(var70.Name)
			
			return
		else
			var69:SendSystemMessage(var7:FormatMessageToSend("GameChat_ChatServiceRunner_ChannelDoesNotExist", "Channel '" .. p31 .. "' does not exist.", "RBX_NAME", p31), p32)
		end
	end
end

local function DoLeaveCommand(p33, p34, p35) --[[ line: 339 ]]
	-- upvalues: chatServiceModule (ref), var7 (write)
	local var71 = chatServiceModule:GetSpeaker(p33)
	local var72 = chatServiceModule:GetChannel(p34)
	
	if var71 then
		if var71:IsInChannel(p34) then
			if var72.Leavable then
				var71:LeaveChannel(var72.Name)
				var71:SendSystemMessage(var7:FormatMessageToSend("GameChat_ChatService_YouHaveLeftChannel", string.format("You have left channel '%s'", p34), "RBX_NAME", var72.Name), "System")
				
				return
			end
			var71:SendSystemMessage(var7:FormatMessageToSend("GameChat_ChatServiceRunner_YouCannotLeaveChannel", "You cannot leave channel '" .. p34 .. "'.", "RBX_NAME", p34), p35)
			
			return
		else
			var71:SendSystemMessage(var7:FormatMessageToSend("GameChat_ChatServiceRunner_YouAreNotInChannel", "You are not in channel '" .. p34 .. "'.", "RBX_NAME", p34), p35)
		end
	end
end

chatServiceModule:RegisterProcessCommandsFunction("default_commands", function(p36, p37, p38) --[[ line: 372 ]]
	-- upvalues: DoJoinCommand (ref), DoLeaveCommand (ref)
	if string.sub(p37, 1, 6):lower() == "/join " then
		DoJoinCommand(p36, string.sub(p37, 7), p38)
		
		return true
	elseif string.sub(p37, 1, 3):lower() == "/j " then
		DoJoinCommand(p36, string.sub(p37, 4), p38)
		
		return true
	elseif string.sub(p37, 1, 7):lower() == "/leave " then
		DoLeaveCommand(p36, string.sub(p37, 8), p38)
		
		return true
	elseif string.sub(p37, 1, 3):lower() == "/l " then
		DoLeaveCommand(p36, string.sub(p37, 4), p38)
		
		return true
	end
	return false
end)

if chatSettingsModule.GeneralChannelName and chatSettingsModule.GeneralChannelName ~= "" then
	local generalChannelName = chatServiceModule:AddChannel(chatSettingsModule.GeneralChannelName)
	generalChannelName.Leavable = false
	generalChannelName.AutoJoin = true
	generalChannelName:RegisterGetWelcomeMessageFunction(function(p39) --[[ line: 396 ]]
		-- upvalues: runService (ref), chatService (ref)
		if runService:IsStudio() then
			return nil
		end
		local player = p39:GetPlayer()
		
		if player then
			local ok, status = pcall(function() --[[ line: 402 ]]
				-- upvalues: chatService (copy), player (ref)
				return chatService:CanUserChatAsync(player.UserId)
			end)
			
			if ok and not status then
				return ""
			end
		end
	end)
end
local system = chatServiceModule:AddChannel("System")
system.Leavable = false
system.AutoJoin = true
system.WelcomeMessage = var7:FormatMessageToSend("GameChat_ChatServiceRunner_SystemChannelWelcomeMessage", "This channel is for system and game notifications.")
system.SpeakerJoined:connect(function(p40) --[[ line: 419 ]]
	-- upvalues: system (ref)
	system:MuteSpeaker(p40)
end)

local function TryRunModule(p41) --[[ line: 424 ]]
	-- upvalues: chatServiceModule (ref)
	if p41:IsA("ModuleScript") then
		local unknownModule = require(p41)
		
		if type(unknownModule) == "function" then
			unknownModule(chatServiceModule)
		end
	end
end

local chatModules = chatService:WaitForChild("ChatModules")
chatModules.ChildAdded:connect(function(p42) --[[ line: 434 ]]
	-- upvalues: TryRunModule (ref)
	local ok, status = pcall(TryRunModule, p42)
	
	if not ok and status then
		print("Error running module " .. p42.Name .. ": " .. status)
	end
end)

for i, v in pairs(chatModules:GetChildren()) do
	local ok, status = pcall(TryRunModule, v)
	
	if not ok and status then
		print("Error running module " .. v.Name .. ": " .. status)
	end
end
playersService.PlayerRemoving:connect(function(p43) --[[ line: 448 ]]
	-- upvalues: chatServiceModule (ref)
	if chatServiceModule:GetSpeaker(p43.Name) then
		chatServiceModule:RemoveSpeaker(p43.Name)
	end
end)