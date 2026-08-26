local _ = false
local ok, status = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserShouldMuteUnfilteredMessage")
end)
local status_1 = ok and status
local _ = nil
local ok_1, status_2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserRemoveMessageOnTextFilterFailures")
end)
local status_2_1 = ok_1 and status_2
local _ = false
local ok_2, status_3 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2")
end)
local status_3_1 = ok_2 and status_3
local t = {}
local parent = script.Parent
local chatService = game:GetService("Chat")
local runService = game:GetService("RunService")
local clientChatModules = chatService:WaitForChild("ClientChatModules")
local chatSettingsModule = require(clientChatModules:WaitForChild("ChatSettings"))
local chatConstantsModule = require(clientChatModules:WaitForChild("ChatConstants"))
local utilModule = require(parent:WaitForChild("Util"))
local var1 = nil
pcall(function()
	-- upvalues: var1 (write)
	var1 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)
var1 = var1 or {}

if not var1.FormatMessageToSend or not var1.LocalizeFormattedMessage then
	function var10.FormatMessageToSend(_, _, p1)
		return p1
	end
end
local t_1 = {}
t_1.__index = t_1

function t_1.SendSystemMessage(p1, p2, p3)
	local var2 = p1:InternalCreateMessageObject(p2, nil, true, p3)
	local ok, status = pcall(function()
		-- upvalues: p1 (ref), var2 (ref)
		p1.eMessagePosted:Fire(var2)
	end)
	
	if not ok and status then
		print("Error posting message: " .. status)
	end
	p1:InternalAddMessageToHistoryLog(var2)
	
	for i, v in pairs(p1.Speakers) do
		v:InternalSendSystemMessage(var2, p1.Name)
	end
	return var2
end

function t_1.SendSystemMessageToSpeaker(p4, p5, p6, p7)
	-- upvalues: runService (ref)
	local var3 = p4.Speakers[p6]
	
	if var3 then
		var3:InternalSendSystemMessage(p4:InternalCreateMessageObject(p5, nil, true, p7), p4.Name)
		
		return
	elseif runService:IsStudio() then
		warn(string.format("Speaker '%s' is not in channel '%s' and cannot be sent a system message", p6, p4.Name))
	end
end

function t_1.SendMessageObjToFilters(p4, p5, p6, p7)
	local message = p6.Message
	p6.Message = p5
	p4:InternalDoMessageFilter(p7.Name, p6, p4.Name)
	p4.ChatService:InternalDoMessageFilter(p7.Name, p6, p4.Name)
	local message_1 = p6.Message
	p6.Message = message
	
	return message_1
end

function t_1.CanCommunicateByUserId(_, p4, p5)
	-- upvalues: runService (ref), chatService (ref)
	if runService:IsStudio() then
		return true
	elseif p4 == 0 or p5 == 0 then
		return true
	end
	local ok, status = pcall(function()
		-- upvalues: chatService (copy), p4 (ref), p5 (ref)
		return chatService:CanUsersChatAsync(p4, p5)
	end)
	
	return ok and status
end

function t_1.CanCommunicate(p4, p5, p6)
	local player = p5:GetPlayer()
	local player_1 = p6:GetPlayer()
	
	return if player and player_1 then p4:CanCommunicateByUserId(player.UserId, player_1.UserId) else true
end

