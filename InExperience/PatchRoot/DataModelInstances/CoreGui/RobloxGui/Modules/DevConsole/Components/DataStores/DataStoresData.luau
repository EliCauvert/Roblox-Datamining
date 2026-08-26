local circularBufferModule = require(script.Parent.Parent.Parent.CircularBuffer)
local signalModule = require(script.Parent.Parent.Parent.Signal)
local var1 = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount"))
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

function t:updateValue(p1, p2)
	-- upvalues: circularBufferModule (ref), var1 (ref)
	if not self._dataStoresData[p1] then
		local var2 = circularBufferModule.new(var1)
		var2:push_back({ value = p2, time = self._lastUpdateTime })
		self._dataStoresData[p1] = { max = p2, min = p2, dataSet = var2 }
		
		return
	end
	local var3 = self._dataStoresData[p1]
	local max = var3.max
	local min = var3.min
	local var4 = self._dataStoresData[p1].dataSet:push_back({ value = p2, time = self._lastUpdateTime })
	
	if var4 then
		local var5 = self._dataStoresData[p1].dataSet:iterator()
		local var6 = var5:next()
		
		if max == var4.value then
			max = min
			while var6 do
				max = if var6.value < max then max else var6.value
				var6 = var5:next()
			end
		end
		if min == var4.value then
			min = max
			while var6 do
				min = if min < var6.value then min else var6.value
				var6 = var5:next()
			end
		end
	end
	self._dataStoresData[p1].max = if max < p2 then p2 else max
	self._dataStoresData[p1].min = if min < p2 then min else p2
end

function t:isRunning()
	return self._isRunning
end

function t:start()
	-- upvalues: getClientReplicatorModule (ref)
	local var7 = getClientReplicatorModule()
	
	if var7 and not self._statsListenerConnection then
		self._statsListenerConnection = var7.StatsReceived:connect(function(p3)
			-- upvalues: self (ref)
			local dataStoreBudget = p3.DataStoreBudget
			self._lastUpdateTime = os.time()
			
			if dataStoreBudget then
				local var8 = 0
				
				for i, v in pairs(dataStoreBudget) do
					if type(v) == "number" then
						self:updateValue(i, v)
						var8 += 1
					end
				end
				self._dataStoresDataCount = var8
				self._dataStoresUpdated:Fire(self._dataStoresData, self._dataStoresDataCount)
			end
		end)
		var7:RequestServerStats(true)
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