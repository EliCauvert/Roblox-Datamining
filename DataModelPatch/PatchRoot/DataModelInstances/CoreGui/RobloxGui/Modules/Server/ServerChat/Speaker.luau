local SpeakerModule = {}
local RunService = game:GetService("RunService")
local ChatSettingsModule = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"))
local _ = script.Parent
local Result1 = nil
local Success, Result = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserRemoveMessageOnTextFilterFailures")
end)
Result1 = Success and Result
local Success1, Result2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2")
end)
local _ = Success1 and Result2

local function _(List)
	local t = {}
	
	for i, value in pairs(List) do
		t[i] = value
	end
	return t
end

local t = {}
local config = {
	eDestroyed = true,
	eSaidMessage = true,
	eReceivedMessage = true,
	eReceivedUnfilteredMessage = true,
	eMessageDoneFiltering = true,
	eReceivedSystemMessage = true,
	eChannelJoined = true,
	eChannelLeft = true,
	eMuted = true,
	eUnmuted = true,
	eExtraDataUpdated = true,
	eMainChannelSet = true,
	eChannelNameColorUpdated = true
}
local config1 = {
	Destroyed = "eDestroyed",
	SaidMessage = "eSaidMessage",
	ReceivedMessage = "eReceivedMessage",
	ReceivedUnfilteredMessage = "eReceivedUnfilteredMessage",
	RecievedUnfilteredMessage = "eReceivedUnfilteredMessage",
	MessageDoneFiltering = "eMessageDoneFiltering",
	ReceivedSystemMessage = "eReceivedSystemMessage",
	ChannelJoined = "eChannelJoined",
	ChannelLeft = "eChannelLeft",
	Muted = "eMuted",
	Unmuted = "eUnmuted",
	ExtraDataUpdated = "eExtraDataUpdated",
	MainChannelSet = "eMainChannelSet",
	ChannelNameColorUpdated = "eChannelNameColorUpdated"
}

function t.__index(p1, p2)
	-- upvalues: t (copy), config (copy), config1 (copy)
	local RawValue = rawget(t, p2)
	
	if RawValue then
		return RawValue
	end
	if config[p2] and not rawget(p1, p2) then
		rawset(p1, p2, Instance.new("BindableEvent"))
	end
	local Entry = config1[p2]
	
	if Entry and not rawget(p1, p2) then
		local RawValue1 = rawget(p1, Entry)
		
		if not RawValue1 then
			RawValue1 = Instance.new("BindableEvent")
			rawset(p1, Entry, RawValue1)
		end
		rawset(p1, p2, RawValue1.Event)
	end
	return (rawget(p1, p2))
end

function t.LazyFire(p1, p2, ...)
	local RawValue = rawget(p1, p2)
	
	if RawValue then
		RawValue:Fire(...)
	end
end

function t.SayMessage(p1, p2, Text: string, p3)
	if p1.ChatService:InternalDoProcessCommands(p1.Name, p2, Text) then return end
	if not Text then return end
	local Channel = p1.Channels[Text:lower()]
	
	if not Channel then return end
	local InternalPostMessageResult = Channel:InternalPostMessage(p1, p2, p3)
	
	if InternalPostMessageResult then
		pcall(function()
			-- upvalues: p1 (copy), InternalPostMessageResult (copy), Text (copy)
			p1:LazyFire("eSaidMessage", InternalPostMessageResult, Text)
		end)
	end
	return InternalPostMessageResult
end

function t.JoinChannel(p1, Text: string)
	if p1.Channels[Text:lower()] then
		warn("Speaker is already in channel \"" .. Text .. "\"")
		
		return
	end
	local Channel = p1.ChatService:GetChannel(Text)
	
	if not Channel then
		error("Channel \"" .. Text .. "\" does not exist!")
	end
	p1.Channels[Text:lower()] = Channel
	Channel:InternalAddSpeaker(p1)
	local Success, Result = pcall(function()
		-- upvalues: p1 (copy), Channel (copy)
		p1.eChannelJoined:Fire(Channel.Name, Channel:GetWelcomeMessageForSpeaker(p1))
	end)
	
	if not Success and Result then
		print("Error joining channel: " .. Result)
	end
end

function t.LeaveChannel(p1, Text: string)
	if not p1.Channels[Text:lower()] then
		warn("Speaker is not in channel \"" .. Text .. "\"")
		
		return
	end
	local Channel = p1.Channels[Text:lower()]
	p1.Channels[Text:lower()] = nil
	Channel:InternalRemoveSpeaker(p1)
	local Success, Result = pcall(function()
		-- upvalues: p1 (copy), Channel (copy)
		p1:LazyFire("eChannelLeft", Channel.Name)
		
		if p1.PlayerObj then
			p1.EventFolder.OnChannelLeft:FireClient(p1.PlayerObj, Channel.Name)
		end
	end)
	
	if not Success and Result then
		print("Error leaving channel: " .. Result)
	end
