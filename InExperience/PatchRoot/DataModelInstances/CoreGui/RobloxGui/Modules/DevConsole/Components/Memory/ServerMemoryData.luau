local SignalModule = require(script.Parent.Parent.Parent.Signal)
local CircularBufferModule = require(script.Parent.Parent.Parent.CircularBuffer)
local ChartHeaderNames = require(script.Parent.Parent.Parent.Constants).MemoryFormatting.ChartHeaderNames
local Number: number? = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount"))
local config = {
	[ChartHeaderNames[1]] = function(p1, p2): boolean --[[ Line: 11 ]]
		return p1.name < p2.name
	end,
	[ChartHeaderNames[2]] = function(p1, p2): boolean --[[ Line: 14 ]]
		return p1.dataStats.dataSet:back().data < p2.dataStats.dataSet:back().data
	end
}
local GetClientReplicatorModule = require(script.Parent.Parent.Parent.Util.getClientReplicator)
local ServerMemoryDataModule = {}
ServerMemoryDataModule.__index = ServerMemoryDataModule

function ServerMemoryDataModule.new() --[[ Line: 24 ]]
	-- upvalues: ServerMemoryDataModule (copy), SignalModule (copy), ChartHeaderNames (copy)
	local t = {}
	setmetatable(t, ServerMemoryDataModule)
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
	t._treeViewUpdated = SignalModule.new()
	t._sortType = ChartHeaderNames[1]
	
	return t
end

function ServerMemoryDataModule:updateEntry(Children, List, Name, Data) --[[ Line: 53 ]]
	-- upvalues: CircularBufferModule (copy), Number (copy)
	if not Children[Name] then
		local NewCircularBuffer = CircularBufferModule.new(Number)
		NewCircularBuffer:push_back({ data = Data, time = self._lastUpdate })
		Children[Name] = { min = Data, max = Data, dataSet = NewCircularBuffer }
		table.insert(List, { name = Name, dataStats = Children[Name] })
		
		return
	end
	local Max = Children[Name].max
	local Min = Children[Name].min
	local Push_backResult = Children[Name].dataSet:push_back({ data = Data, time = self._lastUpdate })
	
	if Push_backResult then
		local IteratorResult = Children[Name].dataSet:iterator()
		local Key = IteratorResult:next()
		
		if Max == Push_backResult.data then
			Max = Min
			while Key do
				Max = Key.data < Max and Max or Key.data
				Key = IteratorResult:next()
			end
		end
		if Min == Push_backResult.data then
			Min = Max
			while Key do
				Min = Min < Key.data and Min or Key.data
				Key = IteratorResult:next()
			end
		end
	end
	Children[Name].max = Max < Data and Data or Max
	Children[Name].min = Min < Data and Min or Data
end

function ServerMemoryDataModule:updateEntryList(CoreScriptTreeData, List, List1): number --[[ Line: 109 ]]
	local Total = 0
	
	for i, value in pairs(List1) do
		local Amount = value / 1048576
		Total += Amount
		self:updateEntry(CoreScriptTreeData, List, i, Amount)
	end
	for i1, _ in pairs(CoreScriptTreeData) do
		if List1[i1] == nil then
			CoreScriptTreeData[i1] = nil
			
			for i2, value1 in ipairs(List) do
				if i1 == value1.name then
					table.remove(List, i2)
					break
				end
			end
		end
	end
	return Total
end

