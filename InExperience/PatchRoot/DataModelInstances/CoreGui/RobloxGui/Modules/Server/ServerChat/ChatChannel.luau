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
local var10 = nil
pcall(function()
	-- upvalues: var10 (write)
	var10 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)
var10 = var10 or {}

if not var10.FormatMessageToSend or not var10.LocalizeFormattedMessage then
	function var10.FormatMessageToSend(_, _, p0)
		return p0
	end
end
local t_1 = {}
t_1.__index = t_1

function t_1.SendSystemMessage(p1, p2, p3)
	local var12 = p1:InternalCreateMessageObject(p2, nil, true, p3)
	local ok, status = pcall(function()
		-- upvalues: p1 (ref), var12 (ref)
		p1.eMessagePosted:Fire(var12)
	end)
	
	if not ok and status then
		print("Error posting message: " .. status)
	end
	p1:InternalAddMessageToHistoryLog(var12)
	
	for i, v in pairs(p1.Speakers) do
		v:InternalSendSystemMessage(var12, p1.Name)
	end
	return var12
end

function t_1.SendSystemMessageToSpeaker(p4, p5, p6, p7)
	-- upvalues: runService (ref)
	local var13 = p4.Speakers[p6]
	
	if var13 then
		var13:InternalSendSystemMessage(p4:InternalCreateMessageObject(p5, nil, true, p7), p4.Name)
		
		return
	elseif runService:IsStudio() then
		warn(string.format("Speaker '%s' is not in channel '%s' and cannot be sent a system message", p6, p4.Name))
	end
end

function t_1.SendMessageObjToFilters(p8, p9, p10, p11)
	local message = p10.Message
	p10.Message = p9
	p8:InternalDoMessageFilter(p11.Name, p10, p8.Name)
	p8.ChatService:InternalDoMessageFilter(p11.Name, p10, p8.Name)
	local message_1 = p10.Message
	p10.Message = message
	
	return message_1
end

function t_1.CanCommunicateByUserId(_, p12, p13)
	-- upvalues: runService (ref), chatService (ref)
	if runService:IsStudio() then
		return true
	elseif p12 == 0 or p13 == 0 then
		return true
	end
	local ok, status = pcall(function()
		-- upvalues: chatService (copy), p12 (ref), p13 (ref)
		return chatService:CanUsersChatAsync(p12, p13)
	end)
	
	return ok and status
end

function t_1.CanCommunicate(p14, p15, p16)
	local player = p15:GetPlayer()
	local player_1 = p16:GetPlayer()
	
	return if player and player_1 then p14:CanCommunicateByUserId(player.UserId, player_1.UserId) else true
end

function t_1.SendMessageToSpeaker(p17, p18, p19, p20, p21)
	-- upvalues: runService (ref)
	local var16 = p17.Speakers[p19]
	local var17 = p17.ChatService:GetSpeaker(p20)
	
	if var16 and var17 then
		if var16:IsSpeakerMuted(p20) then return end
		if not p17:CanCommunicate(var16, var17) then return end
		local var18 = p17:InternalCreateMessageObject(p18, p20, p19 == p20, p21)
		p18 = p17:SendMessageObjToFilters(p18, var18, p20)
		var16:InternalSendMessage(var18, p17.Name)
		local fromSpeaker, fromSpeaker_1, fromSpeaker_2 = p17.ChatService:InternalApplyRobloxFilterNewAPI(var18.FromSpeaker, p18, if p17.Private then Enum.TextFilterContext.PrivateChat else Enum.TextFilterContext.PublicChat)
		
		if fromSpeaker then
			var18.FilterResult = fromSpeaker_2
			var18.IsFilterResult = fromSpeaker_1
			var18.IsFiltered = true
			var16:InternalSendFilteredMessageWithFilterResult(var18, p17.Name)
			
			return
		end
	elseif runService:IsStudio() then
		warn(string.format("Speaker '%s' is not in channel '%s' and cannot be sent a message", p19, p17.Name))
	end
end

