local signalModule = require(script.Parent.Parent.Parent.Signal)
local soundService = game:GetService("SoundService")
local textService = game:GetService("TextService")
local meshContentProviderService = game:GetService("MeshContentProvider")
local keyframeSequenceProviderService = game:GetService("KeyframeSequenceProvider")
local statsService = game:GetService("Stats")
local statsUtilsModule = require(script.Parent.Parent.Parent.Parent.Stats.StatsUtils)
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
local t_1 = {}
t_1.__index = t_1

function t_1.new()
	-- upvalues: t_1 (ref), signalModule (ref), chartHeaderNames (ref)
	local t = {}
	setmetatable(t, t_1)
	t._pollingId = 0
	t._totalMemory = 0
	t._memoryData = {}
	t._memoryDataSorted = {}
	t._treeViewUpdatedSignal = signalModule.new()
	t._totalMemoryUpdated = signalModule.new()
	t._sortType = chartHeaderNames[1]
	t._isRunning = false
	t._doGranularMemUpdate = {}
	t._granularMemTable = {}
	
	return t
end

local function _()
	-- upvalues: statsService (ref), statsUtilsModule (ref)
	local performanceStats = statsService and statsService:FindFirstChild("PerformanceStats")
	
	return if performanceStats then performanceStats:FindFirstChild(statsUtilsModule.StatNames[statsUtilsModule.StatType_Memory]) else nil
end

local function fetchSoundMemoryData()
	-- upvalues: soundService (ref)
	local t = {}
	
	for i, v in pairs(soundService:GetSoundMemoryData()) do
		table.insert(t, { name = i, value = v })
	end
	table.sort(t, function(p1, p2)
		return p2.value < p1.value
	end)
	
	return t
end

local function fetchGraphicsTextureMemoryData()
	-- upvalues: statsService (ref)
	local nonHumanoidPaginatedMemoryByTexture = statsService:GetPaginatedMemoryByTexture(Enum.TextureQueryType.NonHumanoid, 0, 100)
	local nonHumanoidOrphanedPaginatedMemoryByTexture = statsService:GetPaginatedMemoryByTexture(Enum.TextureQueryType.NonHumanoidOrphaned, 0, 100)
	local t = {}
	
	local function aggregateData(p1, p2)
		for i, v in ipairs(p2.Results) do
			table.insert(p1, { name = v.TextureId, value = v.MemoryInBytes / 1048576 })
		end
	end
	
	aggregateData(t, nonHumanoidPaginatedMemoryByTexture)
	aggregateData(t, nonHumanoidOrphanedPaginatedMemoryByTexture)
	table.sort(t, function(p3, p4)
		return p4.value < p3.value
	end)
	
	return t
end

local function fetchGraphicsTextureCharacterMemoryData()
	-- upvalues: statsService (ref)
	local humanoidPaginatedMemoryByTexture = statsService:GetPaginatedMemoryByTexture(Enum.TextureQueryType.Humanoid, 0, 100)
	local humanoidOrphanedPaginatedMemoryByTexture = statsService:GetPaginatedMemoryByTexture(Enum.TextureQueryType.HumanoidOrphaned, 0, 100)
	local t = {}
	
	local function aggregateData(p1, p2)
		for i, v in ipairs(p2.Results) do
			local var2 = v.MemoryInBytes / 1048576
			local t = {}
			local t_1 = {}
			
			for i_1, v_1 in pairs(string.split(v.TextureId, " ")) do
				if string.sub(v_1, 1, 2) == "T[" then
					table.insert(t_1, v_1)
				end
			end
			local _ = ""
			local t_2 = {}
			
			for i_2, v_2 in pairs(t_1) do
				local var3 = string.split(v_2, ".mesh:")[2]
				local matchIndex = string.find(var3, ":", 12)
				
				if matchIndex ~= nil then
					matchIndex -= 1
				end
				t_2[string.sub(var3, 1, matchIndex)] = true
			end
			for i_2, v_2 in pairs(t_2) do
				table.insert(t, { name = i_2 })
			end
			table.sort(t, function(p3, p4)
				return p3.name < p4.name
			end)
			table.insert(p1, { name = "Composite Texture", value = var2, moreInfo = t })
		end
	end
	
	aggregateData(t, humanoidPaginatedMemoryByTexture)
	aggregateData(t, humanoidOrphanedPaginatedMemoryByTexture)
	
	return t
