local Result1 = false
local Success, Result = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserShouldMuteUnfilteredMessage")
end)
Result1 = Success and Result
local Result2_1 = nil
local Success1, Result2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserRemoveMessageOnTextFilterFailures")
end)
Result2_1 = Success1 and Result2
local Result3_1 = false
local Success2, Result3 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2")
end)
Result3_1 = Success2 and Result3
local ChatChannelModule = {}
local Chat = game:GetService("Chat")
local RunService = game:GetService("RunService")
local ClientChatModules = Chat:WaitForChild("ClientChatModules")
local ChatSettingsModule = require(ClientChatModules:WaitForChild("ChatSettings"))
local ChatConstantsModule = require(ClientChatModules:WaitForChild("ChatConstants"))
local UtilModule = require(script.Parent:WaitForChild("Util"))
local ChatLocalizationModule = nil
pcall(function()
	-- upvalues: ChatLocalizationModule (ref)
	ChatLocalizationModule = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)
ChatLocalizationModule = ChatLocalizationModule or {}

if not ChatLocalizationModule.FormatMessageToSend or not ChatLocalizationModule.LocalizeFormattedMessage then
	function ChatLocalizationModule:FormatMessageToSend(_, p1)
		return p1
	end
end
local Module = {}
Module.__index = Module

function Module.SendSystemMessage(p1, Formatted, p2)
	local InternalCreateMessageObjectResult = p1:InternalCreateMessageObject(Formatted, nil, true, p2)
	local Success, Result = pcall(function()
		-- upvalues: p1 (copy), InternalCreateMessageObjectResult (copy)
		p1.eMessagePosted:Fire(InternalCreateMessageObjectResult)
	end)
	
	if not Success and Result then
		print("Error posting message: " .. Result)
	end
	p1:InternalAddMessageToHistoryLog(InternalCreateMessageObjectResult)
	
	for _, speaker in pairs(p1.Speakers) do
		speaker:InternalSendSystemMessage(InternalCreateMessageObjectResult, p1.Name)
	end
	return InternalCreateMessageObjectResult
end

function Module.SendSystemMessageToSpeaker(p3, GameChatChatChannelMutedInChannel, Name, p4)
	-- upvalues: RunService (copy)
	local Speaker = p3.Speakers[Name]
	
	if Speaker then
		Speaker:InternalSendSystemMessage(p3:InternalCreateMessageObject(GameChatChatChannelMutedInChannel, nil, true, p4), p3.Name)
		
		return
	end
	if RunService:IsStudio() then
		warn(string.format("Speaker '%s' is not in channel '%s' and cannot be sent a system message", Name, p3.Name))
	end
end

function Module.SendMessageObjToFilters(p3, Message, InternalCreateMessageObjectResult, FromSpeaker)
	local Message1 = InternalCreateMessageObjectResult.Message
	InternalCreateMessageObjectResult.Message = Message
	p3:InternalDoMessageFilter(FromSpeaker.Name, InternalCreateMessageObjectResult, p3.Name)
	p3.ChatService:InternalDoMessageFilter(FromSpeaker.Name, InternalCreateMessageObjectResult, p3.Name)
	InternalCreateMessageObjectResult.Message = Message1
	
	return InternalCreateMessageObjectResult.Message
end

function Module:CanCommunicateByUserId(UserId, SpeakerUserId)
	-- upvalues: RunService (copy), Chat (copy)
	if RunService:IsStudio() then
		return true
	elseif UserId == 0 or SpeakerUserId == 0 then
		return true
	else
		local Success, Result = pcall(function()
			-- upvalues: Chat (upval), UserId (copy), SpeakerUserId (copy)
			return Chat:CanUsersChatAsync(UserId, SpeakerUserId)
		end)
		
		return Success and Result
	end
end

