local circularBufferModule = require(script.Parent.Parent.Parent.CircularBuffer)
local signalModule = require(script.Parent.Parent.Parent.Signal)
local var2 = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount"))
local getClientReplicatorModule = require(script.Parent.Parent.Parent.Util.getClientReplicator)
local t = {}
t.__index = t

function t.new() --[[ line: 14 ]]
	-- upvalues: t (ref), signalModule (ref)
	local t_1 = {}
	setmetatable(t_1, t)
	t_1._serverStatsUpdated = signalModule.new()
	t_1._serverStatsPing = signalModule.new()
	t_1._serverStatsData = {}
	t_1._serverStatsDataCount = 0
	t_1._lastUpdateTime = 0
	t_1._isRunning = false
	
	return t_1
end

function t:avgPing() --[[ line: 27 ]]
	return self._serverStatsPing
end

function t:Signal() --[[ line: 31 ]]
	return self._serverStatsUpdated
end

function t:getCurrentData() --[[ line: 35 ]]
	return self._serverStatsData
end

function t:updateValue(p0, p1) --[[ line: 39 ]]
	-- upvalues: circularBufferModule (ref), var2 (ref)
	if not self._serverStatsData[p0] then
		local var6 = circularBufferModule.new(var2)
		var6:push_back({ value = p1, time = self._lastUpdateTime })
		self._serverStatsData[p0] = { max = p1, min = p1, dataSet = var6 }
		
		return
	end
	local var7 = self._serverStatsData[p0]
	local max = var7.max
	local min = var7.min
	local var8 = self._serverStatsData[p0].dataSet:push_back({ value = p1, time = self._lastUpdateTime })
	
	if var8 then
		local var9 = self._serverStatsData[p0].dataSet:iterator()
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
	self._serverStatsData[p0].max = if max < p1 then p1 else max
	self._serverStatsData[p0].min = if min < p1 then min else p1
end

function t:isRunning() --[[ line: 87 ]]
	return self._isRunning
end

function t:start() --[[ line: 91 ]]
	-- upvalues: getClientReplicatorModule (ref)
	local var11 = getClientReplicatorModule()
	
	if var11 and not self._statsListenerConnection then
		self._statsListenerConnection = var11.StatsReceived:connect(function(p2) --[[ line: 94 ]]
			-- upvalues: self (ref)
			if p2 then
				self._lastUpdateTime = os.time()
				local var12 = 0
				
				for i, v in pairs(p2) do
					if type(v) == "number" then
						self:updateValue(i, v)
						var12 += 1
					end
				end
				self._serverStatsDataCount = var12
				self._serverStatsUpdated:Fire(self._serverStatsData)
				
				if self._serverStatsData["Avg Data Ping ms"] then
					self._serverStatsPing:Fire(self._serverStatsData["Avg Data Ping ms"].dataSet:back().value)
				end
			end
		end)
		var11:RequestServerStats(true)
		self._isRunning = true
	end
end

function t:stop() --[[ line: 117 ]]
	if self._statsListenerConnection then
		self._statsListenerConnection:Disconnect()
		self._statsListenerConnection = nil
	end
	self._isRunning = false
end

return t