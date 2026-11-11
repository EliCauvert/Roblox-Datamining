local CircularBufferModule = require(script.Parent.Parent.Parent.CircularBuffer)
local SignalModule = require(script.Parent.Parent.Parent.Signal)
local Number: number? = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount"))
local ChartHeaderNames = require(script.Parent.Parent.Parent.Constants).ServerScriptsFormatting.ChartHeaderNames
local config = {
	[ChartHeaderNames[1]] = function(p1, p2): boolean
		return p1.dataStats.dataSet:back().name < p2.dataStats.dataSet:back().name
	end,
	[ChartHeaderNames[2]] = function(p1, p2): boolean
		return p1.dataStats.dataSet:back().data[1] < p2.dataStats.dataSet:back().data[1]
	end,
	[ChartHeaderNames[3]] = function(p1, p2): boolean
		return p1.dataStats.dataSet:back().data[2] < p2.dataStats.dataSet:back().data[2]
	end
}
local MinOfTableModule = require(script.Parent.Parent.Parent.Util.minOfTable)
local MaxOfTableModule = require(script.Parent.Parent.Parent.Util.maxOfTable)
local GetClientReplicatorModule = require(script.Parent.Parent.Parent.Util.getClientReplicator)
local ServerScriptsDataModule = {}
ServerScriptsDataModule.__index = ServerScriptsDataModule

function ServerScriptsDataModule.new()
	-- upvalues: ServerScriptsDataModule (copy), SignalModule (copy), ChartHeaderNames (copy)
	local t = {}
	setmetatable(t, ServerScriptsDataModule)
	t._serverScriptsUpdated = SignalModule.new()
	t._serverScriptsData = {}
	t._lastUpdate = 0
	t._sortedScriptsData = {}
	t._sortType = ChartHeaderNames[1]
	t._isRunning = false
	
	return t
end

function ServerScriptsDataModule:setSortType(_sortType)
	-- upvalues: config (copy)
	if config[_sortType] then
		self._sortType = _sortType
		table.sort(self._sortedScriptsData, config[self._sortType])
		
		return
	else
		error(string.format("attempted to pass invalid sortType: %s", (tostring(_sortType))), 2)
	end
end

function ServerScriptsDataModule:getSortType()
	return self._sortType
end

function ServerScriptsDataModule:Signal()
	return self._serverScriptsUpdated
end

function ServerScriptsDataModule:getCurrentData()
	return self._sortedScriptsData
end

function ServerScriptsDataModule:updateScriptsData(Scripts)
	-- upvalues: CircularBufferModule (copy), Number (copy), MaxOfTableModule (copy), MinOfTableModule (copy)
	self._lastUpdate = os.time()
	
	for Name, _script in pairs(Scripts) do
		if not self._serverScriptsData[Name] then
			local NewCircularBuffer = CircularBufferModule.new(Number)
			NewCircularBuffer:push_back({ data = _script, time = self._lastUpdate })
			self._serverScriptsData[Name] = {
				max = _script,
				min = _script,
				dataSet = NewCircularBuffer
			}
			table.insert(self._sortedScriptsData, { name = Name, dataStats = self._serverScriptsData[Name] })
			continue
		end
		local t = {}
		
		for i, value in pairs(self._serverScriptsData[Name].max) do
			t[i] = value
		end
		local t1 = {}
		
		for i1, value1 in pairs(self._serverScriptsData[Name].min) do
			t1[i1] = value1
		end
		local Push_backResult = self._serverScriptsData[Name].dataSet:push_back({ data = _script, time = self._lastUpdate })
		
		if Push_backResult then
			for i2, entry in pairs(Push_backResult.data) do
				if t[i2] == entry then
					local IteratorResult = self._serverScriptsData[Name].dataSet:iterator()
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
					local IteratorResult = self._serverScriptsData[Name].dataSet:iterator()
					local Key = IteratorResult:next()
					t1[i3] = t[i3]
					while Key do
						t1[i3] = t1[i3] < Key.data[i3] and t1[i3] or Key.data[i3]
						Key = IteratorResult:next()
					end
				end
			end
		end
		self._serverScriptsData[Name].max = MaxOfTableModule(t, _script)
		self._serverScriptsData[Name].min = MinOfTableModule(t1, _script)
	end
end

function ServerScriptsDataModule:isRunning()
	return self._isRunning
end

function ServerScriptsDataModule:start()
	-- upvalues: GetClientReplicatorModule (copy)
	local ClientReplicatorModule = GetClientReplicatorModule()
	
	if ClientReplicatorModule and not self._statsListenerConnection then
		self._statsListenerConnection = ClientReplicatorModule.StatsReceived:connect(function(Stats)
			-- upvalues: self (copy)
			if Stats then
				self._lastUpdate = os.time()
				local Scripts = Stats.Scripts
				
				if Scripts then
					self:updateScriptsData(Scripts)
				end
				self._serverScriptsUpdated:Fire(self._sortedScriptsData)
			end
		end)
		ClientReplicatorModule:RequestServerStats(true)
		self._isRunning = true
	end
end

function ServerScriptsDataModule:stop()
	if self._statsListenerConnection then
		self._statsListenerConnection:Disconnect()
		self._statsListenerConnection = nil
	end
	self._isRunning = false
end

return ServerScriptsDataModule