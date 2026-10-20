local BuildExperience = script:FindFirstAncestor("BuildExperience")
local HttpService = game:GetService("HttpService")
local LogService = game:GetService("LogService")
local MemStorageService = game:GetService("MemStorageService")
local Players = game:GetService("Players")
local FFlagBuildExperienceAskForLogsSeverityRetentionModule = require(BuildExperience.Flags.FFlagBuildExperienceAskForLogsSeverityRetention)
local FFlagBuildExperiencePersistPlaytestLogsModule = require(BuildExperience.Flags.FFlagBuildExperiencePersistPlaytestLogs)
local StudioClientLogsTool = require(BuildExperience.Parent.DataHydration.CreatorAgentChat).StudioClientLogsTool
game:DefineFastInt("MyStatsExperienceAskForLogsMaxEntries", 100)

local function _(): number
	return (math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries")))
end

local config = {
	[Enum.MessageType.MessageOutput.Value] = "Output",
	[Enum.MessageType.MessageInfo.Value] = "Information",
	[Enum.MessageType.MessageWarning.Value] = "Warning",
	[Enum.MessageType.MessageError.Value] = "Error"
}
local config1 = {
	[Enum.MessageType.MessageOutput.Value] = 0,
	[Enum.MessageType.MessageInfo.Value] = 1,
	[Enum.MessageType.MessageWarning.Value] = 2,
	[Enum.MessageType.MessageError.Value] = 3
}

local _ = function(p1)
	return if typeof(p1) == "EnumItem" then p1.Value elseif typeof(p1) == "number" then p1 else nil
end

local _ = function(p1)
	-- upvalues: config (copy)
	local Value = if typeof(p1) == "EnumItem" then p1.Value elseif typeof(p1) == "number" then p1 else nil
	
	return if Value == nil then if typeof(p1) == "EnumItem" then p1.Name elseif typeof(p1) == "string" and p1 ~= "" then p1 else nil else config[Value] or tostring(Value)
end

local _ = function(Input)
	-- upvalues: HttpService (copy)
	return if typeof(Input) == "table" and next(Input) ~= nil then HttpService:JSONEncode(Input) else nil
end

local _ = function(p1)
	-- upvalues: config1 (copy)
	local MessageTypeValue = p1.messageTypeValue
	
	return if MessageTypeValue == nil then 0 else config1[MessageTypeValue] or 0
end

local function trimToCapBySeverity(Entry, Largest)
	-- upvalues: config1 (copy)
	while Largest < #Entry do
		local Index = 1
		local MessageTypeValue = Entry[1].messageTypeValue
		local Entry1 = if MessageTypeValue == nil then 0 else config1[MessageTypeValue] or 0
		for i = 2, #Entry do
			local MessageTypeValue1 = Entry[i].messageTypeValue
			local Entry2 = if MessageTypeValue1 == nil then 0 else config1[MessageTypeValue1] or 0
			
			if Entry2 < Entry1 then
				Entry1 = Entry2
				Index = i
			end
		end
		table.remove(Entry, Index)
	end
end

local function selectRetainedBySeverity(List, Total: number)
	-- upvalues: config1 (copy)
	local List1 = {}
	
	if Total <= 0 then
		return List1
	end
	local CountList = #List
	
	if CountList <= Total then
		table.move(List, 1, CountList, 1, List1)
		
		return List1
	end
	local t = {}
	
	for _, value in List do
		local MessageTypeValue = value.messageTypeValue
		local Entry = if MessageTypeValue == nil then 0 else config1[MessageTypeValue] or 0
		t[Entry] = (t[Entry] or 0) + 1
	end
	local v1 = 0
	local Total1: number = Total
	
	for i = 3, 0, -1 do
		local Entry = t[i] or 0
		
		if Entry < Total1 then
			Total1 -= Entry
			continue
		else
			v1 = i
			break
		end
	end
	local Count = (t[v1] or 0) - Total1
	
	for _, value1 in List do
		local MessageTypeValue = value1.messageTypeValue
		local Entry = if MessageTypeValue == nil then 0 else config1[MessageTypeValue] or 0
		
		if v1 < Entry then
			table.insert(List1, value1)
		elseif Entry == v1 then
			if Count > 0 then
				Count -= 1
			else
				table.insert(List1, value1)
			end
		end
	end
	return List1
end

local _ = function(List, p1, p2: number)
	-- upvalues: FFlagBuildExperienceAskForLogsSeverityRetentionModule (copy), trimToCapBySeverity (copy)
	if p2 <= 0 then return end
	table.insert(List, p1)
	
	if p2 < #List then
		if FFlagBuildExperienceAskForLogsSeverityRetentionModule then
			trimToCapBySeverity(List, p2)
			
			return
		end
		table.remove(List, 1)
	end
end

local function toLogEntry(Message, MessageType, Timestamp, Context)
	-- upvalues: config (copy), HttpService (copy)
	local Value = if typeof(MessageType) == "EnumItem" then MessageType.Value elseif typeof(MessageType) == "number" then MessageType else nil
	
	return {
		message = if typeof(Message) == "string" then Message else tostring(Message or ""),
		messageType = if Value == nil then if typeof(MessageType) == "EnumItem" then MessageType.Name elseif typeof(MessageType) == "string" and MessageType ~= "" then MessageType else nil else config[Value] or tostring(Value),
		messageTypeValue = if typeof(MessageType) == "EnumItem" then MessageType.Value elseif typeof(MessageType) == "number" then MessageType else nil,
		timestamp = if typeof(Timestamp) == "number" then Timestamp else nil,
		contextJson = if typeof(Context) == "table" and next(Context) ~= nil then HttpService:JSONEncode(Context) else nil
	}
end

local List = {}
local ServerMessageOutConnection = nil
local ServerContextOutConnection = nil
local Flag = false
local Largest = math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))
local MessageOutConnection = nil
local PlayerRemovingConnection = nil
local Count = 0
local Flag1 = false
local Callback1 = nil
local Callback = nil

