local Players = game:GetService("Players")
local InGameAssetReporting = script:FindFirstAncestor("InGameAssetReporting")
local _ = require(InGameAssetReporting.Analysis.Types)
local GetFIntIGARRaycastTargetCountModule = require(InGameAssetReporting.Flags.GetFIntIGARRaycastTargetCount)
local GetFIntIGARSubtreeDivergenceThresholdPerMilleModule = require(InGameAssetReporting.Flags.GetFIntIGARSubtreeDivergenceThresholdPerMille)
local ExtractAssetIdsFromInstanceModule = require(InGameAssetReporting.Analysis.extractAssetIdsFromInstance)
local _Random = Random.new()

function getRandomSampleUniformDisk(Vector, p1, Vector1) --[[ Line: 70 ]]
	-- upvalues: _Random (ref)
	local Count = 0
	local NewX = nil
	local NewY = nil
	repeat
		local ScaledNextNumberResult = _Random:NextNumber() * 2 * 3.141592653589793
		local ScaledSquareRoot = math.sqrt((_Random:NextNumber())) * p1
		NewX = Vector.X + math.cos(ScaledNextNumberResult) * ScaledSquareRoot
		NewY = Vector.Y + math.sin(ScaledNextNumberResult) * ScaledSquareRoot
		Count += 1
		if Count > 6 then
			return Vector
		end
		return Vector2.new(NewX, NewY)
	until NewX >= 0 and NewX <= Vector1.X and NewY >= 0 and NewY <= Vector1.Y
end

function interpretAnnotation(Vector, p1: number, Callback) --[[ Line: 89 ]]
	-- upvalues: GetFIntIGARRaycastTargetCountModule (copy), Players (copy)
	local Flag = false
	local config = {
		errorReason = nil,
		hitCountMap = {},
		stats = {
			completedCount = 0,
			hitCount = 0,
			resumptionCount = 0,
			wallTime = 0,
			computeTime = 0,
			targetCount = GetFIntIGARRaycastTargetCountModule()
		},
		highlights = {},
		topLevelObjects = {},
		cancel = function() --[[ Line: 110 ]]
			-- upvalues: Flag (ref)
			Flag = true
		end
	}
	config.raycastComputation = coroutine.create(function() --[[ Line: 116 ]]
		-- upvalues: Callback (copy), config (copy)
		Callback(config)
	end)
	local CurrentCamera = workspace.CurrentCamera
	
	if CurrentCamera == nil then
		config.errorReason = "No camera"
		
		return config
	end
	local ViewportSize = CurrentCamera.ViewportSize
	
	if Vector.X < 0 or ViewportSize.X < Vector.X or Vector.Y < 0 or ViewportSize.Y < Vector.Y then
		config.errorReason = "Coordinates out of bounds"
		
		return config
	elseif p1 <= 0 or math.max(ViewportSize.X, ViewportSize.Y) < p1 then
		config.errorReason = "Invalid radius"
		
		return config
	else
		local LocalPlayer = Players.LocalPlayer
		
		if LocalPlayer == nil then
			config.errorReason = "No local player"
			
			return config
		else
			local FilterDescendantsInstances = { LocalPlayer.Character }
			config.raycastComputation = coroutine.create(function() --[[ Line: 147 ]]
				-- upvalues: FilterDescendantsInstances (copy), config (copy), Flag (ref), Vector (copy), p1 (copy), ViewportSize (copy), CurrentCamera (copy), Callback (copy)
				local RaycastParams1 = RaycastParams.new()
				RaycastParams1.FilterType = Enum.RaycastFilterType.Exclude
				RaycastParams1.FilterDescendantsInstances = FilterDescendantsInstances
				RaycastParams1.IgnoreWater = true
				local ClockTime = os.clock()
				local ClockTime1 = os.clock()
				
				for _ = 1, config.stats.targetCount do
					if Flag then break end
					if ClockTime1 + 0.011111111111111112 < os.clock() then
						local Stats = config.stats
						Stats.computeTime += os.clock() - ClockTime1
						task.wait()
						ClockTime1 = os.clock()
						local Stats1 = config.stats
						Stats1.resumptionCount += 1
						
						if Flag then break end
					end
					local RandomSampleUniformDisk = getRandomSampleUniformDisk(Vector, p1, ViewportSize)
					local v1 = CurrentCamera:ViewportPointToRay(RandomSampleUniformDisk.X, RandomSampleUniformDisk.Y)
					local RaycastResult = nil
					
					for _ = 1, 5 do
						RaycastResult = workspace:Raycast(v1.Origin, v1.Direction * 5000, RaycastParams1)
						local NoRaycastResult = RaycastResult == nil
						local Hit = nil
						
						if not NoRaycastResult then
							Hit = RaycastResult.Instance
							NoRaycastResult = (1 - Hit.Transparency) * (1 - Hit.LocalTransparencyModifier) > 0.05
						end
						if NoRaycastResult then break end
						table.insert(FilterDescendantsInstances, Hit)
						RaycastParams1.FilterDescendantsInstances = FilterDescendantsInstances
						RaycastResult = nil
					end
					if RaycastResult then
						local Hit = RaycastResult.Instance
						
						if Hit ~= nil then
							local Stats = config.stats
							Stats.hitCount += 1
						end
						local v2 = nil
						while Hit ~= nil and (Hit:IsA("PVInstance") or Hit:IsA("Accessory")) and Hit ~= workspace do
							if not config.hitCountMap[Hit] then
								config.hitCountMap[Hit] = { raycastHits = 0, children = {} }
							end
							local HitCount = config.hitCountMap[Hit]
							HitCount.raycastHits += 1
							
							if v2 then
								config.hitCountMap[Hit].children[v2] = true
							end
							v2 = Hit
							Hit = Hit.Parent
						end
						if v2 then
							config.topLevelObjects[v2] = (config.topLevelObjects[v2] or 0) + 1
						end
					end
					local Stats = config.stats
					Stats.completedCount += 1
				end
				config.stats.wallTime = os.clock() - ClockTime
				local Stats = config.stats
				Stats.computeTime += os.clock() - ClockTime1
				Callback(config)
			end)
			
			return config
		end
	end
