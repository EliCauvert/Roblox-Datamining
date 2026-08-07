local signalModule = require(script.Parent.Parent.Parent.Signal)
local circularBufferModule = require(script.Parent.Parent.Parent.CircularBuffer)
local chartHeaderNames = require(script.Parent.Parent.Parent.Constants).MemoryFormatting.ChartHeaderNames
local var2 = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount"))
local t = {
	[chartHeaderNames[1]] = function(p0, p1) --[[ line: 11 ]]
		return p0.name < p1.name
	end,
	[chartHeaderNames[2]] = function(p2, p3) --[[ line: 14 ]]
		return p2.dataStats.dataSet:back().data < p3.dataStats.dataSet:back().data
	end
}
local getClientReplicatorModule = require(script.Parent.Parent.Parent.Util.getClientReplicator)
local t_1 = {}
t_1.__index = t_1

function t_1.new() --[[ line: 24 ]]
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

function t_1:updateEntry(p4, p5, p6, p7) --[[ line: 53 ]]
	-- upvalues: circularBufferModule (ref), var2 (ref)
	if not p4[p6] then
		local var8 = circularBufferModule.new(var2)
		var8:push_back({ data = p7, time = self._lastUpdate })
		p4[p6] = { min = p7, max = p7, dataSet = var8 }
		table.insert(p5, { name = p6, dataStats = p4[p6] })
		
		return
	end
	local max = p4[p6].max
	local min = p4[p6].min
	local var9 = p4[p6].dataSet:push_back({ data = p7, time = self._lastUpdate })
	
	if var9 then
		local var10 = p4[p6].dataSet:iterator()
		local var11 = var10:next()
		
		if max == var9.data then
			max = min
			while var11 do
				max = if var11.data < max then max else var11.data
				var11 = var10:next()
			end
		end
		if min == var9.data then
			min = max
			while var11 do
				min = if min < var11.data then min else var11.data
				var11 = var10:next()
			end
		end
	end
	p4[p6].max = if max < p7 then p7 else max
	p4[p6].min = if min < p7 then min else p7
end

function t_1:updateEntryList(p8, p9, p10) --[[ line: 109 ]]
	local var12 = 0
	
	for i, v in pairs(p10) do
		local var13 = v / 1048576
		var12 += var13
		self:updateEntry(p8, p9, i, var13)
	end
	for i_1, v_1 in pairs(p8) do
		if p10[i_1] == nil then
			p8[i_1] = nil
			
			for i_2, v_2 in ipairs(p9) do
				if i_1 == v_2.name then
					table.remove(p9, i_2)
					continue
				end
			end
		end
	end
	return var12
end

function t_1:updateWithTreeStats(p11) --[[ line: 138 ]]
	local t = {
		PlaceMemory = 0,
		CoreMemory = 0,
		UntrackedMemory = 0,
		PlaceScriptMemory = 0,
		CoreScriptMemory = 0
	}
	
	for i, v in pairs(p11) do
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

function t_1:totalMemSignal() --[[ line: 204 ]]
	return self._totalMemoryUpdated
end

function t_1:treeUpdatedSignal() --[[ line: 208 ]]
	return self._treeViewUpdated
end

function t_1:getSortType() --[[ line: 212 ]]
	return self._sortType
end

local function recursiveSort(p12, p13) --[[ line: 216 ]]
	-- upvalues: recursiveSort (ref)
	table.sort(p12, p13)
	
	for i, v in pairs(p12) do
		if v.dataStats.sortedChildren then
			recursiveSort(v.dataStats.sortedChildren, p13)
		end
	end
end

function t_1:setSortType(p14) --[[ line: 225 ]]
	-- upvalues: t (ref), recursiveSort (ref)
	if t[p14] then
		self._sortType = p14
		recursiveSort(self._memoryDataSorted, t[self._sortType])
		
		return
	end
	error(string.format("attempted to pass invalid sortType: %s", tostring(p14)), 2)
end

function t_1:getMemoryData() --[[ line: 234 ]]
	return self._memoryDataSorted
end

function t_1:isRunning() --[[ line: 238 ]]
	return self._isRunning
end

function t_1:start() --[[ line: 242 ]]
	-- upvalues: getClientReplicatorModule (ref)
	local var17 = getClientReplicatorModule()
	
	if var17 and not self._statsListenerConnection then
		self._statsListenerConnection = var17.StatsReceived:connect(function(p15) --[[ line: 245 ]]
			-- upvalues: self (ref)
			if not p15.ServerMemoryTree then return end
			self._lastUpdate = os.time()
			local serverMemoryTree = p15.ServerMemoryTree
			
			if serverMemoryTree then
				self:updateWithTreeStats(serverMemoryTree)
				self._treeViewUpdated:Fire(self._memoryDataSorted)
			end
		end)
		var17:RequestServerStats(true)
		self._isRunning = true
	end
end

function t_1:stop() --[[ line: 263 ]]
	-- upvalues: getClientReplicatorModule (ref)
	local var18 = getClientReplicatorModule()
	
	if var18 then
		var18:RequestServerStats(false)
		self._statsListenerConnection:Disconnect()
		self._isRunning = false
	end
end

return t_1