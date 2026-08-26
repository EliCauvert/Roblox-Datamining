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
local function _(p1)
	return string.len(string.gsub(p1, " ", "")) == 0
end

local t_2 = {}
t_2.__index = t_2

function t_2.AddChannel(p1, p2, p3)
	-- upvalues: var1 (write), chatChannelModule (ref), chatConstantsModule (ref)
	if p1.ChatChannels[p2:lower()] then
		error(string.format("Channel %q alrady exists.", p2))
	end
	local function DefaultChannelCommands(p4, p5)
		-- upvalues: p1 (ref), p2 (ref), var1 (copy)
		if p5:lower() ~= "/leave" then
			return false
		end
		local var2 = p1:GetChannel(p2)
		local var3 = p1:GetSpeaker(p4)
		
		if var2 and var3 then
			if var2.Leavable then
				var3:LeaveChannel(p2)
				var3:SendSystemMessage(var1:FormatMessageToSend("GameChat_ChatService_YouHaveLeftChannel", string.format("You have left channel '%s'", p2), "RBX_NAME", p2), "System")
			else
				var3:SendSystemMessage(var1:FormatMessageToSend("GameChat_ChatService_CannotLeaveChannel", "You cannot leave this channel."), p2)
			end
		end
		return true
	end
	
	local var2 = chatChannelModule.new(p1, p2)
	p1.ChatChannels[p2:lower()] = var2
	var2:RegisterProcessCommandsFunction("default_commands", DefaultChannelCommands, chatConstantsModule.HighPriority)
	local ok, status = pcall(function()
		-- upvalues: p1 (ref), p2 (ref)
		p1.eChannelAdded:Fire(p2)
	end)
	
	if not ok and status then
		print("Error addding channel: " .. status)
	end
	if p3 ~= nil then
		var2.AutoJoin = p3
		
		if p3 then
			for i, v in pairs(p1.Speakers) do
				v:JoinChannel(p2)
			end
		end
	end
	return var2
end

function t_2.RemoveChannel(p4, p5)
	if p4.ChatChannels[p5:lower()] then
		local name = p4.ChatChannels[p5:lower()].Name
		p4.ChatChannels[p5:lower()]:InternalDestroy()
		p4.ChatChannels[p5:lower()] = nil
		local ok, status = pcall(function()
			-- upvalues: p4 (ref), name (ref)
			p4.eChannelRemoved:Fire(name)
		end)
		
		if ok or not status then
			return
		else
			print("Error removing channel: " .. status)
			
			return
		end
	else
		warn(string.format("Channel %q does not exist.", p5))
	end
end

function t_2.GetChannel(p4, p5)
	return p4.ChatChannels[p5:lower()]
end

function t_2.AddSpeaker(p4, p5)
	-- upvalues: speakerModule (ref)
	if p4.Speakers[p5:lower()] then
		error("Speaker \"" .. p12 .. "\" already exists!")
	end
	local var3 = speakerModule.new(p4, p5)
	p4.Speakers[p5:lower()] = var3
	local ok, status = pcall(function()
		-- upvalues: p4 (ref), p5 (ref)
		p4.eSpeakerAdded:Fire(p5)
	end)
	
	if not ok and status then
		print("Error adding speaker: " .. status)
	end
	return var3
end

function t_2.InternalUnmuteSpeaker(p4, p5)
	for i, v in pairs(p4.ChatChannels) do
		if v:IsSpeakerMuted(p5) then
			v:UnmuteSpeaker(p5)
		end
	end
end