end

function createPlayerCharacterReferenceToPlayerMap(List) --[[ Line: 238 ]]
	local Players = {}
	
	for _, Player in ipairs(List) do
		local Character = Player.Character
		
		if Character then
			Players[Character] = Player
		end
	end
	return Players
end

function descendingOrderBySecondElement(Entry1, Entry): boolean --[[ Line: 249 ]]
	return Entry[2] < Entry1[2]
end

function createTraversalTaskList(p2, List) --[[ Line: 256 ]]
	-- upvalues: Players (copy), GetFIntIGARSubtreeDivergenceThresholdPerMilleModule (copy)
	local List1 = {}
	local List2 = {}
	local PlayerCharacterReferenceToPlayerMap = createPlayerCharacterReferenceToPlayerMap(Players:GetPlayers())
	local List3 = {}
	
	for i, value in pairs(List) do
		table.insert(List3, { i, value })
	end
	table.sort(List3, descendingOrderBySecondElement)
	local FIntIGARSubtreeDivergenceThresholdPerMilleModuleRatio = GetFIntIGARSubtreeDivergenceThresholdPerMilleModule() / 1000
	
	for _, value1 in ipairs(List3) do
		local v1 = value1[1]
		local Count = value1[2]
		
		if PlayerCharacterReferenceToPlayerMap[v1] ~= nil then
			table.insert(List2, {
				player = PlayerCharacterReferenceToPlayerMap[v1],
				count = Count
			})
			continue
		end
		local Count1 = 0
		local v2 = v1
		while p2[v2] do
			local v3 = p2[v2]
			local RaycastHits = v3.raycastHits
			local Children = v3.children
			local Count2 = 0
			
			for i1, child in pairs(Children) do
				if p2[i1] then
					Count2 += 1
				end
			end
			if Count2 == 0 then break end
			local Largest = 0
			
			for child, _ in pairs(Children) do
				if p2[child] then
					Largest = math.max(Largest, p2[child].raycastHits)
				end
			end
			if Largest / RaycastHits < FIntIGARSubtreeDivergenceThresholdPerMilleModuleRatio then break end
			local v4 = nil
			local RaycastHits1 = 0
			
			for i2, _ in pairs(Children) do
				if p2[i2] and RaycastHits1 < p2[i2].raycastHits then
					v4 = i2
					RaycastHits1 = p2[i2].raycastHits
				end
			end
			v2 = v4
			Count1 += 1
		end
		table.insert(List1, { instance = v2, count = Count })
		
		if v2 ~= v1 then
			table.insert(List1, { instance = v1, count = Count })
		end
	end
	return List1, List2
