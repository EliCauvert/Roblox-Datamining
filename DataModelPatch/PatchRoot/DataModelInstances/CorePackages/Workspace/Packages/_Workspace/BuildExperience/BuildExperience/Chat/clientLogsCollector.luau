local HttpService = game:GetService("HttpService")
local LogService = game:GetService("LogService")
local StudioClientLogsTool = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorAgentChat).StudioClientLogsTool
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

local _ = function(List, p1, p2: number)
	if p2 <= 0 then return end
	table.insert(List, p1)
	
	if p2 < #List then
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

local function collectClientLogs(LogService1, MaxEntriesPerSource)
	-- upvalues: LogService (copy), toLogEntry (copy)
	local MaxEntriesPerSource1 = MaxEntriesPerSource or math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))
	local List = {}
	
	for _, LogEntry in (LogService1 or LogService):GetLogHistory() do
		if typeof(LogEntry) == "table" then
			local LogEntry1 = toLogEntry(LogEntry.message, LogEntry.messageType, LogEntry.timestamp, LogEntry.context)
			
			if MaxEntriesPerSource1 > 0 then
				table.insert(List, LogEntry1)
				
				if MaxEntriesPerSource1 < #List then
					table.remove(List, 1)
				end
			end
		end
	end
	return List
end

local _ = function(p1)
	-- upvalues: List (ref)
	while p1 < #List do
		table.remove(List, 1)
	end
end

local function startServerLogCollection(p2): boolean
	-- upvalues: Flag (ref), LogService (copy), Largest (ref), List (ref), ServerMessageOutConnection (ref), toLogEntry (copy), ServerContextOutConnection (ref)
	local P12 = p2 or {}
	
	if (P12.dataModel or game).GameId == 0 then
		return false
	end
	if Flag then
		return true
	end
	local LogService1 = P12.logService or LogService
	Largest = P12.maxEntriesPerSource or math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))
	local Largest1 = Largest
	while Largest1 < #List do
		table.remove(List, 1)
	end
	ServerMessageOutConnection = LogService1.ServerMessageOut:Connect(function(Message, MessageType, Timestamp, p3)
		-- upvalues: List (upval), toLogEntry (upval), Largest (upval)
		local List1 = List
		local LogEntry = toLogEntry(Message, MessageType, Timestamp, p3)
		local Largest1: number = Largest
		
		if Largest1 <= 0 then return end
		table.insert(List1, LogEntry)
		
		if Largest1 < #List1 then
			table.remove(List1, 1)
		end
	end)
	ServerContextOutConnection = LogService1.ServerContextOut:Connect(function(ContextData)
		-- upvalues: List (upval), toLogEntry (upval), Largest (upval)
		if typeof(ContextData) ~= "table" or ContextData._structuredContext == nil then return end
		local List1 = List
		local LogEntry = toLogEntry(ContextData._message, ContextData._messageType, ContextData._timestamp, ContextData._structuredContext)
		local Largest1: number = Largest
		
		if Largest1 <= 0 then return end
		table.insert(List1, LogEntry)
		
		if Largest1 < #List1 then
			table.remove(List1, 1)
		end
	end)
	LogService1:RequestServerOutput()
	Flag = true
	
	return true
end

local function getCollectedServerLogs(MaxEntriesPerSource)
	-- upvalues: List (ref)
	local List1 = {}
	
	for i = math.max(1, #List - (MaxEntriesPerSource or math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))) + 1), #List do
		table.insert(List1, List[i])
	end
	return List1
end

return {
	startServerLogCollection = startServerLogCollection,
	stopServerLogCollection = function(Enabled)
		-- upvalues: ServerMessageOutConnection (ref), ServerContextOutConnection (ref), Flag (ref), List (ref)
		if ServerMessageOutConnection ~= nil then
			ServerMessageOutConnection:Disconnect()
			ServerMessageOutConnection = nil
		end
		if ServerContextOutConnection ~= nil then
			ServerContextOutConnection:Disconnect()
			ServerContextOutConnection = nil
		end
		Flag = false
		
		if Enabled == true then
			List = {}
		end
	end,
	collectToolResultContent = function(p3)
		-- upvalues: StudioClientLogsTool (copy), startServerLogCollection (copy), collectClientLogs (copy), getCollectedServerLogs (copy)
		local P19 = p3 or {}
		
		if (P19.dataModel or game).GameId == 0 then
			return StudioClientLogsTool.formatNotInGameContent()
		else
			local MaxEntriesPerSource = P19.maxEntriesPerSource or math.max(0, game:GetFastInt("MyStatsExperienceAskForLogsMaxEntries"))
			startServerLogCollection(P19)
			
			return StudioClientLogsTool.formatLogsContent(collectClientLogs(P19.logService, MaxEntriesPerSource), (getCollectedServerLogs(MaxEntriesPerSource)))
		end
	end
}