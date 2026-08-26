local logService = game:GetService("LogService")
local circularBufferModule = require(script.Parent.Parent.Parent.CircularBuffer)
local signalModule = require(script.Parent.Parent.Parent.Signal)
local chartHeaderNames = require(script.Parent.Parent.Parent.Constants).NetworkFormatting.ChartHeaderNames
local var1 = tonumber(settings():GetFVariable("NewDevConsoleMaxHttpCount"))
local t = {
	[chartHeaderNames[1]] = function(p1, p2)
		return p1.Num < p2.Num
	end,
	[chartHeaderNames[2]] = function(p1, p2)
		return p1.Method < p2.Method
	end,
	[chartHeaderNames[3]] = function(p1, p2)
		return p1.Status < p2.Status
	end,
	[chartHeaderNames[4]] = function(p1, p2)
		return p1.Time < p2.Time
	end,
	[chartHeaderNames[5]] = function(p1, p2)
		return p1.RequestType < p2.RequestType
	end,
	[chartHeaderNames[6]] = function(p1, p2)
		return p1.Url < p2.Url
	end
}

local function _(p1, p2, p3, p4, p5, p6, p7)
	return {
		Num = p1,
		Method = p2,
		Status = p3,
		Time = p4,
		RequestType = p5,
		Url = p6,
		Response = p7
	}
end

local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref), logService (ref), signalModule (ref), circularBufferModule (ref), var1 (ref), chartHeaderNames (ref)
	local t = {}
	setmetatable(t, t_1)
	t._isRunning = false
	t._isClient = p1
	t._httpResultSignal = if p1 then logService.HttpResultOut else logService.ServerHttpResultOut
	t._httpEntryAdded = signalModule.new()
	t._httpSummaryTable = {}
	t._httpSummaryCount = 0
	t._httpEntryBuffer = circularBufferModule.new(var1)
	t._httpLifeTimeEntryCount = 0
	t._sortType = chartHeaderNames[1]
	
	return t
end

function t_1:addHttpEntry(p1)
	self._httpLifeTimeEntryCount += 1
	self._httpEntryBuffer:push_back({
		Num = self._httpLifeTimeEntryCount,
		Method = p1.Method,
		Status = p1.Status,
		Time = p1.Time,
		RequestType = p1.RequestType,
		Url = p1.URL,
		Response = p1.Response
	})
	local requestType = p1.RequestType
	local var2 = self._httpSummaryTable[requestType]
	
	if var2 then
		var2.RequestCount += 1
		
		if p1.Status >= 400 then
			var2.FailedCount += 1
		end
		var2.AverageTime = (var2.AverageTime * var2.RequestCount + p1.Time - var2.AverageTime) / var2.RequestCount
		
		if p1.Time < var2.MinTime then
			var2.MinTime = p1.Time
		end
		if var2.MaxTime < p1.Time then
			var2.MaxTime = p1.Time
		end
	else
		self._httpSummaryCount += 1
		self._httpSummaryTable[requestType] = {
			RequestCount = 1,
			FailedCount = 0,
			RequestType = requestType,
			AverageTime = p1.Time,
			MinTime = p1.Time,
			MaxTime = p1.Time
		}
		
		if p1.Status >= 400 then
			self._httpSummaryTable[p1.RequestType].FailedCount = 1
			
			return
		end
	end
end

function t_1:setSortType(p1)
	-- upvalues: t (ref)
	if t[p1] then
		self._sortType = p1
		self._httpEntryAdded:Fire(self._httpSummaryTable, self._httpSummaryCount, self:getSortedEntries())
		
		return
	end
	error(string.format("attempted to pass invalid sortType: %s", tostring(p1)), 2)
end

function t_1:getSortType()
	return self._sortType
end

function t_1:resetHttpEntryList()
	-- upvalues: logService (ref)
	self._httpSummaryTable = {}
	self._httpEntryBuffer:reset()
	self._httpLifeTimeEntryCount = 0
	
	if self._isClient then
		local httpResultHistory = logService:GetHttpResultHistory()
		
		if httpResultHistory then
			for i, v in pairs(httpResultHistory) do
				self:addHttpEntry(v)
			end
		end
	end
end

function t_1:Signal()
	return self._httpEntryAdded
end

function t_1:getSortedEntries()
	-- upvalues: t (ref)
	local var2 = self._httpEntryBuffer:iterator()
	local var3 = var2:next()
	local t_1 = {}
	local var4 = 1
	while var3 do
		t_1[var4] = var3
		var4 += 1
		var3 = var2:next()
	end
	table.sort(t_1, t[self._sortType])
	
	return t_1
end

function t_1:getCurrentData()
	return {
		summaryTable = self._httpSummaryTable,
		summaryCount = self._httpSummaryCount,
		entryList = self:getSortedEntries()
	}
end

function t_1:isRunning()
	return self._isRunning
end

function t_1:start()
	-- upvalues: logService (ref)
	if not self._httpResultConnection then
		if self._additionHttpSetup then
			self._additionHttpSetup()
		end
		self._httpResultConnection = self._httpResultSignal:connect(function(p1)
			-- upvalues: self (ref)
			self:addHttpEntry(p1)
			self._httpEntryAdded:Fire(self._httpSummaryTable, self._httpSummaryCount, self:getSortedEntries())
		end)
		self:resetHttpEntryList()
		
		if not self._isClient then
			self._onHttpResultApprovedConnection = logService.OnHttpResultApproved:connect(function(p1)
				-- upvalues: logService (copy), self (ref)
				logService:RequestHttpResultApproved()
				
				if p1 then
					self._onHttpResultApprovedConnection:Disconnect()
					self._onHttpResultApprovedConnection = nil
				end
			end)
			logService:RequestServerHttpResult()
		end
		self._isRunning = true
	end
end

function t_1:stop()
	if self._httpResultConnection then
		self._httpResultConnection:Disconnect()
		self._httpResultConnection = nil
	end
	self._isRunning = false
end

return t_1