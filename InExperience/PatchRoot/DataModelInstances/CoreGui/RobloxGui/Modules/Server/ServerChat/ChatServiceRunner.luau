local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Chat = game:GetService("Chat")
local ChatServiceModule = require(script:WaitForChild("ChatService"))
local ChatSettingsModule = require(Chat:WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"))
local ChatLocalizationModule = nil
pcall(function() --[[ Line: 20 ]]
	-- upvalues: ChatLocalizationModule (ref), Chat (copy)
	ChatLocalizationModule = require(Chat.ClientChatModules.ChatLocalization)
end)
ChatLocalizationModule = ChatLocalizationModule or {}
local MaxChannelNameCheckLength = ChatSettingsModule.MaxChannelNameCheckLength or 50
local MaximumMessageLength = ChatSettingsModule.MaximumMessageLength

if not ChatLocalizationModule.FormatMessageToSend or not ChatLocalizationModule.LocalizeFormattedMessage then
	function ChatLocalizationModule:FormatMessageToSend(_, Formatted) --[[ Line: 28 ]]
		return Formatted
	end
end
local NewInstances = {}
local DefaultChatSystemChatEvents = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")

if not DefaultChatSystemChatEvents then
	DefaultChatSystemChatEvents = Instance.new("Folder")
	DefaultChatSystemChatEvents.Name = "DefaultChatSystemChatEvents"
	DefaultChatSystemChatEvents.Archivable = false
	DefaultChatSystemChatEvents.Parent = ReplicatedStorage
end
local function validateMessageLength(Text): boolean --[[ Line: 43 ]]
	-- upvalues: MaximumMessageLength (copy)
	return MaximumMessageLength * 6 >= Text:len() and (utf8.len(Text) ~= nil and MaximumMessageLength >= utf8.len(utf8.nfcnormalize(Text)))
end

local function validateChannelNameLength(Text): boolean --[[ Line: 59 ]]
	-- upvalues: MaxChannelNameCheckLength (copy)
	return MaxChannelNameCheckLength * 6 >= Text:len() and (utf8.len(Text) ~= nil and MaxChannelNameCheckLength >= utf8.len(utf8.nfcnormalize(Text)))
end

local function emptyFunction() --[[ Line: 77 ]] end

local function GetObjectWithNameAndType(Folder, Name, ClassName) --[[ Line: 81 ]]
	for _, child in pairs(Folder:GetChildren()) do
		if child:IsA(ClassName) and child.Name == Name then
			return child
		end
	end
	return nil
end

local function _(Parent, Name, ClassName) --[[ Line: 91 | Named "CreateIfDoesntExist" ]]
	-- upvalues: GetObjectWithNameAndType (copy), NewInstances (copy)
	local ObjectWithNameAndType = GetObjectWithNameAndType(Parent, Name, ClassName)
	
	if not ObjectWithNameAndType then
		ObjectWithNameAndType = Instance.new(ClassName)
		ObjectWithNameAndType.Name = Name
		ObjectWithNameAndType.Parent = Parent
	end
	NewInstances[Name] = ObjectWithNameAndType
	
	return ObjectWithNameAndType
end

local _ = function(Parent, Name) --[[ Line: 104 | Named "CreateEventIfItDoesntExist" ]]
	-- upvalues: GetObjectWithNameAndType (copy), NewInstances (copy), emptyFunction (copy)
	local RemoteEvent = GetObjectWithNameAndType(Parent, Name, "RemoteEvent")
	
	if not RemoteEvent then
		RemoteEvent = Instance.new("RemoteEvent")
		RemoteEvent.Name = Name
		RemoteEvent.Parent = Parent
	end
	NewInstances[Name] = RemoteEvent
	RemoteEvent.OnServerEvent:Connect(emptyFunction)
	
	return RemoteEvent
end

local Folder = DefaultChatSystemChatEvents
local OnNewMessage = GetObjectWithNameAndType(Folder, "OnNewMessage", "RemoteEvent")

if not OnNewMessage then
	OnNewMessage = Instance.new("RemoteEvent")
	OnNewMessage.Name = "OnNewMessage"
	OnNewMessage.Parent = Folder
end
NewInstances.OnNewMessage = OnNewMessage
OnNewMessage.OnServerEvent:Connect(emptyFunction)
local Folder1 = DefaultChatSystemChatEvents
local OnMessageDoneFiltering = GetObjectWithNameAndType(Folder1, "OnMessageDoneFiltering", "RemoteEvent")

if not OnMessageDoneFiltering then
	OnMessageDoneFiltering = Instance.new("RemoteEvent")
	OnMessageDoneFiltering.Name = "OnMessageDoneFiltering"
	OnMessageDoneFiltering.Parent = Folder1
end
NewInstances.OnMessageDoneFiltering = OnMessageDoneFiltering
OnMessageDoneFiltering.OnServerEvent:Connect(emptyFunction)
local Folder2 = DefaultChatSystemChatEvents
local OnNewSystemMessage = GetObjectWithNameAndType(Folder2, "OnNewSystemMessage", "RemoteEvent")

if not OnNewSystemMessage then
	OnNewSystemMessage = Instance.new("RemoteEvent")
	OnNewSystemMessage.Name = "OnNewSystemMessage"
	OnNewSystemMessage.Parent = Folder2
end
NewInstances.OnNewSystemMessage = OnNewSystemMessage
OnNewSystemMessage.OnServerEvent:Connect(emptyFunction)
local Folder3 = DefaultChatSystemChatEvents
local OnChannelJoined = GetObjectWithNameAndType(Folder3, "OnChannelJoined", "RemoteEvent")

if not OnChannelJoined then
	OnChannelJoined = Instance.new("RemoteEvent")
	OnChannelJoined.Name = "OnChannelJoined"
	OnChannelJoined.Parent = Folder3
end
NewInstances.OnChannelJoined = OnChannelJoined
OnChannelJoined.OnServerEvent:Connect(emptyFunction)
local Folder4 = DefaultChatSystemChatEvents
local OnChannelLeft = GetObjectWithNameAndType(Folder4, "OnChannelLeft", "RemoteEvent")

if not OnChannelLeft then
	OnChannelLeft = Instance.new("RemoteEvent")
	OnChannelLeft.Name = "OnChannelLeft"
	OnChannelLeft.Parent = Folder4
end
NewInstances.OnChannelLeft = OnChannelLeft
OnChannelLeft.OnServerEvent:Connect(emptyFunction)
local Folder5 = DefaultChatSystemChatEvents
local OnMuted = GetObjectWithNameAndType(Folder5, "OnMuted", "RemoteEvent")

if not OnMuted then
	OnMuted = Instance.new("RemoteEvent")
	OnMuted.Name = "OnMuted"
	OnMuted.Parent = Folder5
end
NewInstances.OnMuted = OnMuted
OnMuted.OnServerEvent:Connect(emptyFunction)
local Folder6 = DefaultChatSystemChatEvents
local OnUnmuted = GetObjectWithNameAndType(Folder6, "OnUnmuted", "RemoteEvent")

if not OnUnmuted then
	OnUnmuted = Instance.new("RemoteEvent")
	OnUnmuted.Name = "OnUnmuted"
	OnUnmuted.Parent = Folder6
end
NewInstances.OnUnmuted = OnUnmuted
OnUnmuted.OnServerEvent:Connect(emptyFunction)
local Folder7 = DefaultChatSystemChatEvents
local OnMainChannelSet = GetObjectWithNameAndType(Folder7, "OnMainChannelSet", "RemoteEvent")

if not OnMainChannelSet then
	OnMainChannelSet = Instance.new("RemoteEvent")
	OnMainChannelSet.Name = "OnMainChannelSet"
	OnMainChannelSet.Parent = Folder7
end
NewInstances.OnMainChannelSet = OnMainChannelSet
OnMainChannelSet.OnServerEvent:Connect(emptyFunction)
local Folder8 = DefaultChatSystemChatEvents
local ChannelNameColorUpdated = GetObjectWithNameAndType(Folder8, "ChannelNameColorUpdated", "RemoteEvent")

if not ChannelNameColorUpdated then
	ChannelNameColorUpdated = Instance.new("RemoteEvent")
	ChannelNameColorUpdated.Name = "ChannelNameColorUpdated"
	ChannelNameColorUpdated.Parent = Folder8
end
NewInstances.ChannelNameColorUpdated = ChannelNameColorUpdated
ChannelNameColorUpdated.OnServerEvent:Connect(emptyFunction)
local Folder9 = DefaultChatSystemChatEvents
local SayMessageRequest = GetObjectWithNameAndType(Folder9, "SayMessageRequest", "RemoteEvent")

if not SayMessageRequest then
	SayMessageRequest = Instance.new("RemoteEvent")
	SayMessageRequest.Name = "SayMessageRequest"
	SayMessageRequest.Parent = Folder9
end
NewInstances.SayMessageRequest = SayMessageRequest
SayMessageRequest.OnServerEvent:Connect(emptyFunction)
local Folder10 = DefaultChatSystemChatEvents
local SetBlockedUserIdsRequest = GetObjectWithNameAndType(Folder10, "SetBlockedUserIdsRequest", "RemoteEvent")

if not SetBlockedUserIdsRequest then
	SetBlockedUserIdsRequest = Instance.new("RemoteEvent")
	SetBlockedUserIdsRequest.Name = "SetBlockedUserIdsRequest"
	SetBlockedUserIdsRequest.Parent = Folder10
end
NewInstances.SetBlockedUserIdsRequest = SetBlockedUserIdsRequest
SetBlockedUserIdsRequest.OnServerEvent:Connect(emptyFunction)
local Folder11 = DefaultChatSystemChatEvents
local GetInitDataRequest = GetObjectWithNameAndType(Folder11, "GetInitDataRequest", "RemoteFunction")

if not GetInitDataRequest then
	GetInitDataRequest = Instance.new("RemoteFunction")
	GetInitDataRequest.Name = "GetInitDataRequest"
	GetInitDataRequest.Parent = Folder11
end
NewInstances.GetInitDataRequest = GetInitDataRequest
local Folder12 = DefaultChatSystemChatEvents
local MutePlayerRequest = GetObjectWithNameAndType(Folder12, "MutePlayerRequest", "RemoteFunction")

if not MutePlayerRequest then
	MutePlayerRequest = Instance.new("RemoteFunction")
	MutePlayerRequest.Name = "MutePlayerRequest"
	MutePlayerRequest.Parent = Folder12
end
NewInstances.MutePlayerRequest = MutePlayerRequest
local Folder13 = DefaultChatSystemChatEvents
local UnMutePlayerRequest = GetObjectWithNameAndType(Folder13, "UnMutePlayerRequest", "RemoteFunction")

if not UnMutePlayerRequest then
	UnMutePlayerRequest = Instance.new("RemoteFunction")
	UnMutePlayerRequest.Name = "UnMutePlayerRequest"
	UnMutePlayerRequest.Parent = Folder13
end
NewInstances.UnMutePlayerRequest = UnMutePlayerRequest
local NewInstances1 = NewInstances

local function CreatePlayerSpeakerObject(Player: Player) --[[ Line: 128 ]]
	-- upvalues: ChatServiceModule (copy), NewInstances1 (ref)
	if ChatServiceModule:GetSpeaker(Player.Name) then
		ChatServiceModule:RemoveSpeaker(Player.Name)
	end
	local InternalAddSpeakerWithPlayerObjectResult = ChatServiceModule:InternalAddSpeakerWithPlayerObject(Player.Name, Player, false)
	
	for _, value in pairs(ChatServiceModule:GetAutoJoinChannelList()) do
		InternalAddSpeakerWithPlayerObjectResult:JoinChannel(value.Name)
	end
	InternalAddSpeakerWithPlayerObjectResult:InternalAssignEventFolder(NewInstances1)
	InternalAddSpeakerWithPlayerObjectResult.ChannelJoined:connect(function(p1, p2) --[[ Line: 145 ]]
		-- upvalues: ChatServiceModule (upval), InternalAddSpeakerWithPlayerObjectResult (ref), NewInstances1 (upval), Player (copy)
		local HistoryLogForSpeaker = nil
		local ChannelNameColor = nil
		local Channel = ChatServiceModule:GetChannel(p1)
		
		if Channel then
			HistoryLogForSpeaker = Channel:GetHistoryLogForSpeaker(InternalAddSpeakerWithPlayerObjectResult)
			ChannelNameColor = Channel.ChannelNameColor
		end
		NewInstances1.OnChannelJoined:FireClient(Player, p1, p2, HistoryLogForSpeaker, ChannelNameColor)
	end)
	InternalAddSpeakerWithPlayerObjectResult.Muted:connect(function(p1, p2, p3) --[[ Line: 157 ]]
		-- upvalues: NewInstances1 (upval), Player (copy)
		NewInstances1.OnMuted:FireClient(Player, p1, p2, p3)
	end)
	InternalAddSpeakerWithPlayerObjectResult.Unmuted:connect(function(p1) --[[ Line: 161 ]]
		-- upvalues: NewInstances1 (upval), Player (copy)
		NewInstances1.OnUnmuted:FireClient(Player, p1)
	end)
	ChatServiceModule:InternalFireSpeakerAdded(InternalAddSpeakerWithPlayerObjectResult.Name)
end

NewInstances1.SayMessageRequest.OnServerEvent:connect(function(Player, p1, p2) --[[ Line: 168 ]]
	-- upvalues: validateMessageLength (copy), validateChannelNameLength (copy), ChatServiceModule (copy)
	if type(p1) ~= "string" then return end
	if not validateMessageLength(p1) then return end
	if type(p2) ~= "string" then return end
	if not validateChannelNameLength(p2) then return end
	local Speaker = ChatServiceModule:GetSpeaker(Player.Name)
	
	return if Speaker then Speaker:SayMessage(p1, p2) else nil
end)

function NewInstances1.MutePlayerRequest.OnServerInvoke(Player, p1): boolean? --[[ Line: 189 ]]
	-- upvalues: ChatServiceModule (copy)
	if type(p1) ~= "string" then return end
	local Speaker = ChatServiceModule:GetSpeaker(Player.Name)
	
	if Speaker then
		local Speaker1 = ChatServiceModule:GetSpeaker(p1)
		
		if Speaker1 then
			Speaker:AddMutedSpeaker(Speaker1.Name)
			
			return true
		end
	end
	return false
end

function NewInstances1.UnMutePlayerRequest.OnServerInvoke(Player, p1): boolean? --[[ Line: 205 ]]
	-- upvalues: ChatServiceModule (copy)
	if type(p1) ~= "string" then return end
	local Speaker = ChatServiceModule:GetSpeaker(Player.Name)
	
	if Speaker then
		local Speaker1 = ChatServiceModule:GetSpeaker(p1)
		
		if Speaker1 then
			Speaker:RemoveMutedSpeaker(Speaker1.Name)
			
			return true
		end
	end
	return false
end

local t = {}
Players.PlayerAdded:connect(function(Player) --[[ Line: 224 ]]
	-- upvalues: t (copy), ChatServiceModule (copy)
	for i, value in pairs(t) do
		local Speaker = ChatServiceModule:GetSpeaker(i.Name)
		
		if Speaker then
			for i1 = 1, #value do
				if value[i1] == Player.UserId then
					Speaker:AddMutedSpeaker(Player.Name)
				end
			end
		end
	end
end)
Players.PlayerRemoving:connect(function(Player) --[[ Line: 238 ]]
	-- upvalues: t (copy)
	t[Player] = nil
end)
NewInstances1.SetBlockedUserIdsRequest.OnServerEvent:Connect(function(Player, p1) --[[ Line: 242 ]]
	-- upvalues: ChatServiceModule (copy), Players (copy), t (copy)
	if type(p1) ~= "table" then return end
	local List = {}
	local Speaker = ChatServiceModule:GetSpeaker(Player.Name)
	
	if Speaker then
		for i = 1, math.min(#p1, 50) do
			if type(p1[i]) == "number" then
				table.insert(List, p1[i])
				local Player1 = Players:GetPlayerByUserId(p1[i])
				
				if Player1 then
					Speaker:AddMutedSpeaker(Player1.Name)
				end
			end
		end
		t[Player] = List
	end
end)

function NewInstances1.GetInitDataRequest.OnServerInvoke(Player) --[[ Line: 268 ]]
	-- upvalues: ChatServiceModule (copy), CreatePlayerSpeakerObject (copy)
	local Speaker = ChatServiceModule:GetSpeaker(Player.Name)
	
	if not Speaker or not Speaker:GetPlayer() then
		CreatePlayerSpeakerObject(Player)
		Speaker = ChatServiceModule:GetSpeaker(Player.Name)
	end
	local config = { Channels = {}, SpeakerExtraData = {} }
	
	for _, value in pairs(Speaker:GetChannelList()) do
		local Channel = ChatServiceModule:GetChannel(value)
		
		if Channel then
			table.insert(config.Channels, {
				value,
				Channel:GetWelcomeMessageForSpeaker(Speaker),
				Channel:GetHistoryLogForSpeaker(Speaker),
				Channel.ChannelNameColor
			})
		end
	end
	for _, value1 in pairs(ChatServiceModule:GetSpeakerList()) do
		config.SpeakerExtraData[value1] = ChatServiceModule:GetSpeaker(value1).ExtraData
	end
	return config
end

local function DoJoinCommand(p2, Segment, p3) --[[ Line: 302 ]]
	-- upvalues: ChatServiceModule (copy), ChatLocalizationModule (ref)
	local Speaker = ChatServiceModule:GetSpeaker(p2)
	local Channel = ChatServiceModule:GetChannel(Segment)
	
	if Speaker then
		if not Channel then
			Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_ChatServiceRunner_ChannelDoesNotExist", "Channel '" .. Segment .. "' does not exist.", "RBX_NAME", Segment), p3)
		elseif not Channel.Joinable then
			Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_ChatServiceRunner_YouCannotJoinChannel", "You cannot join channel '" .. Segment .. "'.", "RBX_NAME", Segment), p3)
			
			return
		else
			if Speaker:IsInChannel(Channel.Name) then
				Speaker:SetMainChannel(Channel.Name)
				Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_SwitchChannel_NowInChannel", string.format("You are now chatting in channel: '%s'", Channel.Name), "RBX_NAME", Channel.Name), Channel.Name)
				
				return
			else
				Speaker:JoinChannel(Channel.Name)
				
				return
			end
		end
	end
end

local function DoLeaveCommand(p2, Segment, p3) --[[ Line: 339 ]]
	-- upvalues: ChatServiceModule (copy), ChatLocalizationModule (ref)
	local Speaker = ChatServiceModule:GetSpeaker(p2)
	local Channel = ChatServiceModule:GetChannel(Segment)
	
	if Speaker then
		if not Speaker:IsInChannel(Segment) then
			Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_ChatServiceRunner_YouAreNotInChannel", "You are not in channel '" .. Segment .. "'.", "RBX_NAME", Segment), p3)
		elseif Channel.Leavable then
			Speaker:LeaveChannel(Channel.Name)
			Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_ChatService_YouHaveLeftChannel", string.format("You have left channel '%s'", Segment), "RBX_NAME", Channel.Name), "System")
			
			return
		else
			Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_ChatServiceRunner_YouCannotLeaveChannel", "You cannot leave channel '" .. Segment .. "'.", "RBX_NAME", Segment), p3)
			
			return
		end
	end
end

ChatServiceModule:RegisterProcessCommandsFunction("default_commands", function(p2, Text: string, p3): boolean --[[ Line: 372 ]]
	-- upvalues: DoJoinCommand (copy), DoLeaveCommand (copy)
	if string.sub(Text, 1, 6):lower() == "/join " then
		DoJoinCommand(p2, string.sub(Text, 7), p3)
		
		return true
	elseif string.sub(Text, 1, 3):lower() == "/j " then
		DoJoinCommand(p2, string.sub(Text, 4), p3)
		
		return true
	elseif string.sub(Text, 1, 7):lower() == "/leave " then
		DoLeaveCommand(p2, string.sub(Text, 8), p3)
		
		return true
	elseif string.sub(Text, 1, 3):lower() == "/l " then
		DoLeaveCommand(p2, string.sub(Text, 4), p3)
		
		return true
	else
		return false
	end
end)

if ChatSettingsModule.GeneralChannelName and ChatSettingsModule.GeneralChannelName ~= "" then
	local AddChannelResult = ChatServiceModule:AddChannel(ChatSettingsModule.GeneralChannelName)
	AddChannelResult.Leavable = false
	AddChannelResult.AutoJoin = true
	AddChannelResult:RegisterGetWelcomeMessageFunction(function(p2): string? --[[ Line: 396 ]]
		-- upvalues: RunService (copy), Chat (copy)
		if RunService:IsStudio() then
			return nil
		end
		local Player = p2:GetPlayer()
		
		if Player then
			local Success, Result = pcall(function() --[[ Line: 402 ]]
				-- upvalues: Chat (upval), Player (copy)
				return Chat:CanUserChatAsync(Player.UserId)
			end)
			
			if Success and not Result then
				return ""
			end
		end
	end)
end
local System = ChatServiceModule:AddChannel("System")
System.Leavable = false
System.AutoJoin = true
System.WelcomeMessage = ChatLocalizationModule:FormatMessageToSend("GameChat_ChatServiceRunner_SystemChannelWelcomeMessage", "This channel is for system and game notifications.")
System.SpeakerJoined:connect(function(p2) --[[ Line: 419 ]]
	-- upvalues: System (copy)
	System:MuteSpeaker(p2)
end)

local function TryRunModule(ModuleScript) --[[ Line: 424 ]]
	-- upvalues: ChatServiceModule (copy)
	if ModuleScript:IsA("ModuleScript") then
		local Module: (any) -> () = require(ModuleScript)
		
		if type(Module) == "function" then
			Module(ChatServiceModule)
		end
	end
end

local ChatModules = Chat:WaitForChild("ChatModules")
ChatModules.ChildAdded:connect(function(Child) --[[ Line: 434 ]]
	-- upvalues: TryRunModule (copy)
	local Success, Result = pcall(TryRunModule, Child)
	
	if not Success and Result then
		print("Error running module " .. Child.Name .. ": " .. Result)
	end
end)

for _, child in pairs(ChatModules:GetChildren()) do
	local Success, Result = pcall(TryRunModule, child)
	
	if not Success and Result then
		print("Error running module " .. child.Name .. ": " .. Result)
	end
end
Players.PlayerRemoving:connect(function(Player) --[[ Line: 448 ]]
	-- upvalues: ChatServiceModule (copy)
	if ChatServiceModule:GetSpeaker(Player.Name) then
		ChatServiceModule:RemoveSpeaker(Player.Name)
	end
end)