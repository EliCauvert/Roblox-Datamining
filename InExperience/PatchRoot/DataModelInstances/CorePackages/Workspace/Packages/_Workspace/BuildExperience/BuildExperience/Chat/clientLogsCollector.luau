local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local httpService = game:GetService("HttpService")
local logService = game:GetService("LogService")
local memStorageService = game:GetService("MemStorageService")
local playersService = game:GetService("Players")
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local fFlagBuildExperienceAskForLogsSeverityRetentionModule = require(buildExperience.Flags.FFlagBuildExperienceAskForLogsSeverityRetention)
local fFlagBuildExperiencePersistPlaytestLogsModule = require(buildExperience.Flags.FFlagBuildExperiencePersistPlaytestLogs)
local studioClientLogsTool = creatorAgentChatModule.StudioClientLogsTool
game:DefineFastInt("MyStatsExperienceAskForLogsMaxEntries", 100)

local function _() --[[ line: 45 | named "getDefaultMaxEntriesPerSource" ]]
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

local _ = function(p0) --[[ line: 65 | named "getMessageTypeValue" ]]
	return if typeof(p0) == "EnumItem" then p0.Value elseif typeof(p0) == "number" then p0 else nil
end

local _ = function(p1) --[[ line: 75 | named "getMessageTypeLabel" ]]
	-- upvalues: t (ref)
	local var30 = if typeof(p1) == "EnumItem" then p1.Value elseif typeof(p1) == "number" then p1 else nil
	
	return if var30 == nil then if typeof(p1) == "EnumItem" then p1.Name elseif typeof(p1) == "string" and p1 ~= "" then p1 else nil else t[var30] or tostring(var30)
end

local _ = function(p2) --[[ line: 89 | named "encodeContext" ]]
	-- upvalues: httpService (ref)
	return if typeof(p2) == "table" and next(p2) ~= nil then httpService:JSONEncode(p2) else nil
end

local _ = function(p3) --[[ line: 97 | named "getSeverityRank" ]]
	-- upvalues: t_1 (ref)
	local messageTypeValue = p3.messageTypeValue
	
	return if messageTypeValue == nil then 0 else t_1[messageTypeValue] or 0
end

local function trimToCapBySeverity(p4, p5) --[[ line: 107 ]]
	-- upvalues: t_1 (ref)
	while p5 < #p4 do
		local var31 = 1
		local messageTypeValue = p4[1].messageTypeValue
		local var32 = if messageTypeValue == nil then 0 else t_1[messageTypeValue] or 0
		
		for i = 2, #p4 do
			local messageTypeValue_1 = p4[i].messageTypeValue
			local var33 = if messageTypeValue_1 == nil then 0 else t_1[messageTypeValue_1] or 0
			
			if var33 < var32 then
				var32 = var33
				var31 = i
			end
		end
		table.remove(p4, var31)
	end
end

local function selectRetainedBySeverity(p6, p7) --[[ line: 124 ]]
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
		local var40 = if messageTypeValue == nil then 0 else t_1[messageTypeValue] or 0
		t_2[var40] = (t_2[var40] or 0) + 1
	end
	local var37 = 0
	local var38 = p7
	
	for i = 3, 0, -1 do
		local var39 = t_2[i] or 0
		
		if var39 >= var38 then
			var37 = i
			break
		end
		var38 -= var39
	end
	local var41 = (t_2[var37] or 0) - var38
	
	for i_1, v in p6 do
		local messageTypeValue = v.messageTypeValue
		local var42 = if messageTypeValue == nil then 0 else t_1[messageTypeValue] or 0
		
		if var37 < var42 then
			table.insert(t, v)
		elseif var42 == var37 then
			if var41 > 0 then
				var41 -= 1
			else
				table.insert(t, v)
			end
		end
	end
	return t
end

local _ = function(p8, p9, p10) --[[ line: 174 | named "pushCapped" ]]
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