function t_1.KickSpeaker(p22, p23, p24)
	local var22 = p22.ChatService:GetSpeaker(p23)
	
	if not var22 then
		error("Speaker \"" .. p23 .. "\" does not exist!")
	end
	local formattedText, formattedText_1
	local _ = ""
	local _ = ""
	local nameForDisplay = var22:GetNameForDisplay()
	
	if p24 then
		formattedText = string.format("You were kicked from '%s' for the following reason(s): %s", p22.Name, p24)
		formattedText_1 = string.format("%s was kicked for the following reason(s): %s", nameForDisplay, p24)
	else
		formattedText = string.format("You were kicked from '%s'", p22.Name)
		formattedText_1 = string.format("%s was kicked", nameForDisplay)
	end
	p22:SendSystemMessageToSpeaker(formattedText, p23)
	var22:LeaveChannel(p22.Name)
	p22:SendSystemMessage(formattedText_1)
end

function t_1.MuteSpeaker(p25, p26, p27, p28)
	local var26 = p25.ChatService:GetSpeaker(p26)
	
	if not var26 then
		error("Speaker \"" .. p26 .. "\" does not exist!")
	end
	p25.Mutes[p26:lower()] = if p28 == 0 or p28 == nil then 0 else os.time() + p28
	
	if p27 then
		p25:SendSystemMessage(string.format("%s was muted for the following reason(s): %s", var26:GetNameForDisplay(), p27))
	end
	local ok, status = pcall(function()
		-- upvalues: p25 (ref), p26 (ref), p27 (ref), p28 (ref)
		p25.eSpeakerMuted:Fire(p26, p27, p28)
	end)
	
	if not ok and status then
		print("Error mutting speaker: " .. status)
	end
	local var27 = p25.ChatService:GetSpeaker(p26)
	
	if var27 then
		local ok_1, status_1 = pcall(function()
			-- upvalues: var27 (ref), p25 (ref), p27 (ref), p28 (ref)
			var27.eMuted:Fire(p25.Name, p27, p28)
		end)
		
		if not ok_1 and status_1 then
			print("Error mutting speaker: " .. status_1)
		end
	end
end

function t_1.UnmuteSpeaker(p29, p30)
	if not p29.ChatService:GetSpeaker(p30) then
		error("Speaker \"" .. p30 .. "\" does not exist!")
	end
	p29.Mutes[p30:lower()] = nil
	local ok, status = pcall(function()
		-- upvalues: p29 (ref), p30 (ref)
		p29.eSpeakerUnmuted:Fire(p30)
	end)
	
	if not ok and status then
		print("Error unmuting speaker: " .. status)
	end
	local var28 = p29.ChatService:GetSpeaker(p30)
	
	if var28 then
		local ok_1, status_1 = pcall(function()
			-- upvalues: var28 (ref), p29 (ref)
			var28.eUnmuted:Fire(p29.Name)
		end)
		
		if not ok_1 and status_1 then
			print("Error unmuting speaker: " .. status_1)
		end
	end
end

function t_1.IsSpeakerMuted(p31, p32)
	return p31.Mutes[p32:lower()] ~= nil
end

function t_1.GetSpeakerList(p33)
	local t = {}
	
	for i, v in pairs(p33.Speakers) do
		table.insert(t, v.Name)
	end
	return t
end

function t_1.RegisterFilterMessageFunction(p34, p35, p36, p37)
	if p34.FilterMessageFunctions:HasFunction(p35) then
		error(string.format("FilterMessageFunction '%s' already exists", p35))
	end
	p34.FilterMessageFunctions:AddFunction(p35, p36, p37)
end

function t_1.FilterMessageFunctionExists(p38, p39)
	return p38.FilterMessageFunctions:HasFunction(p39)
end

function t_1.UnregisterFilterMessageFunction(p40, p41)
	if not p40.FilterMessageFunctions:HasFunction(p41) then
		error(string.format("FilterMessageFunction '%s' does not exists", p41))
	end
	p40.FilterMessageFunctions:RemoveFunction(p41)
end

function t_1.RegisterProcessCommandsFunction(p42, p43, p44, p45)
	if p42.ProcessCommandsFunctions:HasFunction(p43) then
		error(string.format("ProcessCommandsFunction '%s' already exists", p43))
	end
	p42.ProcessCommandsFunctions:AddFunction(p43, p44, p45)
end

function t_1.ProcessCommandsFunctionExists(p46, p47)
	return p46.ProcessCommandsFunctions:HasFunction(p47)
end

