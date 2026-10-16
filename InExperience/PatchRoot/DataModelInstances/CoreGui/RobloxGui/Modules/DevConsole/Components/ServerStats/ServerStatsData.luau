local CircularBufferModule = require(script.Parent.Parent.Parent.CircularBuffer)
local SignalModule = require(script.Parent.Parent.Parent.Signal)
local Number: number? = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount"))
local GetClientReplicatorModule = require(script.Parent.Parent.Parent.Util.getClientReplicator)
local ServerStatsDataModule = {}
ServerStatsDataModule.__index = ServerStatsDataModule

function ServerStatsDataModule.new() --[[ Line: 14 ]]
	-- upvalues: ServerStatsDataModule (copy), SignalModule (copy)
	local t = {}
	setmetatable(t, ServerStatsDataModule)
	t._serverStatsUpdated = SignalModule.new()
	t._serverStatsPing = SignalModule.new()
	t._serverStatsData = {}
	t._serverStatsDataCount = 0
	t._lastUpdateTime = 0
	t._isRunning = false
	
	return t
end

function ServerStatsDataModule:avgPing() --[[ Line: 27 ]]
	return self._serverStatsPing
end

function ServerStatsDataModule:Signal() --[[ Line: 31 ]]
	return self._serverStatsUpdated
end

function ServerStatsDataModule:getCurrentData() --[[ Line: 35 ]]
	return self._serverStatsData
end

function ServerStatsDataModule:updateValue(p1, Value) --[[ Line: 39 ]]
	-- upvalues: CircularBufferModule (copy), Number (copy)
	if not self._serverStatsData[p1] then
		local NewCircularBuffer = CircularBufferModule.new(Number)
		NewCircularBuffer:push_back({ value = Value, time = self._lastUpdateTime })
		self._serverStatsData[p1] = { max = Value, min = Value, dataSet = NewCircularBuffer }
		
		return
	end
	local ServerStats = self._serverStatsData[p1]
	local Max = ServerStats.max
	local Min = ServerStats.min
	local Push_backResult = self._serverStatsData[p1].dataSet:push_back({ value = Value, time = self._lastUpdateTime })
	
	if Push_backResult then
		local IteratorResult = self._serverStatsData[p1].dataSet:iterator()
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
	self._serverStatsData[p1].max = Max < Value and Value or Max
	self._serverStatsData[p1].min = Min < Value and Min or Value
end

function ServerStatsDataModule:isRunning() --[[ Line: 87 ]]
	return self._isRunning
end

function ServerStatsDataModule:start() --[[ Line: 91 ]]
	-- upvalues: GetClientReplicatorModule (copy)
	local ClientReplicatorModule = GetClientReplicatorModule()
	
	if ClientReplicatorModule and not self._statsListenerConnection then
		self._statsListenerConnection = ClientReplicatorModule.StatsReceived:connect(function(Stats) --[[ Line: 94 ]]
			-- upvalues: self (copy)
			if Stats then
				self._lastUpdateTime = os.time()
				local _serverStatsDataCount = 0
				
				for i, stat in pairs(Stats) do
					if type(stat) == "number" then
						self:updateValue(i, stat)
						_serverStatsDataCount += 1
					end
				end
				self._serverStatsDataCount = _serverStatsDataCount
				self._serverStatsUpdated:Fire(self._serverStatsData)
				
				if self._serverStatsData["Avg Data Ping ms"] then
					self._serverStatsPing:Fire(self._serverStatsData["Avg Data Ping ms"].dataSet:back().value)
				end
			end
		end)
		ClientReplicatorModule:RequestServerStats(true)
		self._isRunning = true
	end
end

function ServerStatsDataModule:stop() --[[ Line: 117 ]]
	if self._statsListenerConnection then
		self._statsListenerConnection:Disconnect()
		self._statsListenerConnection = nil
	end
	self._isRunning = false
end

return ServerStatsDataModule