end

local function fetchGraphicsMeshPartsMemoryData()
	-- upvalues: meshContentProviderService (ref)
	local t = {}
	
	for i, v in pairs(meshContentProviderService:getContentMemoryData()) do
		table.insert(t, { name = i, value = v / 1048576 })
	end
	table.sort(t, function(p3, p4)
		return p4.value < p3.value
	end)
	
	return t
end

local function fetchFuncAnimation()
	-- upvalues: keyframeSequenceProviderService (ref)
	local t = {}
	
	for i, v in pairs(keyframeSequenceProviderService:GetMemStats()) do
		table.insert(t, { name = i, value = v / 1048576 })
	end
	table.sort(t, function(p3, p4)
		return p4.value < p3.value
	end)
	
	return t
end

local function fetchFontMemoryData()
	-- upvalues: textService (ref)
	local t = {}
	
	for i, v in pairs(textService:GetFontMemoryData()) do
		table.insert(t, { name = i, value = v / 1048576 })
	end
	table.sort(t, function(p3, p4)
		return p4.value < p3.value
	end)
	
	return t
end

function t_1:updateCachedData(p3, p4)
	if self._doGranularMemUpdate[p3] then
		self._doGranularMemUpdate[p3] = false
		self._granularMemTable[p3] = p4()
	end
end

function t_1.getAdditionalMemoryFunc(p3, p4)
	-- upvalues: fetchSoundMemoryData (ref), fetchGraphicsTextureMemoryData (ref), fetchGraphicsTextureCharacterMemoryData (ref), fetchGraphicsMeshPartsMemoryData (ref), fetchFuncAnimation (ref), fetchFontMemoryData (ref)
	local var4 = nil
	
	if p4 == "Sounds" then
		var4 = fetchSoundMemoryData
	elseif p4 == "GraphicsTexture" then
		var4 = fetchGraphicsTextureMemoryData
	elseif p4 == "GraphicsTextureCharacter" then
		var4 = fetchGraphicsTextureCharacterMemoryData
	elseif p4 == "GraphicsMeshParts" then
		var4 = fetchGraphicsMeshPartsMemoryData
	elseif p4 ~= "csgDictionary" then
		if p4 == "Animation" then
			var4 = fetchFuncAnimation
		elseif p4 == "gui/FontData" and game:GetEngineFeature("TextServiceGetFontMemoryData") then
			var4 = fetchFontMemoryData
		end
	end
	return if var4 then function()
		-- upvalues: p3 (ref), p4 (ref), var4 (write)
		p3:updateCachedData(p4, var4)
		
		return p3._granularMemTable[p4]
	end else nil
end

