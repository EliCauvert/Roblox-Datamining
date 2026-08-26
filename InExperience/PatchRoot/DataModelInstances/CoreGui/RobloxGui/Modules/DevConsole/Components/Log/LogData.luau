local logService = game:GetService("LogService")
local textService = game:GetService("TextService")
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local mainWindow = constantsModule.DefaultFontSize.MainWindow
local log = constantsModule.Font.Log
local maxStringSize = constantsModule.LogFormatting.MaxStringSize
local enumToMsgTypeName = constantsModule.EnumToMsgTypeName
local circularBufferModule = require(script.Parent.Parent.Parent.CircularBuffer)
local signalModule = require(script.Parent.Parent.Parent.Signal)
local var1 = tonumber(settings():GetFVariable("NewDevConsoleMaxLogCount"))
local list = {
	"ClassDescriptor failed to learn",
	"EventDescriptor failed to learn",
	"Type failed to learn"
}
local convertTimeStampModule = require(script.Parent.Parent.Parent.Util.convertTimeStamp)
local t = {}
t.__index = t

local function messageEntry(p1, p2, p3, p4)
	-- upvalues: maxStringSize (ref), textService (ref), mainWindow (ref), log (ref)
	local _ = nil
	local p0Count = #p1
	local var2 = if p0Count < maxStringSize then string.format("%s -- %s", p2, p1) else string.format("%s -- %s", p2, string.sub(p1, 1, maxStringSize))
	local var3 = textService:GetTextSize(var2, mainWindow, log, Vector2.new())
	
	if p4 and next(p4) == nil then
		p4 = nil
	end
	return {
		Expanded = false,
		Message = var2,
		CharCount = p0Count,
		Type = p3,
		Dims = var3,
		Context = p4
	}
end

local function ignoreWarningMessageOnAdd(p1)
	-- upvalues: list (ref)
	if p1.Type ~= Enum.MessageType.MessageWarning.Value then
		return false
	end
	local var2 = false
	
	for i, v in ipairs(list) do
		if string.find(p1.Message, v) ~= nil then
			var2 = true
			
			return var2
		end
	end
	return var2
end

local function isMessageFiltered(p2, p3, p4)
	-- upvalues: enumToMsgTypeName (ref)
	return if #p4 == 0 and not next(p3) then false elseif next(p3) and not p3[enumToMsgTypeName[p2.Type]] then false else #p4 > 0 and string.find(p2.Message:lower(), p4:lower()) == nil
end

local function _(p2)
	local var3 = false
	
	for i, v in pairs(p2) do
		var3 = var3 or v
	end
	return var3
end

local function filterMessages(p3, p4, p5, p6)
	-- upvalues: isMessageFiltered (ref), messageEntry (ref)
	p3:reset()
	local var4 = false
	
	for i, v in pairs(p5) do
		var4 = var4 or v
	end
	if #p6 == 0 and not var4 then return end
	local var5 = 0
	local var6 = p4:next()
	while var6 do
		if isMessageFiltered(var6, p5, p6) then
			var5 += 1
			p3:push_back(var6)
		end
		var6 = p4:next()
	end
	if var5 == 0 then
		if #p6 > 0 then
			p3:push_back(messageEntry(string.format("\"%s\" was not found", p6), "", 0))
			
			return
		end
		p3:push_back(messageEntry("No Messages were found", "", 0))
	end
end

function t:checkErrorWarningCounter(p7)
	if p7 == Enum.MessageType.MessageWarning.Value then
		self._warningCount += 1
		self._errorWarningSignal:Fire(self._errorCount, self._warningCount)
		
		return
	elseif p7 == Enum.MessageType.MessageError.Value then
		self._errorCount += 1
		self._errorWarningSignal:Fire(self._errorCount, self._warningCount)
	end
end

function t.new(p7)
	-- upvalues: t (ref), circularBufferModule (ref), var1 (ref), enumToMsgTypeName (ref), signalModule (ref)
	local t_1 = {}
	setmetatable(t_1, t)
	t_1._initialized = false
	t_1._isRunning = false
	t_1._isClient = p7
	t_1._logData = circularBufferModule.new(var1)
	t_1._logDataSearched = circularBufferModule.new(var1)
	t_1._searchTerm = ""
	t_1._commandLineHistory = circularBufferModule.new(100)
	t_1._commandLineIndex = 0
	t_1._filters = {}
	
	for i, v in pairs(enumToMsgTypeName) do
		t_1._filters[v] = true
	end
	t_1._errorCount = p7 and 0
	t_1._warningCount = p7 and 0
	t_1._logDataUpdate = signalModule.new()
	t_1._errorWarningSignal = p7 and signalModule.new()
	t_1._filterUpdated = signalModule.new()
	
	return t_1
end

function t:Signal()
	return self._logDataUpdate
end

function t:errorWarningSignal()
	return self._errorWarningSignal
end

function t:filterUpdatedSignal()
	return self._filterUpdated
end

function t:setSearchTerm(p8)
	-- upvalues: filterMessages (ref)
	if self._searchTerm ~= p8 then
		self._searchTerm = p8
		
		if self._searchTerm == "" then
			self._logDataSearched:reset()
			self._logDataUpdate:Fire(self._logData)
			
			return
		end
		filterMessages(self._logDataSearched, self._logData:iterator(), self._filters, self._searchTerm)
		self._logDataUpdate:Fire(self._logDataSearched)
	end
end