function t_1.SendMessageToSpeaker(p4, p5, p6, p7, p8)
	-- upvalues: runService (ref)
	local var3 = p4.Speakers[p6]
	local var4 = p4.ChatService:GetSpeaker(p7)
	
	if var3 and var4 then
		if var3:IsSpeakerMuted(p7) then return end
		if not p4:CanCommunicate(var3, var4) then return end
		local var5 = p4:InternalCreateMessageObject(p5, p7, p6 == p7, p8)
		p5 = p4:SendMessageObjToFilters(p5, var5, p7)
		var3:InternalSendMessage(var5, p4.Name)
		local fromSpeaker, fromSpeaker_1, fromSpeaker_2 = p4.ChatService:InternalApplyRobloxFilterNewAPI(var5.FromSpeaker, p5, if p4.Private then Enum.TextFilterContext.PrivateChat else Enum.TextFilterContext.PublicChat)
		
		if fromSpeaker then
			var5.FilterResult = fromSpeaker_2
			var5.IsFilterResult = fromSpeaker_1
			var5.IsFiltered = true
			var3:InternalSendFilteredMessageWithFilterResult(var5, p4.Name)
			
			return
		end
	elseif runService:IsStudio() then
		warn(string.format("Speaker '%s' is not in channel '%s' and cannot be sent a message", p6, p4.Name))
	end
end

function t_1.KickSpeaker(p4, p5, p6)
	local var3 = p4.ChatService:GetSpeaker(p5)
	
	if not var3 then
		error("Speaker \"" .. p23 .. "\" does not exist!")
	end
	local formattedText, formattedText_1
	local _ = ""
	local _ = ""
	local nameForDisplay = var3:GetNameForDisplay()
	
	if p6 then
		formattedText = string.format("You were kicked from '%s' for the following reason(s): %s", p4.Name, p6)
		formattedText_1 = string.format("%s was kicked for the following reason(s): %s", nameForDisplay, p6)
	else
		formattedText = string.format("You were kicked from '%s'", p4.Name)
		formattedText_1 = string.format("%s was kicked", nameForDisplay)
	end
	p4:SendSystemMessageToSpeaker(formattedText, p5)
	var3:LeaveChannel(p4.Name)
	p4:SendSystemMessage(formattedText_1)
end

function t_1.MuteSpeaker(p4, p5, p6, p7)
	local var3 = p4.ChatService:GetSpeaker(p5)
	
	if not var3 then
		error("Speaker \"" .. p26 .. "\" does not exist!")
	end
	p4.Mutes[p5:lower()] = if p7 == 0 or p7 == nil then 0 else os.time() + p7
	
	if p6 then
		p4:SendSystemMessage(string.format("%s was muted for the following reason(s): %s", var3:GetNameForDisplay(), p6))
	end
	local ok, status = pcall(function()
		-- upvalues: p4 (ref), p5 (ref), p6 (ref), p7 (ref)
		p4.eSpeakerMuted:Fire(p5, p6, p7)
	end)
	
	if not ok and status then
		print("Error mutting speaker: " .. status)
	end
	local var4 = p4.ChatService:GetSpeaker(p5)
	
	if var4 then
		local ok_1, status_1 = pcall(function()
			-- upvalues: var4 (ref), p4 (ref), p6 (ref), p7 (ref)
			var4.eMuted:Fire(p4.Name, p6, p7)
		end)
		
		if not ok_1 and status_1 then
			print("Error mutting speaker: " .. status_1)
		end
	end
end

function t_1.UnmuteSpeaker(p4, p5)
	if not p4.ChatService:GetSpeaker(p5) then
		error("Speaker \"" .. p30 .. "\" does not exist!")
	end
	p4.Mutes[p5:lower()] = nil
	local ok, status = pcall(function()
		-- upvalues: p4 (ref), p5 (ref)
		p4.eSpeakerUnmuted:Fire(p5)
	end)
	
	if not ok and status then
		print("Error unmuting speaker: " .. status)
	end
	local var3 = p4.ChatService:GetSpeaker(p5)
	
	if var3 then
		local ok_1, status_1 = pcall(function()
			-- upvalues: var3 (ref), p4 (ref)
			var3.eUnmuted:Fire(p4.Name)
		end)
		
		if not ok_1 and status_1 then
			print("Error unmuting speaker: " .. status_1)
		end
	end
end

function t_1.IsSpeakerMuted(p4, p5)
	return p4.Mutes[p5:lower()] ~= nil
end