function t_1:recursiveUpdateEntry(p3, p4, p5)
	-- upvalues: statsUtilsModule (ref), circularBufferModule (ref), var1 (ref)
	local memoryAnalyzerStatName = statsUtilsModule.GetMemoryAnalyzerStatName(p5.DisplayName)
	local value = p5:GetValue()
	local children = p5:GetChildren()
	
	if p3[memoryAnalyzerStatName] then
		local max = p3[memoryAnalyzerStatName].max
		local min = p3[memoryAnalyzerStatName].min
		local t = { data = value, time = self._lastUpdate }
		
		if p3[memoryAnalyzerStatName].additionalInfoFunc and p3[memoryAnalyzerStatName].dataSet:back().data ~= t.data then
			self._doGranularMemUpdate[memoryAnalyzerStatName] = true
		end
		local var4 = p3[memoryAnalyzerStatName].dataSet:push_back(t)
		
		if var4 then
			local var5 = p3[memoryAnalyzerStatName].dataSet:iterator()
			local var6 = var5:next()
			
			if max == var4.data then
				max = min
				while var6 do
					max = if var6.data < max then max else var6.data
					var6 = var5:next()
				end
			end
			if min == var4.data then
				min = max
				while var6 do
					min = if min < var6.data then min else var6.data
					var6 = var5:next()
				end
			end
		end
		p3[memoryAnalyzerStatName].max = if max < value then value else max
		p3[memoryAnalyzerStatName].min = if min < value then min else value
	else
		local var7 = circularBufferModule.new(var1)
		var7:push_back({ data = value, time = self._lastUpdate })
		p3[memoryAnalyzerStatName] = {
			min = value,
			max = value,
			dataSet = var7,
			children = #children > 0 and {},
			sortedChildren = #children > 0 and {}
		}
		local var8 = self:getAdditionalMemoryFunc(memoryAnalyzerStatName)
		
		if var8 then
			p3[memoryAnalyzerStatName].additionalInfoFunc = var8
			self._doGranularMemUpdate[memoryAnalyzerStatName] = true
		end
		table.insert(p4, {
			name = memoryAnalyzerStatName,
			dataStats = p3[memoryAnalyzerStatName]
		})
	end
	local var9 = p3[memoryAnalyzerStatName]
	local t = {}
	
	for i, v in ipairs(children) do
		t[v.DisplayName] = true
		self:recursiveUpdateEntry(var9.children, var9.sortedChildren, v)
	end
	if var9.children then
		for i_1, v_1 in pairs(var9.children) do
			if t[i_1] == nil then
				var9.children[i_1] = nil
				
				for i_2, v_2 in ipairs(var9.sortedChildren) do
					if i_1 == v_2.name then
						table.remove(var9.sortedChildren, i_2)
						continue
					end
				end
			end
		end
	end
end

function t_1:totalMemSignal()
	return self._totalMemoryUpdated
end

function t_1:treeUpdatedSignal()
	return self._treeViewUpdatedSignal
end

function t_1:getSortType()
	return self._sortType
end

local function recursiveSort(p6, p7)
	-- upvalues: recursiveSort (ref)
	table.sort(p6, p7)
	
	for i, v in pairs(p6) do
		if v.dataStats.sortedChildren then
			recursiveSort(v.dataStats.sortedChildren, p7)
		end
	end
end

function t_1:setSortType(p8)
	-- upvalues: t (ref), recursiveSort (ref)
	if t[p8] then
		self._sortType = p8
		recursiveSort(self._memoryDataSorted, t[self._sortType])
		
		return
	end
	error(string.format("attempted to pass invalid sortType: %s", tostring(p8)), 2)
end

function t_1:getMemoryData()
	return self._memoryDataSorted
end

function t_1:isRunning()
	return self._isRunning
end

function t_1.start(p8)
	-- upvalues: statsService (ref), statsUtilsModule (ref)
	spawn(function()
		-- upvalues: p8 (ref), statsService (copy), statsUtilsModule (copy)
		p8._pollingId += 1
		local pollingId = p8._pollingId
		p8._isRunning = true
		while pollingId == p8._pollingId do
			local performanceStats = statsService and statsService:FindFirstChild("PerformanceStats")
			local var10 = if not performanceStats then nil else performanceStats:FindFirstChild(statsUtilsModule.StatNames[statsUtilsModule.StatType_Memory])
			
			if var10 then
				p8._lastUpdate = os.time()
				p8:recursiveUpdateEntry(p8._memoryData, p8._memoryDataSorted, var10)
				
				if p8._totalMemory ~= var10:getValue() then
					p8._totalMemory = var10:getValue()
					p8._totalMemoryUpdated:Fire(p8._totalMemory)
				end
				p8._treeViewUpdatedSignal:Fire(p8._memoryDataSorted)
				wait(3)
			end
			return
		end
		p8._isRunning = false
	end)
end

function t_1:stop()
	self._pollingId += 1
end

return t_1