local list = { 0.05, 0.1, 0.2 }
local t = {}
local RunService = game:GetService("RunService")
local Chat = game:GetService("Chat")
local _ = Chat:WaitForChild("ClientChatModules")
local Parent = script.Parent
local ClientChatModules = Chat:WaitForChild("ClientChatModules")
local config = {
	ChatColor = require(ClientChatModules:WaitForChild("ChatSettings")).ErrorMessageTextColor or Color3.fromRGB(245, 50, 50)
}
local ChatConstantsModule = require(ClientChatModules:WaitForChild("ChatConstants"))
local ChatChannelModule = require(Parent:WaitForChild("ChatChannel"))
local SpeakerModule = require(Parent:WaitForChild("Speaker"))
local UtilModule = require(Parent:WaitForChild("Util"))
local ChatLocalizationModule = nil
pcall(function() --[[ Line: 38 ]]
	-- upvalues: ChatLocalizationModule (ref)
	ChatLocalizationModule = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)
ChatLocalizationModule = ChatLocalizationModule or {}

if not ChatLocalizationModule.FormatMessageToSend or not ChatLocalizationModule.LocalizeFormattedMessage then
	function ChatLocalizationModule:FormatMessageToSend(_, Formatted) --[[ Line: 42 ]]
		return Formatted
	end
end
local function _(Text: string): boolean --[[ Line: 45 | Named "allSpaces" ]]
	return string.len((string.gsub(Text, " ", ""))) == 0
end

local Module = {}
Module.__index = Module

function Module.AddChannel(p1, Text: string, AutoJoin) --[[ Line: 55 ]]
	-- upvalues: ChatLocalizationModule (ref), ChatChannelModule (copy), ChatConstantsModule (copy)
	if p1.ChatChannels[Text:lower()] then
		error(string.format("Channel %q alrady exists.", Text))
	end
	local NewChatChannel = ChatChannelModule.new(p1, Text)
	p1.ChatChannels[Text:lower()] = NewChatChannel
	NewChatChannel:RegisterProcessCommandsFunction("default_commands", function(p2, Text1: string): boolean --[[ Line: 60 | Named "DefaultChannelCommands" ]]
		-- upvalues: p1 (copy), Text (copy), ChatLocalizationModule (upval)
		if Text1:lower() ~= "/leave" then
			return false
		end
		local Channel = p1:GetChannel(Text)
		local Speaker = p1:GetSpeaker(p2)
		
		if Channel and Speaker then
			if Channel.Leavable then
				Speaker:LeaveChannel(Text)
				Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_ChatService_YouHaveLeftChannel", string.format("You have left channel '%s'", Text), "RBX_NAME", Text), "System")
			else
				Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_ChatService_CannotLeaveChannel", "You cannot leave this channel."), Text)
			end
		end
		return true
	end, ChatConstantsModule.HighPriority)
	local Success, Result = pcall(function() --[[ Line: 89 ]]
		-- upvalues: p1 (copy), Text (copy)
		p1.eChannelAdded:Fire(Text)
	end)
	
	if not Success and Result then
		print("Error addding channel: " .. Result)
	end
	if AutoJoin ~= nil then
		NewChatChannel.AutoJoin = AutoJoin
		
		if AutoJoin then
			for _, speaker in pairs(p1.Speakers) do
				speaker:JoinChannel(Text)
			end
		end
	end
	return NewChatChannel
end

function Module.RemoveChannel(p2, Text: string) --[[ Line: 106 ]]
	if p2.ChatChannels[Text:lower()] then
		local Name = p2.ChatChannels[Text:lower()].Name
		p2.ChatChannels[Text:lower()]:InternalDestroy()
		p2.ChatChannels[Text:lower()] = nil
		local Success, Result = pcall(function() --[[ Line: 113 ]]
			-- upvalues: p2 (copy), Name (copy)
			p2.eChannelRemoved:Fire(Name)
		end)
		
		if not Success and Result then
			print("Error removing channel: " .. Result)
			
			return
		end
	else
		warn(string.format("Channel %q does not exist.", Text))
	end
end

function Module.GetChannel(p2, Text: string) --[[ Line: 122 ]]
	return p2.ChatChannels[Text:lower()]
end

