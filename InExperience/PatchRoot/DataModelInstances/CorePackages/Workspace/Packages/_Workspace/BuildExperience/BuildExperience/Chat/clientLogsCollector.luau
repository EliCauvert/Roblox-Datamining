local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local httpService = game:GetService("HttpService")
local logService = game:GetService("LogService")
local fFlagBuildExperienceAskForLogsSeverityRetentionModule = require(buildExperience.Flags.FFlagBuildExperienceAskForLogsSeverityRetention)
local studioClientLogsTool = require(parent.DataHydration.CreatorAgentChat).StudioClientLogsTool
game:DefineFastInt("MyStatsExperienceAskForLogsMaxEntries", 100)

local function _() --[[ line: 23 | named "getDefaultMaxEntriesPerSource" ]]
	return math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))
end

local t = {
	[Enum.MessageType.MessageOutput.Value] = "Output",
	[Enum.MessageType.MessageInfo.Value] = "Information",
	[Enum.MessageType.MessageWarning.Value] = "Warning",
	[Enum.MessageType.MessageError.Value] = "Error"
}
local t_1 = {
	[Enum.MessageType.MessageOutput.Value] = 0,
	[Enum.MessageType.MessageInfo.Value] = 1,
	[Enum.MessageType.MessageWarning.Value] = 2,
	[Enum.MessageType.MessageError.Value] = 3
}

local _ = function(p0) --[[ line: 43 | named "getMessageTypeValue" ]]
	return if typeof(p0) == "EnumItem" then p0.Value elseif typeof(p0) == "number" then p0 else nil
end

local _ = function(p1) --[[ line: 53 | named "getMessageTypeLabel" ]]
	-- upvalues: t (ref)
	local var19 = if typeof(p1) == "EnumItem" then p1.Value elseif typeof(p1) == "number" then p1 else nil
	
	return if var19 == nil then if typeof(p1) == "EnumItem" then p1.Name elseif typeof(p1) == "string" and p1 ~= "" then p1 else nil else t[var19] or tostring(var19)
end

local _ = function(p2) --[[ line: 67 | named "encodeContext" ]]
	-- upvalues: httpService (ref)
	return if typeof(p2) == "table" and next(p2) ~= nil then httpService:JSONEncode(p2) else nil
end

local _ = function(p3) --[[ line: 75 | named "getSeverityRank" ]]
	-- upvalues: t_1 (ref)
	local messageTypeValue = p3.messageTypeValue
	
	return if messageTypeValue == nil then 0 else t_1[messageTypeValue] or 0
end

local function trimToCapBySeverity(p4, p5) --[[ line: 85 ]]
	-- upvalues: t_1 (ref)
	while p5 < #p4 do
		local var20 = 1
		local messageTypeValue = p4[1].messageTypeValue
		local var21 = if messageTypeValue == nil then 0 else t_1[messageTypeValue] or 0
		
		for i = 2, #p4 do
			local messageTypeValue_1 = p4[i].messageTypeValue
			local var22 = if messageTypeValue_1 == nil then 0 else t_1[messageTypeValue_1] or 0
			
			if var22 < var21 then
				var21 = var22
				var20 = i
			end
		end
		table.remove(p4, var20)
	end
end

local function selectRetainedBySeverity(p6, p7) --[[ line: 102 ]]
	-- upvalues: t_1 (ref)
	local t = {}
	
	if p7 <= 0 then
		return t
	end
	local p6Count = #p6
	
	if p6Count <= p7 then
		table.move(p6, 1, p6Count, 1, t)
		
		return t
	end
	local t_2 = {}
	
	for i, v in p6 do
		local messageTypeValue = v.messageTypeValue
		local var29 = if messageTypeValue == nil then 0 else t_1[messageTypeValue] or 0
		t_2[var29] = (t_2[var29] or 0) + 1
	end
	local var26 = 0
	local var27 = p7
	
	for i = 3, 0, -1 do
		local var28 = t_2[i] or 0
		
		if var28 >= var27 then
			var26 = i
			break
		end
		var27 -= var28
	end
	local var30 = (t_2[var26] or 0) - var27
	
	for i_1, v in p6 do
		local messageTypeValue = v.messageTypeValue
		local var31 = if messageTypeValue == nil then 0 else t_1[messageTypeValue] or 0
		
		if var26 < var31 then
			table.insert(t, v)
		elseif var31 == var26 then
			if var30 > 0 then
				var30 -= 1
			else
				table.insert(t, v)
			end
		end
	end
	return t
end

local _ = function(p8, p9, p10) --[[ line: 152 | named "pushCapped" ]]
	-- upvalues: fFlagBuildExperienceAskForLogsSeverityRetentionModule (ref), trimToCapBySeverity (ref)
	if p10 <= 0 then return end
	table.insert(p8, p9)
	
	if p10 < #p8 then
		if fFlagBuildExperienceAskForLogsSeverityRetentionModule then
			trimToCapBySeverity(p8, p10)
			
			return
		end
		table.remove(p8, 1)
	end
end

local function toLogEntry(p11, p12, p13, p14) --[[ line: 166 ]]
	-- upvalues: t (ref), httpService (ref)
	local var32 = if typeof(p13) == "number" then p13 else nil
	local t_1 = {
		message = if typeof(p11) == "string" then p11 else tostring(p11 or "")
	}
	local var34 = if typeof(p12) == "EnumItem" then p12.Value elseif typeof(p12) == "number" then p12 else nil
	t_1.messageType = if var34 ~= nil then if typeof(p12) == "EnumItem" then p12.Name elseif typeof(p12) == "string" and p12 ~= "" then p12 else nil else t[var34] or tostring(var34)
	t_1.messageTypeValue = if typeof(p12) == "EnumItem" then p12.Value elseif typeof(p12) == "number" then p12 else nil
	t_1.timestamp = var32
	t_1.contextJson = if typeof(p14) == "table" and next(p14) ~= nil then httpService:JSONEncode(p14) else nil
	
	return t_1
