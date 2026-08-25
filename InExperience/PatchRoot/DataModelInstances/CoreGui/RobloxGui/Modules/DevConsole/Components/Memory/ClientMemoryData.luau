local signalModule = require(script.Parent.Parent.Parent.Signal)
local soundService = game:GetService("SoundService")
local textService = game:GetService("TextService")
local meshContentProviderService = game:GetService("MeshContentProvider")
local keyframeSequenceProviderService = game:GetService("KeyframeSequenceProvider")
local statsService = game:GetService("Stats")
local statsUtilsModule = require(script.Parent.Parent.Parent.Parent.Stats.StatsUtils)
local circularBufferModule = require(script.Parent.Parent.Parent.CircularBuffer)
local chartHeaderNames = require(script.Parent.Parent.Parent.Constants).MemoryFormatting.ChartHeaderNames
local var8 = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount"))
local t = {
	[chartHeaderNames[1]] = function(p0, p1)
		return p0.name < p1.name
	end,
	[chartHeaderNames[2]] = function(p2, p3)
		return p2.dataStats.dataSet:back().data < p3.dataStats.dataSet:back().data
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
	table.sort(t, function(p4, p5)
		return p5.value < p4.value
	end)
	
	return t
end

local function fetchGraphicsTextureMemoryData()
	-- upvalues: statsService (ref)
	local nonHumanoidPaginatedMemoryByTexture = statsService:GetPaginatedMemoryByTexture(Enum.TextureQueryType.NonHumanoid, 0, 100)
	local nonHumanoidOrphanedPaginatedMemoryByTexture = statsService:GetPaginatedMemoryByTexture(Enum.TextureQueryType.NonHumanoidOrphaned, 0, 100)
	local t = {}
	
	local function aggregateData(p6, p7)
		for i, v in ipairs(p7.Results) do
			table.insert(p6, { name = v.TextureId, value = v.MemoryInBytes / 1048576 })
		end
	end
	
	aggregateData(t, nonHumanoidPaginatedMemoryByTexture)
	aggregateData(t, nonHumanoidOrphanedPaginatedMemoryByTexture)
	table.sort(t, function(p8, p9)
		return p9.value < p8.value
	end)
	
	return t
end

local function fetchGraphicsTextureCharacterMemoryData()
	-- upvalues: statsService (ref)
	local humanoidPaginatedMemoryByTexture = statsService:GetPaginatedMemoryByTexture(Enum.TextureQueryType.Humanoid, 0, 100)
	local humanoidOrphanedPaginatedMemoryByTexture = statsService:GetPaginatedMemoryByTexture(Enum.TextureQueryType.HumanoidOrphaned, 0, 100)
	local t = {}
	
	local function aggregateData(p10, p11)
		for i, v in ipairs(p11.Results) do
			local var29 = v.MemoryInBytes / 1048576
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
				local var33 = string.split(v_2, ".mesh:")[2]
				local matchIndex = string.find(var33, ":", 12)
				
				if matchIndex ~= nil then
					matchIndex -= 1
				end
				t_2[string.sub(var33, 1, matchIndex)] = true
			end
			for i_2, v_2 in pairs(t_2) do
				table.insert(t, { name = i_2 })
			end
			table.sort(t, function(p12, p13)
				return p12.name < p13.name
			end)
			table.insert(p10, { name = "Composite Texture", value = var29, moreInfo = t })
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
	table.sort(t, function(p14, p15)
		return p15.value < p14.value
	end)
	
	return t
end

local function fetchFuncAnimation()
	-- upvalues: keyframeSequenceProviderService (ref)
	local t = {}
	
	for i, v in pairs(keyframeSequenceProviderService:GetMemStats()) do
		table.insert(t, { name = i, value = v / 1048576 })
	end
	table.sort(t, function(p16, p17)
		return p17.value < p16.value
	end)
	
	return t
end

local function fetchFontMemoryData()
	-- upvalues: textService (ref)
	local t = {}
	
	for i, v in pairs(textService:GetFontMemoryData()) do
		table.insert(t, { name = i, value = v / 1048576 })
	end
	table.sort(t, function(p18, p19)
		return p19.value < p18.value
	end)
	
	return t
end

function t_1:updateCachedData(p20, p21)
	if self._doGranularMemUpdate[p20] then
		self._doGranularMemUpdate[p20] = false
		self._granularMemTable[p20] = p21()
	end
end

function t_1.getAdditionalMemoryFunc(p22, p23)
	-- upvalues: fetchSoundMemoryData (ref), fetchGraphicsTextureMemoryData (ref), fetchGraphicsTextureCharacterMemoryData (ref), fetchGraphicsMeshPartsMemoryData (ref), fetchFuncAnimation (ref), fetchFontMemoryData (ref)
	local var38 = nil
	
	if p23 == "Sounds" then
		var38 = fetchSoundMemoryData
	elseif p23 == "GraphicsTexture" then
		var38 = fetchGraphicsTextureMemoryData
	elseif p23 == "GraphicsTextureCharacter" then
		var38 = fetchGraphicsTextureCharacterMemoryData
	elseif p23 == "GraphicsMeshParts" then
		var38 = fetchGraphicsMeshPartsMemoryData
	elseif p23 ~= "csgDictionary" then
		if p23 == "Animation" then
			var38 = fetchFuncAnimation
		elseif p23 == "gui/FontData" and game:GetEngineFeature("TextServiceGetFontMemoryData") then
			var38 = fetchFontMemoryData
		end
	end
	return if var38 then function()
		-- upvalues: p22 (ref), p23 (ref), var38 (write)
		p22:updateCachedData(p23, var38)
		
		return p22._granularMemTable[p23]
	end else nil
end

function t_1:recursiveUpdateEntry(p24, p25, p26)
	-- upvalues: statsUtilsModule (ref), circularBufferModule (ref), var8 (ref)
	local memoryAnalyzerStatName = statsUtilsModule.GetMemoryAnalyzerStatName(p26.DisplayName)
	local value = p26:GetValue()
	local children = p26:GetChildren()
	
	if p24[memoryAnalyzerStatName] then
		local max = p24[memoryAnalyzerStatName].max
		local min = p24[memoryAnalyzerStatName].min
		local t = { data = value, time = self._lastUpdate }
		
		if p24[memoryAnalyzerStatName].additionalInfoFunc and p24[memoryAnalyzerStatName].dataSet:back().data ~= t.data then
			self._doGranularMemUpdate[memoryAnalyzerStatName] = true
		end
		local var45 = p24[memoryAnalyzerStatName].dataSet:push_back(t)
		
		if var45 then
			local var46 = p24[memoryAnalyzerStatName].dataSet:iterator()
			local var47 = var46:next()
			
			if max == var45.data then
				max = min
				while var47 do
					max = if var47.data < max then max else var47.data
					var47 = var46:next()
				end
			end
			if min == var45.data then
				min = max
				while var47 do
					min = if min < var47.data then min else var47.data
					var47 = var46:next()
				end
			end
		end
		p24[memoryAnalyzerStatName].max = if max < value then value else max
		p24[memoryAnalyzerStatName].min = if min < value then min else value
	else
		local var42 = circularBufferModule.new(var8)
		var42:push_back({ data = value, time = self._lastUpdate })
		p24[memoryAnalyzerStatName] = {
			min = value,
			max = value,
			dataSet = var42,
			children = #children > 0 and {},
			sortedChildren = #children > 0 and {}
		}
		local var43 = self:getAdditionalMemoryFunc(memoryAnalyzerStatName)
		
		if var43 then
			p24[memoryAnalyzerStatName].additionalInfoFunc = var43
			self._doGranularMemUpdate[memoryAnalyzerStatName] = true
		end
		table.insert(p25, {
			name = memoryAnalyzerStatName,
			dataStats = p24[memoryAnalyzerStatName]
		})
	end
	local var48 = p24[memoryAnalyzerStatName]
	local t = {}
	
	for i, v in ipairs(children) do
		t[v.DisplayName] = true
		self:recursiveUpdateEntry(var48.children, var48.sortedChildren, v)
	end
	if var48.children then
		for i_1, v_1 in pairs(var48.children) do
			if t[i_1] == nil then
				var48.children[i_1] = nil
				
				for i_2, v_2 in ipairs(var48.sortedChildren) do
					if i_1 == v_2.name then
						table.remove(var48.sortedChildren, i_2)
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

local function recursiveSort(p27, p28)
	-- upvalues: recursiveSort (ref)
	table.sort(p27, p28)
	
	for i, v in pairs(p27) do
		if v.dataStats.sortedChildren then
			recursiveSort(v.dataStats.sortedChildren, p28)
		end
	end
end

function t_1:setSortType(p29)
	-- upvalues: t (ref), recursiveSort (ref)
	if t[p29] then
		self._sortType = p29
		recursiveSort(self._memoryDataSorted, t[self._sortType])
		
		return
	end
	error(string.format("attempted to pass invalid sortType: %s", tostring(p29)), 2)
end

function t_1:getMemoryData()
	return self._memoryDataSorted
end

function t_1:isRunning()
	return self._isRunning
end

function t_1.start(p30)
	-- upvalues: statsService (ref), statsUtilsModule (ref)
	spawn(function()
		-- upvalues: p30 (ref), statsService (copy), statsUtilsModule (copy)
		p30._pollingId += 1
		local pollingId = p30._pollingId
		p30._isRunning = true
		while pollingId == p30._pollingId do
			local performanceStats = statsService and statsService:FindFirstChild("PerformanceStats")
			local var51 = if not performanceStats then nil else performanceStats:FindFirstChild(statsUtilsModule.StatNames[statsUtilsModule.StatType_Memory])
			
			if var51 then
				p30._lastUpdate = os.time()
				p30:recursiveUpdateEntry(p30._memoryData, p30._memoryDataSorted, var51)
				
				if p30._totalMemory ~= var51:getValue() then
					p30._totalMemory = var51:getValue()
					p30._totalMemoryUpdated:Fire(p30._totalMemory)
				end
				p30._treeViewUpdatedSignal:Fire(p30._memoryDataSorted)
				wait(3)
			end
			return
		end
		p30._isRunning = false
	end)
end

function t_1:stop()
	self._pollingId += 1
end

return t_1