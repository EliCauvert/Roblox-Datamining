local FFlagDevConsoleKeyCollisionFixModule = require(script.Parent.Flags.FFlagDevConsoleKeyCollisionFix)
local SignalModule = require(script.Parent.Parent.Parent.Signal)
local SoundService = game:GetService("SoundService")
local TextService = game:GetService("TextService")
local MeshContentProvider = game:GetService("MeshContentProvider")
local KeyframeSequenceProvider = game:GetService("KeyframeSequenceProvider")
local StatsService = game:GetService("Stats")
local StatsUtilsModule = require(script.Parent.Parent.Parent.Parent.Stats.StatsUtils)
local CircularBufferModule = require(script.Parent.Parent.Parent.CircularBuffer)
local ChartHeaderNames = require(script.Parent.Parent.Parent.Constants).MemoryFormatting.ChartHeaderNames
local Number: number? = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount"))
local config = {
	[ChartHeaderNames[1]] = function(p1, p2): boolean
		return p1.name < p2.name
	end,
	[ChartHeaderNames[2]] = function(p1, p2): boolean
		return p1.dataStats.dataSet:back().data < p2.dataStats.dataSet:back().data
	end
}
local ClientMemoryDataModule = {}
ClientMemoryDataModule.__index = ClientMemoryDataModule

function ClientMemoryDataModule.new()
	-- upvalues: ClientMemoryDataModule (copy), SignalModule (copy), ChartHeaderNames (copy)
	local t = {}
	setmetatable(t, ClientMemoryDataModule)
	t._pollingId = 0
	t._totalMemory = 0
	t._memoryData = {}
	t._memoryDataSorted = {}
	t._treeViewUpdatedSignal = SignalModule.new()
	t._totalMemoryUpdated = SignalModule.new()
	t._sortType = ChartHeaderNames[1]
	t._isRunning = false
	t._doGranularMemUpdate = {}
	t._granularMemTable = {}
	
	return t
end

local function _()
	-- upvalues: StatsService (copy), StatsUtilsModule (copy)
	local PerformanceStats = StatsService and StatsService:FindFirstChild("PerformanceStats")
	
	return if PerformanceStats then PerformanceStats:FindFirstChild(StatsUtilsModule.StatNames[StatsUtilsModule.StatType_Memory]) else nil
end

local function fetchSoundMemoryData()
	-- upvalues: SoundService (copy)
	local List = {}
	
	for Name, Value in pairs((SoundService:GetSoundMemoryData())) do
		table.insert(List, { name = Name, value = Value })
	end
	table.sort(List, function(A, B): boolean
		return B.value < A.value
	end)
	
	return List
end

local function fetchGraphicsTextureMemoryData()
	-- upvalues: StatsService (copy)
	local PaginatedMemoryByTexture = StatsService:GetPaginatedMemoryByTexture(Enum.TextureQueryType.NonHumanoidOrphaned, 0, 100)
	local List = {}
	
	local function aggregateData(List, PaginatedMemoryByTexture)
		for _, result in ipairs(PaginatedMemoryByTexture.Results) do
			table.insert(List, {
				name = result.TextureId,
				value = result.MemoryInBytes / 1048576
			})
		end
	end
	
	aggregateData(List, (StatsService:GetPaginatedMemoryByTexture(Enum.TextureQueryType.NonHumanoid, 0, 100)))
	aggregateData(List, PaginatedMemoryByTexture)
	table.sort(List, function(A, B): boolean
		return B.value < A.value
	end)
	
	return List
end