local function toLogEntry(p11, p12, p13, p14) --[[ line: 188 ]]
	-- upvalues: t (ref), httpService (ref)
	local var43 = if typeof(p13) == "number" then p13 else nil
	local t_1 = {
		message = if typeof(p11) == "string" then p11 else tostring(p11 or "")
	}
	local var45 = if typeof(p12) == "EnumItem" then p12.Value elseif typeof(p12) == "number" then p12 else nil
	t_1.messageType = if var45 ~= nil then if typeof(p12) == "EnumItem" then p12.Name elseif typeof(p12) == "string" and p12 ~= "" then p12 else nil else t[var45] or tostring(var45)
	t_1.messageTypeValue = if typeof(p12) == "EnumItem" then p12.Value elseif typeof(p12) == "number" then p12 else nil
	t_1.timestamp = var43
	t_1.contextJson = if typeof(p14) == "table" and next(p14) ~= nil then httpService:JSONEncode(p14) else nil
	
	return t_1
end

local t_2 = {}
local var14 = nil
local var15 = nil
local var16 = false
local maxValue = math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))
local var18 = nil
local var19 = nil
local var20 = 0
local var21 = false
local var22 = nil
local var23 = nil

local function collectClientLogs(p15, p16) --[[ line: 212 ]]
	-- upvalues: logService (ref), toLogEntry (ref), fFlagBuildExperienceAskForLogsSeverityRetentionModule (ref), trimToCapBySeverity (ref)
	p15 = p15 or logService
	p16 = p16 or math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))
	local t = {}
	
	for i, v in p15:GetLogHistory() do
		if typeof(v) == "table" then
			local var49 = toLogEntry(v.message, v.messageType, v.timestamp, v.context)
			
			if p16 > 0 then
				table.insert(t, var49)
				
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

local function trimServerLogs(p17) --[[ line: 227 ]]
	-- upvalues: fFlagBuildExperienceAskForLogsSeverityRetentionModule (ref), trimToCapBySeverity (ref), t_2 (write)
	if fFlagBuildExperienceAskForLogsSeverityRetentionModule then
		trimToCapBySeverity(t_2, p17)
		
		return
	end
	while p17 < #t_2 do
		table.remove(t_2, 1)
	end
end

local function stopServerLogCollection(p18) --[[ line: 237 ]]
	-- upvalues: var14 (write), var15 (write), var18 (write), var19 (write), var20 (write), var21 (write), var22 (write), var16 (write), t_2 (write)
	if var14 ~= nil then
		var14:Disconnect()
		var14 = nil
	end
	if var15 ~= nil then
		var15:Disconnect()
		var15 = nil
	end
	if var18 ~= nil then
		var18:Disconnect()
		var18 = nil
	end
	if var19 ~= nil then
		var19:Disconnect()
		var19 = nil
	end
	var20 += 1
	var21 = false
	var22 = nil
	var16 = false
	
	if p18 == true then
		t_2 = {}
	end
end

local function startServerLogCollection(p19) --[[ line: 263 ]]
	-- upvalues: var16 (write), logService (ref), maxValue (write), trimServerLogs (ref), var14 (write), t_2 (write), toLogEntry (ref), fFlagBuildExperienceAskForLogsSeverityRetentionModule (ref), trimToCapBySeverity (ref), var22 (write), var15 (write), fFlagBuildExperiencePersistPlaytestLogsModule (ref), var23 (write)
	p19 = p19 or {}
	
	if (p19.dataModel or game).GameId == 0 then
		return false
	elseif var16 then
		return true
	end
	local logService_1 = p19.logService or logService
	maxValue = p19.maxEntriesPerSource or math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))
	trimServerLogs(maxValue)
	var14 = logService_1.ServerMessageOut:Connect(function(p20, p21, p22, p23) --[[ line: 277 ]]
		-- upvalues: t_2 (copy), toLogEntry (copy), maxValue (copy), fFlagBuildExperienceAskForLogsSeverityRetentionModule (copy), trimToCapBySeverity (copy), var22 (copy)
		local var52 = toLogEntry(p20, p21, p22, p23)
		
		if maxValue > 0 then
			table.insert(t_2, var52)
			
			if maxValue < #t_2 then
				if fFlagBuildExperienceAskForLogsSeverityRetentionModule then
					trimToCapBySeverity(t_2, maxValue)
				else
					table.remove(t_2, 1)
				end
			end
		end
		if var22 ~= nil then
			var22()
		end
	end)
	var15 = logService_1.ServerContextOut:Connect(function(p24) --[[ line: 285 ]]
		-- upvalues: t_2 (copy), toLogEntry (copy), maxValue (copy), fFlagBuildExperienceAskForLogsSeverityRetentionModule (copy), trimToCapBySeverity (copy), var22 (copy)
		if typeof(p24) ~= "table" or p24._structuredContext == nil then return end
		local var53 = toLogEntry(p24._message, p24._messageType, p24._timestamp, p24._structuredContext)
		
		if maxValue > 0 then
			table.insert(t_2, var53)
			
			if maxValue < #t_2 then
				if fFlagBuildExperienceAskForLogsSeverityRetentionModule then
					trimToCapBySeverity(t_2, maxValue)
				else
					table.remove(t_2, 1)
				end
			end
		end
		if var22 ~= nil then
			var22()
		end
	end)
	logService_1:RequestServerOutput()
	var16 = true
	
	if fFlagBuildExperiencePersistPlaytestLogsModule and var23 ~= nil then
		var23(p19)
	end
	return true
