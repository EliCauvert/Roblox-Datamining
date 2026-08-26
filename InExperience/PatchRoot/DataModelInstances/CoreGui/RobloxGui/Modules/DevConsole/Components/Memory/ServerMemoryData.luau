local signalModule = require(script.Parent.Parent.Parent.Signal)
local circularBufferModule = require(script.Parent.Parent.Parent.CircularBuffer)
local chartHeaderNames = require(script.Parent.Parent.Parent.Constants).MemoryFormatting.ChartHeaderNames
local var1 = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount"))
local t = {
	[chartHeaderNames[1]] = function(p1, p2)
		return p1.name < p2.name
	end,
	[chartHeaderNames[2]] = function(p1, p2)
		return p1.dataStats.dataSet:back().data < p2.dataStats.dataSet:back().data
	end
}
local getClientReplicatorModule = require(script.Parent.Parent.Parent.Util.getClientReplicator)
local t_1 = {}
t_1.__index = t_1

function t_1.new()
	-- upvalues: t_1 (ref), signalModule (ref), chartHeaderNames (ref)
	local t = {}
	setmetatable(t, t_1)
	t._init = false
	t._isRunning = false
	t._totalMemory = 0
	t._memoryData = {}
	t._memoryDataSorted = {}
	t._coreTreeData = {}
	t._coreTreeDataSorted = {}
	t._placeTreeData = {}
	t._placeTreeDataSorted = {}
	t._placeScriptTreeData = {}
	t._placeScriptTreeDataSorted = {}
	t._coreScriptTreeData = {}
	t._coreScriptTreeDataSorted = {}
	t._treeViewUpdated = signalModule.new()
	t._sortType = chartHeaderNames[1]
	
	return t
end

function t_1:updateEntry(p1, p2, p3, p4)
	-- upvalues: circularBufferModule (ref), var1 (ref)
	if not p1[p3] then
		local var2 = circularBufferModule.new(var1)
		var2:push_back({ data = p4, time = self._lastUpdate })
		p1[p3] = { min = p4, max = p4, dataSet = var2 }
		table.insert(p2, { name = p3, dataStats = p1[p3] })
		
		return
	end
	local max = p1[p3].max
	local min = p1[p3].min
	local var3 = p1[p3].dataSet:push_back({ data = p4, time = self._lastUpdate })
	
	if var3 then
		local var4 = p1[p3].dataSet:iterator()
		local var5 = var4:next()
		
		if max == var3.data then
			max = min
			while var5 do
				max = if var5.data < max then max else var5.data
				var5 = var4:next()
			end
		end
		if min == var3.data then
			min = max
			while var5 do
				min = if min < var5.data then min else var5.data
				var5 = var4:next()
			end
		end
	end
	p1[p3].max = if max < p4 then p4 else max
	p1[p3].min = if min < p4 then min else p4
end

function t_1:updateEntryList(p5, p6, p7)
	local var6 = 0
	
	for i, v in pairs(p7) do
		local var7 = v / 1048576
		var6 += var7
		self:updateEntry(p5, p6, i, var7)
	end
	for i_1, v_1 in pairs(p5) do
		if p7[i_1] == nil then
			p5[i_1] = nil
			
			for i_2, v_2 in ipairs(p6) do
				if i_1 == v_2.name then
					table.remove(p6, i_2)
					continue
				end
			end
		end
	end
	return var6
end

