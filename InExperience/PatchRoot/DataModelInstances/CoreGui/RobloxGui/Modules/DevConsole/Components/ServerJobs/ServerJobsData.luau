local circularBufferModule = require(script.Parent.Parent.Parent.CircularBuffer)
local signalModule = require(script.Parent.Parent.Parent.Signal)
local chartHeaderNames = require(script.Parent.Parent.Parent.Constants).ServerJobsFormatting.ChartHeaderNames
local var2 = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount"))
local t = {
	[chartHeaderNames[1]] = function(p0, p1) --[[ line: 11 ]]
		return p0.name < p1.name
	end,
	[chartHeaderNames[2]] = function(p2, p3) --[[ line: 14 ]]
		return p2.dataStats.dataSet:back().data[1] < p3.dataStats.dataSet:back().data[1]
	end,
	[chartHeaderNames[3]] = function(p4, p5) --[[ line: 17 ]]
		return p4.dataStats.dataSet:back().data[2] < p5.dataStats.dataSet:back().data[2]
	end,
	[chartHeaderNames[4]] = function(p6, p7) --[[ line: 20 ]]
		return p6.dataStats.dataSet:back().data[3] < p7.dataStats.dataSet:back().data[3]
	end
}
local minOfTableModule = require(script.Parent.Parent.Parent.Util.minOfTable)
local maxOfTableModule = require(script.Parent.Parent.Parent.Util.maxOfTable)
local getClientReplicatorModule = require(script.Parent.Parent.Parent.Util.getClientReplicator)
local t_1 = {}
t_1.__index = t_1

function t_1.new() --[[ line: 32 ]]
	-- upvalues: t_1 (ref), signalModule (ref), chartHeaderNames (ref)
	local t = {}
	setmetatable(t, t_1)
	t._serverJobsUpdated = signalModule.new()
	t._serverJobsData = {}
	t._sortedJobsData = {}
	t._sortType = chartHeaderNames[1]
	t._lastUpdate = 0
	t._isRunning = false
	
	return t
end

function t_1:setSortType(p8) --[[ line: 46 ]]
	-- upvalues: t (ref)
	if t[p8] then
		self._sortType = p8
		table.sort(self._sortedJobsData, t[self._sortType])
		
		return
	end
	error(string.format("attempted to pass invalid sortType: %s", tostring(p8)), 2)
end

function t_1:getSortType() --[[ line: 56 ]]
	return self._sortType
end

function t_1:Signal() --[[ line: 60 ]]
	return self._serverJobsUpdated
end

function t_1:getCurrentData() --[[ line: 64 ]]
	return self._sortedJobsData
end

function t_1:updateServerJobsData(p9) --[[ line: 68 ]]
	-- upvalues: circularBufferModule (ref), var2 (ref), maxOfTableModule (ref), minOfTableModule (ref)
	self._lastUpdate = os.time()
	
	for i, v in pairs(p9) do
		if not self._serverJobsData[i] then
			local var9 = circularBufferModule.new(var2)
			var9:push_back({ data = v, time = self._lastUpdate })
			self._serverJobsData[i] = { max = v, min = v, dataSet = var9 }
			table.insert(self._sortedJobsData, { name = i, dataStats = self._serverJobsData[i] })
			continue
		end
		local t = {}
		
		for i_1, v_1 in pairs(self._serverJobsData[i].max) do
			t[i_1] = v_1
		end
		local t_1 = {}
		
		for v_1, v_2 in pairs(self._serverJobsData[i].min) do
			t_1[v_1] = v_2
		end
		local var12 = self._serverJobsData[i].dataSet:push_back({ data = v, time = self._lastUpdate })
		
		if var12 then
			for i_3, v_3 in pairs(var12.data) do
				if t[i_3] == v_3 then
					local var15 = self._serverJobsData[i].dataSet:iterator()
					local var16 = var15:next()
					t[i_3] = t_1[i_3]
					while var16 do
						t[i_3] = if var16.data[i_3] < t[i_3] then t[i_3] else var16.data[i_3]
						var16 = var15:next()
					end
				end
			end
			for i_3, v_3 in pairs(var12.data) do
				if t_1[i_3] == v_3 then
					local var13 = self._serverJobsData[i].dataSet:iterator()
					local var14 = var13:next()
					t_1[i_3] = t[i_3]
					while var14 do
						t_1[i_3] = if t_1[i_3] < var14.data[i_3] then t_1[i_3] else var14.data[i_3]
						var14 = var13:next()
					end
				end
			end
		end
		self._serverJobsData[i].max = maxOfTableModule(t, v)
		self._serverJobsData[i].min = minOfTableModule(t_1, v)
	end
end

function t_1:isRunning() --[[ line: 141 ]]
	return self._isRunning
end

function t_1:start() --[[ line: 145 ]]
	-- upvalues: getClientReplicatorModule (ref)
	local var17 = getClientReplicatorModule()
	
	if var17 and not self._statsListenerConnection then
		self._statsListenerConnection = var17.StatsReceived:connect(function(p10) --[[ line: 148 ]]
			-- upvalues: self (ref)
			local jobs = p10.Jobs
			
			if jobs then
				self:updateServerJobsData(jobs)
				self._serverJobsUpdated:Fire(self._sortedJobsData)
			end
		end)
		var17:RequestServerStats(true)
		self._isRunning = true
	end
end

function t_1:stop() --[[ line: 161 ]]
	if self._statsListenerConnection then
		self._statsListenerConnection:Disconnect()
		self._statsListenerConnection = nil
		self._isRunning = false
	end
end

return t_1