function Module.CanCommunicate(p3, Speaker, Speaker1)
	local Player = Speaker:GetPlayer()
	local Player1 = Speaker1:GetPlayer()
	
	return not Player or not Player1 or p3:CanCommunicateByUserId(Player.UserId, Player1.UserId)
end

function Module.SendMessageToSpeaker(p3, Message, p4, FromSpeaker, p5)
	-- upvalues: RunService (copy)
	local Speaker = p3.Speakers[p4]
	local Speaker1 = p3.ChatService:GetSpeaker(FromSpeaker)
	
	if Speaker and Speaker1 then
		if Speaker:IsSpeakerMuted(FromSpeaker) then return end
		if not p3:CanCommunicate(Speaker, Speaker1) then return end
		local InternalCreateMessageObjectResult = p3:InternalCreateMessageObject(Message, FromSpeaker, p4 == FromSpeaker, p5)
		local SendMessageObjToFiltersResult = p3:SendMessageObjToFilters(Message, InternalCreateMessageObjectResult, FromSpeaker)
		Speaker:InternalSendMessage(InternalCreateMessageObjectResult, p3.Name)
		local InternalApplyRobloxFilterNewAPIResult, InternalApplyRobloxFilterNewAPIResult2, InternalApplyRobloxFilterNewAPIResult3 = p3.ChatService:InternalApplyRobloxFilterNewAPI(InternalCreateMessageObjectResult.FromSpeaker, SendMessageObjToFiltersResult, p3.Private and Enum.TextFilterContext.PrivateChat or Enum.TextFilterContext.PublicChat)
		
		if InternalApplyRobloxFilterNewAPIResult then
			InternalCreateMessageObjectResult.FilterResult = InternalApplyRobloxFilterNewAPIResult3
			InternalCreateMessageObjectResult.IsFilterResult = InternalApplyRobloxFilterNewAPIResult2
			InternalCreateMessageObjectResult.IsFiltered = true
			Speaker:InternalSendFilteredMessageWithFilterResult(InternalCreateMessageObjectResult, p3.Name)
			
			return
		end
	elseif RunService:IsStudio() then
		warn(string.format("Speaker '%s' is not in channel '%s' and cannot be sent a message", p4, p3.Name))
	end
end

function Module.KickSpeaker(p3, Text, p4)
	local Speaker = p3.ChatService:GetSpeaker(Text)
	
	if not Speaker then
		error("Speaker \"" .. Text .. "\" does not exist!")
	end
	local NameForDisplay = Speaker:GetNameForDisplay()
	local Formatted1 = nil
	local Formatted = nil
	
	if p4 then
		Formatted = string.format("You were kicked from '%s' for the following reason(s): %s", p3.Name, p4)
		Formatted1 = string.format("%s was kicked for the following reason(s): %s", NameForDisplay, p4)
	else
		Formatted = string.format("You were kicked from '%s'", p3.Name)
		Formatted1 = string.format("%s was kicked", NameForDisplay)
	end
	p3:SendSystemMessageToSpeaker(Formatted, Text)
	Speaker:LeaveChannel(p3.Name)
	p3:SendSystemMessage(Formatted1)
end

function Module.MuteSpeaker(p3, Text: string, p4, p5)
	local Speaker = p3.ChatService:GetSpeaker(Text)
	
	if not Speaker then
		error("Speaker \"" .. Text .. "\" does not exist!")
	end
	p3.Mutes[Text:lower()] = if p5 == 0 or p5 == nil then 0 else os.time() + p5
	
	if p4 then
		p3:SendSystemMessage(string.format("%s was muted for the following reason(s): %s", Speaker:GetNameForDisplay(), p4))
	end
	local Success, Result = pcall(function()
		-- upvalues: p3 (copy), Text (copy), p4 (copy), p5 (copy)
		p3.eSpeakerMuted:Fire(Text, p4, p5)
	end)
	
	if not Success and Result then
		print("Error mutting speaker: " .. Result)
	end
	local Speaker1 = p3.ChatService:GetSpeaker(Text)
	
	if Speaker1 then
		local Success1, Result1 = pcall(function()
			-- upvalues: Speaker1 (copy), p3 (copy), p4 (copy), p5 (copy)
			Speaker1.eMuted:Fire(p3.Name, p4, p5)
		end)
		
		if not Success1 and Result1 then
			print("Error mutting speaker: " .. Result1)
		end
	end
