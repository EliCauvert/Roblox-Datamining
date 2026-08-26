local circularBufferModule = require(script.Parent.Parent.Parent.CircularBuffer)
local signalModule = require(script.Parent.Parent.Parent.Signal)
local var1 = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount"))
local chartHeaderNames = require(script.Parent.Parent.Parent.Constants).ServerScriptsFormatting.ChartHeaderNames
local t = {
	[chartHeaderNames[1]] = function(p1, p2)
		return p1.dataStats.dataSet:back().name < p2.dataStats.dataSet:back().name
	end,
	[chartHeaderNames[2]] = function(p1, p2)
		return p1.dataStats.dataSet:back().data[1] < p2.dataStats.dataSet:back().data[1]
	end,
	[chartHeaderNames[3]] = function(p1, p2)
		return p1.dataStats.dataSet:back().data[2] < p2.dataStats.dataSet:back().data[2]
	end
}
local minOfTableModule = require(script.Parent.Parent.Parent.Util.minOfTable)
local maxOfTableModule = require(script.Parent.Parent.Parent.Util.maxOfTable)
local getClientReplicatorModule = require(script.Parent.Parent.Parent.Util.getClientReplicator)
local t_1 = {}
t_1.__index = t_1

function t_1.new()
	-- upvalues: t_1 (ref), signalModule (ref), chartHeaderNames (ref)
	local t = {}
	setmetatable(t, t_1)
	t._serverScriptsUpdated = signalModule.new()
	t._serverScriptsData = {}
	t._lastUpdate = 0
	t._sortedScriptsData = {}
	t._sortType = chartHeaderNames[1]
	t._isRunning = false
	
	return t
end

function t_1:setSortType(p1)
	-- upvalues: t (ref)
	if t[p1] then
		self._sortType = p1
		table.sort(self._sortedScriptsData, t[self._sortType])
		
		return
	end
	error(string.format("attempted to pass invalid sortType: %s", tostring(p1)), 2)
end

function t_1:getSortType()
	return self._sortType
end

function t_1:Signal()
	return self._serverScriptsUpdated
end

function t_1:getCurrentData()
	return self._sortedScriptsData
end

function t_1:updateScriptsData(p1)
	-- upvalues: circularBufferModule (ref), var1 (ref), maxOfTableModule (ref), minOfTableModule (ref)
	self._lastUpdate = os.time()
	
	for i, v in pairs(p1) do
		if not self._serverScriptsData[i] then
			local var2 = circularBufferModule.new(var1)
			var2:push_back({ data = v, time = self._lastUpdate })
			self._serverScriptsData[i] = { max = v, min = v, dataSet = var2 }
			table.insert(self._sortedScriptsData, { name = i, dataStats = self._serverScriptsData[i] })
			continue
		end
		local t = {}
		
		for i_1, v_1 in pairs(self._serverScriptsData[i].max) do
			t[i_1] = v_1
		end
		local t_1 = {}
		
		for v_1, v_2 in pairs(self._serverScriptsData[i].min) do
			t_1[v_1] = v_2
		end
		local var3 = self._serverScriptsData[i].dataSet:push_back({ data = v, time = self._lastUpdate })
		
		if var3 then
			for i_3, v_3 in pairs(var3.data) do
				if t[i_3] == v_3 then
					local var4 = self._serverScriptsData[i].dataSet:iterator()
					local var5 = var4:next()
					t[i_3] = t_1[i_3]
					while var5 do
						t[i_3] = if var5.data[i_3] < t[i_3] then t[i_3] else var5.data[i_3]
						var5 = var4:next()
					end
				end
			end
			for i_3, v_3 in pairs(var3.data) do
				if t_1[i_3] == v_3 then
					local var6 = self._serverScriptsData[i].dataSet:iterator()
					local var7 = var6:next()
					t_1[i_3] = t[i_3]
					while var7 do
						t_1[i_3] = if t_1[i_3] < var7.data[i_3] then t_1[i_3] else var7.data[i_3]
						var7 = var6:next()
					end
				end
			end
		end
		self._serverScriptsData[i].max = maxOfTableModule(t, v)
		self._serverScriptsData[i].min = minOfTableModule(t_1, v)
	end
end

function t_1:isRunning()
	return self._isRunning
end

function t_1:start()
	-- upvalues: getClientReplicatorModule (ref)
	local var8 = getClientReplicatorModule()
	
	if var8 and not self._statsListenerConnection then
		self._statsListenerConnection = var8.StatsReceived:connect(function(p2)
			-- upvalues: self (ref)
			if p2 then
				self._lastUpdate = os.time()
				local scripts = p2.Scripts
				
				if scripts then
					self:updateScriptsData(scripts)
				end
				self._serverScriptsUpdated:Fire(self._sortedScriptsData)
			end
		end)
		var8:RequestServerStats(true)
		self._isRunning = true
	end
end

function t_1:stop()
	if self._statsListenerConnection then
		self._statsListenerConnection:Disconnect()
		self._statsListenerConnection = nil
	end
	self._isRunning = false
end

return t_1