function t_1.GetSpeakerList(p4)
	local t = {}
	
	for i, v in pairs(p4.Speakers) do
		table.insert(t, v.Name)
	end
	return t
end

function t_1.RegisterFilterMessageFunction(p5, p6, p7, p8)
	if p5.FilterMessageFunctions:HasFunction(p6) then
		error(string.format("FilterMessageFunction '%s' already exists", p6))
	end
	p5.FilterMessageFunctions:AddFunction(p6, p7, p8)
end

function t_1.FilterMessageFunctionExists(p5, p6)
	return p5.FilterMessageFunctions:HasFunction(p6)
end

function t_1.UnregisterFilterMessageFunction(p5, p6)
	if not p5.FilterMessageFunctions:HasFunction(p6) then
		error(string.format("FilterMessageFunction '%s' does not exists", p6))
	end
	p5.FilterMessageFunctions:RemoveFunction(p6)
end

function t_1.RegisterProcessCommandsFunction(p5, p6, p7, p8)
	if p5.ProcessCommandsFunctions:HasFunction(p6) then
		error(string.format("ProcessCommandsFunction '%s' already exists", p6))
	end
	p5.ProcessCommandsFunctions:AddFunction(p6, p7, p8)
end

function t_1.ProcessCommandsFunctionExists(p5, p6)
	return p5.ProcessCommandsFunctions:HasFunction(p6)
end

function t_1.UnregisterProcessCommandsFunction(p5, p6)
	if not p5.ProcessCommandsFunctions:HasFunction(p6) then
		error(string.format("ProcessCommandsFunction '%s' does not exist", p6))
	end
	p5.ProcessCommandsFunctions:RemoveFunction(p6)
end

local function _(p5)
	local t = {}
	
	for i, v in pairs(p5) do
		t[i] = v
	end
	return t
end

function t_1.GetHistoryLog(p6)
	local t = {}
	
	for i, v in pairs(p6.ChatHistory) do
		t[i] = v
	end
	return t
end

function t_1.GetHistoryLogForSpeaker(p7, p8)
	-- upvalues: chatConstantsModule (ref)
	local var3 = -1
	local player = p8:GetPlayer()
	
	if player then
		var3 = player.UserId
	end
	local t = {}
	
	for i = 1, #p7.ChatHistory do
		if not p7:CanCommunicateByUserId(var3, p7.ChatHistory[i].SpeakerUserId) then
			continue
		end
		local t_1 = {}
		
		for i, v in pairs(p7.ChatHistory[i]) do
			t_1[i] = v
		end
		local var4 = t_1
		
		if var4.MessageType == chatConstantsModule.MessageTypeDefault or var4.MessageType == chatConstantsModule.MessageTypeMeCommand then
			local filterResult = var4.FilterResult
			
			if not var4.IsFilterResult then
				var4.Message = filterResult
			elseif player then
				var4.Message = filterResult:GetChatForUserAsync(player.UserId)
			else
				var4.Message = filterResult:GetNonChatStringForBroadcastAsync()
			end
		end
		table.insert(t, var4)
	end
	return t
end

function t_1.InternalDestroy(p9)
	for i, v in pairs(p9.Speakers) do
		v:LeaveChannel(p9.Name)
	end
	p9.eDestroyed:Fire()
	p9.eDestroyed:Destroy()
	p9.eMessagePosted:Destroy()
	p9.eSpeakerJoined:Destroy()
	p9.eSpeakerLeft:Destroy()
	p9.eSpeakerMuted:Destroy()
	p9.eSpeakerUnmuted:Destroy()
end

function t_1.InternalDoMessageFilter(p10, p11, p12, p13)
	for i, v, var37 in p10.FilterMessageFunctions:GetIterator() do
		local ok, status = pcall(function()
			-- upvalues: v (ref), p11 (ref), p12 (ref), p13 (ref)
			v(p11, p12, p13)
		end)
		
		if not ok then
			warn(string.format("DoMessageFilter Function '%s' failed for reason: %s", i, status))
		end
	end