function t_1:updateWithTreeStats(p8)
	local t = {
		PlaceMemory = 0,
		CoreMemory = 0,
		UntrackedMemory = 0,
		PlaceScriptMemory = 0,
		CoreScriptMemory = 0
	}
	
	for i, v in pairs(p8) do
		if i == "totalServerMemory" then
			self._totalMemory = v / 1048576
		elseif i == "developerTags" then
			t.PlaceMemory = self:updateEntryList(self._placeTreeData, self._placeTreeDataSorted, v)
		elseif i == "internalCategories" then
			t.CoreMemory = self:updateEntryList(self._coreTreeData, self._coreTreeDataSorted, v)
		elseif i == "placeScriptMemoryCategories" then
			t.PlaceScriptMemory = self:updateEntryList(self._placeScriptTreeData, self._placeScriptTreeDataSorted, v)
		elseif i == "coreScriptMemoryCategories" then
			t.CoreScriptMemory = self:updateEntryList(self._coreScriptTreeData, self._coreScriptTreeDataSorted, v)
		end
	end
	t.UntrackedMemory = self._totalMemory - t.PlaceMemory - t.CoreMemory
	
	if self._init then
		for i_1, v_1 in pairs(t) do
			self:updateEntry(self._memoryData.Memory.children, self._memoryData.Memory.sortedChildren, i_1, v_1)
		end
		self:updateEntry(self._memoryData, self._memoryDataSorted, "Memory", self._totalMemory)
		
		return
	else
		local t_1 = {}
		local t_2 = {}
		
		for i_1, v_1 in pairs(t) do
			self:updateEntry(t_1, t_2, i_1, v_1)
		end
		self:updateEntry(self._memoryData, self._memoryDataSorted, "Memory", self._totalMemory)
		t_1.PlaceMemory.children = self._placeTreeData
		t_1.PlaceMemory.sortedChildren = self._placeTreeDataSorted
		t_1.CoreMemory.children = self._coreTreeData
		t_1.CoreMemory.sortedChildren = self._coreTreeDataSorted
		t_1.PlaceScriptMemory.children = self._placeScriptTreeData
		t_1.PlaceScriptMemory.sortedChildren = self._placeScriptTreeDataSorted
		t_1.CoreScriptMemory.children = self._coreScriptTreeData
		t_1.CoreScriptMemory.sortedChildren = self._coreScriptTreeDataSorted
		self._memoryData.Memory.children = t_1
		self._memoryData.Memory.sortedChildren = t_2
		self._init = true
	end
end

function t_1:totalMemSignal()
	return self._totalMemoryUpdated
end

function t_1:treeUpdatedSignal()
	return self._treeViewUpdated
end

function t_1:getSortType()
	return self._sortType
end

local function recursiveSort(p9, p10)
	-- upvalues: recursiveSort (ref)
	table.sort(p9, p10)
	
	for i, v in pairs(p9) do
		if v.dataStats.sortedChildren then
			recursiveSort(v.dataStats.sortedChildren, p10)
		end
	end
end

function t_1:setSortType(p11)
	-- upvalues: t (ref), recursiveSort (ref)
	if t[p11] then
		self._sortType = p11
		recursiveSort(self._memoryDataSorted, t[self._sortType])
		
		return
	end
	error(string.format("attempted to pass invalid sortType: %s", tostring(p11)), 2)
end

function t_1:getMemoryData()
	return self._memoryDataSorted
end

function t_1:isRunning()
	return self._isRunning
end

function t_1:start()
	-- upvalues: getClientReplicatorModule (ref)
	local var8 = getClientReplicatorModule()
	
	if var8 and not self._statsListenerConnection then
		self._statsListenerConnection = var8.StatsReceived:connect(function(p11)
			-- upvalues: self (ref)
			if not p11.ServerMemoryTree then return end
			self._lastUpdate = os.time()
			local serverMemoryTree = p11.ServerMemoryTree
			
			if serverMemoryTree then
				self:updateWithTreeStats(serverMemoryTree)
				self._treeViewUpdated:Fire(self._memoryDataSorted)
			end
		end)
		var8:RequestServerStats(true)
		self._isRunning = true
	end
end

function t_1:stop()
	-- upvalues: getClientReplicatorModule (ref)
	local var8 = getClientReplicatorModule()
	
	if var8 then
		var8:RequestServerStats(false)
		self._statsListenerConnection:Disconnect()
		self._isRunning = false
	end
end

return t_1