function t:getSearchTerm()
	return self._searchTerm
end

function t:getCommandLineHistory()
	return self._commandLineHistory
end

function t:getCommandLineIndex()
	return self._commandLineIndex
end

function t:setCommandLineIndex(p8)
	self._commandLineIndex = p8
end

function t:getFilters()
	return self._filters
end

function t:setFilter(p8, p9)
	-- upvalues: filterMessages (ref)
	local var7 = self._filters[p8]
	self._filters[p8] = p9
	local var8 = false
	
	for i, v in pairs(self._filters) do
		var8 = var8 or v
	end
	if var8 then
		filterMessages(self._logDataSearched, self._logData:iterator(), self._filters, self._searchTerm)
		self._logDataUpdate:Fire(self._logDataSearched)
		self._filterUpdated:Fire()
		
		return
	end
	self._filters[p8] = var7
end

function t:setFilters(p10)
	-- upvalues: filterMessages (ref)
	self._filters = p10
	local var9 = false
	
	for i, v in pairs(p10) do
		var9 = var9 or v
	end
	if var9 then
		filterMessages(self._logDataSearched, self._logData:iterator(), self._filters, self._searchTerm)
		self._logDataUpdate:Fire(self._logDataSearched)
		self._filterUpdated:Fire()
		
		return
	end
	self._logDataSearched:reset()
	self._logDataUpdate:Fire(self._logData)
end

function t:getLogData()
	return if #self._logDataSearched:getData() > 0 then self._logDataSearched else self._logData
end

function t:getErrorWarningCount()
	return self._errorCount, self._warningCount
end

function t:isRunning()
	return self._initialized
end

function t:start()
	-- upvalues: logService (ref), messageEntry (ref), convertTimeStampModule (ref), ignoreWarningMessageOnAdd (ref), isMessageFiltered (ref)
	if self._isClient then
		if not self._initialized then
			self._initialized = true
			
			if #{} == 0 then
				for i, v in ipairs(logService:GetLogHistory()) do
					local var10 = messageEntry(v.message or "[DevConsole Error 1]", convertTimeStampModule(v.timestamp), v.messageType.Value, v.context)
					
					if not ignoreWarningMessageOnAdd(var10) then
						self:checkErrorWarningCounter(v.messageType.Value)
						self._logData:push_back(var10)
					end
				end
			end
		end
		self._connection = logService.MessageOut:connect(function(p11, p12, p13)
			-- upvalues: messageEntry (copy), convertTimeStampModule (copy), ignoreWarningMessageOnAdd (copy), self (ref), isMessageFiltered (copy)
			local var11 = messageEntry(p11 or "[DevConsole Error 2]", convertTimeStampModule(os.time()), p12.Value, p13)
			
			if not ignoreWarningMessageOnAdd(var11) then
				self:checkErrorWarningCounter(p12.Value)
				self._logData:push_back(var11)
				
				if #self._logDataSearched:getData() > 0 then
					if isMessageFiltered(var11, self._filters, self._searchTerm) then
						self._logDataSearched:push_back(var11)
						self._logDataUpdate:Fire(self._logDataSearched)
						
						return
					end
				else
					self._logDataUpdate:Fire(self._logData)
				end
			end
		end)
	else
		self._connection = logService.ServerMessageOut:connect(function(p11, p12, p13, p14)
			-- upvalues: messageEntry (copy), convertTimeStampModule (copy), ignoreWarningMessageOnAdd (copy), self (ref), isMessageFiltered (copy)
			local var11 = messageEntry(p11 or "[DevConsole Error 3]", convertTimeStampModule(p13), p12.Value, p14)
			
			if not ignoreWarningMessageOnAdd(var11) then
				self._logData:push_back(var11)
				
				if #self._logDataSearched:getData() > 0 then
					if isMessageFiltered(var11, self._filters, self._searchTerm) then
						self._logDataSearched:push_back(var11)
						self._logDataUpdate:Fire(self._logDataSearched)
						
						return
					end
				else
					self._logDataUpdate:Fire(self._logData)
				end
			end
		end)
		pcall(function()
			-- upvalues: self (ref), logService (copy), messageEntry (copy), convertTimeStampModule (copy), ignoreWarningMessageOnAdd (copy), isMessageFiltered (copy)
			self._variantConnection = logService.ServerContextOut:connect(function(p11)
				-- upvalues: messageEntry (copy), convertTimeStampModule (copy), ignoreWarningMessageOnAdd (copy), self (copy), isMessageFiltered (copy)
				if type(p11) == "table" and p11._structuredContext then
					local var11 = messageEntry(p11._message or "", convertTimeStampModule(p11._timestamp or 0), p11._messageType or 0, p11._structuredContext)
					
					if not ignoreWarningMessageOnAdd(var11) then
						self._logData:push_back(var11)
						
						if #self._logDataSearched:getData() > 0 then
							if isMessageFiltered(var11, self._filters, self._searchTerm) then
								self._logDataSearched:push_back(var11)
								self._logDataUpdate:Fire(self._logDataSearched)
								
								return
							end
						else
							self._logDataUpdate:Fire(self._logData)
						end
					end
				end
			end)
		end)
		logService:RequestServerOutput()
	end
	self._isRunning = true
end

function t:stop()
	self._initialized = false
	self._isRunning = false
	
	if self._connection then
		self._connection:Disconnect()
	end
	if self._variantConnection then
		self._variantConnection:Disconnect()
	end
end

return t