function t_1.UnregisterProcessCommandsFunction(p48, p49)
	if not p48.ProcessCommandsFunctions:HasFunction(p49) then
		error(string.format("ProcessCommandsFunction '%s' does not exist", p49))
	end
	p48.ProcessCommandsFunctions:RemoveFunction(p49)
end

local function _(p50)
	local t = {}
	
	for i, v in pairs(p50) do
		t[i] = v
	end
	return t
end

function t_1.GetHistoryLog(p51)
	local t = {}
	
	for i, v in pairs(p51.ChatHistory) do
		t[i] = v
	end
	return t
end

function t_1.GetHistoryLogForSpeaker(p52, p53)
	-- upvalues: chatConstantsModule (ref)
	local var32 = -1
	local player = p53:GetPlayer()
	
	if player then
		var32 = player.UserId
	end
	local t = {}
	
	for i = 1, #p52.ChatHistory do
		if not p52:CanCommunicateByUserId(var32, p52.ChatHistory[i].SpeakerUserId) then
			continue
		end
		local t_1 = {}
		
		for i, v in pairs(p52.ChatHistory[i]) do
			t_1[i] = v
		end
		local var36 = t_1
		
		if var36.MessageType == chatConstantsModule.MessageTypeDefault or var36.MessageType == chatConstantsModule.MessageTypeMeCommand then
			local filterResult = var36.FilterResult
			
			if not var36.IsFilterResult then
				var36.Message = filterResult
			elseif player then
				var36.Message = filterResult:GetChatForUserAsync(player.UserId)
			else
				var36.Message = filterResult:GetNonChatStringForBroadcastAsync()
			end
		end
		table.insert(t, var36)
	end
	return t
end

function t_1.InternalDestroy(p54)
	for i, v in pairs(p54.Speakers) do
		v:LeaveChannel(p54.Name)
	end
	p54.eDestroyed:Fire()
	p54.eDestroyed:Destroy()
	p54.eMessagePosted:Destroy()
	p54.eSpeakerJoined:Destroy()
	p54.eSpeakerLeft:Destroy()
	p54.eSpeakerMuted:Destroy()
	p54.eSpeakerUnmuted:Destroy()
end

function t_1.InternalDoMessageFilter(p55, p56, p57, p58)
	for i, v, var37 in p55.FilterMessageFunctions:GetIterator() do
		local ok, status = pcall(function()
			-- upvalues: v (ref), p56 (ref), p57 (ref), p58 (ref)
			v(p56, p57, p58)
		end)
		
		if not ok then
			warn(string.format("DoMessageFilter Function '%s' failed for reason: %s", i, status))
		end
	end
end

