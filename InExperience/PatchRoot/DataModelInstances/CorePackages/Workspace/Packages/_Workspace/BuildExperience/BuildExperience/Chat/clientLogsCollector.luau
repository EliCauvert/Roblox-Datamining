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

local function _()
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

local _ = function(p1)
	return if typeof(p1) == "EnumItem" then p1.Value elseif typeof(p1) == "number" then p1 else nil
end

local _ = function(p1)
	-- upvalues: t (ref)
	local var1 = if typeof(p1) == "EnumItem" then p1.Value elseif typeof(p1) == "number" then p1 else nil
	
	return if var1 == nil then if typeof(p1) == "EnumItem" then p1.Name elseif typeof(p1) == "string" and p1 ~= "" then p1 else nil else t[var1] or tostring(var1)
end

local _ = function(p1)
	-- upvalues: httpService (ref)
	return if typeof(p1) == "table" and next(p1) ~= nil then httpService:JSONEncode(p1) else nil
end

local _ = function(p1)
	-- upvalues: t_1 (ref)
	local messageTypeValue = p1.messageTypeValue
	
	return if messageTypeValue == nil then 0 else t_1[messageTypeValue] or 0
end

local function trimToCapBySeverity(p1, p2)
	-- upvalues: t_1 (ref)
	while p2 < #p1 do
		local var1 = 1
		local messageTypeValue = p1[1].messageTypeValue
		local var2 = if messageTypeValue == nil then 0 else t_1[messageTypeValue] or 0
		
		for i = 2, #p1 do
			local messageTypeValue_1 = p1[i].messageTypeValue
			local var3 = if messageTypeValue_1 == nil then 0 else t_1[messageTypeValue_1] or 0
			
			if var3 < var2 then
				var2 = var3
				var1 = i
			end
		end
		table.remove(p1, var1)
	end
end

local function selectRetainedBySeverity(p3, p4)
	-- upvalues: t_1 (ref)
	local t = {}
	
	if p4 <= 0 then
		return t
	end
	local p6Count = #p3
	
	if p6Count <= p4 then
		table.move(p3, 1, p6Count, 1, t)
		
		return t
	end
	local t_2 = {}
	
	for i, v in p3 do
		local messageTypeValue = v.messageTypeValue
		local var4 = if messageTypeValue == nil then 0 else t_1[messageTypeValue] or 0
		t_2[var4] = (t_2[var4] or 0) + 1
	end
	local var5 = 0
	local var6 = p4
	
	for i = 3, 0, -1 do
		local var7 = t_2[i] or 0
		
		if var7 >= var6 then
			var5 = i
			break
		end
		var6 -= var7
	end
	local var8 = (t_2[var5] or 0) - var6
	
	for i_1, v in p3 do
		local messageTypeValue = v.messageTypeValue
		local var9 = if messageTypeValue == nil then 0 else t_1[messageTypeValue] or 0
		
		if var5 < var9 then
			table.insert(t, v)
		elseif var9 == var5 then
			if var8 > 0 then
				var8 -= 1
			else
				table.insert(t, v)
			end
		end
	end
	return t
end

local _ = function(p5, p6, p7)
	-- upvalues: fFlagBuildExperienceAskForLogsSeverityRetentionModule (ref), trimToCapBySeverity (ref)
	if p7 <= 0 then return end
	table.insert(p5, p6)
	
	if p7 < #p5 then
		if fFlagBuildExperienceAskForLogsSeverityRetentionModule then
			trimToCapBySeverity(p5, p7)
			
			return
		end
		table.remove(p5, 1)
	end
end

