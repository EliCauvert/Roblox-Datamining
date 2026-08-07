local playersService = game:GetService("Players")
local inGameAssetReporting = script:FindFirstAncestor("InGameAssetReporting")
local _ = require(inGameAssetReporting.Analysis.Types)
local getFIntIGARRaycastTargetCountModule = require(inGameAssetReporting.Flags.GetFIntIGARRaycastTargetCount)
local getFIntIGARSubtreeDivergenceThresholdPerMilleModule = require(inGameAssetReporting.Flags.GetFIntIGARSubtreeDivergenceThresholdPerMille)
local extractAssetIdsFromInstanceModule = require(inGameAssetReporting.Analysis.extractAssetIdsFromInstance)
local random = Random.new()

function getRandomSampleUniformDisk(p0, p1, p2) --[[ line: 70 ]]
	-- upvalues: random (write)
	local var9, var10
	local _ = nil
	local _ = nil
	local var6 = 0
	repeat
		local var7 = random:NextNumber() * 2 * 3.14159265359
		local var8 = math.sqrt(random:NextNumber()) * p1
		var9 = p0.X + math.cos(var7) * var8
		var10 = p0.Y + math.sin(var7) * var8
		var6 += 1
		if var6 <= 6 then continue end
		return p0
	until var9 >= 0 and var9 <= p2.X and (var10 >= 0 and var10 <= p2.Y)
	return Vector2.new(var9, var10)
end

function interpretAnnotation(p3, p4, p5) --[[ line: 89 ]]
	-- upvalues: getFIntIGARRaycastTargetCountModule (ref), playersService (ref)
	local var11 = false
	local t = {
		errorReason = nil,
		hitCountMap = {},
		stats = {
			completedCount = 0,
			hitCount = 0,
			resumptionCount = 0,
			wallTime = 0,
			computeTime = 0,
			targetCount = getFIntIGARRaycastTargetCountModule()
		},
		highlights = {},
		topLevelObjects = {},
		cancel = function() --[[ line: 110 ]]
			-- upvalues: var11 (write)
			var11 = true
		end
	}
	t.raycastComputation = coroutine.create(function() --[[ line: 116 ]]
		-- upvalues: p5 (ref), t (ref)
		p5(t)
	end)
	local currentCamera = workspace.CurrentCamera
	
	if currentCamera == nil then
		t.errorReason = "No camera"
		
		return t
	end
	local viewportSize = currentCamera.ViewportSize
	
	if p3.X < 0 or viewportSize.X < p3.X or (p3.Y < 0 or viewportSize.Y < p3.Y) then
		t.errorReason = "Coordinates out of bounds"
		
		return t
	elseif p4 <= 0 or math.max(viewportSize.X, viewportSize.Y) < p4 then
		t.errorReason = "Invalid radius"
		
		return t
	end
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer == nil then
		t.errorReason = "No local player"
		
		return t
	end
	local list = { localPlayer.Character }
	t.raycastComputation = coroutine.create(function() --[[ line: 147 ]]
		-- upvalues: list (ref), t (ref), var11 (write), p3 (ref), p4 (ref), viewportSize (ref), currentCamera (ref), p5 (ref)
		local raycastParams = RaycastParams.new()
		raycastParams.FilterType = Enum.RaycastFilterType.Exclude
		raycastParams.FilterDescendantsInstances = list
		raycastParams.IgnoreWater = true
		local processTime = os.clock()
		local processTime_1 = os.clock()
		
		for _ = 1, t.stats.targetCount do
			if var11 then break end
			if processTime_1 + 0.011111111111 < os.clock() then
				t.stats.computeTime += os.clock() - processTime_1
				task.wait()
				processTime_1 = os.clock()
				t.stats.resumptionCount += 1
				
				if var11 then break end
			end
			local origin
			local var17 = getRandomSampleUniformDisk(p3, p4, viewportSize)
			local x = currentCamera:ViewportPointToRay(var17.X, var17.Y)
			local _ = nil
			
			for _ = 1, 5 do
				origin = workspace:Raycast(x.Origin, x.Direction * 5000, raycastParams)
				
				if origin == nil then break end
				local instance = origin.Instance
				
				if (1 - instance.Transparency) * (1 - instance.LocalTransparencyModifier) > 0.05 then break end
				table.insert(list, instance)
				raycastParams.FilterDescendantsInstances = list
				origin = nil
			end
			if origin then
				local instance = origin.Instance
				
				if instance ~= nil then
					t.stats.hitCount += 1
				end
				local var20 = nil
				while instance ~= nil and (instance:IsA("PVInstance") or instance:IsA("Accessory")) and instance ~= workspace do
					if not t.hitCountMap[instance] then
						t.hitCountMap[instance] = { raycastHits = 0, children = {} }
					end
					t.hitCountMap[instance].raycastHits += 1
					
					if var20 then
						t.hitCountMap[instance].children[var20] = true
					end
					var20 = instance
					instance = instance.Parent
				end
				if var20 then
					t.topLevelObjects[var20] = (t.topLevelObjects[var20] or 0) + 1
				end
			end
			t.stats.completedCount += 1
		end
		t.stats.wallTime = os.clock() - processTime
		t.stats.computeTime += os.clock() - processTime_1
		p5(t)
	end)
	
	return t
