local parent = script:FindFirstAncestor("BuildExperience").Parent
local httpService = game:GetService("HttpService")
local logService = game:GetService("LogService")
local studioClientLogsTool = require(parent.DataHydration.CreatorAgentChat).StudioClientLogsTool
game:DefineFastInt("MyStatsExperienceAskForLogsMaxEntries", 100)

local function _() --[[ line: 20 | named "getDefaultMaxEntriesPerSource" ]]
	return math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))
end

local t = {
	[Enum.MessageType.MessageOutput.Value] = "Output",
	[Enum.MessageType.MessageInfo.Value] = "Information",
	[Enum.MessageType.MessageWarning.Value] = "Warning",
	[Enum.MessageType.MessageError.Value] = "Error"
}

local _ = function(p0) --[[ line: 31 | named "getMessageTypeValue" ]]
	return if typeof(p0) == "EnumItem" then p0.Value elseif typeof(p0) == "number" then p0 else nil
end

local _ = function(p1) --[[ line: 41 | named "getMessageTypeLabel" ]]
	-- upvalues: t (ref)
	local var13 = if typeof(p1) == "EnumItem" then p1.Value elseif typeof(p1) == "number" then p1 else nil
	
	return if var13 == nil then if typeof(p1) == "EnumItem" then p1.Name elseif typeof(p1) == "string" and p1 ~= "" then p1 else nil else t[var13] or tostring(var13)
end

local _ = function(p2) --[[ line: 55 | named "encodeContext" ]]
	-- upvalues: httpService (ref)
	return if typeof(p2) == "table" and next(p2) ~= nil then httpService:JSONEncode(p2) else nil
end

local _ = function(p3, p4, p5) --[[ line: 63 | named "pushCapped" ]]
	if p5 <= 0 then return end
	table.insert(p3, p4)
	
	if p5 < #p3 then
		table.remove(p3, 1)
	end
end

local function toLogEntry(p6, p7, p8, p9) --[[ line: 73 ]]
	-- upvalues: t (ref), httpService (ref)
	local var14 = if typeof(p8) == "number" then p8 else nil
	local t_1 = {
		message = if typeof(p6) == "string" then p6 else tostring(p6 or "")
	}
	local var16 = if typeof(p7) == "EnumItem" then p7.Value elseif typeof(p7) == "number" then p7 else nil
	t_1.messageType = if var16 ~= nil then if typeof(p7) == "EnumItem" then p7.Name elseif typeof(p7) == "string" and p7 ~= "" then p7 else nil else t[var16] or tostring(var16)
	t_1.messageTypeValue = if typeof(p7) == "EnumItem" then p7.Value elseif typeof(p7) == "number" then p7 else nil
	t_1.timestamp = var14
	t_1.contextJson = if typeof(p9) == "table" and next(p9) ~= nil then httpService:JSONEncode(p9) else nil
	
	return t_1
end

local t_1 = {}
local var5 = nil
local var6 = nil
local var7 = false
local maxValue = math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))

local function collectClientLogs(p10, p11) --[[ line: 91 ]]
	-- upvalues: logService (ref), toLogEntry (ref)
	p10 = p10 or logService
	p11 = p11 or math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))
	local t = {}
	
	for i, v in p10:GetLogHistory() do
		if typeof(v) == "table" then
			local var20 = toLogEntry(v.message, v.messageType, v.timestamp, v.context)
			
			if p11 > 0 then
				table.insert(t, var20)
				
				if p11 < #t then
					table.remove(t, 1)
				end
			end
		end
	end
	return t
end

local _ = function(p12) --[[ line: 106 | named "trimServerLogs" ]]
	-- upvalues: t_1 (write)
	while p12 < #t_1 do
		table.remove(t_1, 1)
	end
end

local function stopServerLogCollection(p13) --[[ line: 112 ]]
	-- upvalues: var5 (write), var6 (write), var7 (write), t_1 (write)
	if var5 ~= nil then
		var5:Disconnect()
		var5 = nil
	end
	if var6 ~= nil then
		var6:Disconnect()
		var6 = nil
	end
	var7 = false
	
	if p13 == true then
		t_1 = {}
	end
end

local function startServerLogCollection(p14) --[[ line: 127 ]]
	-- upvalues: var7 (write), logService (ref), maxValue (write), t_1 (write), var5 (write), toLogEntry (ref), var6 (write)
	p14 = p14 or {}
	
	if (p14.dataModel or game).GameId == 0 then
		return false
	elseif var7 then
		return true
	end
	local logService_1 = p14.logService or logService
	maxValue = p14.maxEntriesPerSource or math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))
	local var23 = maxValue
	while var23 < #t_1 do
		table.remove(t_1, 1)
	end
	var5 = logService_1.ServerMessageOut:Connect(function(p15, p16, p17, p18) --[[ line: 141 ]]
		-- upvalues: t_1 (copy), toLogEntry (copy), maxValue (copy)
		local var24 = toLogEntry(p15, p16, p17, p18)
		
		if maxValue <= 0 then return end
		table.insert(t_1, var24)
		
		if maxValue < #t_1 then
			table.remove(t_1, 1)
		end
	end)
	var6 = logService_1.ServerContextOut:Connect(function(p19) --[[ line: 146 ]]
		-- upvalues: t_1 (copy), toLogEntry (copy), maxValue (copy)
		if typeof(p19) ~= "table" or p19._structuredContext == nil then return end
		local var25 = toLogEntry(p19._message, p19._messageType, p19._timestamp, p19._structuredContext)
		
		if maxValue <= 0 then return end
		table.insert(t_1, var25)
		
		if maxValue < #t_1 then
			table.remove(t_1, 1)
		end
	end)
	logService_1:RequestServerOutput()
	var7 = true
	
	return true
end

local function getCollectedServerLogs(p20) --[[ line: 163 ]]
	-- upvalues: t_1 (write)
	local t = {}
	
	for i = math.max(1, #t_1 - (p20 or math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))) + 1), #t_1 do
		table.insert(t, t_1[i])
	end
	return t
end

return {
	startServerLogCollection = startServerLogCollection,
	stopServerLogCollection = stopServerLogCollection,
	collectToolResultContent = function(p21) --[[ line: 173 ]]
		-- upvalues: studioClientLogsTool (ref), startServerLogCollection (ref), collectClientLogs (ref), getCollectedServerLogs (ref)
		p21 = p21 or {}
		
		if (p21.dataModel or game).GameId == 0 then
			return studioClientLogsTool.formatNotInGameContent()
		end
		local maxEntriesPerSource = p21.maxEntriesPerSource or math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))
		startServerLogCollection(p21)
		
		return studioClientLogsTool.formatLogsContent(collectClientLogs(p21.logService, maxEntriesPerSource), getCollectedServerLogs(maxEntriesPerSource))
	end
}