end

function t.IsInChannel(p1, Text: string): boolean
	return p1.Channels[Text:lower()] ~= nil
end

function t.GetChannelList(p1)
	local List = {}
	
	for _, channel in pairs(p1.Channels) do
		table.insert(List, channel.Name)
	end
	return List
end

function t.SendMessage(p2, p3, Text: string, p4, p5)
	-- upvalues: RunService (copy)
	local Channel = p2.Channels[Text:lower()]
	
	if Channel then
		Channel:SendMessageToSpeaker(p3, p2.Name, p4, p5)
		
		return
	end
	if RunService:IsStudio() then
		warn(string.format("Speaker '%s' is not in channel '%s' and cannot receive a message in it.", p2.Name, Text))
	end
end

function t.SendSystemMessage(p2, p3, Text: string, p4)
	-- upvalues: RunService (copy)
	local Channel = p2.Channels[Text:lower()]
	
	if Channel then
		Channel:SendSystemMessageToSpeaker(p3, p2.Name, p4)
		
		return
	end
	if RunService:IsStudio() then
		warn(string.format("Speaker '%s' is not in channel '%s' and cannot receive a system message in it.", p2.Name, Text))
	end
end

function t.GetPlayer(p2)
	return p2.PlayerObj
end

function t.GetNameForDisplay(p2)
	-- upvalues: ChatSettingsModule (copy)
	if ChatSettingsModule.PlayerDisplayNamesEnabled then
		local Player = p2:GetPlayer()
		
		return if Player then Player.DisplayName else p2.Name
	else
		return p2.Name
	end
end

function t.SetExtraData(p2, p3, p4)
	p2.ExtraData[p3] = p4
	p2:LazyFire("eExtraDataUpdated", p3, p4)
end

function t.GetExtraData(p2, p3)
	return p2.ExtraData[p3]
end

function t.SetMainChannel(p2, p3)
	local Success, Result = pcall(function()
		-- upvalues: p2 (copy), p3 (copy)
		p2:LazyFire("eMainChannelSet", p3)
		
		if p2.PlayerObj then
			p2.EventFolder.OnMainChannelSet:FireClient(p2.PlayerObj, p3)
		end
	end)
	
	if not Success and Result then
		print("Error setting main channel: " .. Result)
	end
end

function t.AddMutedSpeaker(p2, Text: string)
	p2.MutedSpeakers[Text:lower()] = true
end

function t.RemoveMutedSpeaker(p2, Text: string)
	p2.MutedSpeakers[Text:lower()] = false
end

function t.IsSpeakerMuted(p2, Text: string)
	return p2.MutedSpeakers[Text:lower()]
end

function t.InternalDestroy(p2)
	for _, channel in pairs(p2.Channels) do
		channel:InternalRemoveSpeaker(p2)
	end
	p2.eDestroyed:Fire()
	p2.EventFolder = nil
	p2.eDestroyed:Destroy()
	p2.eSaidMessage:Destroy()
	p2.eReceivedMessage:Destroy()
	p2.eReceivedUnfilteredMessage:Destroy()
	p2.eMessageDoneFiltering:Destroy()
	p2.eReceivedSystemMessage:Destroy()
	p2.eChannelJoined:Destroy()
	p2.eChannelLeft:Destroy()
	p2.eMuted:Destroy()
	p2.eUnmuted:Destroy()
	p2.eExtraDataUpdated:Destroy()
	p2.eMainChannelSet:Destroy()
	p2.eChannelNameColorUpdated:Destroy()
end

function t.InternalAssignPlayerObject(p3, PlayerObj)
	p3.PlayerObj = PlayerObj
end

function t.InternalAssignEventFolder(p3, EventFolder)
	p3.EventFolder = EventFolder
end

function t.InternalSendMessage(p3, p4, p5)
	local Success, Result = pcall(function()
		-- upvalues: p3 (copy), p4 (copy), p5 (copy)
		p3:LazyFire("eReceivedUnfilteredMessage", p4, p5)
		
		if p3.PlayerObj then
			p3.EventFolder.OnNewMessage:FireClient(p3.PlayerObj, p4, p5)
		end
	end)
	
	if not Success and Result then
		print("Error sending internal message: " .. Result)
	end
end

function t.InternalSendFilteredMessage(p3, p4, p5)
	local Success, Result = pcall(function()
		-- upvalues: p3 (copy), p4 (copy), p5 (copy)
		p3:LazyFire("eReceivedMessage", p4, p5)
		p3:LazyFire("eMessageDoneFiltering", p4, p5)
		
		if p3.PlayerObj then
			p3.EventFolder.OnMessageDoneFiltering:FireClient(p3.PlayerObj, p4, p5)
		end
	end)
	
	if not Success and Result then
		print("Error sending internal filtered message: " .. Result)
	end