local function collectClientLogs(LogService1, MaxEntriesPerSource)
	-- upvalues: LogService (copy), toLogEntry (copy), FFlagBuildExperienceAskForLogsSeverityRetentionModule (copy), trimToCapBySeverity (copy)
	local MaxEntriesPerSource1 = MaxEntriesPerSource or math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))
	local List = {}
	
	for _, LogEntry in (LogService1 or LogService):GetLogHistory() do
		if typeof(LogEntry) == "table" then
			local LogEntry1 = toLogEntry(LogEntry.message, LogEntry.messageType, LogEntry.timestamp, LogEntry.context)
			
			if MaxEntriesPerSource1 > 0 then
				table.insert(List, LogEntry1)
				
				if MaxEntriesPerSource1 < #List then
					if FFlagBuildExperienceAskForLogsSeverityRetentionModule then
						trimToCapBySeverity(List, MaxEntriesPerSource1)
					else
						table.remove(List, 1)
					end
				end
			end
		end
	end
	return List
end

local function trimServerLogs(Largest)
	-- upvalues: FFlagBuildExperienceAskForLogsSeverityRetentionModule (copy), trimToCapBySeverity (copy), List (ref)
	if FFlagBuildExperienceAskForLogsSeverityRetentionModule then
		trimToCapBySeverity(List, Largest)
		
		return
	end
	while Largest < #List do
		table.remove(List, 1)
	end
end

local function startServerLogCollection(p1): boolean
	-- upvalues: Flag (ref), LogService (copy), Largest (ref), trimServerLogs (copy), ServerMessageOutConnection (ref), List (ref), toLogEntry (copy), FFlagBuildExperienceAskForLogsSeverityRetentionModule (copy), trimToCapBySeverity (copy), Callback1 (ref), ServerContextOutConnection (ref), FFlagBuildExperiencePersistPlaytestLogsModule (copy), Callback (ref)
	local P16 = p1 or {}
	
	if (P16.dataModel or game).GameId == 0 then
		return false
	end
	if Flag then
		return true
	end
	local LogService1 = P16.logService or LogService
	Largest = P16.maxEntriesPerSource or math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))
	trimServerLogs(Largest)
	ServerMessageOutConnection = LogService1.ServerMessageOut:Connect(function(Message, MessageType, Timestamp, p2)
		-- upvalues: List (upval), toLogEntry (upval), Largest (upval), FFlagBuildExperienceAskForLogsSeverityRetentionModule (upval), trimToCapBySeverity (upval), Callback1 (upval)
		local List1 = List
		local LogEntry = toLogEntry(Message, MessageType, Timestamp, p2)
		local Largest1: number = Largest
		
		if Largest1 > 0 then
			table.insert(List1, LogEntry)
			
			if Largest1 < #List1 then
				if FFlagBuildExperienceAskForLogsSeverityRetentionModule then
					trimToCapBySeverity(List1, Largest1)
				else
					table.remove(List1, 1)
				end
			end
		end
		if Callback1 ~= nil then
			Callback1()
		end
	end)
	ServerContextOutConnection = LogService1.ServerContextOut:Connect(function(ContextData)
		-- upvalues: List (upval), toLogEntry (upval), Largest (upval), FFlagBuildExperienceAskForLogsSeverityRetentionModule (upval), trimToCapBySeverity (upval), Callback1 (upval)
		if typeof(ContextData) ~= "table" or ContextData._structuredContext == nil then return end
		local List1 = List
		local LogEntry = toLogEntry(ContextData._message, ContextData._messageType, ContextData._timestamp, ContextData._structuredContext)
		local Largest1: number = Largest
		
		if Largest1 > 0 then
			table.insert(List1, LogEntry)
			
			if Largest1 < #List1 then
				if FFlagBuildExperienceAskForLogsSeverityRetentionModule then
					trimToCapBySeverity(List1, Largest1)
				else
					table.remove(List1, 1)
				end
			end
		end
		if Callback1 ~= nil then
			Callback1()
		end
	end)
	LogService1:RequestServerOutput()
	Flag = true
	
	if FFlagBuildExperiencePersistPlaytestLogsModule and Callback ~= nil then
		Callback(P16)
	end
	return true