end

function Module.UnmuteSpeaker(p3, Text: string)
	if not p3.ChatService:GetSpeaker(Text) then
		error("Speaker \"" .. Text .. "\" does not exist!")
	end
	p3.Mutes[Text:lower()] = nil
	local Success, Result = pcall(function()
		-- upvalues: p3 (copy), Text (copy)
		p3.eSpeakerUnmuted:Fire(Text)
	end)
	
	if not Success and Result then
		print("Error unmuting speaker: " .. Result)
	end
	local Speaker = p3.ChatService:GetSpeaker(Text)
	
	if Speaker then
		local Success1, Result1 = pcall(function()
			-- upvalues: Speaker (copy), p3 (copy)
			Speaker.eUnmuted:Fire(p3.Name)
		end)
		
		if not Success1 and Result1 then
			print("Error unmuting speaker: " .. Result1)
		end
	end
end

function Module.IsSpeakerMuted(p3, Name: string): boolean
	return p3.Mutes[Name:lower()] ~= nil
end

function Module.GetSpeakerList(p3)
	local List = {}
	
	for _, speaker in pairs(p3.Speakers) do
		table.insert(List, speaker.Name)
	end
	return List
end

function Module.RegisterFilterMessageFunction(p4, p5, p6, p7)
	if p4.FilterMessageFunctions:HasFunction(p5) then
		error(string.format("FilterMessageFunction '%s' already exists", p5))
	end
	p4.FilterMessageFunctions:AddFunction(p5, p6, p7)
end

function Module.FilterMessageFunctionExists(p4, p5)
	return p4.FilterMessageFunctions:HasFunction(p5)
end

function Module.UnregisterFilterMessageFunction(p4, p5)
	if not p4.FilterMessageFunctions:HasFunction(p5) then
		error(string.format("FilterMessageFunction '%s' does not exists", p5))
	end
	p4.FilterMessageFunctions:RemoveFunction(p5)
end

function Module.RegisterProcessCommandsFunction(p4, p5, p6, p7)
	if p4.ProcessCommandsFunctions:HasFunction(p5) then
		error(string.format("ProcessCommandsFunction '%s' already exists", p5))
	end
	p4.ProcessCommandsFunctions:AddFunction(p5, p6, p7)
end

function Module.ProcessCommandsFunctionExists(p4, p5)
	return p4.ProcessCommandsFunctions:HasFunction(p5)
end

function Module.UnregisterProcessCommandsFunction(p4, p5)
	if not p4.ProcessCommandsFunctions:HasFunction(p5) then
		error(string.format("ProcessCommandsFunction '%s' does not exist", p5))
	end
	p4.ProcessCommandsFunctions:RemoveFunction(p5)
end

local function _(List)
	local t = {}
	
	for i, value in pairs(List) do
		t[i] = value
	end
	return t
end

function Module.GetHistoryLog(p4)
	local t = {}
	
	for i, value in pairs(p4.ChatHistory) do
		t[i] = value
	end
	return t
end