end

function t.InternalSendFilteredMessageWithTranslatedFilterResult(p3, List, p4, TextFilterTranslatedResult)
	-- upvalues: Result1 (ref)
	local t = {}
	
	for i, value in pairs(List) do
		t[i] = value
	end
	local FilterResult = t.FilterResult
	local Player = p3:GetPlayer()
	local TranslationForLocale = if Player == nil then nil else TextFilterTranslatedResult:GetTranslationForLocale(Player.LocaleId)
	local NonChatStringForBroadcastAsync = ""
	local NonChatStringForBroadcastAsync1 = nil
	pcall(function()
		-- upvalues: t (copy), Player (copy), NonChatStringForBroadcastAsync (ref), FilterResult (copy), TranslationForLocale (copy), NonChatStringForBroadcastAsync1 (ref)
		if not t.IsFilterResult then
			NonChatStringForBroadcastAsync = FilterResult
		elseif Player then
			NonChatStringForBroadcastAsync = FilterResult:GetChatForUserAsync(Player.UserId)
			
			if TranslationForLocale then
				NonChatStringForBroadcastAsync1 = TranslationForLocale:GetChatForUserAsync(Player.UserId)
				
				return
			end
		else
			NonChatStringForBroadcastAsync = FilterResult:GetNonChatStringForBroadcastAsync()
			
			if TranslationForLocale then
				NonChatStringForBroadcastAsync1 = TranslationForLocale:GetNonChatStringForBroadcastAsync()
				
				return
			end
		end
	end)
	
	if Result1 then
		t.Message = NonChatStringForBroadcastAsync
		
		if NonChatStringForBroadcastAsync1 then
			t.TranslatedMessage = NonChatStringForBroadcastAsync1
		end
		t.FilterResult = nil
		p3:InternalSendFilteredMessage(t, p4)
	elseif #NonChatStringForBroadcastAsync > 0 then
		t.Message = NonChatStringForBroadcastAsync
		
		if NonChatStringForBroadcastAsync1 then
			t.TranslatedMessage = NonChatStringForBroadcastAsync1
		end
		t.FilterResult = nil
		p3:InternalSendFilteredMessage(t, p4)
	end
end

function t.InternalSendFilteredMessageWithFilterResult(p5, List, p6)
	-- upvalues: Result1 (ref)
	local t = {}
	
	for i, value in pairs(List) do
		t[i] = value
	end
	local FilterResult = t.FilterResult
	local Player = p5:GetPlayer()
	local NonChatStringForBroadcastAsync = ""
	pcall(function()
		-- upvalues: t (copy), Player (copy), NonChatStringForBroadcastAsync (ref), FilterResult (copy)
		if not t.IsFilterResult then
			NonChatStringForBroadcastAsync = FilterResult
			
			return
		end
		if Player then
			NonChatStringForBroadcastAsync = FilterResult:GetChatForUserAsync(Player.UserId)
			
			return
		else
			NonChatStringForBroadcastAsync = FilterResult:GetNonChatStringForBroadcastAsync()
		end
	end)
	
	if Result1 then
		t.Message = NonChatStringForBroadcastAsync
		t.FilterResult = nil
		p5:InternalSendFilteredMessage(t, p6)
	elseif #NonChatStringForBroadcastAsync > 0 then
		t.Message = NonChatStringForBroadcastAsync
		t.FilterResult = nil
		p5:InternalSendFilteredMessage(t, p6)
	end
end

function t.InternalSendSystemMessage(p7, p8, p9)
	local Success, Result = pcall(function()
		-- upvalues: p7 (copy), p8 (copy), p9 (copy)
		p7:LazyFire("eReceivedSystemMessage", p8, p9)
		
		if p7.PlayerObj then
			p7.EventFolder.OnNewSystemMessage:FireClient(p7.PlayerObj, p8, p9)
		end
	end)
	
	if not Success and Result then
		print("Error sending internal system message: " .. Result)
	end
end

function t.UpdateChannelNameColor(p7, p8, p9)
	p7:LazyFire("eChannelNameColorUpdated", p8, p9)
	
	if p7.PlayerObj then
		p7.EventFolder.ChannelNameColorUpdated:FireClient(p7.PlayerObj, p8, p9)
	end
end

function SpeakerModule.new(ChatService, Name)
	-- upvalues: t (copy)
	local self = setmetatable({}, t)
	self.ChatService = ChatService
	self.PlayerObj = nil
	self.Name = Name
	self.ExtraData = {}
	self.Channels = {}
	self.MutedSpeakers = {}
	self.EventFolder = nil
	
	return self
end

return SpeakerModule