function Module.AddSpeaker(p2, Text: string) --[[ Line: 127 ]]
	-- upvalues: SpeakerModule (copy)
	if p2.Speakers[Text:lower()] then
		error("Speaker \"" .. Text .. "\" already exists!")
	end
	local NewSpeaker = SpeakerModule.new(p2, Text)
	p2.Speakers[Text:lower()] = NewSpeaker
	local Success, Result = pcall(function() --[[ Line: 135 ]]
		-- upvalues: p2 (copy), Text (copy)
		p2.eSpeakerAdded:Fire(Text)
	end)
	
	if not Success and Result then
		print("Error adding speaker: " .. Result)
	end
	return NewSpeaker
end

function Module.InternalUnmuteSpeaker(p2, Name) --[[ Line: 143 ]]
	for _, chatChannel in pairs(p2.ChatChannels) do
		if chatChannel:IsSpeakerMuted(Name) then
			chatChannel:UnmuteSpeaker(Name)
		end
	end
end

function Module.RemoveSpeaker(p3, Text: string) --[[ Line: 151 ]]
	if p3.Speakers[Text:lower()] then
		local Name = p3.Speakers[Text:lower()].Name
		p3:InternalUnmuteSpeaker(Name)
		p3.Speakers[Text:lower()]:InternalDestroy()
		p3.Speakers[Text:lower()] = nil
		local Success, Result = pcall(function() --[[ Line: 160 ]]
			-- upvalues: p3 (copy), Name (copy)
			p3.eSpeakerRemoved:Fire(Name)
		end)
		
		if not Success and Result then
			print("Error removing speaker: " .. Result)
			
			return
		end
	else
		warn("Speaker \"" .. Text .. "\" does not exist!")
	end
end

function Module.GetSpeaker(p3, Text: string) --[[ Line: 170 ]]
	return p3.Speakers[Text:lower()]
end

function Module.GetSpeakerByUserOrDisplayName(p3, Text: string) --[[ Line: 174 ]]
	local Speaker = p3.Speakers[Text:lower()]
	
	if Speaker then
		return Speaker
	end
	for _, speaker in pairs(p3.Speakers) do
		local Player = speaker:GetPlayer()
		
		if Player and Player.DisplayName:lower() == Text:lower() then
			return speaker
		end
	end
end

function Module.GetChannelList(p4) --[[ Line: 190 ]]
	local List = {}
	
	for _, chatChannel in pairs(p4.ChatChannels) do
		if not chatChannel.Private then
			table.insert(List, chatChannel.Name)
		end
	end
	return List
end

function Module.GetAutoJoinChannelList(p5) --[[ Line: 200 ]]
	local List = {}
	
	for _, chatChannel in pairs(p5.ChatChannels) do
		if chatChannel.AutoJoin then
			table.insert(List, chatChannel)
		end
	end
	return List
end

function Module.GetSpeakerList(p6) --[[ Line: 210 ]]
	local List = {}
	
	for _, speaker in pairs(p6.Speakers) do
		table.insert(List, speaker.Name)
	end
	return List
end

function Module.SendGlobalSystemMessage(p7, p8) --[[ Line: 218 ]]
	for _, speaker in pairs(p7.Speakers) do
		speaker:SendSystemMessage(p8, nil)
	end
end

function Module.RegisterFilterMessageFunction(p9, p10, p11, p12) --[[ Line: 224 ]]
	if p9.FilterMessageFunctions:HasFunction(p10) then
		error(string.format("FilterMessageFunction '%s' already exists", p10))
	end
	p9.FilterMessageFunctions:AddFunction(p10, p11, p12)
end

function Module.FilterMessageFunctionExists(p9, p10) --[[ Line: 231 ]]
	return p9.FilterMessageFunctions:HasFunction(p10)
end

function Module.UnregisterFilterMessageFunction(p9, p10) --[[ Line: 235 ]]
	if not p9.FilterMessageFunctions:HasFunction(p10) then
		error(string.format("FilterMessageFunction '%s' does not exists", p10))
	end
	p9.FilterMessageFunctions:RemoveFunction(p10)
end

function Module.RegisterProcessCommandsFunction(p9, p10, p11, HighPriority) --[[ Line: 242 ]]
	if p9.ProcessCommandsFunctions:HasFunction(p10) then
		error(string.format("ProcessCommandsFunction '%s' already exists", p10))
	end
	p9.ProcessCommandsFunctions:AddFunction(p10, p11, HighPriority)