end

function createPlayerCharacterReferenceToPlayerMap(p6) --[[ line: 238 ]]
	local t = {}
	
	for i, v in ipairs(p6) do
		local character = v.Character
		
		if character then
			t[character] = v
		end
	end
	return t
end

function descendingOrderBySecondElement(p7, p8) --[[ line: 249 ]]
	return p8[2] < p7[2]
end

function createTraversalTaskList(p9, p10) --[[ line: 256 ]]
	-- upvalues: playersService (ref), getFIntIGARSubtreeDivergenceThresholdPerMilleModule (ref)
	local t = {}
	local t_1 = {}
	local var24 = createPlayerCharacterReferenceToPlayerMap(playersService:GetPlayers())
	local t_2 = {}
	
	for i, v in pairs(p10) do
		table.insert(t_2, { i, v })
	end
	local var27, var28
	table.sort(t_2, descendingOrderBySecondElement)
	local var26 = getFIntIGARSubtreeDivergenceThresholdPerMilleModule() / 1000
	
	for i_1, v_1 in ipairs(t_2) do
		var27 = v_1[1]
		var28 = v_1[2]
		
		if var24[var27] ~= nil then
			table.insert(t_1, { player = var24[var27], count = var28 })
			continue
		end
		local var29 = 0
		local var30 = var27
		while p9[var30] do
			local var31 = p9[var30]
			local raycastHits = var31.raycastHits
			local children = var31.children
			local var32 = 0
			
			for i_2, v_2 in pairs(children) do
				if p9[i_2] then
					var32 += 1
				end
			end
			if var32 == 0 then break end
			local var33 = 0
			
			for v_2, v_3 in pairs(children) do
				if p9[v_2] then
					var33 = math.max(var33, p9[v_2].raycastHits)
				end
			end
			if var33 / raycastHits < var26 then break end
			local var34 = nil
			local var35 = 0
			
			for i_4, v_4 in pairs(children) do
				if p9[i_4] and var35 < p9[i_4].raycastHits then
					var34 = i_4
					var35 = p9[i_4].raycastHits
				end
			end
			var30 = var34
			var29 += 1
		end
		table.insert(t, { instance = var30, count = var28 })
		
		if var30 ~= var27 then
			table.insert(t, { instance = var27, count = var28 })
		end
	end
	return t, t_1
end

function mutateMergeExtractedAssets(value, p11, p12) --[[ line: 344 ]]
	for i, v in ipairs(p12.Image) do
		if not value[v] then
			value[v] = true
			table.insert(p11.Image, v)
		end
	end
	for i, v_1 in ipairs(p12.Mesh) do
		if not value[v_1] then
			value[v_1] = true
			table.insert(p11.Mesh, v_1)
		end
	end
	for i, v_2 in ipairs(p12.Video) do
		if not value[v_2] then
			value[v_2] = true
			table.insert(p11.Video, v_2)
		end
	end
	for i, v_3 in ipairs(p12.Model) do
		if not value[v_3] then
			value[v_3] = true
			table.insert(p11.Model, v_3)
		end
	end
	for i, v_4 in ipairs(p12.Package) do
		if not value[v_4.id] then
			value[v_4.id] = true
			table.insert(p11.Package, v_4)
		end
	end
	if game:GetEngineFeature("ExperienceStateCaptureExperienceChatSupport") then
		for i, v_5 in ipairs(p12.Text) do
			if not value[v_5] then
				value[v_5] = true
				table.insert(p11.Text, v_5)
			end
		end
	end
end

function interpretInstanceListForGUIObjects(p13) --[[ line: 396 ]]
	local t = {
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
		cancel = function() --[[ line: 410 ]] end
	}
	
	for i, v in ipairs(p13) do
		local var37 = nil
	end
	return t
end