local function fetchGraphicsTextureCharacterMemoryData()
	-- upvalues: StatsService (copy), FFlagDevConsoleKeyCollisionFixModule (copy)
	local PaginatedMemoryByTexture = StatsService:GetPaginatedMemoryByTexture(Enum.TextureQueryType.HumanoidOrphaned, 0, 100)
	local t = {}
	
	local function aggregateData(List, PaginatedMemoryByTexture)
		-- upvalues: FFlagDevConsoleKeyCollisionFixModule (upval)
		for _, result in ipairs(PaginatedMemoryByTexture.Results) do
			local MemoryInBytesRatio = result.MemoryInBytes / 1048576
			local MoreInfo = {}
			local List1 = {}
			
			for _, value in pairs(string.split(result.TextureId, " ")) do
				if string.sub(value, 1, 2) == "T[" then
					table.insert(List1, value)
				end
			end
			local t = {}
			
			for _, value1 in pairs(List1) do
				local Part: string = string.split(value1, ".mesh:")[2]
				local FoundAt: number? = string.find(Part, ":", 12)
				
				if FoundAt ~= nil then
					FoundAt -= 1
				end
				t[string.sub(Part, 1, FoundAt)] = true
			end
			for Name, _ in pairs(t) do
				table.insert(MoreInfo, { name = Name })
			end
			table.sort(MoreInfo, function(A, B): boolean
				return A.name < B.name
			end)
			
			if FFlagDevConsoleKeyCollisionFixModule then
				table.insert(List, {
					name = "Composite Texture",
					id = result.TextureId,
					value = MemoryInBytesRatio,
					moreInfo = MoreInfo
				})
			else
				table.insert(List, {
					name = "Composite Texture",
					value = MemoryInBytesRatio,
					moreInfo = MoreInfo
				})
			end
		end
	end
	
	aggregateData(t, (StatsService:GetPaginatedMemoryByTexture(Enum.TextureQueryType.Humanoid, 0, 100)))
	aggregateData(t, PaginatedMemoryByTexture)
	
	return t
end

local function fetchGraphicsMeshPartsMemoryData()
	-- upvalues: MeshContentProvider (copy)
	local List = {}
	
	for Name, value in pairs((MeshContentProvider:getContentMemoryData())) do
		table.insert(List, { name = Name, value = value / 1048576 })
	end
	table.sort(List, function(A, B): boolean
		return B.value < A.value
	end)
	
	return List
end

local function fetchFuncAnimation()
	-- upvalues: KeyframeSequenceProvider (copy)
	local List = {}
	
	for Name, memStat in pairs((KeyframeSequenceProvider:GetMemStats())) do
		table.insert(List, { name = Name, value = memStat / 1048576 })
	end
	table.sort(List, function(A, B): boolean
		return B.value < A.value
	end)
	
	return List
end

local function fetchFontMemoryData()
	-- upvalues: TextService (copy)
	local List = {}
	
	for Name, value in pairs((TextService:GetFontMemoryData())) do
		table.insert(List, { name = Name, value = value / 1048576 })
	end
	table.sort(List, function(A, B): boolean
		return B.value < A.value
	end)
	
	return List
end

function ClientMemoryDataModule:updateCachedData(p1, Callback)
	if self._doGranularMemUpdate[p1] then
		self._doGranularMemUpdate[p1] = false
		self._granularMemTable[p1] = Callback()
	end
end

function ClientMemoryDataModule.getAdditionalMemoryFunc(p1, MemoryAnalyzerStatName)
	-- upvalues: fetchSoundMemoryData (copy), fetchGraphicsTextureMemoryData (copy), fetchGraphicsTextureCharacterMemoryData (copy), fetchGraphicsMeshPartsMemoryData (copy), fetchFuncAnimation (copy), fetchFontMemoryData (copy)
	local FetchSoundMemoryData = if MemoryAnalyzerStatName == "Sounds" then fetchSoundMemoryData elseif MemoryAnalyzerStatName == "GraphicsTexture" then fetchGraphicsTextureMemoryData elseif MemoryAnalyzerStatName == "GraphicsTextureCharacter" then fetchGraphicsTextureCharacterMemoryData elseif MemoryAnalyzerStatName == "GraphicsMeshParts" then fetchGraphicsMeshPartsMemoryData elseif MemoryAnalyzerStatName == "csgDictionary" then nil elseif MemoryAnalyzerStatName == "Animation" then fetchFuncAnimation elseif MemoryAnalyzerStatName == "gui/FontData" and game:GetEngineFeature("TextServiceGetFontMemoryData") then fetchFontMemoryData else nil
	
	return if FetchSoundMemoryData then function()
		-- upvalues: p1 (copy), MemoryAnalyzerStatName (copy), FetchSoundMemoryData (ref)
		p1:updateCachedData(MemoryAnalyzerStatName, FetchSoundMemoryData)
		
		return p1._granularMemTable[MemoryAnalyzerStatName]
	end else nil
end

