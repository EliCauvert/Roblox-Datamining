local replicatedStorageService = game:GetService("ReplicatedStorage")
local _script = script
local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local chatService = game:GetService("Chat")
local chatServiceModule = require(_script:WaitForChild("ChatService"))
local chatSettingsModule = require(chatService:WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"))
local var1 = nil
pcall(function()
	-- upvalues: var1 (write), chatService (ref)
	var1 = require(chatService.ClientChatModules.ChatLocalization)
end)
var1 = var1 or {}
local maxChannelNameCheckLength = chatSettingsModule.MaxChannelNameCheckLength or 50
local maximumMessageLength = chatSettingsModule.MaximumMessageLength

if not var1.FormatMessageToSend or not var1.LocalizeFormattedMessage then
	function var7.FormatMessageToSend(_, _, p1)
		return p1
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
local function validateMessageLength(p1)
	-- upvalues: maximumMessageLength (ref)
	return if maximumMessageLength * 6 < p1:len() then false elseif utf8.len(p1) == nil then false else maximumMessageLength >= utf8.len(utf8.nfcnormalize(p1))
end

local function validateChannelNameLength(p1)
	-- upvalues: maxChannelNameCheckLength (ref)
	return if maxChannelNameCheckLength * 6 < p1:len() then false elseif utf8.len(p1) == nil then false else maxChannelNameCheckLength >= utf8.len(utf8.nfcnormalize(p1))
end

local function emptyFunction() end

local function GetObjectWithNameAndType(p1, p2, p3)
	for i, v in pairs(p1:GetChildren()) do
		if v:IsA(p3) and v.Name == p2 then
			return v
		end
	end
	return nil
end

local function _(p4, p5, p6)
	-- upvalues: GetObjectWithNameAndType (ref), t (ref)
	local var2 = GetObjectWithNameAndType(p4, p5, p6)
	
	if not var2 then
		var2 = Instance.new(p6)
		var2.Name = p5
		var2.Parent = p4
	end
	t[p5] = var2
	
	return var2
end

local _ = function(p4, p5)
	-- upvalues: GetObjectWithNameAndType (ref), t (ref), emptyFunction (ref)
	local var2 = GetObjectWithNameAndType(p4, p5, "RemoteEvent")
	
	if not var2 then
		var2 = Instance.new("RemoteEvent")
		var2.Name = p5
		var2.Parent = p4
	end
	t[p5] = var2
	var2.OnServerEvent:Connect(emptyFunction)
	
	return var2
end

local var2 = defaultChatSystemChatEvents_1
local onNewMessage = GetObjectWithNameAndType(var2, "OnNewMessage", "RemoteEvent")

if not onNewMessage then
	onNewMessage = Instance.new("RemoteEvent")
	onNewMessage.Name = "OnNewMessage"
	onNewMessage.Parent = var2
end
t.OnNewMessage = onNewMessage
onNewMessage.OnServerEvent:Connect(emptyFunction)
local var3 = defaultChatSystemChatEvents_1
local onMessageDoneFiltering = GetObjectWithNameAndType(var3, "OnMessageDoneFiltering", "RemoteEvent")

if not onMessageDoneFiltering then
	onMessageDoneFiltering = Instance.new("RemoteEvent")
	onMessageDoneFiltering.Name = "OnMessageDoneFiltering"
	onMessageDoneFiltering.Parent = var3
end
t.OnMessageDoneFiltering = onMessageDoneFiltering
onMessageDoneFiltering.OnServerEvent:Connect(emptyFunction)
local var4 = defaultChatSystemChatEvents_1
local onNewSystemMessage = GetObjectWithNameAndType(var4, "OnNewSystemMessage", "RemoteEvent")

if not onNewSystemMessage then
	onNewSystemMessage = Instance.new("RemoteEvent")
	onNewSystemMessage.Name = "OnNewSystemMessage"
	onNewSystemMessage.Parent = var4
end
t.OnNewSystemMessage = onNewSystemMessage
onNewSystemMessage.OnServerEvent:Connect(emptyFunction)
local var5 = defaultChatSystemChatEvents_1
local onChannelJoined = GetObjectWithNameAndType(var5, "OnChannelJoined", "RemoteEvent")

if not onChannelJoined then
	onChannelJoined = Instance.new("RemoteEvent")
	onChannelJoined.Name = "OnChannelJoined"
	onChannelJoined.Parent = var5
end
t.OnChannelJoined = onChannelJoined
onChannelJoined.OnServerEvent:Connect(emptyFunction)
local var6 = defaultChatSystemChatEvents_1
local onChannelLeft = GetObjectWithNameAndType(var6, "OnChannelLeft", "RemoteEvent")

if not onChannelLeft then
	onChannelLeft = Instance.new("RemoteEvent")
	onChannelLeft.Name = "OnChannelLeft"
	onChannelLeft.Parent = var6
end
t.OnChannelLeft = onChannelLeft
onChannelLeft.OnServerEvent:Connect(emptyFunction)
local var7 = defaultChatSystemChatEvents_1
local onMuted = GetObjectWithNameAndType(var7, "OnMuted", "RemoteEvent")

if not onMuted then
	onMuted = Instance.new("RemoteEvent")
	onMuted.Name = "OnMuted"
	onMuted.Parent = var7
end
t.OnMuted = onMuted
onMuted.OnServerEvent:Connect(emptyFunction)
local var8 = defaultChatSystemChatEvents_1
local onUnmuted = GetObjectWithNameAndType(var8, "OnUnmuted", "RemoteEvent")

if not onUnmuted then
	onUnmuted = Instance.new("RemoteEvent")
	onUnmuted.Name = "OnUnmuted"
	onUnmuted.Parent = var8
end
t.OnUnmuted = onUnmuted
onUnmuted.OnServerEvent:Connect(emptyFunction)
local var9 = defaultChatSystemChatEvents_1
local onMainChannelSet = GetObjectWithNameAndType(var9, "OnMainChannelSet", "RemoteEvent")

if not onMainChannelSet then
	onMainChannelSet = Instance.new("RemoteEvent")
	onMainChannelSet.Name = "OnMainChannelSet"
	onMainChannelSet.Parent = var9
end
t.OnMainChannelSet = onMainChannelSet
onMainChannelSet.OnServerEvent:Connect(emptyFunction)
local var10 = defaultChatSystemChatEvents_1
local channelNameColorUpdated = GetObjectWithNameAndType(var10, "ChannelNameColorUpdated", "RemoteEvent")

if not channelNameColorUpdated then
	channelNameColorUpdated = Instance.new("RemoteEvent")
	channelNameColorUpdated.Name = "ChannelNameColorUpdated"
	channelNameColorUpdated.Parent = var10
end
t.ChannelNameColorUpdated = channelNameColorUpdated
channelNameColorUpdated.OnServerEvent:Connect(emptyFunction)
local var11 = defaultChatSystemChatEvents_1
local sayMessageRequest = GetObjectWithNameAndType(var11, "SayMessageRequest", "RemoteEvent")

if not sayMessageRequest then
	sayMessageRequest = Instance.new("RemoteEvent")
	sayMessageRequest.Name = "SayMessageRequest"
	sayMessageRequest.Parent = var11
end
t.SayMessageRequest = sayMessageRequest
sayMessageRequest.OnServerEvent:Connect(emptyFunction)
local var12 = defaultChatSystemChatEvents_1
local setBlockedUserIdsRequest = GetObjectWithNameAndType(var12, "SetBlockedUserIdsRequest", "RemoteEvent")

if not setBlockedUserIdsRequest then
	setBlockedUserIdsRequest = Instance.new("RemoteEvent")
	setBlockedUserIdsRequest.Name = "SetBlockedUserIdsRequest"
	setBlockedUserIdsRequest.Parent = var12
end
t.SetBlockedUserIdsRequest = setBlockedUserIdsRequest
setBlockedUserIdsRequest.OnServerEvent:Connect(emptyFunction)
local var13 = defaultChatSystemChatEvents_1
local getInitDataRequest = GetObjectWithNameAndType(var13, "GetInitDataRequest", "RemoteFunction")

if not getInitDataRequest then
	getInitDataRequest = Instance.new("RemoteFunction")
	getInitDataRequest.Name = "GetInitDataRequest"
	getInitDataRequest.Parent = var13
end
t.GetInitDataRequest = getInitDataRequest
local var14 = defaultChatSystemChatEvents_1
local mutePlayerRequest = GetObjectWithNameAndType(var14, "MutePlayerRequest", "RemoteFunction")

if not mutePlayerRequest then
	mutePlayerRequest = Instance.new("RemoteFunction")
	mutePlayerRequest.Name = "MutePlayerRequest"
	mutePlayerRequest.Parent = var14
end
t.MutePlayerRequest = mutePlayerRequest
local var15 = defaultChatSystemChatEvents_1
local unMutePlayerRequest = GetObjectWithNameAndType(var15, "UnMutePlayerRequest", "RemoteFunction")

if not unMutePlayerRequest then
	unMutePlayerRequest = Instance.new("RemoteFunction")
	unMutePlayerRequest.Name = "UnMutePlayerRequest"
	unMutePlayerRequest.Parent = var15
end
t.UnMutePlayerRequest = unMutePlayerRequest
local var16 = t

local function CreatePlayerSpeakerObject(p4)
	-- upvalues: chatServiceModule (ref), var16 (write)
	if chatServiceModule:GetSpeaker(p4.Name) then
		chatServiceModule:RemoveSpeaker(p4.Name)
	end
	local name = chatServiceModule:InternalAddSpeakerWithPlayerObject(p4.Name, p4, false)
	
	for i, v in pairs(chatServiceModule:GetAutoJoinChannelList()) do
		name:JoinChannel(v.Name)
	end
	name:InternalAssignEventFolder(var16)
	name.ChannelJoined:connect(function(p5, p6)
		-- upvalues: chatServiceModule (copy), name (write), var16 (copy), p4 (ref)
		local var17 = nil
		local channelNameColor = nil
		local var18 = chatServiceModule:GetChannel(p5)
		
		if var18 then
			var17 = var18:GetHistoryLogForSpeaker(name)
			channelNameColor = var18.ChannelNameColor
		end
		var16.OnChannelJoined:FireClient(p4, p5, p6, var17, channelNameColor)
	end)
	name.Muted:connect(function(p5, p6, p7)
		-- upvalues: var16 (copy), p4 (ref)
		var16.OnMuted:FireClient(p4, p5, p6, p7)
	end)
	name.Unmuted:connect(function(p5)
		-- upvalues: var16 (copy), p4 (ref)
		var16.OnUnmuted:FireClient(p4, p5)
	end)
	chatServiceModule:InternalFireSpeakerAdded(name.Name)
end

var16.SayMessageRequest.OnServerEvent:connect(function(p5, p6, p7)
	-- upvalues: validateMessageLength (ref), validateChannelNameLength (ref), chatServiceModule (ref)
	if type(p6) ~= "string" then return end
	if not validateMessageLength(p6) then return end
	if type(p7) ~= "string" then return end
	if not validateChannelNameLength(p7) then return end
	local nameSpeaker = chatServiceModule:GetSpeaker(p5.Name)
	
	return if nameSpeaker then nameSpeaker:SayMessage(p6, p7) else nil
end)

function var43.MutePlayerRequest.OnServerInvoke(p5, p6)
	-- upvalues: chatServiceModule (ref)
	if type(p6) ~= "string" then return end
	local nameSpeaker = chatServiceModule:GetSpeaker(p5.Name)
	
	if nameSpeaker then
		local var17 = chatServiceModule:GetSpeaker(p6)
		
		if var17 then
			nameSpeaker:AddMutedSpeaker(var17.Name)
			
			return true
		end
	end
	return false
end

function var43.UnMutePlayerRequest.OnServerInvoke(p5, p6)
	-- upvalues: chatServiceModule (ref)
	if type(p6) ~= "string" then return end
	local nameSpeaker = chatServiceModule:GetSpeaker(p5.Name)
	
	if nameSpeaker then
		local var17 = chatServiceModule:GetSpeaker(p6)
		
		if var17 then
			nameSpeaker:RemoveMutedSpeaker(var17.Name)
			
			return true
		end
	end
	return false
end

local t_1 = {}
playersService.PlayerAdded:connect(function(p5)
	-- upvalues: t_1 (ref), chatServiceModule (ref)
	for i, v in pairs(t_1) do
		local nameSpeaker = chatServiceModule:GetSpeaker(i.Name)
		
		if nameSpeaker then
			for i_1 = 1, #v do
				if v[i_1] == p5.UserId then
					nameSpeaker:AddMutedSpeaker(p5.Name)
				end
			end
		end
	end
end)
playersService.PlayerRemoving:connect(function(p6)
	-- upvalues: t_1 (ref)
	t_1[p6] = nil
end)
var16.SetBlockedUserIdsRequest.OnServerEvent:Connect(function(p6, p7)
	-- upvalues: chatServiceModule (ref), playersService (ref), t_1 (ref)
	if type(p7) ~= "table" then return end
	local t = {}
	local nameSpeaker = chatServiceModule:GetSpeaker(p6.Name)
	
	if nameSpeaker then
		for i = 1, math.min(#p7, 50) do
			if type(p7[i]) == "number" then
				table.insert(t, p7[i])
				local var17 = playersService:GetPlayerByUserId(p7[i])
				
				if var17 then
					nameSpeaker:AddMutedSpeaker(var17.Name)
				end
			end
		end
		t_1[p6] = t
	end
end)

function var43.GetInitDataRequest.OnServerInvoke(p8)
	-- upvalues: chatServiceModule (ref), CreatePlayerSpeakerObject (ref)
	local nameSpeaker = chatServiceModule:GetSpeaker(p8.Name)
	
	if not nameSpeaker or not nameSpeaker:GetPlayer() then
		CreatePlayerSpeakerObject(p8)
		nameSpeaker = chatServiceModule:GetSpeaker(p8.Name)
	end
	local t = { Channels = {}, SpeakerExtraData = {} }
	
	for i, v in pairs(nameSpeaker:GetChannelList()) do
		local var18 = chatServiceModule:GetChannel(v)
		
		if var18 then
			table.insert(t.Channels, {
				v,
				var18:GetWelcomeMessageForSpeaker(nameSpeaker),
				var18:GetHistoryLogForSpeaker(nameSpeaker),
				var18.ChannelNameColor
			})
		end
	end
	for i, v_1 in pairs(chatServiceModule:GetSpeakerList()) do
		t.SpeakerExtraData[v_1] = chatServiceModule:GetSpeaker(v_1).ExtraData
	end
	return t
end

local function DoJoinCommand(p9, p10, p11)
	-- upvalues: chatServiceModule (ref), var1 (write)
	local var19 = chatServiceModule:GetSpeaker(p9)
	local var20 = chatServiceModule:GetChannel(p10)
	
	if var19 then
		if var20 then
			if not var20.Joinable then
				var19:SendSystemMessage(var1:FormatMessageToSend("GameChat_ChatServiceRunner_YouCannotJoinChannel", "You cannot join channel '" .. p31 .. "'.", "RBX_NAME", p10), p11)
				
				return
			elseif var19:IsInChannel(var20.Name) then
				var19:SetMainChannel(var20.Name)
				var19:SendSystemMessage(var1:FormatMessageToSend("GameChat_SwitchChannel_NowInChannel", string.format("You are now chatting in channel: '%s'", var20.Name), "RBX_NAME", var20.Name), var20.Name)
				
				return
			end
			var19:JoinChannel(var20.Name)
			
			return
		else
			var19:SendSystemMessage(var1:FormatMessageToSend("GameChat_ChatServiceRunner_ChannelDoesNotExist", "Channel '" .. p31 .. "' does not exist.", "RBX_NAME", p10), p11)
		end
	end
end

local function DoLeaveCommand(p9, p10, p11)
	-- upvalues: chatServiceModule (ref), var1 (write)
	local var19 = chatServiceModule:GetSpeaker(p9)
	local var20 = chatServiceModule:GetChannel(p10)
	
	if var19 then
		if var19:IsInChannel(p10) then
			if var20.Leavable then
				var19:LeaveChannel(var20.Name)
				var19:SendSystemMessage(var1:FormatMessageToSend("GameChat_ChatService_YouHaveLeftChannel", string.format("You have left channel '%s'", p10), "RBX_NAME", var20.Name), "System")
				
				return
			end
			var19:SendSystemMessage(var1:FormatMessageToSend("GameChat_ChatServiceRunner_YouCannotLeaveChannel", "You cannot leave channel '" .. p34 .. "'.", "RBX_NAME", p10), p11)
			
			return
		else
			var19:SendSystemMessage(var1:FormatMessageToSend("GameChat_ChatServiceRunner_YouAreNotInChannel", "You are not in channel '" .. p34 .. "'.", "RBX_NAME", p10), p11)
		end
	end
end

chatServiceModule:RegisterProcessCommandsFunction("default_commands", function(p9, p10, p11)
	-- upvalues: DoJoinCommand (ref), DoLeaveCommand (ref)
	if string.sub(p10, 1, 6):lower() == "/join " then
		DoJoinCommand(p9, string.sub(p10, 7), p11)
		
		return true
	elseif string.sub(p10, 1, 3):lower() == "/j " then
		DoJoinCommand(p9, string.sub(p10, 4), p11)
		
		return true
	elseif string.sub(p10, 1, 7):lower() == "/leave " then
		DoLeaveCommand(p9, string.sub(p10, 8), p11)
		
		return true
	elseif string.sub(p10, 1, 3):lower() == "/l " then
		DoLeaveCommand(p9, string.sub(p10, 4), p11)
		
		return true
	end
	return false
end)

if chatSettingsModule.GeneralChannelName and chatSettingsModule.GeneralChannelName ~= "" then
	local generalChannelName = chatServiceModule:AddChannel(chatSettingsModule.GeneralChannelName)
	generalChannelName.Leavable = false
	generalChannelName.AutoJoin = true
	generalChannelName:RegisterGetWelcomeMessageFunction(function(p9)
		-- upvalues: runService (ref), chatService (ref)
		if runService:IsStudio() then
			return nil
		end
		local player = p9:GetPlayer()
		
		if player then
			local ok, status = pcall(function()
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
system.WelcomeMessage = var1:FormatMessageToSend("GameChat_ChatServiceRunner_SystemChannelWelcomeMessage", "This channel is for system and game notifications.")
system.SpeakerJoined:connect(function(p9)
	-- upvalues: system (ref)
	system:MuteSpeaker(p9)
end)

local function TryRunModule(p9)
	-- upvalues: chatServiceModule (ref)
	if p9:IsA("ModuleScript") then
		local unknownModule = require(p9)
		
		if type(unknownModule) == "function" then
			unknownModule(chatServiceModule)
		end
	end
end

local chatModules = chatService:WaitForChild("ChatModules")
chatModules.ChildAdded:connect(function(p9)
	-- upvalues: TryRunModule (ref)
	local ok, status = pcall(TryRunModule, p9)
	
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
playersService.PlayerRemoving:connect(function(p9)
	-- upvalues: chatServiceModule (ref)
	if chatServiceModule:GetSpeaker(p9.Name) then
		chatServiceModule:RemoveSpeaker(p9.Name)
	end
end)