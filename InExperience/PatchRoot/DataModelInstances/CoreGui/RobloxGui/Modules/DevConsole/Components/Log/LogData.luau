local logService = game:GetService("LogService")
local textService = game:GetService("TextService")
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local mainWindow = constantsModule.DefaultFontSize.MainWindow
local log = constantsModule.Font.Log
local maxStringSize = constantsModule.LogFormatting.MaxStringSize
local enumToMsgTypeName = constantsModule.EnumToMsgTypeName
local circularBufferModule = require(script.Parent.Parent.Parent.CircularBuffer)
local signalModule = require(script.Parent.Parent.Parent.Signal)
local var5 = tonumber(settings():GetFVariable("NewDevConsoleMaxLogCount"))
local list = {
	"ClassDescriptor failed to learn",
	"EventDescriptor failed to learn",
	"Type failed to learn"
}
local convertTimeStampModule = require(script.Parent.Parent.Parent.Util.convertTimeStamp)
local t = {}
t.__index = t

local function messageEntry(p0, p1, p2, p3) --[[ line: 34 ]]
	-- upvalues: maxStringSize (ref), textService (ref), mainWindow (ref), log (ref)
	local _ = nil
	local p0Count = #p0
	local var14 = if p0Count < maxStringSize then string.format("%s -- %s", p1, p0) else string.format("%s -- %s", p1, string.sub(p0, 1, maxStringSize))
	local var15 = textService:GetTextSize(var14, mainWindow, log, Vector2.new())
	
	if p3 and next(p3) == nil then
		p3 = nil
	end
	return {
		Expanded = false,
		Message = var14,
		CharCount = p0Count,
		Type = p2,
		Dims = var15,
		Context = p3
	}
end

local function ignoreWarningMessageOnAdd(p4) --[[ line: 61 ]]
	-- upvalues: list (ref)
	if p4.Type ~= Enum.MessageType.MessageWarning.Value then
		return false
	end
	local var16 = false
	
	for i, v in ipairs(list) do
		if string.find(p4.Message, v) ~= nil then
			var16 = true
			
			return var16
		end
	end
	return var16
end

local function isMessageFiltered(p5, p6, p7) --[[ line: 78 ]]
	-- upvalues: enumToMsgTypeName (ref)
	return if #p7 == 0 and not next(p6) then false elseif next(p6) and not p6[enumToMsgTypeName[p5.Type]] then false else #p7 > 0 and string.find(p5.Message:lower(), p7:lower()) == nil
end

local function _(p8) --[[ line: 99 | named "validActiveFilters" ]]
	local var17 = false
	
	for i, v in pairs(p8) do
		var17 = var17 or v
	end
	return var17
end

local function filterMessages(p9, p10, p11, p12) --[[ line: 107 ]]
	-- upvalues: isMessageFiltered (ref), messageEntry (ref)
	p9:reset()
	local var18 = false
	
	for i, v in pairs(p11) do
		var18 = var18 or v
	end
	if #p12 == 0 and not var18 then return end
	local var19 = 0
	local var20 = p10:next()
	while var20 do
		if isMessageFiltered(var20, p11, p12) then
			var19 += 1
			p9:push_back(var20)
		end
		var20 = p10:next()
	end
	if var19 == 0 then
		if #p12 > 0 then
			p9:push_back(messageEntry(string.format("\"%s\" was not found", p12), "", 0))
			
			return
		end
		p9:push_back(messageEntry("No Messages were found", "", 0))
	end
end

function t:checkErrorWarningCounter(p13) --[[ line: 137 ]]
	if p13 == Enum.MessageType.MessageWarning.Value then
		self._warningCount += 1
		self._errorWarningSignal:Fire(self._errorCount, self._warningCount)
		
		return
	elseif p13 == Enum.MessageType.MessageError.Value then
		self._errorCount += 1
		self._errorWarningSignal:Fire(self._errorCount, self._warningCount)
	end
end

function t.new(p14) --[[ line: 147 ]]
	-- upvalues: t (ref), circularBufferModule (ref), var5 (ref), enumToMsgTypeName (ref), signalModule (ref)
	local t_1 = {}
	setmetatable(t_1, t)
	t_1._initialized = false
	t_1._isRunning = false
	t_1._isClient = p14
	t_1._logData = circularBufferModule.new(var5)
	t_1._logDataSearched = circularBufferModule.new(var5)
	t_1._searchTerm = ""
	t_1._commandLineHistory = circularBufferModule.new(100)
	t_1._commandLineIndex = 0
	t_1._filters = {}
	
	for i, v in pairs(enumToMsgTypeName) do
		t_1._filters[v] = true
	end
	t_1._errorCount = p14 and 0
	t_1._warningCount = p14 and 0
	t_1._logDataUpdate = signalModule.new()
	t_1._errorWarningSignal = p14 and signalModule.new()
	t_1._filterUpdated = signalModule.new()
	
	return t_1
end

function t:Signal() --[[ line: 176 ]]
	return self._logDataUpdate
end

function t:errorWarningSignal() --[[ line: 180 ]]
	return self._errorWarningSignal
end

function t:filterUpdatedSignal() --[[ line: 184 ]]
	return self._filterUpdated
end

function t:setSearchTerm(p15) --[[ line: 188 ]]
	-- upvalues: filterMessages (ref)
	if self._searchTerm ~= p15 then
		self._searchTerm = p15
		
		if self._searchTerm == "" then
			self._logDataSearched:reset()
			self._logDataUpdate:Fire(self._logData)
			
			return
		end
		filterMessages(self._logDataSearched, self._logData:iterator(), self._filters, self._searchTerm)
		self._logDataUpdate:Fire(self._logDataSearched)
	end
