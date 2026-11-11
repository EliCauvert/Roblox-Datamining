local LogService = game:GetService("LogService")
local TextService = game:GetService("TextService")
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local MainWindow = ConstantsModule.DefaultFontSize.MainWindow
local Log = ConstantsModule.Font.Log
local MaxStringSize = ConstantsModule.LogFormatting.MaxStringSize
local EnumToMsgTypeName = ConstantsModule.EnumToMsgTypeName
local CircularBufferModule = require(script.Parent.Parent.Parent.CircularBuffer)
local SignalModule = require(script.Parent.Parent.Parent.Signal)
local Number: number? = tonumber(settings():GetFVariable("NewDevConsoleMaxLogCount"))
local Patterns = {
	"ClassDescriptor failed to learn",
	"EventDescriptor failed to learn",
	"Type failed to learn"
}
local ConvertTimeStampModule = require(script.Parent.Parent.Parent.Util.convertTimeStamp)
local LogDataModule = {}
LogDataModule.__index = LogDataModule

local function messageEntry(Text: string, p1, Type, Context)
	-- upvalues: MaxStringSize (copy), TextService (copy), MainWindow (copy), Log (copy)
	local CountText = #Text
	local Formatted: string = if CountText < MaxStringSize then string.format("%s -- %s", p1, Text) else string.format("%s -- %s", p1, (string.sub(Text, 1, MaxStringSize)))
	local TextSize = TextService:GetTextSize(Formatted, MainWindow, Log, Vector2.new())
	
	if Context and next(Context) == nil then
		Context = nil
	end
	return {
		Expanded = false,
		Message = Formatted,
		CharCount = CountText,
		Type = Type,
		Dims = TextSize,
		Context = Context
	}
end

local function ignoreWarningMessageOnAdd(p1): boolean
	-- upvalues: Patterns (copy)
	if p1.Type ~= Enum.MessageType.MessageWarning.Value then
		return false
	end
	local Flag = false
	
	for _, pattern in ipairs(Patterns) do
		if string.find(p1.Message, pattern) ~= nil then
			Flag = true
			
			return Flag
		end
	end
	return Flag
end

