local list = { 0.05, 0.1, 0.2 }
local t = {}
local runService = game:GetService("RunService")
local chatService = game:GetService("Chat")
local _ = chatService:WaitForChild("ClientChatModules")
local parent = script.Parent
local clientChatModules = chatService:WaitForChild("ClientChatModules")
local t_1 = {
	ChatColor = require(clientChatModules:WaitForChild("ChatSettings")).ErrorMessageTextColor or Color3.fromRGB(245, 50, 50)
}
local chatConstantsModule = require(clientChatModules:WaitForChild("ChatConstants"))
local chatChannelModule = require(parent:WaitForChild("ChatChannel"))
local speakerModule = require(parent:WaitForChild("Speaker"))
local utilModule = require(parent:WaitForChild("Util"))
local var10 = nil
pcall(function() --[[ line: 38 ]]
	-- upvalues: var10 (write)
	var10 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)
var10 = var10 or {}

if not var10.FormatMessageToSend or not var10.LocalizeFormattedMessage then
	function var10.FormatMessageToSend(_, _, p0) --[[ line: 42 ]]
		return p0
	end
end
local function _(p1) --[[ line: 45 | named "allSpaces" ]]
	return string.len(string.gsub(p1, " ", "")) == 0
end

local t_2 = {}
t_2.__index = t_2

function t_2.AddChannel(p2, p3, p4) --[[ line: 55 ]]
	-- upvalues: var10 (write), chatChannelModule (ref), chatConstantsModule (ref)
	if p2.ChatChannels[p3:lower()] then
		error(string.format("Channel %q alrady exists.", p3))
	end
	local function DefaultChannelCommands(p5, p6) --[[ line: 60 ]]
		-- upvalues: p2 (ref), p3 (ref), var10 (copy)
		if p6:lower() ~= "/leave" then
			return false
		end
		local var18 = p2:GetChannel(p3)
		local var19 = p2:GetSpeaker(p5)
		
		if var18 and var19 then
			if var18.Leavable then
				var19:LeaveChannel(p3)
				var19:SendSystemMessage(var10:FormatMessageToSend("GameChat_ChatService_YouHaveLeftChannel", string.format("You have left channel '%s'", p3), "RBX_NAME", p3), "System")
			else
				var19:SendSystemMessage(var10:FormatMessageToSend("GameChat_ChatService_CannotLeaveChannel", "You cannot leave this channel."), p3)
			end
		end
		return true
	end
	
	local var17 = chatChannelModule.new(p2, p3)
	p2.ChatChannels[p3:lower()] = var17
	var17:RegisterProcessCommandsFunction("default_commands", DefaultChannelCommands, chatConstantsModule.HighPriority)
	local ok, status = pcall(function() --[[ line: 89 ]]
		-- upvalues: p2 (ref), p3 (ref)
		p2.eChannelAdded:Fire(p3)
	end)
	
	if not ok and status then
		print("Error addding channel: " .. status)
	end
	if p4 ~= nil then
		var17.AutoJoin = p4
		
		if p4 then
			for i, v in pairs(p2.Speakers) do
				v:JoinChannel(p3)
			end
		end
	end
	return var17
end

function t_2.RemoveChannel(p7, p8) --[[ line: 106 ]]
	if p7.ChatChannels[p8:lower()] then
		local name = p7.ChatChannels[p8:lower()].Name
		p7.ChatChannels[p8:lower()]:InternalDestroy()
		p7.ChatChannels[p8:lower()] = nil
		local ok, status = pcall(function() --[[ line: 113 ]]
			-- upvalues: p7 (ref), name (ref)
			p7.eChannelRemoved:Fire(name)
		end)
		
		if ok or not status then
			return
		else
			print("Error removing channel: " .. status)
			
			return
		end
	else
		warn(string.format("Channel %q does not exist.", p8))
	end
end

function t_2.GetChannel(p9, p10) --[[ line: 122 ]]
	return p9.ChatChannels[p10:lower()]
end