end

function t:getSearchTerm() --[[ line: 207 ]]
	return self._searchTerm
end

function t:getCommandLineHistory() --[[ line: 211 ]]
	return self._commandLineHistory
end

function t:getCommandLineIndex() --[[ line: 215 ]]
	return self._commandLineIndex
end

function t:setCommandLineIndex(p16) --[[ line: 219 ]]
	self._commandLineIndex = p16
end

function t:getFilters() --[[ line: 223 ]]
	return self._filters
end

function t:setFilter(p17, p18) --[[ line: 227 ]]
	-- upvalues: filterMessages (ref)
	local var22 = self._filters[p17]
	self._filters[p17] = p18
	local var23 = false
	
	for i, v in pairs(self._filters) do
		var23 = var23 or v
	end
	if var23 then
		filterMessages(self._logDataSearched, self._logData:iterator(), self._filters, self._searchTerm)
		self._logDataUpdate:Fire(self._logDataSearched)
		self._filterUpdated:Fire()
		
		return
	end
	self._filters[p17] = var22
end

function t:setFilters(p19) --[[ line: 246 ]]
	-- upvalues: filterMessages (ref)
	self._filters = p19
	local var24 = false
	
	for i, v in pairs(p19) do
		var24 = var24 or v
	end
	if var24 then
		filterMessages(self._logDataSearched, self._logData:iterator(), self._filters, self._searchTerm)
		self._logDataUpdate:Fire(self._logDataSearched)
		self._filterUpdated:Fire()
		
		return
	end
	self._logDataSearched:reset()
	self._logDataUpdate:Fire(self._logData)
end

function t:getLogData() --[[ line: 265 ]]
	return if #self._logDataSearched:getData() > 0 then self._logDataSearched else self._logData
end

function t:getErrorWarningCount() --[[ line: 272 ]]
	return self._errorCount, self._warningCount
end

function t:isRunning() --[[ line: 276 ]]
	return self._initialized
end

function t:start() --[[ line: 280 ]]
	-- upvalues: logService (ref), messageEntry (ref), convertTimeStampModule (ref), ignoreWarningMessageOnAdd (ref), isMessageFiltered (ref)
	if self._isClient then
		if not self._initialized then
			self._initialized = true
			
			if #{} == 0 then
				for i, v in ipairs(logService:GetLogHistory()) do
					local var25 = messageEntry(v.message or "[DevConsole Error 1]", convertTimeStampModule(v.timestamp), v.messageType.Value, v.context)
					
					if not ignoreWarningMessageOnAdd(var25) then
						self:checkErrorWarningCounter(v.messageType.Value)
						self._logData:push_back(var25)
					end
				end
			end
		end
		self._connection = logService.MessageOut:connect(function(p20, p21, p22) --[[ line: 302 ]]
			-- upvalues: messageEntry (copy), convertTimeStampModule (copy), ignoreWarningMessageOnAdd (copy), self (ref), isMessageFiltered (copy)
			local var26 = messageEntry(p20 or "[DevConsole Error 2]", convertTimeStampModule(os.time()), p21.Value, p22)
			
			if not ignoreWarningMessageOnAdd(var26) then
				self:checkErrorWarningCounter(p21.Value)
				self._logData:push_back(var26)
				
				if #self._logDataSearched:getData() > 0 then
					if isMessageFiltered(var26, self._filters, self._searchTerm) then
						self._logDataSearched:push_back(var26)
						self._logDataUpdate:Fire(self._logDataSearched)
						
						return
					end
				else
					self._logDataUpdate:Fire(self._logData)
				end
			end
		end)
	else
		self._connection = logService.ServerMessageOut:connect(function(p23, p24, p25, p26) --[[ line: 325 ]]
			-- upvalues: messageEntry (copy), convertTimeStampModule (copy), ignoreWarningMessageOnAdd (copy), self (ref), isMessageFiltered (copy)
			local var27 = messageEntry(p23 or "[DevConsole Error 3]", convertTimeStampModule(p25), p24.Value, p26)
			
			if not ignoreWarningMessageOnAdd(var27) then
				self._logData:push_back(var27)
				
				if #self._logDataSearched:getData() > 0 then
					if isMessageFiltered(var27, self._filters, self._searchTerm) then
						self._logDataSearched:push_back(var27)
						self._logDataUpdate:Fire(self._logDataSearched)
						
						return
					end
				else
					self._logDataUpdate:Fire(self._logData)
				end
			end
		end)
		pcall(function() --[[ line: 347 ]]
			-- upvalues: self (ref), logService (copy), messageEntry (copy), convertTimeStampModule (copy), ignoreWarningMessageOnAdd (copy), isMessageFiltered (copy)
			self._variantConnection = logService.ServerContextOut:connect(function(p27) --[[ line: 348 ]]
				-- upvalues: messageEntry (copy), convertTimeStampModule (copy), ignoreWarningMessageOnAdd (copy), self (copy), isMessageFiltered (copy)
				if type(p27) == "table" and p27._structuredContext then
					local var28 = messageEntry(p27._message or "", convertTimeStampModule(p27._timestamp or 0), p27._messageType or 0, p27._structuredContext)
					
					if not ignoreWarningMessageOnAdd(var28) then
						self._logData:push_back(var28)
						
						if #self._logDataSearched:getData() > 0 then
							if isMessageFiltered(var28, self._filters, self._searchTerm) then
								self._logDataSearched:push_back(var28)
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

function t:stop() --[[ line: 384 ]]
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