local function isMessageFiltered(Key, Filters, SearchTerm: string): boolean
	-- upvalues: EnumToMsgTypeName (copy)
	return (#SearchTerm ~= 0 or next(Filters)) and ((not next(Filters) or Filters[EnumToMsgTypeName[Key.Type]]) and (#SearchTerm <= 0 or string.find(Key.Message:lower(), SearchTerm:lower()) ~= nil))
end

local function _(List)
	local v1 = false
	
	for _, value in pairs(List) do
		v1 = v1 or value
	end
	return v1
end

local function filterMessages(LogDataSearched, IteratorResult, Filters, SearchTerm)
	-- upvalues: isMessageFiltered (copy), messageEntry (copy)
	LogDataSearched:reset()
	local v2 = false
	
	for _, filter in pairs(Filters) do
		v2 = v2 or filter
	end
	if #SearchTerm == 0 and not v2 then return end
	local Count = 0
	local Key = IteratorResult:next()
	while Key do
		if isMessageFiltered(Key, Filters, SearchTerm) then
			Count += 1
			LogDataSearched:push_back(Key)
		end
		Key = IteratorResult:next()
	end
	if Count == 0 then
		if #SearchTerm > 0 then
			LogDataSearched:push_back((messageEntry(string.format("\"%s\" was not found", SearchTerm), "", 0)))
			
			return
		end
		LogDataSearched:push_back((messageEntry("No Messages were found", "", 0)))
	end
end

function LogDataModule:checkErrorWarningCounter(p2)
	if p2 == Enum.MessageType.MessageWarning.Value then
		self._warningCount += 1
		self._errorWarningSignal:Fire(self._errorCount, self._warningCount)
		
		return
	end
	if p2 == Enum.MessageType.MessageError.Value then
		self._errorCount += 1
		self._errorWarningSignal:Fire(self._errorCount, self._warningCount)
	end
end

function LogDataModule.new(Number1)
	-- upvalues: LogDataModule (copy), CircularBufferModule (copy), Number (copy), EnumToMsgTypeName (copy), SignalModule (copy)
	local t = {}
	setmetatable(t, LogDataModule)
	t._initialized = false
	t._isRunning = false
	t._isClient = Number1
	t._logData = CircularBufferModule.new(Number)
	t._logDataSearched = CircularBufferModule.new(Number)
	t._searchTerm = ""
	t._commandLineHistory = CircularBufferModule.new(100)
	t._commandLineIndex = 0
	t._filters = {}
	
	for _, value in pairs(EnumToMsgTypeName) do
		t._filters[value] = true
	end
	t._errorCount = Number1 and 0
	t._warningCount = Number1 and 0
	t._logDataUpdate = SignalModule.new()
	t._errorWarningSignal = Number1 and SignalModule.new()
	t._filterUpdated = SignalModule.new()
	
	return t
end

function LogDataModule:Signal()
	return self._logDataUpdate
end

function LogDataModule:errorWarningSignal()
	return self._errorWarningSignal
end

function LogDataModule:filterUpdatedSignal()
	return self._filterUpdated
end

function LogDataModule:setSearchTerm(_searchTerm)
	-- upvalues: filterMessages (copy)
	if self._searchTerm ~= _searchTerm then
		self._searchTerm = _searchTerm
		
		if self._searchTerm == "" then
			self._logDataSearched:reset()
			self._logDataUpdate:Fire(self._logData)
			
			return
		end
		filterMessages(self._logDataSearched, self._logData:iterator(), self._filters, self._searchTerm)
		self._logDataUpdate:Fire(self._logDataSearched)
	end
end

function LogDataModule:getSearchTerm()
	return self._searchTerm
end

function LogDataModule:getCommandLineHistory()
	return self._commandLineHistory
end

function LogDataModule:getCommandLineIndex()
	return self._commandLineIndex
end

function LogDataModule:setCommandLineIndex(_commandLineIndex)
	self._commandLineIndex = _commandLineIndex
end

function LogDataModule:getFilters()
	return self._filters
end

function LogDataModule:setFilter(p2, p3)
	-- upvalues: filterMessages (copy)
	local Filter = self._filters[p2]
	self._filters[p2] = p3
	local v3 = false
	
	for _, filter in pairs(self._filters) do
		v3 = v3 or filter
	end
	if v3 then
		filterMessages(self._logDataSearched, self._logData:iterator(), self._filters, self._searchTerm)
		self._logDataUpdate:Fire(self._logDataSearched)
		self._filterUpdated:Fire()
		
		return
	else
		self._filters[p2] = Filter
	end
end

function LogDataModule:setFilters(_filters)
	-- upvalues: filterMessages (copy)
	self._filters = _filters
	local v4 = false
	
	for _, filter in pairs(_filters) do
		v4 = v4 or filter
	end
	if v4 then
		filterMessages(self._logDataSearched, self._logData:iterator(), self._filters, self._searchTerm)
		self._logDataUpdate:Fire(self._logDataSearched)
		self._filterUpdated:Fire()
		
		return
	else
		self._logDataSearched:reset()
		self._logDataUpdate:Fire(self._logData)
	end
end

function LogDataModule.getLogData(p4)
	return if #p4._logDataSearched:getData() > 0 then p4._logDataSearched else p4._logData
end

function LogDataModule:getErrorWarningCount()
	return self._errorCount, self._warningCount
end

function LogDataModule:isRunning()
	return self._initialized
end

function LogDataModule:start()
	-- upvalues: LogService (copy), messageEntry (copy), ConvertTimeStampModule (copy), ignoreWarningMessageOnAdd (copy), isMessageFiltered (copy)
	if self._isClient then
		if not self._initialized then
			self._initialized = true
			
			if #{} == 0 then
				for _, value in ipairs((LogService:GetLogHistory())) do
					local MessageEntryResult = messageEntry(value.message or "[DevConsole Error 1]", ConvertTimeStampModule(value.timestamp), value.messageType.Value, value.context)
					
					if not ignoreWarningMessageOnAdd(MessageEntryResult) then
						self:checkErrorWarningCounter(value.messageType.Value)
						self._logData:push_back(MessageEntryResult)
					end
				end
			end
		end
		self._connection = LogService.MessageOut:connect(function(Message, MessageType, Context)
			-- upvalues: messageEntry (upval), ConvertTimeStampModule (upval), ignoreWarningMessageOnAdd (upval), self (copy), isMessageFiltered (upval)
			local MessageEntryResult = messageEntry(Message or "[DevConsole Error 2]", ConvertTimeStampModule(os.time()), MessageType.Value, Context)
			
			if not ignoreWarningMessageOnAdd(MessageEntryResult) then
				self:checkErrorWarningCounter(MessageType.Value)
				self._logData:push_back(MessageEntryResult)
				
				if #self._logDataSearched:getData() <= 0 then
					self._logDataUpdate:Fire(self._logData)
				elseif isMessageFiltered(MessageEntryResult, self._filters, self._searchTerm) then
					self._logDataSearched:push_back(MessageEntryResult)
					self._logDataUpdate:Fire(self._logDataSearched)
					
					return
				end
			end
		end)
	else
		self._connection = LogService.ServerMessageOut:connect(function(Message, MessageType, Timestamp, Context)
			-- upvalues: messageEntry (upval), ConvertTimeStampModule (upval), ignoreWarningMessageOnAdd (upval), self (copy), isMessageFiltered (upval)
			local MessageEntryResult = messageEntry(Message or "[DevConsole Error 3]", ConvertTimeStampModule(Timestamp), MessageType.Value, Context)
			
			if not ignoreWarningMessageOnAdd(MessageEntryResult) then
				self._logData:push_back(MessageEntryResult)
				
				if #self._logDataSearched:getData() <= 0 then
					self._logDataUpdate:Fire(self._logData)
				elseif isMessageFiltered(MessageEntryResult, self._filters, self._searchTerm) then
					self._logDataSearched:push_back(MessageEntryResult)
					self._logDataUpdate:Fire(self._logDataSearched)
					
					return
				end
			end
		end)
		pcall(function()
			-- upvalues: self (copy), LogService (upval), messageEntry (upval), ConvertTimeStampModule (upval), ignoreWarningMessageOnAdd (upval), isMessageFiltered (upval)
			self._variantConnection = LogService.ServerContextOut:connect(function(ContextData)
				-- upvalues: messageEntry (upval), ConvertTimeStampModule (upval), ignoreWarningMessageOnAdd (upval), self (upval), isMessageFiltered (upval)
				if type(ContextData) == "table" and ContextData._structuredContext then
					local MessageEntryResult = messageEntry(ContextData._message or "", ConvertTimeStampModule(ContextData._timestamp or 0), ContextData._messageType or 0, ContextData._structuredContext)
					
					if not ignoreWarningMessageOnAdd(MessageEntryResult) then
						self._logData:push_back(MessageEntryResult)
						
						if #self._logDataSearched:getData() <= 0 then
							self._logDataUpdate:Fire(self._logData)
						elseif isMessageFiltered(MessageEntryResult, self._filters, self._searchTerm) then
							self._logDataSearched:push_back(MessageEntryResult)
							self._logDataUpdate:Fire(self._logDataSearched)
							
							return
						end
					end
				end
			end)
		end)
		LogService:RequestServerOutput()
	end
	self._isRunning = true
end

function LogDataModule:stop()
	self._initialized = false
	self._isRunning = false
	
	if self._connection then
		self._connection:Disconnect()
	end
	if self._variantConnection then
		self._variantConnection:Disconnect()
	end
end

return LogDataModule