function interpretAndExtractItemsFromInstanceForPreciseSelection(a) --[[ line: 439 ]]
	-- upvalues: extractAssetIdsFromInstanceModule (ref), playersService (ref)
	local t = {
		extractedAssets = {
			Package = {},
			Model = {},
			Image = {},
			Mesh = {},
			Text = {},
			Video = {}
		},
		extractedPlayers = {},
		cancel = function() --[[ line: 450 ]] end,
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
		computation = coroutine.create(function() --[[ line: 469 ]] end)
	}
	
	if not a then
		return t
	end
	local t_1 = {}
	
	local _ = function(p14) --[[ line: 476 ]]
		-- upvalues: extractAssetIdsFromInstanceModule (copy), t_1 (ref), t (ref)
		local var44 = extractAssetIdsFromInstanceModule(p14)
		
		if var44 then
			mutateMergeExtractedAssets(t_1, t.extractedAssets, var44)
		end
		t.stats.instancesTraversed += 1
	end
	
	local var40 = createPlayerCharacterReferenceToPlayerMap(playersService:GetPlayers())
	local var41 = a
	while var41 ~= nil and (var41:IsA("PVInstance") or var41:IsA("Accessory") or (var41:IsA("GuiObject") or var41:IsA("FaceInstance"))) and var41 ~= workspace do
		if var40[var41] == nil then
			local var42 = extractAssetIdsFromInstanceModule(var41)
			
			if var42 then
				mutateMergeExtractedAssets(t_1, t.extractedAssets, var42)
			end
			t.stats.instancesTraversed += 1
			var41 = var41.Parent
		end
		table.insert(t.extractedPlayers, { count = 1, player = var40[var41] })
		
		return t
	end
	for i, v in ipairs(a:GetChildren()) do
		local var43 = extractAssetIdsFromInstanceModule(v)
		
		if var43 then
			mutateMergeExtractedAssets(t_1, t.extractedAssets, var43)
		end
		t.stats.instancesTraversed += 1
	end
	return t
end

function extractItemsFromInterpretations(a, b) --[[ line: 516 ]]
	-- upvalues: extractAssetIdsFromInstanceModule (ref)
	local var45 = false
	local t = {
		extractedAssets = {
			Package = {},
			Model = {},
			Image = {},
			Mesh = {},
			Text = {},
			Video = {}
		},
		extractedPlayers = {},
		cancel = function() --[[ line: 532 ]]
			-- upvalues: var45 (write)
			var45 = true
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
	t.computation = coroutine.create(function() --[[ line: 551 ]]
		-- upvalues: b (ref), t (ref)
		b(t)
	end)
	
	for i, v in ipairs(a) do
		v.cancel()
		t.stats.raycastTargetCount += v.stats.targetCount
		t.stats.raycastCompletedCount += v.stats.completedCount
		t.stats.raycastResumptionCount += v.stats.resumptionCount
		t.stats.raycastComputeTime += v.stats.computeTime
	end
	local processTime = os.clock()
	local t_1 = {}
	local t_2 = {}
	
	for i_1, v_1 in ipairs(a) do
		for i_2, v_2 in pairs(v_1.hitCountMap) do
			if not t_1[i_2] then
				t_1[i_2] = { raycastHits = 0, children = {} }
				t.stats.hitCountMapSize += 1
			end
			t_1[i_2].raycastHits += v_2.raycastHits
			
			for i_4, v_4 in pairs(v_2.children) do
				t_1[i_2].children[i_4] = true
			end
		end
		for i_2, v_2 in pairs(v_1.topLevelObjects) do
			local var52 = t_2[i_2]
			
			if not var52 then
				t.stats.topLevelObjectsSize += 1
			end
			t_2[i_2] = (var52 or 0) + v_2
		end
	end
	local var50, var51 = createTraversalTaskList(t_1, t_2)
	t.extractedPlayers = var51
	t.stats.playersCount = #var51
	t.stats.wallTime = os.clock() - processTime
	t.stats.traversalTaskListSize = #var50
	t.computation = coroutine.create(function() --[[ line: 599 ]]
		-- upvalues: t (ref), var50 (ref), var45 (write), b (ref), t_1 (ref), extractAssetIdsFromInstanceModule (copy)
		local processTime = os.clock()
		local processTime_1 = os.clock()
		
		local _ = function() --[[ line: 602 ]]
			-- upvalues: processTime_1 (write)
			return processTime_1 + 0.011111111111 < os.clock()
		end
		
		local _ = function() --[[ line: 605 ]]
			-- upvalues: t (copy), processTime_1 (write)
			t.stats.computeTime += os.clock() - processTime_1
			task.wait()
			processTime_1 = os.clock()
			t.stats.resumptionCount += 1
		end
		
		local t_2 = {}
		local t_3 = {}
		
		for i, v in ipairs(var50) do
			local t_4 = {}
			local t_5 = {}
			table.insert(t_4, v.instance)
		end
		t.stats.wallTime += os.clock() - processTime
		t.stats.computeTime += os.clock() - processTime_1
		b(t)
	end)
	
	return t
end

return {
	interpretAnnotation = interpretAnnotation,
	extractItemsFromInterpretations = extractItemsFromInterpretations,
	interpretInstanceListForGUIObjects = interpretInstanceListForGUIObjects,
	interpretAndExtractItemsFromInstanceForPreciseSelection = interpretAndExtractItemsFromInstanceForPreciseSelection,
	__setRandomGenerator = function(value) --[[ line: 698 ]]
		-- upvalues: random (write)
		random = value
	end
}