end

function Module.ProcessCommandsFunctionExists(p9, p10) --[[ Line: 249 ]]
	return p9.ProcessCommandsFunctions:HasFunction(p10)
end

function Module.UnregisterProcessCommandsFunction(p9, p10) --[[ Line: 253 ]]
	if not p9.ProcessCommandsFunctions:HasFunction(p10) then
		error(string.format("ProcessCommandsFunction '%s' does not exist", p10))
	end
	p9.ProcessCommandsFunctions:RemoveFunction(p10)
end

local CurrentTime = 0
local CurrentTime1 = 0
local Count = 0

function Module.InternalNotifyFilterIssue(p9) --[[ Line: 263 ]]
	-- upvalues: CurrentTime1 (ref), Count (ref), CurrentTime (ref), ChatLocalizationModule (ref), config (copy)
	if tick() - CurrentTime1 > 60 then
		Count = 0
	end
	Count += 1
	CurrentTime1 = tick()
	
	if Count >= 3 and tick() - CurrentTime > 60 then
		CurrentTime = tick()
		local SystemChannel = p9:GetChannel("System")
		
		if SystemChannel then
			SystemChannel:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_ChatService_ChatFilterIssues", "The chat filter is currently experiencing issues and messages may be slow to appear."), config)
		end
	end
end

local t1 = {}