end

function t_1.InternalDoProcessCommands(p14, p15, p16, p17)
	for i, v, var38 in p14.ProcessCommandsFunctions:GetIterator() do
		local ok, status = pcall(function()
			-- upvalues: v (ref), p15 (ref), p16 (ref), p17 (ref)
			local var5 = v(p15, p16, p17)
			
			if type(var5) ~= "boolean" then
				error("Process command functions must return a bool")
			end
			return var5
		end)
		
		if ok then
			if status then
				return true
			end
		else
			warn(string.format("DoProcessCommands Function '%s' failed for reason: %s", i, status))
		end
	end
	return false
end

function getLanguageCodeFromLocale(p18)
	local var5 = string.gmatch(p18, "[^-]+")()
	
	return var5 or "en"
end

function t_1.InternalPostMessage(p18, p19, p20, p21)
	-- upvalues: var1 (write), chatService (ref), status_1 (write), status_3_1 (write), status_2_1 (write)
	local var5
	if p18:InternalDoProcessCommands(p19.Name, p20, p18.Name) then
		return false
	elseif p18.Mutes[p19.Name:lower()] ~= nil then
		var5 = p18.Mutes[p19.Name:lower()]
		
		if var5 > 0 and var5 < os.time() then
			p18:UnmuteSpeaker(p19.Name)
		else
			p18:SendSystemMessageToSpeaker(var1:FormatMessageToSend("GameChat_ChatChannel_MutedInChannel", "You are muted and cannot talk in this channel"), p19.Name)
			
			return false
		end
	end
	var5 = p18:InternalCreateMessageObject(p20, p19.Name, false, p21)
	var5.Message = p20
	local var6 = nil
	pcall(function()
		-- upvalues: var6 (write), chatService (copy), var5 (write)
		var6 = chatService:InvokeChatCallback(Enum.ChatCallbackType.OnServerReceivingMessage, var5)
	end)
	var5.Message = nil
	local v
	local var7 = p18:SendMessageObjToFilters(p20, var5, p19)
	local t = {}
	
	for i, v in pairs(p18.Speakers) do
		if not v:IsSpeakerMuted(p19.Name) and p18:CanCommunicate(p19, v) then
			table.insert(t, v.Name)
			
			if v.Name ~= p19.Name then
				v:InternalSendMessage(var5, p18.Name)
				continue
			end
			local t_1 = {}
			
			for i_1, v_1 in pairs(var5) do
				t_1[i_1] = v_1
			end
			local var8 = t_1
			
			if status_1 then
				var8.Message = string.rep("_", var5.MessageLengthUtf8 or var5.MessageLength)
			else
				var8.Message = var7
			end
			var8.IsFiltered = true
			v:InternalSendMessage(var8, p18.Name)
		end
	end
	local ok, status = pcall(function()
		-- upvalues: p18 (ref), var5 (write)
		p18.eMessagePosted:Fire(var5)
	end)
	
	if not ok and status then
		print("Error posting message: " .. status)
	end
	local var9 = if p18.Private then Enum.TextFilterContext.PrivateChat else Enum.TextFilterContext.PublicChat
	local var10 = nil
	
	if status_3_1 then
		v = {}
		local t_1 = {}
		
		for i_1, v_1 in pairs(p18.Speakers) do
			local player = v_1:GetPlayer()
			
			if player ~= nil and player.LocaleId ~= nil then
				t_1[getLanguageCodeFromLocale(player.LocaleId)] = true
			end
		end
		for i_2, v_2 in t_1 do
			table.insert(v, i_2)
		end
		local fromSpeaker, fromSpeaker_1, fromSpeaker_2 = p18.ChatService:InternalApplyRobloxFilterAndTranslate(var5.FromSpeaker, v, var7, var9)
		
		if fromSpeaker then
			if fromSpeaker_1 then
				var5.FilterResult = fromSpeaker_2.SourceText
			else
				var5.FilterResult = fromSpeaker_2
			end
			var5.IsFilterResult = fromSpeaker_1
			
			if fromSpeaker_1 then
				var10 = fromSpeaker_2
			end
		elseif not status_2_1 then
			return false
		end
		var5.IsFilterResult = false
		var5.FilterResult = ""
		var5.MessageLength = 0
	else
		v, fromSpeaker, fromSpeaker_1 = p18.ChatService:InternalApplyRobloxFilterNewAPI(var5.FromSpeaker, var7, var9)
		
		if v then
			var5.FilterResult = fromSpeaker_1
			var5.IsFilterResult = fromSpeaker
		elseif status_2_1 then
			var5.IsFilterResult = false
			var5.FilterResult = ""
			var5.MessageLength = 0
		else
			return false
		end
	end
	local v_2
	var5.IsFiltered = true
	p18:InternalAddMessageToHistoryLog(var5)
	
	for i_1, v_1 in pairs(t) do
		v_2 = p18.Speakers[v_1]
		
		if v_2 then
			if status_3_1 and (var10 and (p19:GetPlayer() ~= nil and (v_2:GetPlayer() ~= nil and p19:GetPlayer().LocaleId ~= v_2:GetPlayer().LocaleId))) then
				v_2:InternalSendFilteredMessageWithTranslatedFilterResult(var5, p18.Name, var10)
			else
				v_2:InternalSendFilteredMessageWithFilterResult(var5, p18.Name)
			end
		end
	end
	local var11
	v = {}
	
	for i_2, v_2 in pairs(p18.Speakers) do
		if not v_2:IsSpeakerMuted(p19.Name) and p18:CanCommunicate(p19, v_2) then
			var11 = false
			
			for i_3, v_4 in pairs(t) do
				if v_2.Name == v_4 then
					var11 = true
					break
				end
			end
			if not var11 then
				table.insert(v, v_2.Name)
			end
		end
	end
	for i_3, v_2 in pairs(v) do
		local var12 = p18.Speakers[v_2]
		
		if var12 then
			var12:InternalSendFilteredMessageWithFilterResult(var5, p18.Name)
		end
	end
	return var5
