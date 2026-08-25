local circularBufferModule = require(script.Parent.Parent.Parent.CircularBuffer)
local signalModule = require(script.Parent.Parent.Parent.Signal)
local var2 = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount"))
local getClientReplicatorModule = require(script.Parent.Parent.Parent.Util.getClientReplicator)
local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref), signalModule (ref)
	local t_1 = {}
	setmetatable(t_1, t)
	t_1._dataStoresUpdated = signalModule.new()
	t_1._dataStoresData = {}
	t_1._dataStoresDataCount = 0
	t_1._lastUpdateTime = 0
	t_1._isRunning = false
	
	return t_1
end

function t:Signal()
	return self._dataStoresUpdated
end

function t:getCurrentData()
	return self._dataStoresData, self._dataStoresDataCount
end

function t:updateValue(p0, p1)
	-- upvalues: circularBufferModule (ref), var2 (ref)
	if not self._dataStoresData[p0] then
		local var6 = circularBufferModule.new(var2)
		var6:push_back({ value = p1, time = self._lastUpdateTime })
		self._dataStoresData[p0] = { max = p1, min = p1, dataSet = var6 }
		
		return
	end
	local var7 = self._dataStoresData[p0]
	local max = var7.max
	local min = var7.min
	local var8 = self._dataStoresData[p0].dataSet:push_back({ value = p1, time = self._lastUpdateTime })
	
	if var8 then
		local var9 = self._dataStoresData[p0].dataSet:iterator()
		local var10 = var9:next()
		
		if max == var8.value then
			max = min
			while var10 do
				max = if var10.value < max then max else var10.value
				var10 = var9:next()
			end
		end
		if min == var8.value then
			min = max
			while var10 do
				min = if min < var10.value then min else var10.value
				var10 = var9:next()
			end
		end
	end
	self._dataStoresData[p0].max = if max < p1 then p1 else max
	self._dataStoresData[p0].min = if min < p1 then min else p1
end

function t:isRunning()
	return self._isRunning
end

function t:start()
	-- upvalues: getClientReplicatorModule (ref)
	local var11 = getClientReplicatorModule()
	
	if var11 and not self._statsListenerConnection then
		self._statsListenerConnection = var11.StatsReceived:connect(function(p2)
			-- upvalues: self (ref)
			local dataStoreBudget = p2.DataStoreBudget
			self._lastUpdateTime = os.time()
			
			if dataStoreBudget then
				local var12 = 0
				
				for i, v in pairs(dataStoreBudget) do
					if type(v) == "number" then
						self:updateValue(i, v)
						var12 += 1
					end
				end
				self._dataStoresDataCount = var12
				self._dataStoresUpdated:Fire(self._dataStoresData, self._dataStoresDataCount)
			end
		end)
		var11:RequestServerStats(true)
		self._isRunning = true
	end
end

function t:stop()
	if self._statsListenerConnection then
		self._statsListenerConnection:Disconnect()
		self._statsListenerConnection = nil
	end
	self._isRunning = false
end

return t