end

local function getCollectedServerLogs(p25) --[[ line: 308 ]]
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

local _ = function(p26) --[[ line: 322 | named "getLogSnapshotKey" ]]
	return `BuildExperiencePlaytestLogs:{p26}`
end

local _ = function(p27, p28, p29) --[[ line: 326 | named "writeLogSnapshot" ]]
	-- upvalues: httpService (ref)
	local ok, status = pcall(httpService.JSONEncode, httpService, p29)
	
	if ok and typeof(status) == "string" then
		pcall(p27.SetItem, p27, p28, status)
		
		return
	end
end

var23 = function(p30) --[[ line: 334 ]]
	-- upvalues: logService (ref), memStorageService (ref), playersService (ref), var20 (write), var21 (write), collectClientLogs (ref), getCollectedServerLogs (ref), httpService (ref), var22 (write), var18 (write), var19 (write)
	local dataModel = p30.dataModel or game
	local gameId = dataModel.GameId
	local placeId = dataModel.PlaceId
	local placeVersion = dataModel.PlaceVersion
	
	if typeof(gameId) == "number" and gameId ~= 0 and (typeof(placeId) == "number" and typeof(placeVersion) == "number") then
		local logService_1 = p30.logService or logService
		local memStorageService_1 = p30.memStorageService or memStorageService
		local playersService_1 = p30.playersService or playersService
		local maxEntriesPerSource = p30.maxEntriesPerSource or math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))
		local var61 = `BuildExperiencePlaytestLogs:{gameId}`
		var20 += 1
		local var62 = var20
		var21 = false
		pcall(memStorageService_1.SetItem, memStorageService_1, var61, "")
		
		local function persistNow() --[[ line: 359 ]]
			-- upvalues: var62 (ref), var20 (copy), collectClientLogs (copy), logService_1 (ref), maxEntriesPerSource (ref), memStorageService_1 (ref), var61 (ref), gameId (ref), placeId (ref), placeVersion (ref), getCollectedServerLogs (copy), httpService (copy)
			if var62 ~= var20 then return end
			local ok, status = pcall(collectClientLogs, logService_1, maxEntriesPerSource)
			
			if not ok then return end
			local ok_1, status_1 = pcall(httpService.JSONEncode, httpService, {
				schemaVersion = 1,
				universeId = gameId,
				placeId = placeId,
				placeVersion = placeVersion,
				clientLogs = status,
				serverLogs = getCollectedServerLogs(maxEntriesPerSource)
			})
			
			if ok_1 then
				if typeof(status_1) ~= "string" then return end
				pcall(memStorageService_1.SetItem, memStorageService_1, var61, status_1)
			end
		end
		
		local function scheduleWrite() --[[ line: 377 ]]
			-- upvalues: var62 (ref), var20 (copy), var21 (copy), persistNow (ref), p30 (ref)
			if var62 ~= var20 or var21 then return end
			var21 = true
			
			local function writeAfterDelay() --[[ line: 382 ]]
				-- upvalues: var62 (copy), var20 (copy), var21 (copy), persistNow (copy)
				if var62 == var20 then
					var21 = false
					persistNow()
					
					return
				end
			end
			
			if p30.schedule == nil then
				task.delay(1, writeAfterDelay)
				
				return
			end
			p30.schedule(1, writeAfterDelay)
		end
		
		var22 = scheduleWrite
		var18 = logService_1.MessageOut:Connect(scheduleWrite)
		local localPlayer = playersService_1.LocalPlayer
		var19 = playersService_1.PlayerRemoving:Connect(function(p31) --[[ line: 399 ]]
			-- upvalues: localPlayer (ref), persistNow (ref)
			if p31 == localPlayer then
				persistNow()
			end
		end)
		scheduleWrite()
		
		return
	end