local function toLogEntry(p5, p6, p7, p8)
	-- upvalues: t (ref), httpService (ref)
	local var10 = if typeof(p7) == "number" then p7 else nil
	local t_1 = {
		message = if typeof(p5) == "string" then p5 else tostring(p5 or "")
	}
	local var11 = if typeof(p6) == "EnumItem" then p6.Value elseif typeof(p6) == "number" then p6 else nil
	t_1.messageType = if var11 ~= nil then if typeof(p6) == "EnumItem" then p6.Name elseif typeof(p6) == "string" and p6 ~= "" then p6 else nil else t[var11] or tostring(var11)
	t_1.messageTypeValue = if typeof(p6) == "EnumItem" then p6.Value elseif typeof(p6) == "number" then p6 else nil
	t_1.timestamp = var10
	t_1.contextJson = if typeof(p8) == "table" and next(p8) ~= nil then httpService:JSONEncode(p8) else nil
	
	return t_1
end

local t_2 = {}
local var10 = nil
local var11 = nil
local var12 = false
local maxValue = math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))
local var13 = nil
local var14 = nil
local var15 = 0
local var16 = false
local var17 = nil
local var18 = nil

local function collectClientLogs(p5, p6)
	-- upvalues: logService (ref), toLogEntry (ref), fFlagBuildExperienceAskForLogsSeverityRetentionModule (ref), trimToCapBySeverity (ref)
	p5 = p5 or logService
	p6 = p6 or math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))
	local t = {}
	
	for i, v in p5:GetLogHistory() do
		if typeof(v) == "table" then
			local var19 = toLogEntry(v.message, v.messageType, v.timestamp, v.context)
			
			if p6 > 0 then
				table.insert(t, var19)
				
				if p6 < #t then
					if fFlagBuildExperienceAskForLogsSeverityRetentionModule then
						trimToCapBySeverity(t, p6)
					else
						table.remove(t, 1)
					end
				end
			end
		end
	end
	return t
end

local function trimServerLogs(p7)
	-- upvalues: fFlagBuildExperienceAskForLogsSeverityRetentionModule (ref), trimToCapBySeverity (ref), t_2 (write)
	if fFlagBuildExperienceAskForLogsSeverityRetentionModule then
		trimToCapBySeverity(t_2, p7)
		
		return
	end
	while p7 < #t_2 do
		table.remove(t_2, 1)
	end
end

local function stopServerLogCollection(p8)
	-- upvalues: var10 (write), var11 (write), var13 (write), var14 (write), var15 (write), var16 (write), var17 (write), var12 (write), t_2 (write)
	if var10 ~= nil then
		var10:Disconnect()
		var10 = nil
	end
	if var11 ~= nil then
		var11:Disconnect()
		var11 = nil
	end
	if var13 ~= nil then
		var13:Disconnect()
		var13 = nil
	end
	if var14 ~= nil then
		var14:Disconnect()
		var14 = nil
	end
	var15 += 1
	var16 = false
	var17 = nil
	var12 = false
	
	if p8 == true then
		t_2 = {}
	end
end