function t_2.AddSpeaker(p11, p12) --[[ line: 127 ]]
	-- upvalues: speakerModule (ref)
	if p11.Speakers[p12:lower()] then
		error("Speaker \"" .. p12 .. "\" already exists!")
	end
	local var20 = speakerModule.new(p11, p12)
	p11.Speakers[p12:lower()] = var20
	local ok, status = pcall(function() --[[ line: 135 ]]
		-- upvalues: p11 (ref), p12 (ref)
		p11.eSpeakerAdded:Fire(p12)
	end)
	
	if not ok and status then
		print("Error adding speaker: " .. status)
	end
	return var20
end

function t_2.InternalUnmuteSpeaker(p13, p14) --[[ line: 143 ]]
	for i, v in pairs(p13.ChatChannels) do
		if v:IsSpeakerMuted(p14) then
			v:UnmuteSpeaker(p14)
		end
	end
end

function t_2.RemoveSpeaker(p15, p16) --[[ line: 151 ]]
	if p15.Speakers[p16:lower()] then
		local name = p15.Speakers[p16:lower()].Name
		p15:InternalUnmuteSpeaker(name)
		p15.Speakers[p16:lower()]:InternalDestroy()
		p15.Speakers[p16:lower()] = nil
		local ok, status = pcall(function() --[[ line: 160 ]]
			-- upvalues: p15 (ref), name (ref)
			p15.eSpeakerRemoved:Fire(name)
		end)
		
		if ok or not status then
			return
		else
			print("Error removing speaker: " .. status)
			
			return
		end
	else
		warn("Speaker \"" .. p16 .. "\" does not exist!")
	end
end

function t_2.GetSpeaker(p17, p18) --[[ line: 170 ]]
	return p17.Speakers[p18:lower()]
end

function t_2.GetSpeakerByUserOrDisplayName(p19, p20) --[[ line: 174 ]]
	local var21 = p19.Speakers[p20:lower()]
	
	if var21 then
		return var21
	end
	for i, v in pairs(p19.Speakers) do
		local player = v:GetPlayer()
		
		if player and player.DisplayName:lower() == p20:lower() then
			return v
		end
	end
end

function t_2.GetChannelList(p21) --[[ line: 190 ]]
	local t = {}
	
	for i, v in pairs(p21.ChatChannels) do
		if not v.Private then
			table.insert(t, v.Name)
		end
	end
	return t
end

function t_2.GetAutoJoinChannelList(p22) --[[ line: 200 ]]
	local t = {}
	
	for i, v in pairs(p22.ChatChannels) do
		if v.AutoJoin then
			table.insert(t, v)
		end
	end
	return t
end

function t_2.GetSpeakerList(p23) --[[ line: 210 ]]
	local t = {}
	
	for i, v in pairs(p23.Speakers) do
		table.insert(t, v.Name)
	end
	return t
end

function t_2.SendGlobalSystemMessage(p24, p25) --[[ line: 218 ]]
	for i, v in pairs(p24.Speakers) do
		v:SendSystemMessage(p25, nil)
	end
end

function t_2.RegisterFilterMessageFunction(p26, p27, p28, p29) --[[ line: 224 ]]
	if p26.FilterMessageFunctions:HasFunction(p27) then
		error(string.format("FilterMessageFunction '%s' already exists", p27))
	end
	p26.FilterMessageFunctions:AddFunction(p27, p28, p29)
end

function t_2.FilterMessageFunctionExists(p30, p31) --[[ line: 231 ]]
	return p30.FilterMessageFunctions:HasFunction(p31)
end

function t_2.UnregisterFilterMessageFunction(p32, p33) --[[ line: 235 ]]
	if not p32.FilterMessageFunctions:HasFunction(p33) then
		error(string.format("FilterMessageFunction '%s' does not exists", p33))
	end
	p32.FilterMessageFunctions:RemoveFunction(p33)
end

function t_2.RegisterProcessCommandsFunction(p34, p35, p36, p37) --[[ line: 242 ]]
	if p34.ProcessCommandsFunctions:HasFunction(p35) then
		error(string.format("ProcessCommandsFunction '%s' already exists", p35))
	end
	p34.ProcessCommandsFunctions:AddFunction(p35, p36, p37)
end