end

local function readLogSnapshot(p32) --[[ line: 407 ]]
	-- upvalues: memStorageService (ref), httpService (ref)
	local universeId = p32.universeId
	local placeId = p32.placeId
	
	if typeof(universeId) ~= "number" or universeId == 0 or typeof(placeId) ~= "number" then
		return nil
	end
	local memStorageService_1 = p32.memStorageService or memStorageService
	local ok, status = pcall(memStorageService_1.GetItem, memStorageService_1, `BuildExperiencePlaytestLogs:{universeId}`)
	
	if not ok or typeof(status) ~= "string" or status == "" then
		return nil
	end
	local ok_1, status_1 = pcall(httpService.JSONDecode, httpService, status)
	
	return if not (not ok_1 or typeof(status_1) ~= "table") then if status_1.schemaVersion == 1 and status_1.universeId == universeId and (status_1.placeId == placeId and typeof(status_1.placeVersion) == "number") and (typeof(status_1.clientLogs) == "table" and typeof(status_1.serverLogs) == "table") then status_1 else nil else nil
end

local _ = function(p33, p34) --[[ line: 438 | named "logsAreStale" ]]
	return p34 ~= nil and (if typeof(p33) == "number" then p33 < p34 else true)
end

return {
	startServerLogCollection = startServerLogCollection,
	stopServerLogCollection = stopServerLogCollection,
	collectToolResultContent = function(p35) --[[ line: 442 ]]
		-- upvalues: fFlagBuildExperiencePersistPlaytestLogsModule (ref), readLogSnapshot (ref), studioClientLogsTool (ref), startServerLogCollection (ref), collectClientLogs (ref), getCollectedServerLogs (ref)
		p35 = p35 or {}
		local dataModel = p35.dataModel or game
		
		if dataModel.GameId == 0 then
			if fFlagBuildExperiencePersistPlaytestLogsModule then
				local var69 = readLogSnapshot(p35)
				
				if var69 == nil then
					return studioClientLogsTool.formatNotInGameContent()
				else
					local placeVersion = var69.placeVersion
					local minimumPlaceVersion = p35.minimumPlaceVersion
					
					return if minimumPlaceVersion ~= nil and (if typeof(placeVersion) == "number" then placeVersion < minimumPlaceVersion else true) then studioClientLogsTool.formatStaleLogsContent() else studioClientLogsTool.formatLogsContent(var69.clientLogs, var69.serverLogs)
				end
			end
		elseif fFlagBuildExperiencePersistPlaytestLogsModule then
			local placeVersion = dataModel.PlaceVersion
			local minimumPlaceVersion = p35.minimumPlaceVersion
			
			if minimumPlaceVersion ~= nil and (if typeof(placeVersion) == "number" then placeVersion < minimumPlaceVersion else true) then
				return studioClientLogsTool.formatStaleLogsContent()
			end
		end
		local maxEntriesPerSource = p35.maxEntriesPerSource or math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))
		startServerLogCollection(p35)
		
		return studioClientLogsTool.formatLogsContent(collectClientLogs(p35.logService, maxEntriesPerSource), getCollectedServerLogs(maxEntriesPerSource))
	end
}