local function startServerLogCollection(p8)
	-- upvalues: var12 (write), logService (ref), maxValue (write), trimServerLogs (ref), var10 (write), t_2 (write), toLogEntry (ref), fFlagBuildExperienceAskForLogsSeverityRetentionModule (ref), trimToCapBySeverity (ref), var17 (write), var11 (write), fFlagBuildExperiencePersistPlaytestLogsModule (ref), var18 (write)
	p8 = p8 or {}
	
	if (p8.dataModel or game).GameId == 0 then
		return false
	elseif var12 then
		return true
	end
	local logService_1 = p8.logService or logService
	maxValue = p8.maxEntriesPerSource or math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))
	trimServerLogs(maxValue)
	var10 = logService_1.ServerMessageOut:Connect(function(p9, p10, p11, p12)
		-- upvalues: t_2 (copy), toLogEntry (copy), maxValue (copy), fFlagBuildExperienceAskForLogsSeverityRetentionModule (copy), trimToCapBySeverity (copy), var17 (copy)
		local var20 = toLogEntry(p9, p10, p11, p12)
		
		if maxValue > 0 then
			table.insert(t_2, var20)
			
			if maxValue < #t_2 then
				if fFlagBuildExperienceAskForLogsSeverityRetentionModule then
					trimToCapBySeverity(t_2, maxValue)
				else
					table.remove(t_2, 1)
				end
			end
		end
		if var17 ~= nil then
			var17()
		end
	end)
	var11 = logService_1.ServerContextOut:Connect(function(p9)
		-- upvalues: t_2 (copy), toLogEntry (copy), maxValue (copy), fFlagBuildExperienceAskForLogsSeverityRetentionModule (copy), trimToCapBySeverity (copy), var17 (copy)
		if typeof(p9) ~= "table" or p9._structuredContext == nil then return end
		local var20 = toLogEntry(p9._message, p9._messageType, p9._timestamp, p9._structuredContext)
		
		if maxValue > 0 then
			table.insert(t_2, var20)
			
			if maxValue < #t_2 then
				if fFlagBuildExperienceAskForLogsSeverityRetentionModule then
					trimToCapBySeverity(t_2, maxValue)
				else
					table.remove(t_2, 1)
				end
			end
		end
		if var17 ~= nil then
			var17()
		end
	end)
	logService_1:RequestServerOutput()
	var12 = true
	
	if fFlagBuildExperiencePersistPlaytestLogsModule and var18 ~= nil then
		var18(p8)
	end
	return true
end

local function getCollectedServerLogs(p8)
	-- upvalues: fFlagBuildExperienceAskForLogsSeverityRetentionModule (ref), selectRetainedBySeverity (ref), t_2 (write)
	p8 = p8 or math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))
	
	if fFlagBuildExperienceAskForLogsSeverityRetentionModule then
		return selectRetainedBySeverity(t_2, p8)
	end
	local t = {}
	
	for i = math.max(1, #t_2 - p8 + 1), #t_2 do
		table.insert(t, t_2[i])
	end
	return t
end

local _ = function(p9)
	return `BuildExperiencePlaytestLogs:{p9}`
end

local _ = function(p9, p10, p11)
	-- upvalues: httpService (ref)
	local ok, status = pcall(httpService.JSONEncode, httpService, p11)
	
	if ok and typeof(status) == "string" then
		pcall(p9.SetItem, p9, p10, status)
		
		return
	end
end

var18 = function(p9)
	-- upvalues: logService (ref), memStorageService (ref), playersService (ref), var15 (write), var16 (write), collectClientLogs (ref), getCollectedServerLogs (ref), httpService (ref), var17 (write), var13 (write), var14 (write)
	local dataModel = p9.dataModel or game
	local gameId = dataModel.GameId
	local placeId = dataModel.PlaceId
	local placeVersion = dataModel.PlaceVersion
	
	if typeof(gameId) == "number" and gameId ~= 0 and (typeof(placeId) == "number" and typeof(placeVersion) == "number") then
		local logService_1 = p9.logService or logService
		local memStorageService_1 = p9.memStorageService or memStorageService
		local playersService_1 = p9.playersService or playersService
		local maxEntriesPerSource = p9.maxEntriesPerSource or math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))
		local var20 = `BuildExperiencePlaytestLogs:{gameId}`
		var15 += 1
		local var21 = var15
		var16 = false
		pcall(memStorageService_1.SetItem, memStorageService_1, var20, "")
		
		local function persistNow()
			-- upvalues: var21 (ref), var15 (copy), collectClientLogs (copy), logService_1 (ref), maxEntriesPerSource (ref), memStorageService_1 (ref), var20 (ref), gameId (ref), placeId (ref), placeVersion (ref), getCollectedServerLogs (copy), httpService (copy)
			if var21 ~= var15 then return end
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
				pcall(memStorageService_1.SetItem, memStorageService_1, var20, status_1)
			end
		end
		
		local function scheduleWrite()
			-- upvalues: var21 (ref), var15 (copy), var16 (copy), persistNow (ref), p9 (ref)
			if var21 ~= var15 or var16 then return end
			var16 = true
			
			local function writeAfterDelay()
				-- upvalues: var21 (copy), var15 (copy), var16 (copy), persistNow (copy)
				if var21 == var15 then
					var16 = false
					persistNow()
					
					return
				end
			end
			
			if p9.schedule == nil then
				task.delay(1, writeAfterDelay)
				
				return
			end
			p9.schedule(1, writeAfterDelay)
		end
		
		var17 = scheduleWrite
		var13 = logService_1.MessageOut:Connect(scheduleWrite)
		local localPlayer = playersService_1.LocalPlayer
		var14 = playersService_1.PlayerRemoving:Connect(function(p10)
			-- upvalues: localPlayer (ref), persistNow (ref)
			if p10 == localPlayer then
				persistNow()
			end
		end)
		scheduleWrite()
		
		return
	end