end

function t_1.InternalAddSpeaker(p22, p23)
	if p22.Speakers[p23.Name] then
		warn("Speaker \"" .. p69.name .. "\" is already in the channel!")
		
		return
	end
	p22.Speakers[p23.Name] = p23
	local ok, status = pcall(function()
		-- upvalues: p22 (ref), p23 (ref)
		p22.eSpeakerJoined:Fire(p23.Name)
	end)
	
	if not ok and status then
		print("Error removing channel: " .. status)
	end
end

function t_1.InternalRemoveSpeaker(p22, p23)
	if not p22.Speakers[p23.Name] then
		warn("Speaker \"" .. p71.name .. "\" is not in the channel!")
		
		return
	end
	p22.Speakers[p23.Name] = nil
	local ok, status = pcall(function()
		-- upvalues: p22 (ref), p23 (ref)
		p22.eSpeakerLeft:Fire(p23.Name)
	end)
	
	if not ok and status then
		print("Error removing speaker: " .. status)
	end
end

function t_1.InternalRemoveExcessMessagesFromLog(p22)
	local remove = table.remove
	while p22.MaxHistory < #p22.ChatHistory do
		remove(p22.ChatHistory, 1)
	end
end

function t_1.InternalAddMessageToHistoryLog(p23, p24)
	table.insert(p23.ChatHistory, p24)
	p23:InternalRemoveExcessMessagesFromLog()
end

function t_1.GetMessageType(_, _, p23)
	-- upvalues: chatConstantsModule (ref)
	return if p23 == nil then chatConstantsModule.MessageTypeSystem else chatConstantsModule.MessageTypeDefault
end

