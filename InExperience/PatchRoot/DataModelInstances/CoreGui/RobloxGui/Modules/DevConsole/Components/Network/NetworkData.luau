local logService = game:GetService("LogService")
local circularBufferModule = require(script.Parent.Parent.Parent.CircularBuffer)
local signalModule = require(script.Parent.Parent.Parent.Signal)
local chartHeaderNames = require(script.Parent.Parent.Parent.Constants).NetworkFormatting.ChartHeaderNames
local var3 = tonumber(settings():GetFVariable("NewDevConsoleMaxHttpCount"))
local t = {
	[chartHeaderNames[1]] = function(p0, p1)
		return p0.Num < p1.Num
	end,
	[chartHeaderNames[2]] = function(p2, p3)
		return p2.Method < p3.Method
	end,
	[chartHeaderNames[3]] = function(p4, p5)
		return p4.Status < p5.Status
	end,
	[chartHeaderNames[4]] = function(p6, p7)
		return p6.Time < p7.Time
	end,
	[chartHeaderNames[5]] = function(p8, p9)
		return p8.RequestType < p9.RequestType
	end,
	[chartHeaderNames[6]] = function(p10, p11)
		return p10.Url < p11.Url
	end
}

local function _(p12, p13, p14, p15, p16, p17, p18)
	return {
		Num = p12,
		Method = p13,
		Status = p14,
		Time = p15,
		RequestType = p16,
		Url = p17,
		Response = p18
	}
end

local t_1 = {}
t_1.__index = t_1

function t_1.new(p19)
	-- upvalues: t_1 (ref), logService (ref), signalModule (ref), circularBufferModule (ref), var3 (ref), chartHeaderNames (ref)
	local t = {}
	setmetatable(t, t_1)
	t._isRunning = false
	t._isClient = p19
	t._httpResultSignal = if p19 then logService.HttpResultOut else logService.ServerHttpResultOut
	t._httpEntryAdded = signalModule.new()
	t._httpSummaryTable = {}
	t._httpSummaryCount = 0
	t._httpEntryBuffer = circularBufferModule.new(var3)
	t._httpLifeTimeEntryCount = 0
	t._sortType = chartHeaderNames[1]
	
	return t
end

function t_1:addHttpEntry(p20)
	self._httpLifeTimeEntryCount += 1
	self._httpEntryBuffer:push_back({
		Num = self._httpLifeTimeEntryCount,
		Method = p20.Method,
		Status = p20.Status,
		Time = p20.Time,
		RequestType = p20.RequestType,
		Url = p20.URL,
		Response = p20.Response
	})
	local requestType = p20.RequestType
	local var7 = self._httpSummaryTable[requestType]
	
	if var7 then
		var7.RequestCount += 1
		
		if p20.Status >= 400 then
			var7.FailedCount += 1
		end
		var7.AverageTime = (var7.AverageTime * var7.RequestCount + p20.Time - var7.AverageTime) / var7.RequestCount
		
		if p20.Time < var7.MinTime then
			var7.MinTime = p20.Time
		end
		if var7.MaxTime < p20.Time then
			var7.MaxTime = p20.Time
		end
	else
		self._httpSummaryCount += 1
		self._httpSummaryTable[requestType] = {
			RequestCount = 1,
			FailedCount = 0,
			RequestType = requestType,
			AverageTime = p20.Time,
			MinTime = p20.Time,
			MaxTime = p20.Time
		}
		
		if p20.Status >= 400 then
			self._httpSummaryTable[p20.RequestType].FailedCount = 1
			
			return
		end
	end
end

function t_1:setSortType(p21)
	-- upvalues: t (ref)
	if t[p21] then
		self._sortType = p21
		self._httpEntryAdded:Fire(self._httpSummaryTable, self._httpSummaryCount, self:getSortedEntries())
		
		return
	end
	error(string.format("attempted to pass invalid sortType: %s", tostring(p21)), 2)
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
	local var9 = self._httpEntryBuffer:iterator()
	local var10 = var9:next()
	local t_1 = {}
	local var12 = 1
	while var10 do
		t_1[var12] = var10
		var12 += 1
		var10 = var9:next()
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
		self._httpResultConnection = self._httpResultSignal:connect(function(p22)
			-- upvalues: self (ref)
			self:addHttpEntry(p22)
			self._httpEntryAdded:Fire(self._httpSummaryTable, self._httpSummaryCount, self:getSortedEntries())
		end)
		self:resetHttpEntryList()
		
		if not self._isClient then
			self._onHttpResultApprovedConnection = logService.OnHttpResultApproved:connect(function(p23)
				-- upvalues: logService (copy), self (ref)
				logService:RequestHttpResultApproved()
				
				if p23 then
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