end

local function getCollectedServerLogs(MaxEntriesPerSource)
	-- upvalues: FFlagBuildExperienceAskForLogsSeverityRetentionModule (copy), selectRetainedBySeverity (copy), List (ref)
	local MaxEntriesPerSource1 = MaxEntriesPerSource or math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))
	
	if FFlagBuildExperienceAskForLogsSeverityRetentionModule then
		return (selectRetainedBySeverity(List, MaxEntriesPerSource1))
	end
	local List1 = {}
	
	for i = math.max(1, #List - MaxEntriesPerSource1 + 1), #List do
		table.insert(List1, List[i])
	end
	return List1
end

local _ = function(p1): string
	return `BuildExperiencePlaytestLogs:{p1}`
end

local _ = function(p1, p2, p3)
	-- upvalues: HttpService (copy)
	local Success, Result = pcall(HttpService.JSONEncode, HttpService, p3)
	
	if Success and typeof(Result) == "string" then
		pcall(p1.SetItem, p1, p2, Result)
		
		return
	end
end

Callback = function(p1)
	-- upvalues: LogService (copy), MemStorageService (copy), Players (copy), Count (ref), Flag1 (ref), collectClientLogs (copy), getCollectedServerLogs (copy), HttpService (copy), Callback1 (ref), MessageOutConnection (ref), PlayerRemovingConnection (ref)
	local DataModel = p1.dataModel or game
	local GameId = DataModel.GameId
	local PlaceId = DataModel.PlaceId
	local PlaceVersion = DataModel.PlaceVersion
	
	if typeof(GameId) == "number" and GameId ~= 0 and typeof(PlaceId) == "number" and typeof(PlaceVersion) == "number" then
		local LogService1 = p1.logService or LogService
		local MemStorageService1 = p1.memStorageService or MemStorageService
		local PlayersService = p1.playersService or Players
		local MaxEntriesPerSource = p1.maxEntriesPerSource or math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))
		local BuildExperiencePlaytestLogsName: string = `BuildExperiencePlaytestLogs:{GameId}`
		Count += 1
		local Count1: number = Count
		Flag1 = false
		pcall(MemStorageService1.SetItem, MemStorageService1, BuildExperiencePlaytestLogsName, "")
		
		local function persistNow()
			-- upvalues: Count1 (copy), Count (upval), collectClientLogs (upval), LogService1 (copy), MaxEntriesPerSource (copy), MemStorageService1 (copy), BuildExperiencePlaytestLogsName (copy), GameId (copy), PlaceId (copy), PlaceVersion (copy), getCollectedServerLogs (upval), HttpService (upval)
			if Count1 ~= Count then return end
			local Success, Result = pcall(collectClientLogs, LogService1, MaxEntriesPerSource)
			
			if not Success then return end
			local Success1, Result1 = pcall(HttpService.JSONEncode, HttpService, {
				schemaVersion = 1,
				universeId = GameId,
				placeId = PlaceId,
				placeVersion = PlaceVersion,
				clientLogs = Result,
				serverLogs = getCollectedServerLogs(MaxEntriesPerSource)
			})
			
			if Success1 then
				if typeof(Result1) ~= "string" then return end
				pcall(MemStorageService1.SetItem, MemStorageService1, BuildExperiencePlaytestLogsName, Result1)
			end
		end
		
		local function scheduleWrite()
			-- upvalues: Count1 (copy), Count (upval), Flag1 (upval), persistNow (copy), p1 (copy)
			if Count1 ~= Count or Flag1 then return end
			Flag1 = true
			
			local function writeAfterDelay()
				-- upvalues: Count1 (upval), Count (upval), Flag1 (upval), persistNow (upval)
				if Count1 == Count then
					Flag1 = false
					persistNow()
					
					return
				end
			end
			
			if p1.schedule == nil then
				task.delay(1, writeAfterDelay)
				
				return
			else
				p1.schedule(1, writeAfterDelay)
			end
		end
		
		Callback1 = scheduleWrite
		MessageOutConnection = LogService1.MessageOut:Connect(scheduleWrite)
		local LocalPlayer = PlayersService.LocalPlayer
		PlayerRemovingConnection = PlayersService.PlayerRemoving:Connect(function(Player)
			-- upvalues: LocalPlayer (copy), persistNow (copy)
			if Player == LocalPlayer then
				persistNow()
			end
		end)
		scheduleWrite()
		
		return
	end