function t_1.InternalCreateMessageObject(p23, p24, p25, p26, p27)
	-- upvalues: chatSettingsModule (ref)
	local var13 = p23:GetMessageType(p24, p25)
	local var14 = -1
	local nameForDisplay = nil
	local var15 = nil
	
	if p25 then
		var15 = p23.ChatService:GetSpeaker(p25)
		
		if var15 then
			local player = var15:GetPlayer()
			
			if player then
				var14 = player.UserId
				
				if chatSettingsModule.PlayerDisplayNamesEnabled then
					nameForDisplay = var15:GetNameForDisplay()
				end
			else
				var14 = 0
			end
		end
	end
	local t = {
		ID = p23.ChatService:InternalGetUniqueMessageId(),
		FromSpeaker = p25,
		SpeakerDisplayName = nameForDisplay,
		SpeakerUserId = var14,
		OriginalChannel = p23.Name,
		MessageLength = string.len(p24),
		MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(p24)),
		MessageType = var13,
		IsFiltered = p26,
		Message = if p26 then p24 else nil,
		Time = os.time(),
		ExtraData = {}
	}
	
	if var15 then
		for i, v in pairs(var15.ExtraData) do
			t.ExtraData[i] = v
		end
	end
	if p27 then
		for i, v in pairs(p27) do
			t.ExtraData[i] = v
		end
	end
	return t
end

function t_1.SetChannelNameColor(value, p28)
	value.ChannelNameColor = p28
	
	for i, v in pairs(value.Speakers) do
		v:UpdateChannelNameColor(value.Name, p28)
	end
end

function t_1.GetWelcomeMessageForSpeaker(p29, p30)
	if p29.GetWelcomeMessageFunction then
		local welcomeMessageFunction = p29.GetWelcomeMessageFunction(p30)
		
		return welcomeMessageFunction or p29.WelcomeMessage
	end
end

function t_1.RegisterGetWelcomeMessageFunction(p29, p30)
	if type(p30) ~= "function" then
		error("RegisterGetWelcomeMessageFunction must be called with a function.")
	end
	p29.GetWelcomeMessageFunction = p30
end

function t_1.UnRegisterGetWelcomeMessageFunction(p29)
	p29.GetWelcomeMessageFunction = nil
end

function t.new(p29, p30, p31, p32)
	-- upvalues: t_1 (ref), utilModule (ref)
	local tbl = setmetatable({}, t_1)
	tbl.ChatService = p29
	tbl.Name = p30
	tbl.WelcomeMessage = p31 or ""
	tbl.GetWelcomeMessageFunction = nil
	tbl.ChannelNameColor = p32
	tbl.Joinable = true
	tbl.Leavable = true
	tbl.AutoJoin = false
	tbl.Private = false
	tbl.Speakers = {}
	tbl.Mutes = {}
	tbl.MaxHistory = 200
	tbl.HistoryIndex = 0
	tbl.ChatHistory = {}
	tbl.FilterMessageFunctions = utilModule:NewSortedFunctionContainer()
	tbl.ProcessCommandsFunctions = utilModule:NewSortedFunctionContainer()
	tbl.eDestroyed = Instance.new("BindableEvent")
	tbl.eMessagePosted = Instance.new("BindableEvent")
	tbl.eSpeakerJoined = Instance.new("BindableEvent")
	tbl.eSpeakerLeft = Instance.new("BindableEvent")
	tbl.eSpeakerMuted = Instance.new("BindableEvent")
	tbl.eSpeakerUnmuted = Instance.new("BindableEvent")
	tbl.MessagePosted = tbl.eMessagePosted.Event
	tbl.SpeakerJoined = tbl.eSpeakerJoined.Event
	tbl.SpeakerLeft = tbl.eSpeakerLeft.Event
	tbl.SpeakerMuted = tbl.eSpeakerMuted.Event
	tbl.SpeakerUnmuted = tbl.eSpeakerUnmuted.Event
	tbl.Destroyed = tbl.eDestroyed.Event
	
	return tbl
end

return t