function ServerMemoryDataModule:updateWithTreeStats(ServerMemoryTree) --[[ Line: 138 ]]
	local config = {
		PlaceMemory = 0,
		CoreMemory = 0,
		UntrackedMemory = 0,
		PlaceScriptMemory = 0,
		CoreScriptMemory = 0
	}
	
	for i, value in pairs(ServerMemoryTree) do
		if i == "totalServerMemory" then
			self._totalMemory = value / 1048576
		elseif i == "developerTags" then
			config.PlaceMemory = self:updateEntryList(self._placeTreeData, self._placeTreeDataSorted, value)
		elseif i == "internalCategories" then
			config.CoreMemory = self:updateEntryList(self._coreTreeData, self._coreTreeDataSorted, value)
		elseif i == "placeScriptMemoryCategories" then
			config.PlaceScriptMemory = self:updateEntryList(self._placeScriptTreeData, self._placeScriptTreeDataSorted, value)
		elseif i == "coreScriptMemoryCategories" then
			config.CoreScriptMemory = self:updateEntryList(self._coreScriptTreeData, self._coreScriptTreeDataSorted, value)
		end
	end
	config.UntrackedMemory = self._totalMemory - config.PlaceMemory - config.CoreMemory
	
	if self._init then
		for i1, value1 in pairs(config) do
			self:updateEntry(self._memoryData.Memory.children, self._memoryData.Memory.sortedChildren, i1, value1)
		end
		self:updateEntry(self._memoryData, self._memoryDataSorted, "Memory", self._totalMemory)
		
		return
	else
		local Children = {}
		local SortedChildren = {}
		
		for i2, value2 in pairs(config) do
			self:updateEntry(Children, SortedChildren, i2, value2)
		end
		self:updateEntry(self._memoryData, self._memoryDataSorted, "Memory", self._totalMemory)
		Children.PlaceMemory.children = self._placeTreeData
		Children.PlaceMemory.sortedChildren = self._placeTreeDataSorted
		Children.CoreMemory.children = self._coreTreeData
		Children.CoreMemory.sortedChildren = self._coreTreeDataSorted
		Children.PlaceScriptMemory.children = self._placeScriptTreeData
		Children.PlaceScriptMemory.sortedChildren = self._placeScriptTreeDataSorted
		Children.CoreScriptMemory.children = self._coreScriptTreeData
		Children.CoreScriptMemory.sortedChildren = self._coreScriptTreeDataSorted
		self._memoryData.Memory.children = Children
		self._memoryData.Memory.sortedChildren = SortedChildren
		self._init = true
	end
end

function ServerMemoryDataModule:totalMemSignal() --[[ Line: 204 ]]
	return self._totalMemoryUpdated
end

function ServerMemoryDataModule:treeUpdatedSignal() --[[ Line: 208 ]]
	return self._treeViewUpdated
end

function ServerMemoryDataModule:getSortType() --[[ Line: 212 ]]
	return self._sortType
end

local function recursiveSort(List, p1) --[[ Line: 216 ]]
	-- upvalues: recursiveSort (copy)
	table.sort(List, p1)
	
	for _, value in pairs(List) do
		if value.dataStats.sortedChildren then
			recursiveSort(value.dataStats.sortedChildren, p1)
		end
	end
end

function ServerMemoryDataModule:setSortType(_sortType) --[[ Line: 225 ]]
	-- upvalues: config (copy), recursiveSort (copy)
	if config[_sortType] then
		self._sortType = _sortType
		recursiveSort(self._memoryDataSorted, config[self._sortType])
		
		return
	else
		error(string.format("attempted to pass invalid sortType: %s", (tostring(_sortType))), 2)
	end
end

function ServerMemoryDataModule:getMemoryData() --[[ Line: 234 ]]
	return self._memoryDataSorted
end

function ServerMemoryDataModule:isRunning() --[[ Line: 238 ]]
	return self._isRunning
end

function ServerMemoryDataModule:start() --[[ Line: 242 ]]
	-- upvalues: GetClientReplicatorModule (copy)
	local ClientReplicatorModule = GetClientReplicatorModule()
	
	if ClientReplicatorModule and not self._statsListenerConnection then
		self._statsListenerConnection = ClientReplicatorModule.StatsReceived:connect(function(Stats) --[[ Line: 245 ]]
			-- upvalues: self (copy)
			if not Stats.ServerMemoryTree then return end
			self._lastUpdate = os.time()
			local ServerMemoryTree = Stats.ServerMemoryTree
			
			if ServerMemoryTree then
				self:updateWithTreeStats(ServerMemoryTree)
				self._treeViewUpdated:Fire(self._memoryDataSorted)
			end
		end)
		ClientReplicatorModule:RequestServerStats(true)
		self._isRunning = true
	end
end

function ServerMemoryDataModule:stop() --[[ Line: 263 ]]
	-- upvalues: GetClientReplicatorModule (copy)
	local ClientReplicatorModule = GetClientReplicatorModule()
	
	if ClientReplicatorModule then
		ClientReplicatorModule:RequestServerStats(false)
		self._statsListenerConnection:Disconnect()
		self._isRunning = false
	end
end

return ServerMemoryDataModule