end

local function readLogSnapshot(p9)
	-- upvalues: memStorageService (ref), httpService (ref)
	local universeId = p9.universeId
	local placeId = p9.placeId
	
	if typeof(universeId) ~= "number" or universeId == 0 or typeof(placeId) ~= "number" then
		return nil
	end
	local memStorageService_1 = p9.memStorageService or memStorageService
	local ok, status = pcall(memStorageService_1.GetItem, memStorageService_1, `BuildExperiencePlaytestLogs:{universeId}`)
	
	if not ok or typeof(status) ~= "string" or status == "" then
		return nil
	end
	local ok_1, status_1 = pcall(httpService.JSONDecode, httpService, status)
	
	return if not (not ok_1 or typeof(status_1) ~= "table") then if status_1.schemaVersion == 1 and status_1.universeId == universeId and (status_1.placeId == placeId and typeof(status_1.placeVersion) == "number") and (typeof(status_1.clientLogs) == "table" and typeof(status_1.serverLogs) == "table") then status_1 else nil else nil
end

local _ = function(p9, p10)
	return p10 ~= nil and (if typeof(p9) == "number" then p9 < p10 else true)
end

return {
	startServerLogCollection = startServerLogCollection,
	stopServerLogCollection = stopServerLogCollection,
	collectToolResultContent = function(p9)
		-- upvalues: fFlagBuildExperiencePersistPlaytestLogsModule (ref), readLogSnapshot (ref), studioClientLogsTool (ref), startServerLogCollection (ref), collectClientLogs (ref), getCollectedServerLogs (ref)
		p9 = p9 or {}
		local dataModel = p9.dataModel or game
		
		if dataModel.GameId == 0 then
			if fFlagBuildExperiencePersistPlaytestLogsModule then
				local var20 = readLogSnapshot(p9)
				
				if var20 == nil then
					return studioClientLogsTool.formatNotInGameContent()
				else
					local placeVersion = var20.placeVersion
					local minimumPlaceVersion = p9.minimumPlaceVersion
					
					return if minimumPlaceVersion ~= nil and (if typeof(placeVersion) == "number" then placeVersion < minimumPlaceVersion else true) then studioClientLogsTool.formatStaleLogsContent() else studioClientLogsTool.formatLogsContent(var20.clientLogs, var20.serverLogs)
				end
			end
		elseif fFlagBuildExperiencePersistPlaytestLogsModule then
			local placeVersion = dataModel.PlaceVersion
			local minimumPlaceVersion = p9.minimumPlaceVersion
			
			if minimumPlaceVersion ~= nil and (if typeof(placeVersion) == "number" then placeVersion < minimumPlaceVersion else true) then
				return studioClientLogsTool.formatStaleLogsContent()
			end
		end
		local maxEntriesPerSource = p9.maxEntriesPerSource or math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))
		startServerLogCollection(p9)
		
		return studioClientLogsTool.formatLogsContent(collectClientLogs(p9.logService, maxEntriesPerSource), getCollectedServerLogs(maxEntriesPerSource))
	end
}