function Module.GetHistoryLogForSpeaker(p5, p6)
	-- upvalues: ChatConstantsModule (copy)
	local UserId = -1
	local Player = p6:GetPlayer()
	
	if Player then
		UserId = Player.UserId
	end
	local List = {}
	
	for i = 1, #p5.ChatHistory do
		if p5:CanCommunicateByUserId(UserId, p5.ChatHistory[i].SpeakerUserId) then
			local t = {}
			
			for i1, value in pairs(p5.ChatHistory[i]) do
				t[i1] = value
			end
			if t.MessageType == ChatConstantsModule.MessageTypeDefault or t.MessageType == ChatConstantsModule.MessageTypeMeCommand then
				local FilterResult = t.FilterResult
				
				if t.IsFilterResult then
					if Player then
						t.Message = FilterResult:GetChatForUserAsync(Player.UserId)
					else
						t.Message = FilterResult:GetNonChatStringForBroadcastAsync()
					end
				else
					t.Message = FilterResult
				end
			end
			table.insert(List, t)
		end
	end
	return List
end

function Module.InternalDestroy(p7)
	for _, speaker in pairs(p7.Speakers) do
		speaker:LeaveChannel(p7.Name)
	end
	p7.eDestroyed:Fire()
	p7.eDestroyed:Destroy()
	p7.eMessagePosted:Destroy()
	p7.eSpeakerJoined:Destroy()
	p7.eSpeakerLeft:Destroy()
	p7.eSpeakerMuted:Destroy()
	p7.eSpeakerUnmuted:Destroy()
end

function Module.InternalDoMessageFilter(p8, Name, p9, Name1)
	for i, value, _ in p8.FilterMessageFunctions:GetIterator() do
		local Success, Result = pcall(function()
			-- upvalues: value (copy), Name (copy), p9 (copy), Name1 (copy)
			value(Name, p9, Name1)
		end)
		
		if not Success then
			warn(string.format("DoMessageFilter Function '%s' failed for reason: %s", i, Result))
		end
	end
end

function Module.InternalDoProcessCommands(p10, Name, Message, Name1): boolean
	for i, value, _ in p10.ProcessCommandsFunctions:GetIterator() do
		local Success, Result = pcall(function()
			-- upvalues: value (copy), Name (copy), Message (copy), Name1 (copy)
			local ValueResult = value(Name, Message, Name1)
			
			if type(ValueResult) ~= "boolean" then
				error("Process command functions must return a bool")
			end
			return ValueResult
		end)
		
		if not Success then
			warn(string.format("DoProcessCommands Function '%s' failed for reason: %s", i, Result))
		elseif Result then
			return true
		end
	end
	return false
end

function getLanguageCodeFromLocale(Text: string)
	local v1 = string.gmatch(Text, "[^-]+")()
	
	return if v1 then v1 else "en"
end