end

local t_2 = {}
local var10 = nil
local var11 = nil
local var12 = false
local maxValue = math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))

local function collectClientLogs(p15, p16) --[[ line: 184 ]]
	-- upvalues: logService (ref), toLogEntry (ref), fFlagBuildExperienceAskForLogsSeverityRetentionModule (ref), trimToCapBySeverity (ref)
	p15 = p15 or logService
	p16 = p16 or math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))
	local t = {}
	
	for i, v in p15:GetLogHistory() do
		if typeof(v) == "table" then
			local var38 = toLogEntry(v.message, v.messageType, v.timestamp, v.context)
			
			if p16 > 0 then
				table.insert(t, var38)
				
				if p16 < #t then
					if fFlagBuildExperienceAskForLogsSeverityRetentionModule then
						trimToCapBySeverity(t, p16)
					else
						table.remove(t, 1)
					end
				end
			end
		end
	end
	return t
end

local function trimServerLogs(p17) --[[ line: 199 ]]
	-- upvalues: fFlagBuildExperienceAskForLogsSeverityRetentionModule (ref), trimToCapBySeverity (ref), t_2 (write)
	if fFlagBuildExperienceAskForLogsSeverityRetentionModule then
		trimToCapBySeverity(t_2, p17)
		
		return
	end
	while p17 < #t_2 do
		table.remove(t_2, 1)
	end
end

local function stopServerLogCollection(p18) --[[ line: 209 ]]
	-- upvalues: var10 (write), var11 (write), var12 (write), t_2 (write)
	if var10 ~= nil then
		var10:Disconnect()
		var10 = nil
	end
	if var11 ~= nil then
		var11:Disconnect()
		var11 = nil
	end
	var12 = false
	
	if p18 == true then
		t_2 = {}
	end
end

local function startServerLogCollection(p19) --[[ line: 224 ]]
	-- upvalues: var12 (write), logService (ref), maxValue (write), trimServerLogs (ref), var10 (write), t_2 (write), toLogEntry (ref), fFlagBuildExperienceAskForLogsSeverityRetentionModule (ref), trimToCapBySeverity (ref), var11 (write)
	p19 = p19 or {}
	
	if (p19.dataModel or game).GameId == 0 then
		return false
	elseif var12 then
		return true
	end
	local logService_1 = p19.logService or logService
	maxValue = p19.maxEntriesPerSource or math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))
	trimServerLogs(maxValue)
	var10 = logService_1.ServerMessageOut:Connect(function(p20, p21, p22, p23) --[[ line: 238 ]]
		-- upvalues: t_2 (copy), toLogEntry (copy), maxValue (copy), fFlagBuildExperienceAskForLogsSeverityRetentionModule (copy), trimToCapBySeverity (copy)
		local var41 = toLogEntry(p20, p21, p22, p23)
		
		if maxValue <= 0 then return end
		table.insert(t_2, var41)
		
		if maxValue < #t_2 then
			if fFlagBuildExperienceAskForLogsSeverityRetentionModule then
				trimToCapBySeverity(t_2, maxValue)
				
				return
			end
			table.remove(t_2, 1)
		end
	end)
	var11 = logService_1.ServerContextOut:Connect(function(p24) --[[ line: 243 ]]
		-- upvalues: t_2 (copy), toLogEntry (copy), maxValue (copy), fFlagBuildExperienceAskForLogsSeverityRetentionModule (copy), trimToCapBySeverity (copy)
		if typeof(p24) ~= "table" or p24._structuredContext == nil then return end
		local var42 = toLogEntry(p24._message, p24._messageType, p24._timestamp, p24._structuredContext)
		
		if maxValue <= 0 then return end
		table.insert(t_2, var42)
		
		if maxValue < #t_2 then
			if fFlagBuildExperienceAskForLogsSeverityRetentionModule then
				trimToCapBySeverity(t_2, maxValue)
				
				return
			end
			table.remove(t_2, 1)
		end
	end)
	logService_1:RequestServerOutput()
	var12 = true
	
	return true
end

local function getCollectedServerLogs(p25) --[[ line: 260 ]]
	-- upvalues: fFlagBuildExperienceAskForLogsSeverityRetentionModule (ref), selectRetainedBySeverity (ref), t_2 (write)
	p25 = p25 or math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))
	
	if fFlagBuildExperienceAskForLogsSeverityRetentionModule then
		return selectRetainedBySeverity(t_2, p25)
	end
	local t = {}
	
	for i = math.max(1, #t_2 - p25 + 1), #t_2 do
		table.insert(t, t_2[i])
	end
	return t
end

return {
	startServerLogCollection = startServerLogCollection,
	stopServerLogCollection = stopServerLogCollection,
	collectToolResultContent = function(p26) --[[ line: 274 ]]
		-- upvalues: studioClientLogsTool (ref), startServerLogCollection (ref), collectClientLogs (ref), getCollectedServerLogs (ref)
		p26 = p26 or {}
		
		if (p26.dataModel or game).GameId == 0 then
			return studioClientLogsTool.formatNotInGameContent()
		end
		local maxEntriesPerSource = p26.maxEntriesPerSource or math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))
		startServerLogCollection(p26)
		
		return studioClientLogsTool.formatLogsContent(collectClientLogs(p26.logService, maxEntriesPerSource), getCollectedServerLogs(maxEntriesPerSource))
	end
}