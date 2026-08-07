local t = {}
local runService = game:GetService("RunService")
local chatSettingsModule = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"))
local _ = script.Parent
local _ = nil
local ok, status = pcall(function() --[[ line: 16 ]]
	return UserSettings():IsUserFeatureEnabled("UserRemoveMessageOnTextFilterFailures")
end)
local status_1 = ok and status
local _ = false
local ok_1, status_2 = pcall(function() --[[ line: 24 ]]
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2")
end)
local _ = ok_1 and status_2

local function _(p0) --[[ line: 32 | named "ShallowCopy" ]]
	local t = {}
	
	for i, v in pairs(p0) do
		t[i] = v
	end
	return t
end

local t_1 = {}
local t_2 = {
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
local t_3 = {
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

function t_1:__index(p1) --[[ line: 76 ]]
	-- upvalues: t_1 (ref), t_2 (ref), t_3 (ref)
	local var8 = rawget(t_1, p1)
	
	if var8 then
		return var8
	elseif t_2[p1] and not rawget(self, p1) then
		rawset(self, p1, Instance.new("BindableEvent"))
	end
	local var9 = t_3[p1]
	
	if var9 and not rawget(self, p1) then
		local var10 = rawget(self, var9)
		
		if not var10 then
			var10 = Instance.new("BindableEvent")
			rawset(self, var9, var10)
		end
		rawset(self, p1, var10.Event)
	end
	return rawget(self, p1)
end

function t_1.LazyFire(p2, p3, ...) --[[ line: 95 ]]
	local var11 = rawget(p2, p3)
	
	if var11 then
		var11:Fire(...)
	end
end

function t_1.SayMessage(p4, p5, p6, p7) --[[ line: 102 ]]
	if p4.ChatService:InternalDoProcessCommands(p4.Name, p5, p6) then return end
	if not p6 then return end
	local var12 = p4.Channels[p6:lower()]
	
	if not var12 then return end
	local var13 = var12:InternalPostMessage(p4, p5, p7)
	
	if var13 then
		pcall(function() --[[ line: 117 ]]
			-- upvalues: p4 (ref), var13 (ref), p6 (ref)
			p4:LazyFire("eSaidMessage", var13, p6)
		end)
	end
	return var13
end

function t_1.JoinChannel(p8, p9) --[[ line: 125 ]]
	if p8.Channels[p9:lower()] then
		warn("Speaker is already in channel \"" .. p9 .. "\"")
		
		return
	end
	local var14 = p8.ChatService:GetChannel(p9)
	
	if not var14 then
		error("Channel \"" .. p9 .. "\" does not exist!")
	end
	p8.Channels[p9:lower()] = var14
	var14:InternalAddSpeaker(p8)
	local ok, status = pcall(function() --[[ line: 138 ]]
		-- upvalues: p8 (ref), var14 (ref)
		p8.eChannelJoined:Fire(var14.Name, var14:GetWelcomeMessageForSpeaker(p8))
	end)
	
	if not ok and status then
		print("Error joining channel: " .. status)
	end
end

function t_1.LeaveChannel(p10, p11) --[[ line: 146 ]]
	if not p10.Channels[p11:lower()] then
		warn("Speaker is not in channel \"" .. p11 .. "\"")
		
		return
	end
	local var15 = p10.Channels[p11:lower()]
	p10.Channels[p11:lower()] = nil
	var15:InternalRemoveSpeaker(p10)
	local ok, status = pcall(function() --[[ line: 156 ]]
		-- upvalues: p10 (ref), var15 (ref)
		p10:LazyFire("eChannelLeft", var15.Name)
		
		if p10.PlayerObj then
			p10.EventFolder.OnChannelLeft:FireClient(p10.PlayerObj, var15.Name)
		end
	end)
	
	if not ok and status then
		print("Error leaving channel: " .. status)
	end
end

function t_1.IsInChannel(p12, p13) --[[ line: 167 ]]
	return p12.Channels[p13:lower()] ~= nil
end

function t_1.GetChannelList(p14) --[[ line: 171 ]]
	local t = {}
	
	for i, v in pairs(p14.Channels) do
		table.insert(t, v.Name)
	end
	return t
end

function t_1.SendMessage(p15, p16, p17, p18, p19) --[[ line: 179 ]]
	-- upvalues: runService (ref)
	local var17 = p15.Channels[p17:lower()]
	
	if var17 then
		var17:SendMessageToSpeaker(p16, p15.Name, p18, p19)
		
		return
	elseif runService:IsStudio() then
		warn(string.format("Speaker '%s' is not in channel '%s' and cannot receive a message in it.", p15.Name, p17))
	end
end

function t_1.SendSystemMessage(p20, p21, p22, p23) --[[ line: 190 ]]
	-- upvalues: runService (ref)
	local var18 = p20.Channels[p22:lower()]
	
	if var18 then
		var18:SendSystemMessageToSpeaker(p21, p20.Name, p23)
		
		return
	elseif runService:IsStudio() then
		warn(string.format("Speaker '%s' is not in channel '%s' and cannot receive a system message in it.", p20.Name, p22))
	end
end

function t_1.GetPlayer(p24) --[[ line: 201 ]]
	return p24.PlayerObj
end

function t_1.GetNameForDisplay(p25) --[[ line: 205 ]]
	-- upvalues: chatSettingsModule (ref)
	if not chatSettingsModule.PlayerDisplayNamesEnabled then
		return p25.Name
	end
	local player = p25:GetPlayer()
	
	return if player then player.DisplayName else p25.Name
end

function t_1.SetExtraData(value, p26, p27) --[[ line: 219 ]]
	value.ExtraData[p26] = p27
	value:LazyFire("eExtraDataUpdated", p26, p27)
end

function t_1.GetExtraData(p28, p29) --[[ line: 224 ]]
	return p28.ExtraData[p29]
end

function t_1.SetMainChannel(value, p30) --[[ line: 228 ]]
	local ok, status = pcall(function() --[[ line: 229 ]]
		-- upvalues: value (ref), p30 (ref)
		value:LazyFire("eMainChannelSet", p30)
		
		if value.PlayerObj then
			value.EventFolder.OnMainChannelSet:FireClient(value.PlayerObj, p30)
		end
	end)
	
	if not ok and status then
		print("Error setting main channel: " .. status)
	end
end

function t_1.AddMutedSpeaker(p31, p32) --[[ line: 241 ]]
	p31.MutedSpeakers[p32:lower()] = true
end

function t_1.RemoveMutedSpeaker(p33, p34) --[[ line: 245 ]]
	p33.MutedSpeakers[p34:lower()] = false
end

function t_1.IsSpeakerMuted(p35, p36) --[[ line: 249 ]]
	return p35.MutedSpeakers[p36:lower()]
end

function t_1.InternalDestroy(p37) --[[ line: 255 ]]
	for i, v in pairs(p37.Channels) do
		v:InternalRemoveSpeaker(p37)
	end
	p37.eDestroyed:Fire()
	p37.EventFolder = nil
	p37.eDestroyed:Destroy()
	p37.eSaidMessage:Destroy()
	p37.eReceivedMessage:Destroy()
	p37.eReceivedUnfilteredMessage:Destroy()
	p37.eMessageDoneFiltering:Destroy()
	p37.eReceivedSystemMessage:Destroy()
	p37.eChannelJoined:Destroy()
	p37.eChannelLeft:Destroy()
	p37.eMuted:Destroy()
	p37.eUnmuted:Destroy()
	p37.eExtraDataUpdated:Destroy()
	p37.eMainChannelSet:Destroy()
	p37.eChannelNameColorUpdated:Destroy()
end

function t_1.InternalAssignPlayerObject(value, p38) --[[ line: 278 ]]
	value.PlayerObj = p38
end

function t_1.InternalAssignEventFolder(value, p39) --[[ line: 282 ]]
	value.EventFolder = p39
end

function t_1.InternalSendMessage(p40, p41, p42) --[[ line: 286 ]]
	local ok, status = pcall(function() --[[ line: 287 ]]
		-- upvalues: p40 (ref), p41 (ref), p42 (ref)
		p40:LazyFire("eReceivedUnfilteredMessage", p41, p42)
		
		if p40.PlayerObj then
			p40.EventFolder.OnNewMessage:FireClient(p40.PlayerObj, p41, p42)
		end
	end)
	
	if not ok and status then
		print("Error sending internal message: " .. status)
	end
end

function t_1.InternalSendFilteredMessage(p43, p44, p45) --[[ line: 298 ]]
	local ok, status = pcall(function() --[[ line: 299 ]]
		-- upvalues: p43 (ref), p44 (ref), p45 (ref)
		p43:LazyFire("eReceivedMessage", p44, p45)
		p43:LazyFire("eMessageDoneFiltering", p44, p45)
		
		if p43.PlayerObj then
			p43.EventFolder.OnMessageDoneFiltering:FireClient(p43.PlayerObj, p44, p45)
		end
	end)
	
	if not ok and status then
		print("Error sending internal filtered message: " .. status)
	end
end

function t_1.InternalSendFilteredMessageWithTranslatedFilterResult(p46, p47, p48, p49) --[[ line: 314 ]]
	-- upvalues: status_1 (write)
	local t = {}
	
	for i, v in pairs(p47) do
		t[i] = v
	end
	t = t.FilterResult
	local player = p46:GetPlayer()
	local var22 = if player ~= nil then nil else p49:GetTranslationForLocale(player.LocaleId)
	local var23 = ""
	local var24 = nil
	pcall(function() --[[ line: 324 ]]
		-- upvalues: t (ref), player (ref), var23 (write), t (ref), var22 (ref), var24 (write)
		if not t.IsFilterResult then
			var23 = t
		elseif player then
			var23 = t:GetChatForUserAsync(player.UserId)
			
			if var22 then
				var24 = var22:GetChatForUserAsync(player.UserId)
				
				return
			end
		else
			var23 = t:GetNonChatStringForBroadcastAsync()
			
			if var22 then
				var24 = var22:GetNonChatStringForBroadcastAsync()
				
				return
			end
		end
	end)
	
	if status_1 then
		t.Message = var23
		t.FilterResult = nil
		p46:InternalSendFilteredMessage(t, p48)
	elseif #var23 > 0 then
		t.Message = var23
		t.FilterResult = nil
		p46:InternalSendFilteredMessage(t, p48)
	end
end

function t_1.InternalSendFilteredMessageWithFilterResult(p50, p51, p52) --[[ line: 360 ]]
	-- upvalues: status_1 (write)
	local t = {}
	
	for i, v in pairs(p51) do
		t[i] = v
	end
	t = t.FilterResult
	local player = p50:GetPlayer()
	local var27 = ""
	pcall(function() --[[ line: 367 ]]
		-- upvalues: t (ref), player (ref), var27 (write), t (ref)
		if not t.IsFilterResult then
			var27 = t
			
			return
		elseif player then
			var27 = t:GetChatForUserAsync(player.UserId)
			
			return
		end
		var27 = t:GetNonChatStringForBroadcastAsync()
	end)
	
	if status_1 then
		t.Message = var27
		t.FilterResult = nil
		p50:InternalSendFilteredMessage(t, p52)
	elseif #var27 > 0 then
		t.Message = var27
		t.FilterResult = nil
		p50:InternalSendFilteredMessage(t, p52)
	end
end

function t_1.InternalSendSystemMessage(p53, p54, p55) --[[ line: 396 ]]
	local ok, status = pcall(function() --[[ line: 397 ]]
		-- upvalues: p53 (ref), p54 (ref), p55 (ref)
		p53:LazyFire("eReceivedSystemMessage", p54, p55)
		
		if p53.PlayerObj then
			p53.EventFolder.OnNewSystemMessage:FireClient(p53.PlayerObj, p54, p55)
		end
	end)
	
	if not ok and status then
		print("Error sending internal system message: " .. status)
	end
end

function t_1.UpdateChannelNameColor(p56, p57, p58) --[[ line: 408 ]]
	p56:LazyFire("eChannelNameColorUpdated", p57, p58)
	
	if p56.PlayerObj then
		p56.EventFolder.ChannelNameColorUpdated:FireClient(p56.PlayerObj, p57, p58)
	end
end

function t.new(p59, p60) --[[ line: 418 ]]
	-- upvalues: t_1 (ref)
	local tbl = setmetatable({}, t_1)
	tbl.ChatService = p59
	tbl.PlayerObj = nil
	tbl.Name = p60
	tbl.ExtraData = {}
	tbl.Channels = {}
	tbl.MutedSpeakers = {}
	tbl.EventFolder = nil
	
	return tbl
end

return t