end

function mutateMergeExtractedAssets(p3, p4, p5) --[[ Line: 344 ]]
	for _, value in ipairs(p5.Image) do
		if not p3[value] then
			p3[value] = true
			table.insert(p4.Image, value)
		end
	end
	for _, value1 in ipairs(p5.Mesh) do
		if not p3[value1] then
			p3[value1] = true
			table.insert(p4.Mesh, value1)
		end
	end
	for _, value2 in ipairs(p5.Video) do
		if not p3[value2] then
			p3[value2] = true
			table.insert(p4.Video, value2)
		end
	end
	for _, value3 in ipairs(p5.Model) do
		if not p3[value3] then
			p3[value3] = true
			table.insert(p4.Model, value3)
		end
	end
	for _, value4 in ipairs(p5.Package) do
		if not p3[value4.id] then
			p3[value4.id] = true
			table.insert(p4.Package, value4)
		end
	end
	if game:GetEngineFeature("ExperienceStateCaptureExperienceChatSupport") then
		for _, value5 in ipairs(p5.Text) do
			if not p3[value5] then
				p3[value5] = true
				table.insert(p4.Text, value5)
			end
		end
	end
end

function interpretInstanceListForGUIObjects(List) --[[ Line: 396 ]]
	local config = {
		errorReason = nil,
		hitCountMap = {},
		stats = {
			targetCount = 0,
			completedCount = 0,
			hitCount = 0,
			resumptionCount = 0,
			wallTime = 0,
			computeTime = 0
		},
		highlights = {},
		topLevelObjects = {},
		cancel = function() --[[ Line: 410 ]] end
	}
	
	for _, value in ipairs(List) do
		local v5 = nil
		while value ~= nil and value:IsA("GuiObject") do
			if not config.hitCountMap[value] then
				config.hitCountMap[value] = { raycastHits = 0, children = {} }
			end
			local HitCount = config.hitCountMap[value]
			HitCount.raycastHits += 1
			
			if v5 then
				config.hitCountMap[value].children[v5] = true
			end
			v5 = value
			value = value.Parent
		end
		if v5 then
			config.topLevelObjects[v5] = (config.topLevelObjects[v5] or 0) + 1
		end
	end
	return config
end

