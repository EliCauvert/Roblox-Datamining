local CircularBufferModule = require(script.Parent.Parent.Parent.CircularBuffer)
local SignalModule = require(script.Parent.Parent.Parent.Signal)
local ChartHeaderNames = require(script.Parent.Parent.Parent.Constants).ServerJobsFormatting.ChartHeaderNames
local Number: number? = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount"))
local config = {
	[ChartHeaderNames[1]] = function(p1, p2): boolean --[[ Line: 11 ]]
		return p1.name < p2.name
	end,
	[ChartHeaderNames[2]] = function(p1, p2): boolean --[[ Line: 14 ]]
		return p1.dataStats.dataSet:back().data[1] < p2.dataStats.dataSet:back().data[1]
	end,
	[ChartHeaderNames[3]] = function(p1, p2): boolean --[[ Line: 17 ]]
		return p1.dataStats.dataSet:back().data[2] < p2.dataStats.dataSet:back().data[2]
	end,
	[ChartHeaderNames[4]] = function(p1, p2): boolean --[[ Line: 20 ]]
		return p1.dataStats.dataSet:back().data[3] < p2.dataStats.dataSet:back().data[3]
	end
}
local MinOfTableModule = require(script.Parent.Parent.Parent.Util.minOfTable)
local MaxOfTableModule = require(script.Parent.Parent.Parent.Util.maxOfTable)
local GetClientReplicatorModule = require(script.Parent.Parent.Parent.Util.getClientReplicator)
local ServerJobsDataModule = {}
ServerJobsDataModule.__index = ServerJobsDataModule

function ServerJobsDataModule.new() --[[ Line: 32 ]]
	-- upvalues: ServerJobsDataModule (copy), SignalModule (copy), ChartHeaderNames (copy)
	local t = {}
	setmetatable(t, ServerJobsDataModule)
	t._serverJobsUpdated = SignalModule.new()
	t._serverJobsData = {}
	t._sortedJobsData = {}
	t._sortType = ChartHeaderNames[1]
	t._lastUpdate = 0
	t._isRunning = false
	
	return t
end

function ServerJobsDataModule:setSortType(_sortType) --[[ Line: 46 ]]
	-- upvalues: config (copy)
	if config[_sortType] then
		self._sortType = _sortType
		table.sort(self._sortedJobsData, config[self._sortType])
		
		return
	else
		error(string.format("attempted to pass invalid sortType: %s", (tostring(_sortType))), 2)
	end
end

function ServerJobsDataModule:getSortType() --[[ Line: 56 ]]
	return self._sortType
end

function ServerJobsDataModule:Signal() --[[ Line: 60 ]]
	return self._serverJobsUpdated
end

function ServerJobsDataModule:getCurrentData() --[[ Line: 64 ]]
	return self._sortedJobsData
end

function ServerJobsDataModule:updateServerJobsData(Jobs) --[[ Line: 68 ]]
	-- upvalues: CircularBufferModule (copy), Number (copy), MaxOfTableModule (copy), MinOfTableModule (copy)
	self._lastUpdate = os.time()
	
	for Name, job in pairs(Jobs) do
		if not self._serverJobsData[Name] then
			local NewCircularBuffer = CircularBufferModule.new(Number)
			NewCircularBuffer:push_back({ data = job, time = self._lastUpdate })
			self._serverJobsData[Name] = { max = job, min = job, dataSet = NewCircularBuffer }
			table.insert(self._sortedJobsData, { name = Name, dataStats = self._serverJobsData[Name] })
			continue
		end
		local t = {}
		
		for i, value in pairs(self._serverJobsData[Name].max) do
			t[i] = value
		end
		local t1 = {}
		
		for i1, value1 in pairs(self._serverJobsData[Name].min) do
			t1[i1] = value1
		end
		local Push_backResult = self._serverJobsData[Name].dataSet:push_back({ data = job, time = self._lastUpdate })
		
		if Push_backResult then
			for i2, entry in pairs(Push_backResult.data) do
				if t[i2] == entry then
					local IteratorResult = self._serverJobsData[Name].dataSet:iterator()
					local Key = IteratorResult:next()
					t[i2] = t1[i2]
					while Key do
						t[i2] = Key.data[i2] < t[i2] and t[i2] or Key.data[i2]
						Key = IteratorResult:next()
					end
				end
			end
			for i3, entry1 in pairs(Push_backResult.data) do
				if t1[i3] == entry1 then
					local IteratorResult = self._serverJobsData[Name].dataSet:iterator()
					local Key = IteratorResult:next()
					t1[i3] = t[i3]
					while Key do
						t1[i3] = t1[i3] < Key.data[i3] and t1[i3] or Key.data[i3]
						Key = IteratorResult:next()
					end
				end
			end
		end
		self._serverJobsData[Name].max = MaxOfTableModule(t, job)
		self._serverJobsData[Name].min = MinOfTableModule(t1, job)
	end
end

function ServerJobsDataModule:isRunning() --[[ Line: 141 ]]
	return self._isRunning
end

function ServerJobsDataModule:start() --[[ Line: 145 ]]
	-- upvalues: GetClientReplicatorModule (copy)
	local ClientReplicatorModule = GetClientReplicatorModule()
	
	if ClientReplicatorModule and not self._statsListenerConnection then
		self._statsListenerConnection = ClientReplicatorModule.StatsReceived:connect(function(Stats) --[[ Line: 148 ]]
			-- upvalues: self (copy)
			local Jobs = Stats.Jobs
			
			if Jobs then
				self:updateServerJobsData(Jobs)
				self._serverJobsUpdated:Fire(self._sortedJobsData)
			end
		end)
		ClientReplicatorModule:RequestServerStats(true)
		self._isRunning = true
	end
end

function ServerJobsDataModule:stop() --[[ Line: 161 ]]
	if self._statsListenerConnection then
		self._statsListenerConnection:Disconnect()
		self._statsListenerConnection = nil
		self._isRunning = false
	end
end

return ServerJobsDataModule