function Module.InternalPostMessage(p11, p12, Message, p13)
	-- upvalues: ChatLocalizationModule (ref), Chat (copy), Result1 (ref), Result3_1 (ref), Result2_1 (ref)
	if p11:InternalDoProcessCommands(p12.Name, Message, p11.Name) then
		return false
	end
	if p11.Mutes[p12.Name:lower()] ~= nil then
		local Mute: number = p11.Mutes[p12.Name:lower()]
		
		if Mute <= 0 or Mute >= os.time() then
			p11:SendSystemMessageToSpeaker(ChatLocalizationModule:FormatMessageToSend("GameChat_ChatChannel_MutedInChannel", "You are muted and cannot talk in this channel"), p12.Name)
			
			return false
		end
		p11:UnmuteSpeaker(p12.Name)
	end
	local InternalCreateMessageObjectResult = p11:InternalCreateMessageObject(Message, p12.Name, false, p13)
	InternalCreateMessageObjectResult.Message = Message
	local InvokeChatResult = nil
	pcall(function()
		-- upvalues: InvokeChatResult (ref), Chat (upval), InternalCreateMessageObjectResult (ref)
		InvokeChatResult = Chat:InvokeChatCallback(Enum.ChatCallbackType.OnServerReceivingMessage, InternalCreateMessageObjectResult)
	end)
	InternalCreateMessageObjectResult.Message = nil
	
	if InvokeChatResult then
		if InvokeChatResult.ShouldDeliver == false then
			return false
		end
		InternalCreateMessageObjectResult = InvokeChatResult
	end
	local SendMessageObjToFiltersResult = p11:SendMessageObjToFilters(Message, InternalCreateMessageObjectResult, p12)
	local Names = {}
	
	for _, speaker1 in pairs(p11.Speakers) do
		if not speaker1:IsSpeakerMuted(p12.Name) and p11:CanCommunicate(p12, speaker1) then
			table.insert(Names, speaker1.Name)
			
			if speaker1.Name ~= p12.Name then
				speaker1:InternalSendMessage(InternalCreateMessageObjectResult, p11.Name)
				continue
			end
			local t = {}
			
			for i, value1 in pairs(InternalCreateMessageObjectResult) do
				t[i] = value1
			end
			if Result1 then
				t.Message = string.rep("_", InternalCreateMessageObjectResult.MessageLengthUtf8 or InternalCreateMessageObjectResult.MessageLength)
			else
				t.Message = SendMessageObjToFiltersResult
			end
			t.IsFiltered = true
			speaker1:InternalSendMessage(t, p11.Name)
		end
	end
	local Success, Result = pcall(function()
		-- upvalues: p11 (copy), InternalCreateMessageObjectResult (ref)
		p11.eMessagePosted:Fire(InternalCreateMessageObjectResult)
	end)
	
	if not Success and Result then
		print("Error posting message: " .. Result)
	end
	local PrivateChat = p11.Private and Enum.TextFilterContext.PrivateChat or Enum.TextFilterContext.PublicChat
	local v1 = nil
	
	if Result3_1 then
		local List = {}
		local t = {}
		
		for _, speaker2 in pairs(p11.Speakers) do
			local Player = speaker2:GetPlayer()
			
			if Player ~= nil and Player.LocaleId ~= nil then
				t[getLanguageCodeFromLocale(Player.LocaleId)] = true
			end
		end
		for i1, _ in t do
			table.insert(List, i1)
		end
		local InternalApplyRobloxFilterAndTranslateResult, InternalApplyRobloxFilterAndTranslateResult2, InternalApplyRobloxFilterAndTranslateResult3 = p11.ChatService:InternalApplyRobloxFilterAndTranslate(InternalCreateMessageObjectResult.FromSpeaker, List, SendMessageObjToFiltersResult, PrivateChat)
		
		if InternalApplyRobloxFilterAndTranslateResult then
			if InternalApplyRobloxFilterAndTranslateResult2 then
				InternalCreateMessageObjectResult.FilterResult = InternalApplyRobloxFilterAndTranslateResult3.SourceText
			else
				InternalCreateMessageObjectResult.FilterResult = InternalApplyRobloxFilterAndTranslateResult3
			end
			InternalCreateMessageObjectResult.IsFilterResult = InternalApplyRobloxFilterAndTranslateResult2
			
			if InternalApplyRobloxFilterAndTranslateResult2 then
				v1 = InternalApplyRobloxFilterAndTranslateResult3
			end
		else
			if not Result2_1 then
				return false
			end
			InternalCreateMessageObjectResult.IsFilterResult = false
			InternalCreateMessageObjectResult.FilterResult = ""
			InternalCreateMessageObjectResult.MessageLength = 0
		end
	else
		local InternalApplyRobloxFilterNewAPIResult, InternalApplyRobloxFilterNewAPIResult2, InternalApplyRobloxFilterNewAPIResult3 = p11.ChatService:InternalApplyRobloxFilterNewAPI(InternalCreateMessageObjectResult.FromSpeaker, SendMessageObjToFiltersResult, PrivateChat)
		
		if InternalApplyRobloxFilterNewAPIResult then
			InternalCreateMessageObjectResult.FilterResult = InternalApplyRobloxFilterNewAPIResult3
			InternalCreateMessageObjectResult.IsFilterResult = InternalApplyRobloxFilterNewAPIResult2
		else
			if not Result2_1 then
				return false
			end
			InternalCreateMessageObjectResult.IsFilterResult = false
			InternalCreateMessageObjectResult.FilterResult = ""
			InternalCreateMessageObjectResult.MessageLength = 0
		end
	end
	InternalCreateMessageObjectResult.IsFiltered = true
	p11:InternalAddMessageToHistoryLog(InternalCreateMessageObjectResult)
	
	for _, name in pairs(Names) do
		local Speaker1 = p11.Speakers[name]
		
		if Speaker1 then
			if Result3_1 and (v1 and (p12:GetPlayer() ~= nil and (Speaker1:GetPlayer() ~= nil and p12:GetPlayer().LocaleId ~= Speaker1:GetPlayer().LocaleId))) then
				Speaker1:InternalSendFilteredMessageWithTranslatedFilterResult(InternalCreateMessageObjectResult, p11.Name, v1)
			else
				Speaker1:InternalSendFilteredMessageWithFilterResult(InternalCreateMessageObjectResult, p11.Name)
			end
		end
	end
	local List = {}
	local Flag = nil
	
	for _, speaker in pairs(p11.Speakers) do
		if not speaker:IsSpeakerMuted(p12.Name) and p11:CanCommunicate(p12, speaker) then
			Flag = false
			
			for _, value in pairs(Names) do
				if speaker.Name == value then
					Flag = true
					break
				end
			end
			if not Flag then
				table.insert(List, speaker.Name)
			end
		end
	end
	for _, value2 in pairs(List) do
		local Speaker = p11.Speakers[value2]
		
		if Speaker then
			Speaker:InternalSendFilteredMessageWithFilterResult(InternalCreateMessageObjectResult, p11.Name)
		end
	end
	return InternalCreateMessageObjectResult
