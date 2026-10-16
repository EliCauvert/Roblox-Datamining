local CircularBufferModule = require(script.Parent.Parent.Parent.CircularBuffer)
local SignalModule = require(script.Parent.Parent.Parent.Signal)
local Number: number? = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount"))
local GetClientReplicatorModule = require(script.Parent.Parent.Parent.Util.getClientReplicator)
local DataStoresDataModule = {}
DataStoresDataModule.__index = DataStoresDataModule

function DataStoresDataModule.new() --[[ Line: 12 ]]
	-- upvalues: DataStoresDataModule (copy), SignalModule (copy)
	local t = {}
	setmetatable(t, DataStoresDataModule)
	t._dataStoresUpdated = SignalModule.new()
	t._dataStoresData = {}
	t._dataStoresDataCount = 0
	t._lastUpdateTime = 0
	t._isRunning = false
	
	return t
end

function DataStoresDataModule:Signal() --[[ Line: 24 ]]
	return self._dataStoresUpdated
end

function DataStoresDataModule:getCurrentData() --[[ Line: 28 ]]
	return self._dataStoresData, self._dataStoresDataCount
end

function DataStoresDataModule:updateValue(p1, Value) --[[ Line: 32 ]]
	-- upvalues: CircularBufferModule (copy), Number (copy)
	if not self._dataStoresData[p1] then
		local NewCircularBuffer = CircularBufferModule.new(Number)
		NewCircularBuffer:push_back({ value = Value, time = self._lastUpdateTime })
		self._dataStoresData[p1] = { max = Value, min = Value, dataSet = NewCircularBuffer }
		
		return
	end
	local DataStores = self._dataStoresData[p1]
	local Max = DataStores.max
	local Min = DataStores.min
	local Push_backResult = self._dataStoresData[p1].dataSet:push_back({ value = Value, time = self._lastUpdateTime })
	
	if Push_backResult then
		local IteratorResult = self._dataStoresData[p1].dataSet:iterator()
		local Key = IteratorResult:next()
		
		if Max == Push_backResult.value then
			Max = Min
			while Key do
				Max = Key.value < Max and Max or Key.value
				Key = IteratorResult:next()
			end
		end
		if Min == Push_backResult.value then
			Min = Max
			while Key do
				Min = Min < Key.value and Min or Key.value
				Key = IteratorResult:next()
			end
		end
	end
	self._dataStoresData[p1].max = Max < Value and Value or Max
	self._dataStoresData[p1].min = Min < Value and Min or Value
end

function DataStoresDataModule:isRunning() --[[ Line: 80 ]]
	return self._isRunning
end

function DataStoresDataModule:start() --[[ Line: 84 ]]
	-- upvalues: GetClientReplicatorModule (copy)
	local ClientReplicatorModule = GetClientReplicatorModule()
	
	if ClientReplicatorModule and not self._statsListenerConnection then
		self._statsListenerConnection = ClientReplicatorModule.StatsReceived:connect(function(Stats) --[[ Line: 87 ]]
			-- upvalues: self (copy)
			local DataStoreBudget = Stats.DataStoreBudget
			self._lastUpdateTime = os.time()
			
			if DataStoreBudget then
				local _dataStoresDataCount = 0
				
				for i, value in pairs(DataStoreBudget) do
					if type(value) == "number" then
						self:updateValue(i, value)
						_dataStoresDataCount += 1
					end
				end
				self._dataStoresDataCount = _dataStoresDataCount
				self._dataStoresUpdated:Fire(self._dataStoresData, self._dataStoresDataCount)
			end
		end)
		ClientReplicatorModule:RequestServerStats(true)
		self._isRunning = true
	end
end

function DataStoresDataModule:stop() --[[ Line: 107 ]]
	if self._statsListenerConnection then
		self._statsListenerConnection:Disconnect()
		self._statsListenerConnection = nil
	end
	self._isRunning = false
end

return DataStoresDataModule