function Module.InternalApplyRobloxFilter(p9, p10, Text: string, p11) --[[ Line: 292 ]]
	-- upvalues: RunService (copy), Chat (copy), list (copy), t1 (copy)
	if RunService:IsServer() and not RunService:IsStudio() then
		local Speaker = p9:GetSpeaker(p10)
		local Speaker1 = p11 and p9:GetSpeaker(p11)
		
		if Speaker == nil then
			return nil
		end
		local Player = Speaker:GetPlayer()
		local Player1 = Speaker1 and Speaker1:GetPlayer()
		
		if Player == nil then
			return Text
		end
		if string.len((string.gsub(Text, " ", ""))) == 0 then
			return Text
		end
		local CurrentTime = tick()
		local Count = 0
		local Result = nil
		while true do
			local Success
			Success, Result = pcall(function() --[[ Line: 315 ]]
				-- upvalues: Player1 (copy), Chat (upval), Text (copy), Player (copy)
				return if Player1 then Chat:FilterStringAsync(Text, Player, Player1) else Chat:FilterStringForBroadcast(Text, Player)
			end)
			if Success then
				return Result
			end
			warn("Error filtering message:", Result)
			Count += 1
			
			if Count > 3 or tick() - CurrentTime > 60 then
				p9:InternalNotifyFilterIssue()
				
				return nil
			end
			local Entry = list[math.min(#list, Count)]
			wait(Entry + (math.random() * 2 - 1) * Entry)
		end
	else
		if not t1[Text] then
			t1[Text] = true
			wait()
		end
		return Text
	end
end

function Module.InternalApplyRobloxFilterAndTranslate(p12, p13, TargetLocales, Text: string, TextContext) --[[ Line: 351 ]]
	-- upvalues: RunService (copy)
	if not RunService:IsServer() or RunService:IsStudio() then
		wait()
		
		return true, false, Text
	end
	local Speaker = p12:GetSpeaker(p13)
	
	if Speaker == nil then
		return false, nil, nil
	end
	local Player = Speaker:GetPlayer()
	
	if Player == nil then
		return true, false, Text
	elseif string.len((string.gsub(Text, " ", ""))) == 0 then
		return true, false, Text
	else
		local Success, Result = pcall(function() --[[ Line: 369 ]]
			-- upvalues: Text (copy), Player (copy), TargetLocales (copy), TextContext (copy)
			return (game:GetService("TextService"):FilterAndTranslateStringAsync(Text, Player.UserId, TargetLocales, TextContext))
		end)
		
		if Success then
			return true, true, Result
		else
			warn("Error filtering and translating message", Text, Result)
			p12:InternalNotifyFilterIssue()
			
			return false, nil, nil
		end
	end
end

function Module.InternalApplyRobloxFilterNewAPI(p12, p13, Text: string, TextContext) --[[ Line: 388 ]]
	-- upvalues: RunService (copy)
	if not RunService:IsServer() or RunService:IsStudio() then
		wait()
		
		return true, false, Text
	end
	local Speaker = p12:GetSpeaker(p13)
	
	if Speaker == nil then
		return false, nil, nil
	end
	local Player = Speaker:GetPlayer()
	
	if Player == nil then
		return true, false, Text
	elseif string.len((string.gsub(Text, " ", ""))) == 0 then
		return true, false, Text
	else
		local Success, Result = pcall(function() --[[ Line: 407 ]]
			-- upvalues: Text (copy), Player (copy), TextContext (copy)
			return (game:GetService("TextService"):FilterStringAsync(Text, Player.UserId, TextContext))
		end)
		
		if Success then
			return true, true, Result
		else
			warn("Error filtering message:", Text, Result)
			p12:InternalNotifyFilterIssue()
			
			return false, nil, nil
		end
	end
end

function Module.InternalDoMessageFilter(p12, p13, p14, p15) --[[ Line: 426 ]]
	for i, value, _ in p12.FilterMessageFunctions:GetIterator() do
		local Success, Result = pcall(function() --[[ Line: 430 ]]
			-- upvalues: value (copy), p13 (copy), p14 (copy), p15 (copy)
			value(p13, p14, p15)
		end)
		
		if not Success then
			warn(string.format("DoMessageFilter Function '%s' failed for reason: %s", i, Result))
		end
	end
end

function Module.InternalDoProcessCommands(p16, p17, p18, p19): boolean --[[ Line: 440 ]]
	for i, value, _ in p16.ProcessCommandsFunctions:GetIterator() do
		local Success, Result = pcall(function() --[[ Line: 444 ]]
			-- upvalues: value (copy), p17 (copy), p18 (copy), p19 (copy)
			local ValueResult = value(p17, p18, p19)
			
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

function Module.InternalGetUniqueMessageId(p20): number --[[ Line: 462 ]]
	local MessageIdCounter: number = p20.MessageIdCounter
	p20.MessageIdCounter = MessageIdCounter + 1
	
	return MessageIdCounter
end

function Module.InternalAddSpeakerWithPlayerObject(p20, Text: string, p21, p22) --[[ Line: 468 ]]
	-- upvalues: SpeakerModule (copy)
	if p20.Speakers[Text:lower()] then
		error("Speaker \"" .. Text .. "\" already exists!")
	end
	local NewSpeaker = SpeakerModule.new(p20, Text)
	NewSpeaker:InternalAssignPlayerObject(p21)
	p20.Speakers[Text:lower()] = NewSpeaker
	
	if p22 then
		local Success, Result = pcall(function() --[[ Line: 478 ]]
			-- upvalues: p20 (copy), Text (copy)
			p20.eSpeakerAdded:Fire(Text)
		end)
		
		if not Success and Result then
			print("Error adding speaker: " .. Result)
		end
	end
	return NewSpeaker
end

function Module.InternalFireSpeakerAdded(p20, p21) --[[ Line: 487 ]]
	local Success, Result = pcall(function() --[[ Line: 488 ]]
		-- upvalues: p20 (copy), p21 (copy)
		p20.eSpeakerAdded:Fire(p21)
	end)
	
	if not Success and Result then
		print("Error firing speaker added: " .. Result)
	end
end

function t.new() --[[ Line: 497 ]]
	-- upvalues: Module (copy), UtilModule (copy)
	local self = setmetatable({}, Module)
	self.MessageIdCounter = 0
	self.ChatChannels = {}
	self.Speakers = {}
	self.FilterMessageFunctions = UtilModule:NewSortedFunctionContainer()
	self.ProcessCommandsFunctions = UtilModule:NewSortedFunctionContainer()
	self.eChannelAdded = Instance.new("BindableEvent")
	self.eChannelRemoved = Instance.new("BindableEvent")
	self.eSpeakerAdded = Instance.new("BindableEvent")
	self.eSpeakerRemoved = Instance.new("BindableEvent")
	self.ChannelAdded = self.eChannelAdded.Event
	self.ChannelRemoved = self.eChannelRemoved.Event
	self.SpeakerAdded = self.eSpeakerAdded.Event
	self.SpeakerRemoved = self.eSpeakerRemoved.Event
	self.ChatServiceMajorVersion = 0
	self.ChatServiceMinorVersion = 5
	
	return self
end

return t.new()