end

function Module.InternalAddSpeaker(p14, p15)
	if p14.Speakers[p15.Name] then
		warn("Speaker \"" .. p15.name .. "\" is already in the channel!")
		
		return
	end
	p14.Speakers[p15.Name] = p15
	local Success, Result = pcall(function()
		-- upvalues: p14 (copy), p15 (copy)
		p14.eSpeakerJoined:Fire(p15.Name)
	end)
	
	if not Success and Result then
		print("Error removing channel: " .. Result)
	end
end

function Module.InternalRemoveSpeaker(p14, p15)
	if not p14.Speakers[p15.Name] then
		warn("Speaker \"" .. p15.name .. "\" is not in the channel!")
		
		return
	end
	p14.Speakers[p15.Name] = nil
	local Success, Result = pcall(function()
		-- upvalues: p14 (copy), p15 (copy)
		p14.eSpeakerLeft:Fire(p15.Name)
	end)
	
	if not Success and Result then
		print("Error removing speaker: " .. Result)
	end
end

function Module.InternalRemoveExcessMessagesFromLog(p14)
	local RemoveFunction: (any, any) -> () = table.remove
	while p14.MaxHistory < #p14.ChatHistory do
		RemoveFunction(p14.ChatHistory, 1)
	end
end

function Module.InternalAddMessageToHistoryLog(p15, InternalCreateMessageObjectResult)
	table.insert(p15.ChatHistory, InternalCreateMessageObjectResult)
	p15:InternalRemoveExcessMessagesFromLog()
end

function Module:GetMessageType(_, FromSpeaker)
	-- upvalues: ChatConstantsModule (copy)
	return if FromSpeaker == nil then ChatConstantsModule.MessageTypeSystem else ChatConstantsModule.MessageTypeDefault
end