function interpretAndExtractItemsFromInstanceForPreciseSelection(Object) --[[ Line: 439 ]]
	-- upvalues: ExtractAssetIdsFromInstanceModule (copy), Players (copy)
	local config = {
		extractedAssets = {
			Package = {},
			Model = {},
			Image = {},
			Mesh = {},
			Text = {},
			Video = {}
		},
		extractedPlayers = {},
		cancel = function() --[[ Line: 450 ]] end,
		stats = {
			hitCountMapSize = 0,
			topLevelObjectsSize = 0,
			instancesTraversed = 0,
			traversalTaskListSize = 0,
			traversalTasksCompleted = 0,
			playersCount = 0,
			resumptionCount = 0,
			wallTime = 0,
			computeTime = 0,
			raycastTargetCount = 0,
			raycastCompletedCount = 0,
			raycastResumptionCount = 0,
			raycastComputeTime = 0
		},
		computation = coroutine.create(function() --[[ Line: 469 ]] end)
	}
	
	if not Object then
		return config
	end
	local t = {}
	
	local function _(p6) --[[ Line: 476 ]]
		-- upvalues: ExtractAssetIdsFromInstanceModule (upval), t (copy), config (copy)
		local ExtractAssetIdsFromInstanceModuleResult = ExtractAssetIdsFromInstanceModule(p6)
		
		if ExtractAssetIdsFromInstanceModuleResult then
			mutateMergeExtractedAssets(t, config.extractedAssets, ExtractAssetIdsFromInstanceModuleResult)
		end
		local Stats = config.stats
		Stats.instancesTraversed += 1
	end
	
	local PlayerCharacterReferenceToPlayerMap = createPlayerCharacterReferenceToPlayerMap(Players:GetPlayers())
	local Object1 = Object
	while Object1 ~= nil and (Object1:IsA("PVInstance") or Object1:IsA("Accessory") or Object1:IsA("GuiObject") or Object1:IsA("FaceInstance")) and Object1 ~= workspace do
		if PlayerCharacterReferenceToPlayerMap[Object1] ~= nil then
			table.insert(config.extractedPlayers, {
				count = 1,
				player = PlayerCharacterReferenceToPlayerMap[Object1]
			})
			
			return config
		end
		local ExtractAssetIdsFromInstanceModuleResult = ExtractAssetIdsFromInstanceModule(Object1)
		
		if ExtractAssetIdsFromInstanceModuleResult then
			mutateMergeExtractedAssets(t, config.extractedAssets, ExtractAssetIdsFromInstanceModuleResult)
		end
		local Stats = config.stats
		Stats.instancesTraversed += 1
		Object1 = Object1.Parent
	end
	for _, child in ipairs((Object:GetChildren())) do
		local ExtractAssetIdsFromInstanceModuleResult = ExtractAssetIdsFromInstanceModule(child)
		
		if ExtractAssetIdsFromInstanceModuleResult then
			mutateMergeExtractedAssets(t, config.extractedAssets, ExtractAssetIdsFromInstanceModuleResult)
		end
		local Stats = config.stats
		Stats.instancesTraversed += 1
	end
	return config
end