function t_1.InternalDoProcessCommands(p59, p60, p61, p62)
	for i, v, var38 in p59.ProcessCommandsFunctions:GetIterator() do
		local ok, status = pcall(function()
			-- upvalues: v (ref), p60 (ref), p61 (ref), p62 (ref)
			local var39 = v(p60, p61, p62)
			
			if type(var39) ~= "boolean" then
				error("Process command functions must return a bool")
			end
			return var39
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

function getLanguageCodeFromLocale(p63)
	local var40 = string.gmatch(p63, "[^-]+")()
	
	return var40 or "en"
end

function t_1.InternalPostMessage(p64, p65, p66, p67)
	-- upvalues: var10 (write), chatService (ref), status_1 (write), status_3_1 (write), status_2_1 (write)
	local var41
	if p64:InternalDoProcessCommands(p65.Name, p66, p64.Name) then
		return false
	elseif p64.Mutes[p65.Name:lower()] ~= nil then
		var41 = p64.Mutes[p65.Name:lower()]
		
		if var41 > 0 and var41 < os.time() then
			p64:UnmuteSpeaker(p65.Name)
		else
			p64:SendSystemMessageToSpeaker(var10:FormatMessageToSend("GameChat_ChatChannel_MutedInChannel", "You are muted and cannot talk in this channel"), p65.Name)
			
			return false
		end
	end
	var41 = p64:InternalCreateMessageObject(p66, p65.Name, false, p67)
	var41.Message = p66
	local var42 = nil
	pcall(function()
		-- upvalues: var42 (write), chatService (copy), var41 (write)
		var42 = chatService:InvokeChatCallback(Enum.ChatCallbackType.OnServerReceivingMessage, var41)
	end)
	var41.Message = nil
	local v
	local var43 = p64:SendMessageObjToFilters(p66, var41, p65)
	local t = {}
	
	for i, v in pairs(p64.Speakers) do
		if not v:IsSpeakerMuted(p65.Name) and p64:CanCommunicate(p65, v) then
			table.insert(t, v.Name)
			
			if v.Name ~= p65.Name then
				v:InternalSendMessage(var41, p64.Name)
				continue
			end
			local t_1 = {}
			
			for i_1, v_1 in pairs(var41) do
				t_1[i_1] = v_1
			end
			local var57 = t_1
			
			if status_1 then
				var57.Message = string.rep("_", var41.MessageLengthUtf8 or var41.MessageLength)
			else
				var57.Message = var43
			end
			var57.IsFiltered = true
			v:InternalSendMessage(var57, p64.Name)
		end
	end
	local ok, status = pcall(function()
		-- upvalues: p64 (ref), var41 (write)
		p64.eMessagePosted:Fire(var41)
	end)
	
	if not ok and status then
		print("Error posting message: " .. status)
	end
	local var45 = if p64.Private then Enum.TextFilterContext.PrivateChat else Enum.TextFilterContext.PublicChat
	local var46 = nil
	
	if status_3_1 then
		v = {}
		local t_1 = {}
		
		for i_1, v_1 in pairs(p64.Speakers) do
			local player = v_1:GetPlayer()
			
			if player ~= nil and player.LocaleId ~= nil then
				t_1[getLanguageCodeFromLocale(player.LocaleId)] = true
			end
		end
		for i_2, v_2 in t_1 do
			table.insert(v, i_2)
		end
		local fromSpeaker, fromSpeaker_1, fromSpeaker_2 = p64.ChatService:InternalApplyRobloxFilterAndTranslate(var41.FromSpeaker, v, var43, var45)
		
		if fromSpeaker then
			if fromSpeaker_1 then
				var41.FilterResult = fromSpeaker_2.SourceText
			else
				var41.FilterResult = fromSpeaker_2
			end
			var41.IsFilterResult = fromSpeaker_1
			
			if fromSpeaker_1 then
				var46 = fromSpeaker_2
			end
		elseif not status_2_1 then
			return false
		end
		var41.IsFilterResult = false
		var41.FilterResult = ""
		var41.MessageLength = 0
	else
		v, fromSpeaker, fromSpeaker_1 = p64.ChatService:InternalApplyRobloxFilterNewAPI(var41.FromSpeaker, var43, var45)
		
		if v then
			var41.FilterResult = fromSpeaker_1
			var41.IsFilterResult = fromSpeaker
		elseif status_2_1 then
			var41.IsFilterResult = false
			var41.FilterResult = ""
			var41.MessageLength = 0
		else
			return false
		end
	end
	local v_2
	var41.IsFiltered = true
	p64:InternalAddMessageToHistoryLog(var41)
	
	for i_1, v_1 in pairs(t) do
		v_2 = p64.Speakers[v_1]
		
		if v_2 then
			if status_3_1 and (var46 and (p65:GetPlayer() ~= nil and (v_2:GetPlayer() ~= nil and p65:GetPlayer().LocaleId ~= v_2:GetPlayer().LocaleId))) then
				v_2:InternalSendFilteredMessageWithTranslatedFilterResult(var41, p64.Name, var46)
			else
				v_2:InternalSendFilteredMessageWithFilterResult(var41, p64.Name)
			end
		end
	end
	local var55
	v = {}
	
	for i_2, v_2 in pairs(p64.Speakers) do
		if not v_2:IsSpeakerMuted(p65.Name) and p64:CanCommunicate(p65, v_2) then
			var55 = false
			
			for i_3, v_4 in pairs(t) do
				if v_2.Name == v_4 then
					var55 = true
					break
				end
			end
			if not var55 then
				table.insert(v, v_2.Name)
			end
		end
	end
	for i_3, v_2 in pairs(v) do
		local var54 = p64.Speakers[v_2]
		
		if var54 then
			var54:InternalSendFilteredMessageWithFilterResult(var41, p64.Name)
		end
	end
	return var41
end

function t_1.InternalAddSpeaker(p68, p69)
	if p68.Speakers[p69.Name] then
		warn("Speaker \"" .. p69.name .. "\" is already in the channel!")
		
		return
	end
	p68.Speakers[p69.Name] = p69
	local ok, status = pcall(function()
		-- upvalues: p68 (ref), p69 (ref)
		p68.eSpeakerJoined:Fire(p69.Name)
	end)
	
	if not ok and status then
		print("Error removing channel: " .. status)
	end
end

function t_1.InternalRemoveSpeaker(p70, p71)
	if not p70.Speakers[p71.Name] then
		warn("Speaker \"" .. p71.name .. "\" is not in the channel!")
		
		return
	end
	p70.Speakers[p71.Name] = nil
	local ok, status = pcall(function()
		-- upvalues: p70 (ref), p71 (ref)
		p70.eSpeakerLeft:Fire(p71.Name)
	end)
	
	if not ok and status then
		print("Error removing speaker: " .. status)
	end
end

function t_1.InternalRemoveExcessMessagesFromLog(p72)
	local remove = table.remove
	while p72.MaxHistory < #p72.ChatHistory do
		remove(p72.ChatHistory, 1)
	end
end

function t_1.InternalAddMessageToHistoryLog(p73, p74)
	table.insert(p73.ChatHistory, p74)
	p73:InternalRemoveExcessMessagesFromLog()
end

function t_1.GetMessageType(_, _, p75)
	-- upvalues: chatConstantsModule (ref)
	return if p75 == nil then chatConstantsModule.MessageTypeSystem else chatConstantsModule.MessageTypeDefault
end

function t_1.InternalCreateMessageObject(p76, p77, p78, p79, p80)
	-- upvalues: chatSettingsModule (ref)
	local var58 = p76:GetMessageType(p77, p78)
	local var59 = -1
	local nameForDisplay = nil
	local var61 = nil
	
	if p78 then
		var61 = p76.ChatService:GetSpeaker(p78)
		
		if var61 then
			local player = var61:GetPlayer()
			
			if player then
				var59 = player.UserId
				
				if chatSettingsModule.PlayerDisplayNamesEnabled then
					nameForDisplay = var61:GetNameForDisplay()
				end
			else
				var59 = 0
			end
		end
	end
	local t = {
		ID = p76.ChatService:InternalGetUniqueMessageId(),
		FromSpeaker = p78,
		SpeakerDisplayName = nameForDisplay,
		SpeakerUserId = var59,
		OriginalChannel = p76.Name,
		MessageLength = string.len(p77),
		MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(p77)),
		MessageType = var58,
		IsFiltered = p79,
		Message = if p79 then p77 else nil,
		Time = os.time(),
		ExtraData = {}
	}
	
	if var61 then
		for i, v in pairs(var61.ExtraData) do
			t.ExtraData[i] = v
		end
	end
	if p80 then
		for i, v in pairs(p80) do
			t.ExtraData[i] = v
		end
	end
	return t
end

function t_1.SetChannelNameColor(value, p81)
	value.ChannelNameColor = p81
	
	for i, v in pairs(value.Speakers) do
		v:UpdateChannelNameColor(value.Name, p81)
	end
end

function t_1.GetWelcomeMessageForSpeaker(p82, p83)
	if p82.GetWelcomeMessageFunction then
		local welcomeMessageFunction = p82.GetWelcomeMessageFunction(p83)
		
		return welcomeMessageFunction or p82.WelcomeMessage
	end
end

function t_1.RegisterGetWelcomeMessageFunction(p84, p85)
	if type(p85) ~= "function" then
		error("RegisterGetWelcomeMessageFunction must be called with a function.")
	end
	p84.GetWelcomeMessageFunction = p85
end

function t_1.UnRegisterGetWelcomeMessageFunction(p86)
	p86.GetWelcomeMessageFunction = nil
end

function t.new(p87, p88, p89, p90)
	-- upvalues: t_1 (ref), utilModule (ref)
	local tbl = setmetatable({}, t_1)
	tbl.ChatService = p87
	tbl.Name = p88
	tbl.WelcomeMessage = p89 or ""
	tbl.GetWelcomeMessageFunction = nil
	tbl.ChannelNameColor = p90
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