function t_2.RemoveSpeaker(p6, p7)
	if p6.Speakers[p7:lower()] then
		local name = p6.Speakers[p7:lower()].Name
		p6:InternalUnmuteSpeaker(name)
		p6.Speakers[p7:lower()]:InternalDestroy()
		p6.Speakers[p7:lower()] = nil
		local ok, status = pcall(function()
			-- upvalues: p6 (ref), name (ref)
			p6.eSpeakerRemoved:Fire(name)
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

function t_2.GetSpeaker(p6, p7)
	return p6.Speakers[p7:lower()]
end

function t_2.GetSpeakerByUserOrDisplayName(p6, p7)
	local var3 = p6.Speakers[p7:lower()]
	
	if var3 then
		return var3
	end
	for i, v in pairs(p6.Speakers) do
		local player = v:GetPlayer()
		
		if player and player.DisplayName:lower() == p7:lower() then
			return v
		end
	end
end

function t_2.GetChannelList(p8)
	local t = {}
	
	for i, v in pairs(p8.ChatChannels) do
		if not v.Private then
			table.insert(t, v.Name)
		end
	end
	return t
end

function t_2.GetAutoJoinChannelList(p9)
	local t = {}
	
	for i, v in pairs(p9.ChatChannels) do
		if v.AutoJoin then
			table.insert(t, v)
		end
	end
	return t
end

function t_2.GetSpeakerList(p10)
	local t = {}
	
	for i, v in pairs(p10.Speakers) do
		table.insert(t, v.Name)
	end
	return t
end

function t_2.SendGlobalSystemMessage(p11, p12)
	for i, v in pairs(p11.Speakers) do
		v:SendSystemMessage(p12, nil)
	end
end

function t_2.RegisterFilterMessageFunction(p13, p14, p15, p16)
	if p13.FilterMessageFunctions:HasFunction(p14) then
		error(string.format("FilterMessageFunction '%s' already exists", p14))
	end
	p13.FilterMessageFunctions:AddFunction(p14, p15, p16)
end

function t_2.FilterMessageFunctionExists(p13, p14)
	return p13.FilterMessageFunctions:HasFunction(p14)
end

function t_2.UnregisterFilterMessageFunction(p13, p14)
	if not p13.FilterMessageFunctions:HasFunction(p14) then
		error(string.format("FilterMessageFunction '%s' does not exists", p14))
	end
	p13.FilterMessageFunctions:RemoveFunction(p14)
end

function t_2.RegisterProcessCommandsFunction(p13, p14, p15, p16)
	if p13.ProcessCommandsFunctions:HasFunction(p14) then
		error(string.format("ProcessCommandsFunction '%s' already exists", p14))
	end
	p13.ProcessCommandsFunctions:AddFunction(p14, p15, p16)
end

function t_2.ProcessCommandsFunctionExists(p13, p14)
	return p13.ProcessCommandsFunctions:HasFunction(p14)
end

function t_2.UnregisterProcessCommandsFunction(p13, p14)
	if not p13.ProcessCommandsFunctions:HasFunction(p14) then
		error(string.format("ProcessCommandsFunction '%s' does not exist", p14))
	end
	p13.ProcessCommandsFunctions:RemoveFunction(p14)
end

local var4 = 0
local var5 = 0
local var6 = 0

function t_2.InternalNotifyFilterIssue(p13)
	-- upvalues: var5 (write), var6 (write), var4 (write), var1 (write), t_1 (ref)
	if tick() - var5 > 60 then
		var6 = 0
	end
	var6 += 1
	var5 = tick()
	
	if var6 >= 3 and tick() - var4 > 60 then
		var4 = tick()
		local systemChannel = p13:GetChannel("System")
		
		if systemChannel then
			systemChannel:SendSystemMessage(var1:FormatMessageToSend("GameChat_ChatService_ChatFilterIssues", "The chat filter is currently experiencing issues and messages may be slow to appear."), t_1)
		end
	end
end

local t_3 = {}

function t_2.InternalApplyRobloxFilter(p13, p14, p15, p16)
	-- upvalues: runService (ref), chatService (ref), list (ref), t_3 (ref)
	if runService:IsServer() and not runService:IsStudio() then
		local var7 = p13:GetSpeaker(p14)
		local var8 = p16 and p13:GetSpeaker(p16)
		
		if var7 == nil then
			return nil
		end
		local player = var7:GetPlayer()
		local var9 = var8 and var8:GetPlayer()
		
		if player == nil then
			return p15
		elseif string.len(string.gsub(p15, " ", "")) == 0 then
			return p15
		end
		local currentTime = tick()
		local var10 = 0
		while true do
			local ok, status = pcall(function()
				-- upvalues: var9 (ref), chatService (copy), p15 (ref), player (ref)
				return if var9 then chatService:FilterStringAsync(p15, player, var9) else chatService:FilterStringForBroadcast(p15, player)
			end)
			if not ok then
				warn("Error filtering message:", status)
				var10 += 1
				
				if var10 <= 3 and tick() - currentTime <= 60 then
					local var11 = list[math.min(#list, var10)]
					wait(var11 + (math.random() * 2 - 1) * var11)
					continue
				end
				p13:InternalNotifyFilterIssue()
				
				return nil
			end
			return status
		end
		return nil
	elseif not t_3[p15] then
		t_3[p15] = true
		wait()
	end
	return p15
end

function t_2.InternalApplyRobloxFilterAndTranslate(p17, p18, p19, p20, p21)
	-- upvalues: runService (ref)
	if not runService:IsServer() or runService:IsStudio() then
		wait()
		
		return true, false, p20
	end
	local var12 = p17:GetSpeaker(p18)
	
	if var12 == nil then
		return false, nil, nil
	end
	local player = var12:GetPlayer()
	
	if player == nil then
		return true, false, p20
	elseif string.len(string.gsub(p20, " ", "")) == 0 then
		return true, false, p20
	end
	local ok, status = pcall(function()
		-- upvalues: p20 (ref), player (ref), p19 (ref), p21 (ref)
		return game:GetService("TextService"):FilterAndTranslateStringAsync(p20, player.UserId, p19, p21)
	end)
	
	if ok then
		return true, true, status
	end
	warn("Error filtering and translating message", p20, status)
	p17:InternalNotifyFilterIssue()
	
	return false, nil, nil
end

function t_2.InternalApplyRobloxFilterNewAPI(p17, p18, p19, p20)
	-- upvalues: runService (ref)
	if not runService:IsServer() or runService:IsStudio() then
		wait()
		
		return true, false, p19
	end
	local var12 = p17:GetSpeaker(p18)
	
	if var12 == nil then
		return false, nil, nil
	end
	local player = var12:GetPlayer()
	
	if player == nil then
		return true, false, p19
	elseif string.len(string.gsub(p19, " ", "")) == 0 then
		return true, false, p19
	end
	local ok, status = pcall(function()
		-- upvalues: p19 (ref), player (ref), p20 (ref)
		return game:GetService("TextService"):FilterStringAsync(p19, player.UserId, p20)
	end)
	
	if ok then
		return true, true, status
	end
	warn("Error filtering message:", p19, status)
	p17:InternalNotifyFilterIssue()
	
	return false, nil, nil
end

function t_2.InternalDoMessageFilter(p17, p18, p19, p20)
	for i, v, var38 in p17.FilterMessageFunctions:GetIterator() do
		local ok, status = pcall(function()
			-- upvalues: v (ref), p18 (ref), p19 (ref), p20 (ref)
			v(p18, p19, p20)
		end)
		
		if not ok then
			warn(string.format("DoMessageFilter Function '%s' failed for reason: %s", i, status))
		end
	end
end

function t_2.InternalDoProcessCommands(p21, p22, p23, p24)
	for i, v, var39 in p21.ProcessCommandsFunctions:GetIterator() do
		local ok, status = pcall(function()
			-- upvalues: v (ref), p22 (ref), p23 (ref), p24 (ref)
			local var12 = v(p22, p23, p24)
			
			if type(var12) ~= "boolean" then
				error("Process command functions must return a bool")
			end
			return var12
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

function t_2.InternalGetUniqueMessageId(p25)
	local messageIdCounter = p25.MessageIdCounter
	p25.MessageIdCounter = messageIdCounter + 1
	
	return messageIdCounter
end

function t_2.InternalAddSpeakerWithPlayerObject(p25, p26, p27, p28)
	-- upvalues: speakerModule (ref)
	if p25.Speakers[p26:lower()] then
		error("Speaker \"" .. p66 .. "\" already exists!")
	end
	local var12 = speakerModule.new(p25, p26)
	var12:InternalAssignPlayerObject(p27)
	p25.Speakers[p26:lower()] = var12
	
	if p28 then
		local ok, status = pcall(function()
			-- upvalues: p25 (ref), p26 (ref)
			p25.eSpeakerAdded:Fire(p26)
		end)
		
		if not ok and status then
			print("Error adding speaker: " .. status)
		end
	end
	return var12
end

function t_2.InternalFireSpeakerAdded(p25, p26)
	local ok, status = pcall(function()
		-- upvalues: p25 (ref), p26 (ref)
		p25.eSpeakerAdded:Fire(p26)
	end)
	
	if not ok and status then
		print("Error firing speaker added: " .. status)
	end
end

function t.new()
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