local t = {}
local runService = game:GetService("RunService")
local chatSettingsModule = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"))
local _ = script.Parent
local _ = nil
local ok, status = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserRemoveMessageOnTextFilterFailures")
end)
local status_1 = ok and status
local _ = false
local ok_1, status_2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2")
end)
local _ = ok_1 and status_2

local function _(p1)
	local t = {}
	
	for i, v in pairs(p1) do
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

function t_1:__index(p2)
	-- upvalues: t_1 (ref), t_2 (ref), t_3 (ref)
	local var1 = rawget(t_1, p2)
	
	if var1 then
		return var1
	elseif t_2[p2] and not rawget(self, p2) then
		rawset(self, p2, Instance.new("BindableEvent"))
	end
	local var2 = t_3[p2]
	
	if var2 and not rawget(self, p2) then
		local var3 = rawget(self, var2)
		
		if not var3 then
			var3 = Instance.new("BindableEvent")
			rawset(self, var2, var3)
		end
		rawset(self, p2, var3.Event)
	end
	return rawget(self, p2)
end

function t_1.LazyFire(p2, p3, ...)
	local var1 = rawget(p2, p3)
	
	if var1 then
		var1:Fire(...)
	end
end

function t_1.SayMessage(p2, p3, p4, p5)
	if p2.ChatService:InternalDoProcessCommands(p2.Name, p3, p4) then return end
	if not p4 then return end
	local var1 = p2.Channels[p4:lower()]
	
	if not var1 then return end
	local var2 = var1:InternalPostMessage(p2, p3, p5)
	
	if var2 then
		pcall(function()
			-- upvalues: p2 (ref), var2 (ref), p4 (ref)
			p2:LazyFire("eSaidMessage", var2, p4)
		end)
	end
	return var2
end

function t_1.JoinChannel(p2, p3)
	if p2.Channels[p3:lower()] then
		warn("Speaker is already in channel \"" .. p9 .. "\"")
		
		return
	end
	local var1 = p2.ChatService:GetChannel(p3)
	
	if not var1 then
		error("Channel \"" .. p9 .. "\" does not exist!")
	end
	p2.Channels[p3:lower()] = var1
	var1:InternalAddSpeaker(p2)
	local ok, status = pcall(function()
		-- upvalues: p2 (ref), var1 (ref)
		p2.eChannelJoined:Fire(var1.Name, var1:GetWelcomeMessageForSpeaker(p2))
	end)
	
	if not ok and status then
		print("Error joining channel: " .. status)
	end
end

function t_1.LeaveChannel(p2, p3)
	if not p2.Channels[p3:lower()] then
		warn("Speaker is not in channel \"" .. p11 .. "\"")
		
		return
	end
	local var1 = p2.Channels[p3:lower()]
	p2.Channels[p3:lower()] = nil
	var1:InternalRemoveSpeaker(p2)
	local ok, status = pcall(function()
		-- upvalues: p2 (ref), var1 (ref)
		p2:LazyFire("eChannelLeft", var1.Name)
		
		if p2.PlayerObj then
			p2.EventFolder.OnChannelLeft:FireClient(p2.PlayerObj, var1.Name)
		end
	end)
	
	if not ok and status then
		print("Error leaving channel: " .. status)
	end
end

function t_1.IsInChannel(p2, p3)
	return p2.Channels[p3:lower()] ~= nil
end

function t_1.GetChannelList(p2)
	local t = {}
	
	for i, v in pairs(p2.Channels) do
		table.insert(t, v.Name)
	end
	return t
end

function t_1.SendMessage(p3, p4, p5, p6, p7)
	-- upvalues: runService (ref)
	local var1 = p3.Channels[p5:lower()]
	
	if var1 then
		var1:SendMessageToSpeaker(p4, p3.Name, p6, p7)
		
		return
	elseif runService:IsStudio() then
		warn(string.format("Speaker '%s' is not in channel '%s' and cannot receive a message in it.", p3.Name, p5))
	end
end

function t_1.SendSystemMessage(p3, p4, p5, p6)
	-- upvalues: runService (ref)
	local var1 = p3.Channels[p5:lower()]
	
	if var1 then
		var1:SendSystemMessageToSpeaker(p4, p3.Name, p6)
		
		return
	elseif runService:IsStudio() then
		warn(string.format("Speaker '%s' is not in channel '%s' and cannot receive a system message in it.", p3.Name, p5))
	end
end

function t_1.GetPlayer(p3)
	return p3.PlayerObj
end

function t_1.GetNameForDisplay(p3)
	-- upvalues: chatSettingsModule (ref)
	if not chatSettingsModule.PlayerDisplayNamesEnabled then
		return p3.Name
	end
	local player = p3:GetPlayer()
	
	return if player then player.DisplayName else p3.Name
end

function t_1.SetExtraData(value, p3, p4)
	value.ExtraData[p3] = p4
	value:LazyFire("eExtraDataUpdated", p3, p4)
end

function t_1.GetExtraData(p3, p4)
	return p3.ExtraData[p4]
end

function t_1.SetMainChannel(value, p3)
	local ok, status = pcall(function()
		-- upvalues: value (ref), p3 (ref)
		value:LazyFire("eMainChannelSet", p3)
		
		if value.PlayerObj then
			value.EventFolder.OnMainChannelSet:FireClient(value.PlayerObj, p3)
		end
	end)
	
	if not ok and status then
		print("Error setting main channel: " .. status)
	end
end

function t_1.AddMutedSpeaker(p3, p4)
	p3.MutedSpeakers[p4:lower()] = true
end

function t_1.RemoveMutedSpeaker(p3, p4)
	p3.MutedSpeakers[p4:lower()] = false