function t_2.ProcessCommandsFunctionExists(p38, p39) --[[ line: 249 ]]
	return p38.ProcessCommandsFunctions:HasFunction(p39)
end

function t_2.UnregisterProcessCommandsFunction(p40, p41) --[[ line: 253 ]]
	if not p40.ProcessCommandsFunctions:HasFunction(p41) then
		error(string.format("ProcessCommandsFunction '%s' does not exist", p41))
	end
	p40.ProcessCommandsFunctions:RemoveFunction(p41)
end

local var12 = 0
local var13 = 0
local var14 = 0

function t_2.InternalNotifyFilterIssue(p42) --[[ line: 263 ]]
	-- upvalues: var13 (write), var14 (write), var12 (write), var10 (write), t_1 (ref)
	if tick() - var13 > 60 then
		var14 = 0
	end
	var14 += 1
	var13 = tick()
	
	if var14 >= 3 and tick() - var12 > 60 then
		var12 = tick()
		local systemChannel = p42:GetChannel("System")
		
		if systemChannel then
			systemChannel:SendSystemMessage(var10:FormatMessageToSend("GameChat_ChatService_ChatFilterIssues", "The chat filter is currently experiencing issues and messages may be slow to appear."), t_1)
		end
	end
end

local t_3 = {}

function t_2.InternalApplyRobloxFilter(p43, p44, p45, p46) --[[ line: 292 ]]
	-- upvalues: runService (ref), chatService (ref), list (ref), t_3 (ref)
	if runService:IsServer() and not runService:IsStudio() then
		local var27 = p43:GetSpeaker(p44)
		local var28 = p46 and p43:GetSpeaker(p46)
		
		if var27 == nil then
			return nil
		end
		local player = var27:GetPlayer()
		local var30 = var28 and var28:GetPlayer()
		
		if player == nil then
			return p45
		elseif string.len(string.gsub(p45, " ", "")) == 0 then
			return p45
		end
		local currentTime = tick()
		local var32 = 0
		while true do
			local ok, status = pcall(function() --[[ line: 315 ]]
				-- upvalues: var30 (ref), chatService (copy), p45 (ref), player (ref)
				return if var30 then chatService:FilterStringAsync(p45, player, var30) else chatService:FilterStringForBroadcast(p45, player)
			end)
			if not ok then
				warn("Error filtering message:", status)
				var32 += 1
				
				if var32 <= 3 and tick() - currentTime <= 60 then
					local var33 = list[math.min(#list, var32)]
					wait(var33 + (math.random() * 2 - 1) * var33)
					continue
				end
				p43:InternalNotifyFilterIssue()
				
				return nil
			end
			return status
		end
		return nil
	elseif not t_3[p45] then
		t_3[p45] = true
		wait()
	end
	return p45
end

function t_2.InternalApplyRobloxFilterAndTranslate(p47, p48, p49, p50, p51) --[[ line: 351 ]]
	-- upvalues: runService (ref)
	if not runService:IsServer() or runService:IsStudio() then
		wait()
		
		return true, false, p50
	end
	local var34 = p47:GetSpeaker(p48)
	
	if var34 == nil then
		return false, nil, nil
	end
	local player = var34:GetPlayer()
	
	if player == nil then
		return true, false, p50
	elseif string.len(string.gsub(p50, " ", "")) == 0 then
		return true, false, p50
	end
	local ok, status = pcall(function() --[[ line: 369 ]]
		-- upvalues: p50 (ref), player (ref), p49 (ref), p51 (ref)
		return game:GetService("TextService"):FilterAndTranslateStringAsync(p50, player.UserId, p49, p51)
	end)
	
	if ok then
		return true, true, status
	end
	warn("Error filtering and translating message", p50, status)
	p47:InternalNotifyFilterIssue()
	
	return false, nil, nil
end

function t_2.InternalApplyRobloxFilterNewAPI(p52, p53, p54, p55) --[[ line: 388 ]]
	-- upvalues: runService (ref)
	if not runService:IsServer() or runService:IsStudio() then
		wait()
		
		return true, false, p54
	end
	local var36 = p52:GetSpeaker(p53)
	
	if var36 == nil then
		return false, nil, nil
	end
	local player = var36:GetPlayer()
	
	if player == nil then
		return true, false, p54
	elseif string.len(string.gsub(p54, " ", "")) == 0 then
		return true, false, p54
	end
	local ok, status = pcall(function() --[[ line: 407 ]]
		-- upvalues: p54 (ref), player (ref), p55 (ref)
		return game:GetService("TextService"):FilterStringAsync(p54, player.UserId, p55)
	end)
	
	if ok then
		return true, true, status
	end
	warn("Error filtering message:", p54, status)
	p52:InternalNotifyFilterIssue()
	
	return false, nil, nil
end

function t_2.InternalDoMessageFilter(p56, p57, p58, p59) --[[ line: 426 ]]
	for i, v, var38 in p56.FilterMessageFunctions:GetIterator() do
		local ok, status = pcall(function() --[[ line: 430 ]]
			-- upvalues: v (ref), p57 (ref), p58 (ref), p59 (ref)
			v(p57, p58, p59)
		end)
		
		if not ok then
			warn(string.format("DoMessageFilter Function '%s' failed for reason: %s", i, status))
		end
	end
end

function t_2.InternalDoProcessCommands(p60, p61, p62, p63) --[[ line: 440 ]]
	for i, v, var39 in p60.ProcessCommandsFunctions:GetIterator() do
		local ok, status = pcall(function() --[[ line: 444 ]]
			-- upvalues: v (ref), p61 (ref), p62 (ref), p63 (ref)
			local var40 = v(p61, p62, p63)
			
			if type(var40) ~= "boolean" then
				error("Process command functions must return a bool")
			end
			return var40
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

function t_2.InternalGetUniqueMessageId(p64) --[[ line: 462 ]]
	local messageIdCounter = p64.MessageIdCounter
	p64.MessageIdCounter = messageIdCounter + 1
	
	return messageIdCounter
end

function t_2.InternalAddSpeakerWithPlayerObject(p65, p66, p67, p68) --[[ line: 468 ]]
	-- upvalues: speakerModule (ref)
	if p65.Speakers[p66:lower()] then
		error("Speaker \"" .. p66 .. "\" already exists!")
	end
	local var41 = speakerModule.new(p65, p66)
	var41:InternalAssignPlayerObject(p67)
	p65.Speakers[p66:lower()] = var41
	
	if p68 then
		local ok, status = pcall(function() --[[ line: 478 ]]
			-- upvalues: p65 (ref), p66 (ref)
			p65.eSpeakerAdded:Fire(p66)
		end)
		
		if not ok and status then
			print("Error adding speaker: " .. status)
		end
	end
	return var41
end

function t_2.InternalFireSpeakerAdded(p69, p70) --[[ line: 487 ]]
	local ok, status = pcall(function() --[[ line: 488 ]]
		-- upvalues: p69 (ref), p70 (ref)
		p69.eSpeakerAdded:Fire(p70)
	end)
	
	if not ok and status then
		print("Error firing speaker added: " .. status)
	end
end

function t.new() --[[ line: 497 ]]
	-- upvalues: t_2 (ref), utilModule (ref)
	local tbl = setmetatable({}, t_2)
	tbl.MessageIdCounter = 0
	tbl.ChatChannels = {}
	tbl.Speakers = {}
	tbl.FilterMessageFunctions = utilModule:NewSortedFunctionContainer()
	tbl.ProcessCommandsFunctions = utilModule:NewSortedFunctionContainer()
	tbl.eChannelAdded = Instance.new("BindableEvent")
	tbl.eChannelRemoved = Instance.new("BindableEvent")
	tbl.eSpeakerAdded = Instance.new("BindableEvent")
	tbl.eSpeakerRemoved = Instance.new("BindableEvent")
	tbl.ChannelAdded = tbl.eChannelAdded.Event
	tbl.ChannelRemoved = tbl.eChannelRemoved.Event
	tbl.SpeakerAdded = tbl.eSpeakerAdded.Event
	tbl.SpeakerRemoved = tbl.eSpeakerRemoved.Event
	tbl.ChatServiceMajorVersion = 0
	tbl.ChatServiceMinorVersion = 5
	
	return tbl
end

return t.new()