end

local function readLogSnapshot(p1)
	-- upvalues: MemStorageService (copy), HttpService (copy)
	local UniverseId = p1.universeId
	local PlaceId = p1.placeId
	
	if typeof(UniverseId) ~= "number" or UniverseId == 0 or typeof(PlaceId) ~= "number" then
		return nil
	end
	local MemStorageService1 = p1.memStorageService or MemStorageService
	local Success, Result = pcall(MemStorageService1.GetItem, MemStorageService1, `BuildExperiencePlaytestLogs:{UniverseId}`)
	
	if Success and typeof(Result) == "string" and Result ~= "" then
		local Success1, Result1 = pcall(HttpService.JSONDecode, HttpService, Result)
		
		return if Success1 and typeof(Result1) == "table" and (Result1.schemaVersion == 1 and Result1.universeId == UniverseId and Result1.placeId == PlaceId and typeof(Result1.placeVersion) == "number" and typeof(Result1.clientLogs) == "table" and typeof(Result1.serverLogs) == "table") then Result1 else nil
	else
		return nil
	end
end

local _ = function(p1, p2): boolean
	return p2 ~= nil and (typeof(p1) ~= "number" or p1 < p2)
end

return {
	startServerLogCollection = startServerLogCollection,
	stopServerLogCollection = function(Enabled)
		-- upvalues: ServerMessageOutConnection (ref), ServerContextOutConnection (ref), MessageOutConnection (ref), PlayerRemovingConnection (ref), Count (ref), Flag1 (ref), Callback1 (ref), Flag (ref), List (ref)
		if ServerMessageOutConnection ~= nil then
			ServerMessageOutConnection:Disconnect()
			ServerMessageOutConnection = nil
		end
		if ServerContextOutConnection ~= nil then
			ServerContextOutConnection:Disconnect()
			ServerContextOutConnection = nil
		end
		if MessageOutConnection ~= nil then
			MessageOutConnection:Disconnect()
			MessageOutConnection = nil
		end
		if PlayerRemovingConnection ~= nil then
			PlayerRemovingConnection:Disconnect()
			PlayerRemovingConnection = nil
		end
		Count += 1
		Flag1 = false
		Callback1 = nil
		Flag = false
		
		if Enabled == true then
			List = {}
		end
	end,
	collectToolResultContent = function(p1)
		-- upvalues: FFlagBuildExperiencePersistPlaytestLogsModule (copy), readLogSnapshot (copy), StudioClientLogsTool (copy), startServerLogCollection (copy), collectClientLogs (copy), getCollectedServerLogs (copy)
		local P32 = p1 or {}
		local DataModel = P32.dataModel or game
		
		if DataModel.GameId == 0 then
			if FFlagBuildExperiencePersistPlaytestLogsModule then
				local LogSnapshot = readLogSnapshot(P32)
				
				if LogSnapshot ~= nil then
					local PlaceVersion = LogSnapshot.placeVersion
					local MinimumPlaceVersion = P32.minimumPlaceVersion
					local IsNotNumber: boolean = MinimumPlaceVersion ~= nil and (typeof(PlaceVersion) ~= "number" or PlaceVersion < MinimumPlaceVersion)
					
					return if IsNotNumber then StudioClientLogsTool.formatStaleLogsContent() else StudioClientLogsTool.formatLogsContent(LogSnapshot.clientLogs, LogSnapshot.serverLogs)
				end
			end
			return StudioClientLogsTool.formatNotInGameContent()
		else
			if FFlagBuildExperiencePersistPlaytestLogsModule then
				local PlaceVersion = DataModel.PlaceVersion
				local MinimumPlaceVersion = P32.minimumPlaceVersion
				
				if MinimumPlaceVersion ~= nil and (typeof(PlaceVersion) ~= "number" or PlaceVersion < MinimumPlaceVersion) then
					return StudioClientLogsTool.formatStaleLogsContent()
				end
			end
			local MaxEntriesPerSource = P32.maxEntriesPerSource or math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))
			startServerLogCollection(P32)
			
			return StudioClientLogsTool.formatLogsContent(collectClientLogs(P32.logService, MaxEntriesPerSource), (getCollectedServerLogs(MaxEntriesPerSource)))
		end
	end
}