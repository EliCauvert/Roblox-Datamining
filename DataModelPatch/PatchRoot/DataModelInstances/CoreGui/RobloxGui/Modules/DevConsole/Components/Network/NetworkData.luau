local LogService = game:GetService("LogService")
local CircularBufferModule = require(script.Parent.Parent.Parent.CircularBuffer)
local SignalModule = require(script.Parent.Parent.Parent.Signal)
local ChartHeaderNames = require(script.Parent.Parent.Parent.Constants).NetworkFormatting.ChartHeaderNames
local Number: number? = tonumber(settings():GetFVariable("NewDevConsoleMaxHttpCount"))
local config = {
	[ChartHeaderNames[1]] = function(p1, p2): boolean
		return p1.Num < p2.Num
	end,
	[ChartHeaderNames[2]] = function(p1, p2): boolean
		return p1.Method < p2.Method
	end,
	[ChartHeaderNames[3]] = function(p1, p2): boolean
		return p1.Status < p2.Status
	end,
	[ChartHeaderNames[4]] = function(p1, p2): boolean
		return p1.Time < p2.Time
	end,
	[ChartHeaderNames[5]] = function(p1, p2): boolean
		return p1.RequestType < p2.RequestType
	end,
	[ChartHeaderNames[6]] = function(p1, p2): boolean
		return p1.Url < p2.Url
	end
}

local function _(Num, Method, Status, Time, RequestType, Url, Response)
	return {
		Num = Num,
		Method = Method,
		Status = Status,
		Time = Time,
		RequestType = RequestType,
		Url = Url,
		Response = Response
	}
end

local NetworkDataModule = {}
NetworkDataModule.__index = NetworkDataModule

function NetworkDataModule.new(_isClient)
	-- upvalues: NetworkDataModule (copy), LogService (copy), SignalModule (copy), CircularBufferModule (copy), Number (copy), ChartHeaderNames (copy)
	local t = {}
	setmetatable(t, NetworkDataModule)
	t._isRunning = false
	t._isClient = _isClient
	t._httpResultSignal = _isClient and LogService.HttpResultOut or LogService.ServerHttpResultOut
	t._httpEntryAdded = SignalModule.new()
	t._httpSummaryTable = {}
	t._httpSummaryCount = 0
	t._httpEntryBuffer = CircularBufferModule.new(Number)
	t._httpLifeTimeEntryCount = 0
	t._sortType = ChartHeaderNames[1]
	
	return t
end

function NetworkDataModule:addHttpEntry(HttpEntry)
	self._httpLifeTimeEntryCount += 1
	self._httpEntryBuffer:push_back({
		Num = self._httpLifeTimeEntryCount,
		Method = HttpEntry.Method,
		Status = HttpEntry.Status,
		Time = HttpEntry.Time,
		RequestType = HttpEntry.RequestType,
		Url = HttpEntry.URL,
		Response = HttpEntry.Response
	})
	local RequestType = HttpEntry.RequestType
	local HttpSummary = self._httpSummaryTable[RequestType]
	
	if HttpSummary then
		HttpSummary.RequestCount += 1
		
		if HttpEntry.Status >= 400 then
			HttpSummary.FailedCount += 1
		end
		HttpSummary.AverageTime = (HttpSummary.AverageTime * HttpSummary.RequestCount + HttpEntry.Time - HttpSummary.AverageTime) / HttpSummary.RequestCount
		
		if HttpEntry.Time < HttpSummary.MinTime then
			HttpSummary.MinTime = HttpEntry.Time
		end
		if HttpSummary.MaxTime < HttpEntry.Time then
			HttpSummary.MaxTime = HttpEntry.Time
		end
	else
		self._httpSummaryCount += 1
		self._httpSummaryTable[RequestType] = {
			RequestCount = 1,
			FailedCount = 0,
			RequestType = RequestType,
			AverageTime = HttpEntry.Time,
			MinTime = HttpEntry.Time,
			MaxTime = HttpEntry.Time
		}
		
		if HttpEntry.Status >= 400 then
			self._httpSummaryTable[HttpEntry.RequestType].FailedCount = 1
			
			return
		end
	end
end

function NetworkDataModule:setSortType(_sortType)
	-- upvalues: config (copy)
	if config[_sortType] then
		self._sortType = _sortType
		self._httpEntryAdded:Fire(self._httpSummaryTable, self._httpSummaryCount, self:getSortedEntries())
		
		return
	else
		error(string.format("attempted to pass invalid sortType: %s", (tostring(_sortType))), 2)
	end
end

function NetworkDataModule:getSortType()
	return self._sortType
end

function NetworkDataModule:resetHttpEntryList()
	-- upvalues: LogService (copy)
	self._httpSummaryTable = {}
	self._httpEntryBuffer:reset()
	self._httpLifeTimeEntryCount = 0
	
	if self._isClient then
		local HttpResultHistory = LogService:GetHttpResultHistory()
		
		if HttpResultHistory then
			for _, value in pairs(HttpResultHistory) do
				self:addHttpEntry(value)
			end
		end
	end
end

function NetworkDataModule:Signal()
	return self._httpEntryAdded
end

function NetworkDataModule:getSortedEntries()
	-- upvalues: config (copy)
	local IteratorResult = self._httpEntryBuffer:iterator()
	local Key = IteratorResult:next()
	local Keys = {}
	local Count = 1
	while Key do
		Keys[Count] = Key
		Count += 1
		Key = IteratorResult:next()
	end
	table.sort(Keys, config[self._sortType])
	
	return Keys
end

function NetworkDataModule:getCurrentData()
	return {
		summaryTable = self._httpSummaryTable,
		summaryCount = self._httpSummaryCount,
		entryList = self:getSortedEntries()
	}
end

function NetworkDataModule:isRunning()
	return self._isRunning
end

function NetworkDataModule:start()
	-- upvalues: LogService (copy)
	if not self._httpResultConnection then
		if self._additionHttpSetup then
			self._additionHttpSetup()
		end
		self._httpResultConnection = self._httpResultSignal:connect(function(p1)
			-- upvalues: self (copy)
			self:addHttpEntry(p1)
			self._httpEntryAdded:Fire(self._httpSummaryTable, self._httpSummaryCount, self:getSortedEntries())
		end)
		self:resetHttpEntryList()
		
		if not self._isClient then
			self._onHttpResultApprovedConnection = LogService.OnHttpResultApproved:connect(function(IsApproved)
				-- upvalues: LogService (upval), self (copy)
				LogService:RequestHttpResultApproved()
				
				if IsApproved then
					self._onHttpResultApprovedConnection:Disconnect()
					self._onHttpResultApprovedConnection = nil
				end
			end)
			LogService:RequestServerHttpResult()
		end
		self._isRunning = true
	end
end

function NetworkDataModule:stop()
	if self._httpResultConnection then
		self._httpResultConnection:Disconnect()
		self._httpResultConnection = nil
	end
	self._isRunning = false
end

return NetworkDataModule