function ClientMemoryDataModule:recursiveUpdateEntry(Children, List, Player)
	-- upvalues: StatsUtilsModule (copy), CircularBufferModule (copy), Number (copy)
	local MemoryAnalyzerStatName = StatsUtilsModule.GetMemoryAnalyzerStatName(Player.DisplayName)
	local Value = Player:GetValue()
	local Children1 = Player:GetChildren()
	
	if Children[MemoryAnalyzerStatName] then
		local Max = Children[MemoryAnalyzerStatName].max
		local Min = Children[MemoryAnalyzerStatName].min
		local config = { data = Value, time = self._lastUpdate }
		
		if Children[MemoryAnalyzerStatName].additionalInfoFunc and Children[MemoryAnalyzerStatName].dataSet:back().data ~= config.data then
			self._doGranularMemUpdate[MemoryAnalyzerStatName] = true
		end
		local Push_backResult = Children[MemoryAnalyzerStatName].dataSet:push_back(config)
		
		if Push_backResult then
			local IteratorResult = Children[MemoryAnalyzerStatName].dataSet:iterator()
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
		Children[MemoryAnalyzerStatName].max = Max < Value and Value or Max
		Children[MemoryAnalyzerStatName].min = Min < Value and Min or Value
	else
		local NewCircularBuffer = CircularBufferModule.new(Number)
		NewCircularBuffer:push_back({ data = Value, time = self._lastUpdate })
		Children[MemoryAnalyzerStatName] = {
			min = Value,
			max = Value,
			dataSet = NewCircularBuffer,
			children = #Children1 > 0 and {},
			sortedChildren = #Children1 > 0 and {}
		}
		local AdditionalMemoryFunc = self:getAdditionalMemoryFunc(MemoryAnalyzerStatName)
		
		if AdditionalMemoryFunc then
			Children[MemoryAnalyzerStatName].additionalInfoFunc = AdditionalMemoryFunc
			self._doGranularMemUpdate[MemoryAnalyzerStatName] = true
		end
		table.insert(List, {
			name = MemoryAnalyzerStatName,
			dataStats = Children[MemoryAnalyzerStatName]
		})
	end
	local Child = Children[MemoryAnalyzerStatName]
	local t = {}
	
	for _, Player1 in ipairs(Children1) do
		t[Player1.DisplayName] = true
		self:recursiveUpdateEntry(Child.children, Child.sortedChildren, Player1)
	end
	if Child.children then
		for i, _ in pairs(Child.children) do
			if t[i] == nil then
				Child.children[i] = nil
				
				for i1, value in ipairs(Child.sortedChildren) do
					if i == value.name then
						table.remove(Child.sortedChildren, i1)
						break
					end
				end
			end
		end
	end
end

function ClientMemoryDataModule:totalMemSignal()
	return self._totalMemoryUpdated
end

function ClientMemoryDataModule:treeUpdatedSignal()
	return self._treeViewUpdatedSignal
end

function ClientMemoryDataModule:getSortType()
	return self._sortType
end

local function recursiveSort(List, p1)
	-- upvalues: recursiveSort (copy)
	table.sort(List, p1)
	
	for _, value in pairs(List) do
		if value.dataStats.sortedChildren then
			recursiveSort(value.dataStats.sortedChildren, p1)
		end
	end
end

function ClientMemoryDataModule:setSortType(_sortType)
	-- upvalues: config (copy), recursiveSort (copy)
	if config[_sortType] then
		self._sortType = _sortType
		recursiveSort(self._memoryDataSorted, config[self._sortType])
		
		return
	else
		error(string.format("attempted to pass invalid sortType: %s", (tostring(_sortType))), 2)
	end
end

function ClientMemoryDataModule:getMemoryData()
	return self._memoryDataSorted
end

function ClientMemoryDataModule:isRunning()
	return self._isRunning
end

function ClientMemoryDataModule.start(p2)
	-- upvalues: StatsService (copy), StatsUtilsModule (copy)
	spawn(function()
		-- upvalues: p2 (copy), StatsService (upval), StatsUtilsModule (upval)
		p2._pollingId += 1
		local PollingId = p2._pollingId
		p2._isRunning = true
		while PollingId == p2._pollingId do
			local PerformanceStats = StatsService and StatsService:FindFirstChild("PerformanceStats")
			local Child = if PerformanceStats then PerformanceStats:FindFirstChild(StatsUtilsModule.StatNames[StatsUtilsModule.StatType_Memory]) else nil
			
			if not Child then return end
			p2._lastUpdate = os.time()
			p2:recursiveUpdateEntry(p2._memoryData, p2._memoryDataSorted, Child)
			
			if p2._totalMemory ~= Child:getValue() then
				p2._totalMemory = Child:getValue()
				p2._totalMemoryUpdated:Fire(p2._totalMemory)
			end
			p2._treeViewUpdatedSignal:Fire(p2._memoryDataSorted)
			wait(3)
		end
		p2._isRunning = false
	end)
end

function ClientMemoryDataModule:stop()
	self._pollingId += 1
end

return ClientMemoryDataModule