end

function t_1.IsSpeakerMuted(p3, p4)
	return p3.MutedSpeakers[p4:lower()]
end

function t_1.InternalDestroy(p3)
	for i, v in pairs(p3.Channels) do
		v:InternalRemoveSpeaker(p3)
	end
	p3.eDestroyed:Fire()
	p3.EventFolder = nil
	p3.eDestroyed:Destroy()
	p3.eSaidMessage:Destroy()
	p3.eReceivedMessage:Destroy()
	p3.eReceivedUnfilteredMessage:Destroy()
	p3.eMessageDoneFiltering:Destroy()
	p3.eReceivedSystemMessage:Destroy()
	p3.eChannelJoined:Destroy()
	p3.eChannelLeft:Destroy()
	p3.eMuted:Destroy()
	p3.eUnmuted:Destroy()
	p3.eExtraDataUpdated:Destroy()
	p3.eMainChannelSet:Destroy()
	p3.eChannelNameColorUpdated:Destroy()
end

function t_1.InternalAssignPlayerObject(value, p4)
	value.PlayerObj = p4
end

function t_1.InternalAssignEventFolder(value, p4)
	value.EventFolder = p4
end

function t_1.InternalSendMessage(p4, p5, p6)
	local ok, status = pcall(function()
		-- upvalues: p4 (ref), p5 (ref), p6 (ref)
		p4:LazyFire("eReceivedUnfilteredMessage", p5, p6)
		
		if p4.PlayerObj then
			p4.EventFolder.OnNewMessage:FireClient(p4.PlayerObj, p5, p6)
		end
	end)
	
	if not ok and status then
		print("Error sending internal message: " .. status)
	end
end

function t_1.InternalSendFilteredMessage(p4, p5, p6)
	local ok, status = pcall(function()
		-- upvalues: p4 (ref), p5 (ref), p6 (ref)
		p4:LazyFire("eReceivedMessage", p5, p6)
		p4:LazyFire("eMessageDoneFiltering", p5, p6)
		
		if p4.PlayerObj then
			p4.EventFolder.OnMessageDoneFiltering:FireClient(p4.PlayerObj, p5, p6)
		end
	end)
	
	if not ok and status then
		print("Error sending internal filtered message: " .. status)
	end
end

function t_1.InternalSendFilteredMessageWithTranslatedFilterResult(p4, p5, p6, p7)
	-- upvalues: status_1 (write)
	local t = {}
	
	for i, v in pairs(p5) do
		t[i] = v
	end
	t = t.FilterResult
	local player = p4:GetPlayer()
	local var1 = if player ~= nil then nil else p7:GetTranslationForLocale(player.LocaleId)
	local var2 = ""
	local var3 = nil
	pcall(function()
		-- upvalues: t (ref), player (ref), var2 (write), t (ref), var1 (ref), var3 (write)
		if not t.IsFilterResult then
			var2 = t
		elseif player then
			var2 = t:GetChatForUserAsync(player.UserId)
			
			if var1 then
				var3 = var1:GetChatForUserAsync(player.UserId)
				
				return
			end
		else
			var2 = t:GetNonChatStringForBroadcastAsync()
			
			if var1 then
				var3 = var1:GetNonChatStringForBroadcastAsync()
				
				return
			end
		end
	end)
	
	if status_1 then
		t.Message = var2
		t.FilterResult = nil
		p4:InternalSendFilteredMessage(t, p6)
	elseif #var2 > 0 then
		t.Message = var2
		t.FilterResult = nil
		p4:InternalSendFilteredMessage(t, p6)
	end
end

function t_1.InternalSendFilteredMessageWithFilterResult(p8, p9, p10)
	-- upvalues: status_1 (write)
	local t = {}
	
	for i, v in pairs(p9) do
		t[i] = v
	end
	t = t.FilterResult
	local player = p8:GetPlayer()
	local var4 = ""
	pcall(function()
		-- upvalues: t (ref), player (ref), var4 (write), t (ref)
		if not t.IsFilterResult then
			var4 = t
			
			return
		elseif player then
			var4 = t:GetChatForUserAsync(player.UserId)
			
			return
		end
		var4 = t:GetNonChatStringForBroadcastAsync()
	end)
	
	if status_1 then
		t.Message = var4
		t.FilterResult = nil
		p8:InternalSendFilteredMessage(t, p10)
	elseif #var4 > 0 then
		t.Message = var4
		t.FilterResult = nil
		p8:InternalSendFilteredMessage(t, p10)
	end
end

function t_1.InternalSendSystemMessage(p11, p12, p13)
	local ok, status = pcall(function()
		-- upvalues: p11 (ref), p12 (ref), p13 (ref)
		p11:LazyFire("eReceivedSystemMessage", p12, p13)
		
		if p11.PlayerObj then
			p11.EventFolder.OnNewSystemMessage:FireClient(p11.PlayerObj, p12, p13)
		end
	end)
	
	if not ok and status then
		print("Error sending internal system message: " .. status)
	end
end

function t_1.UpdateChannelNameColor(p11, p12, p13)
	p11:LazyFire("eChannelNameColorUpdated", p12, p13)
	
	if p11.PlayerObj then
		p11.EventFolder.ChannelNameColorUpdated:FireClient(p11.PlayerObj, p12, p13)
	end
end

function t.new(p11, p12)
	-- upvalues: t_1 (ref)
	local tbl = setmetatable({}, t_1)
	tbl.ChatService = p11
	tbl.PlayerObj = nil
	tbl.Name = p12
	tbl.ExtraData = {}
	tbl.Channels = {}
	tbl.MutedSpeakers = {}
	tbl.EventFolder = nil
	
	return tbl
end

return t