function Module.InternalCreateMessageObject(p15, Text: string, FromSpeaker, IsFiltered, List)
	-- upvalues: ChatSettingsModule (copy)
	local MessageType = p15:GetMessageType(Text, FromSpeaker)
	local UserId = -1
	local NameForDisplay = nil
	local Speaker = nil
	
	if FromSpeaker then
		Speaker = p15.ChatService:GetSpeaker(FromSpeaker)
		
		if Speaker then
			local Player = Speaker:GetPlayer()
			
			if Player then
				UserId = Player.UserId
				
				if ChatSettingsModule.PlayerDisplayNamesEnabled then
					NameForDisplay = Speaker:GetNameForDisplay()
				end
			else
				UserId = 0
			end
		end
	end
	local config = {
		ID = p15.ChatService:InternalGetUniqueMessageId(),
		FromSpeaker = FromSpeaker,
		SpeakerDisplayName = NameForDisplay,
		SpeakerUserId = UserId,
		OriginalChannel = p15.Name,
		MessageLength = string.len(Text),
		MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(Text)),
		MessageType = MessageType,
		IsFiltered = IsFiltered,
		Message = IsFiltered and Text or nil,
		Time = os.time(),
		ExtraData = {}
	}
	
	if Speaker then
		for i, value in pairs(Speaker.ExtraData) do
			config.ExtraData[i] = value
		end
	end
	if List then
		for i1, value1 in pairs(List) do
			config.ExtraData[i1] = value1
		end
	end
	return config
end

function Module.SetChannelNameColor(p16, ChannelNameColor)
	p16.ChannelNameColor = ChannelNameColor
	
	for _, speaker in pairs(p16.Speakers) do
		speaker:UpdateChannelNameColor(p16.Name, ChannelNameColor)
	end
end

function Module.GetWelcomeMessageForSpeaker(p17, p18)
	if p17.GetWelcomeMessageFunction then
		local WelcomeMessageFunction = p17.GetWelcomeMessageFunction(p18)
		
		if WelcomeMessageFunction then
			return WelcomeMessageFunction
		end
	end
	return p17.WelcomeMessage
end

function Module.RegisterGetWelcomeMessageFunction(p17, Callback)
	if type(Callback) ~= "function" then
		error("RegisterGetWelcomeMessageFunction must be called with a function.")
	end
	p17.GetWelcomeMessageFunction = Callback
end

function Module.UnRegisterGetWelcomeMessageFunction(p17)
	p17.GetWelcomeMessageFunction = nil
end

function ChatChannelModule.new(ChatService, Name, p17, ChannelNameColor)
	-- upvalues: Module (copy), UtilModule (copy)
	local self = setmetatable({}, Module)
	self.ChatService = ChatService
	self.Name = Name
	self.WelcomeMessage = p17 or ""
	self.GetWelcomeMessageFunction = nil
	self.ChannelNameColor = ChannelNameColor
	self.Joinable = true
	self.Leavable = true
	self.AutoJoin = false
	self.Private = false
	self.Speakers = {}
	self.Mutes = {}
	self.MaxHistory = 200
	self.HistoryIndex = 0
	self.ChatHistory = {}
	self.FilterMessageFunctions = UtilModule:NewSortedFunctionContainer()
	self.ProcessCommandsFunctions = UtilModule:NewSortedFunctionContainer()
	self.eDestroyed = Instance.new("BindableEvent")
	self.eMessagePosted = Instance.new("BindableEvent")
	self.eSpeakerJoined = Instance.new("BindableEvent")
	self.eSpeakerLeft = Instance.new("BindableEvent")
	self.eSpeakerMuted = Instance.new("BindableEvent")
	self.eSpeakerUnmuted = Instance.new("BindableEvent")
	self.MessagePosted = self.eMessagePosted.Event
	self.SpeakerJoined = self.eSpeakerJoined.Event
	self.SpeakerLeft = self.eSpeakerLeft.Event
	self.SpeakerMuted = self.eSpeakerMuted.Event
	self.SpeakerUnmuted = self.eSpeakerUnmuted.Event
	self.Destroyed = self.eDestroyed.Event
	
	return self
end

return ChatChannelModule