function extractItemsFromInterpretations(List, Callback) --[[ Line: 516 ]]
	-- upvalues: ExtractAssetIdsFromInstanceModule (copy)
	local Flag = false
	local config = {
		extractedAssets = {
			Package = {},
			Model = {},
			Image = {},
			Mesh = {},
			Text = {},
			Video = {}
		},
		extractedPlayers = {},
		cancel = function() --[[ Line: 532 ]]
			-- upvalues: Flag (ref)
			Flag = true
		end,
		stats = {
			hitCountMapSize = 0,
			topLevelObjectsSize = 0,
			instancesTraversed = 0,
			traversalTaskListSize = 0,
			traversalTasksCompleted = 0,
			playersCount = 0,
			resumptionCount = 0,
			wallTime = 0,
			computeTime = 0,
			raycastTargetCount = 0,
			raycastCompletedCount = 0,
			raycastResumptionCount = 0,
			raycastComputeTime = 0
		}
	}
	config.computation = coroutine.create(function() --[[ Line: 551 ]]
		-- upvalues: Callback (copy), config (copy)
		Callback(config)
	end)
	
	for _, value in ipairs(List) do
		value.cancel()
		local Stats = config.stats
		Stats.raycastTargetCount += value.stats.targetCount
		local Stats1 = config.stats
		Stats1.raycastCompletedCount += value.stats.completedCount
		local Stats2 = config.stats
		Stats2.raycastResumptionCount += value.stats.resumptionCount
		local Stats3 = config.stats
		Stats3.raycastComputeTime += value.stats.computeTime
	end
	local ClockTime = os.clock()
	local t = {}
	local t1 = {}
	
	for _, value1 in ipairs(List) do
		for i, value2 in pairs(value1.hitCountMap) do
			if not t[i] then
				t[i] = { raycastHits = 0, children = {} }
				local Stats = config.stats
				Stats.hitCountMapSize += 1
			end
			local Entry = t[i]
			Entry.raycastHits += value2.raycastHits
			
			for i1, _ in pairs(value2.children) do
				t[i].children[i1] = true
			end
		end
		for i2, topLevelObject in pairs(value1.topLevelObjects) do
			local Entry = t1[i2]
			
			if not Entry then
				local Stats = config.stats
				Stats.topLevelObjectsSize += 1
			end
			t1[i2] = (Entry or 0) + topLevelObject
		end
	end
	local TraversalTaskList, TraversalTaskList2 = createTraversalTaskList(t, t1)
	config.extractedPlayers = TraversalTaskList2
	config.stats.playersCount = #TraversalTaskList2
	config.stats.wallTime = os.clock() - ClockTime
	config.stats.traversalTaskListSize = #TraversalTaskList
	config.computation = coroutine.create(function() --[[ Line: 599 ]]
		-- upvalues: config (copy), TraversalTaskList (copy), Flag (ref), Callback (copy), t (copy), ExtractAssetIdsFromInstanceModule (upval)
		local ClockTime = os.clock()
		local ClockTime1 = os.clock()
		
		local function _(): boolean --[[ Line: 602 ]]
			-- upvalues: ClockTime1 (ref)
			return ClockTime1 + 0.011111111111111112 < os.clock()
		end
		
		local _ = function() --[[ Line: 605 ]]
			-- upvalues: config (upval), ClockTime1 (ref)
			local Stats = config.stats
			Stats.computeTime += os.clock() - ClockTime1
			task.wait()
			ClockTime1 = os.clock()
			local Stats1 = config.stats
			Stats1.resumptionCount += 1
		end
		
		local t2 = {}
		local t3 = {}
		
		for _, value in ipairs(TraversalTaskList) do
			local List = {}
			local List1 = {}
			table.insert(List, value.instance)
			while #List > 0 do
				if ClockTime1 + 0.011111111111111112 < os.clock() then
					local Stats = config.stats
					Stats.computeTime += os.clock() - ClockTime1
					task.wait()
					ClockTime1 = os.clock()
					local Stats1 = config.stats
					Stats1.resumptionCount += 1
					
					if Flag then
						local Stats2 = config.stats
						Stats2.wallTime += os.clock() - ClockTime
						Callback(config)
						
						return
					end
				end
				local Removed = table.remove(List)
				
				if t3[Removed] then continue end
				table.insert(List1, Removed)
				local List2 = {}
				
				for _, child in pairs((Removed:GetChildren())) do
					table.insert(List2, { child, if t[child] then t[child].raycastHits else 0 })
				end
				table.sort(List2, descendingOrderBySecondElement)
				
				for _, value1 in ipairs(List2) do
					table.insert(List, value1[1])
				end
				t3[Removed] = true
			end
			while #List1 > 0 do
				if ClockTime1 + 0.011111111111111112 < os.clock() then
					local Stats = config.stats
					Stats.computeTime += os.clock() - ClockTime1
					task.wait()
					ClockTime1 = os.clock()
					local Stats3 = config.stats
					Stats3.resumptionCount += 1
					
					if Flag then
						local Stats4 = config.stats
						Stats4.wallTime += os.clock() - ClockTime
						Callback(config)
						
						return
					end
				end
				local ExtractAssetIdsFromInstanceModuleResult = ExtractAssetIdsFromInstanceModule((table.remove(List1)))
				
				if ExtractAssetIdsFromInstanceModuleResult then
					mutateMergeExtractedAssets(t2, config.extractedAssets, ExtractAssetIdsFromInstanceModuleResult)
				end
				local Stats = config.stats
				Stats.instancesTraversed += 1
			end
			local Stats = config.stats
			Stats.traversalTasksCompleted += 1
		end
		local Stats = config.stats
		Stats.wallTime += os.clock() - ClockTime
		local Stats5 = config.stats
		Stats5.computeTime += os.clock() - ClockTime1
		Callback(config)
	end)
	
	return config
end

return {
	interpretAnnotation = interpretAnnotation,
	extractItemsFromInterpretations = extractItemsFromInterpretations,
	interpretInstanceListForGUIObjects = interpretInstanceListForGUIObjects,
	interpretAndExtractItemsFromInstanceForPreciseSelection = interpretAndExtractItemsFromInstanceForPreciseSelection,
	__setRandomGenerator = function(p6) --[[ Line: 698 ]]
		-- upvalues: _Random (ref)
		_Random = p6
	end
}