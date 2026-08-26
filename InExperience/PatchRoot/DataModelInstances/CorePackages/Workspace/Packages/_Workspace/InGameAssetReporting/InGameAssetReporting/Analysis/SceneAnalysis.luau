local playersService = game:GetService("Players")
local inGameAssetReporting = script:FindFirstAncestor("InGameAssetReporting")
local _ = require(inGameAssetReporting.Analysis.Types)
local getFIntIGARRaycastTargetCountModule = require(inGameAssetReporting.Flags.GetFIntIGARRaycastTargetCount)
local getFIntIGARSubtreeDivergenceThresholdPerMilleModule = require(inGameAssetReporting.Flags.GetFIntIGARSubtreeDivergenceThresholdPerMille)
local extractAssetIdsFromInstanceModule = require(inGameAssetReporting.Analysis.extractAssetIdsFromInstance)
local random = Random.new()

function getRandomSampleUniformDisk(p1, p2, p3)
	-- upvalues: random (write)
	local var1, var2
	local _ = nil
	local _ = nil
	local var3 = 0
	repeat
		local var4 = random:NextNumber() * 2 * 3.14159265359
		local var5 = math.sqrt(random:NextNumber()) * p2
		var1 = p1.X + math.cos(var4) * var5
		var2 = p1.Y + math.sin(var4) * var5
		var3 += 1
		if var3 <= 6 then continue end
		return p1
	until var1 >= 0 and var1 <= p3.X and (var2 >= 0 and var2 <= p3.Y)
	return Vector2.new(var1, var2)
end

function interpretAnnotation(p1, p2, p3)
	-- upvalues: getFIntIGARRaycastTargetCountModule (ref), playersService (ref)
	local var1 = false
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
		cancel = function()
			-- upvalues: var1 (write)
			var1 = true
		end
	}
	t.raycastComputation = coroutine.create(function()
		-- upvalues: p3 (ref), t (ref)
		p3(t)
	end)
	local currentCamera = workspace.CurrentCamera
	
	if currentCamera == nil then
		t.errorReason = "No camera"
		
		return t
	end
	local viewportSize = currentCamera.ViewportSize
	
	if p1.X < 0 or viewportSize.X < p1.X or (p1.Y < 0 or viewportSize.Y < p1.Y) then
		t.errorReason = "Coordinates out of bounds"
		
		return t
	elseif p2 <= 0 or math.max(viewportSize.X, viewportSize.Y) < p2 then
		t.errorReason = "Invalid radius"
		
		return t
	end
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer == nil then
		t.errorReason = "No local player"
		
		return t
	end
	local list = { localPlayer.Character }
	t.raycastComputation = coroutine.create(function()
		-- upvalues: list (ref), t (ref), var1 (write), p1 (ref), p2 (ref), viewportSize (ref), currentCamera (ref), p3 (ref)
		local raycastParams = RaycastParams.new()
		raycastParams.FilterType = Enum.RaycastFilterType.Exclude
		raycastParams.FilterDescendantsInstances = list
		raycastParams.IgnoreWater = true
		local processTime = os.clock()
		local processTime_1 = os.clock()
		
		for _ = 1, t.stats.targetCount do
			if var1 then break end
			if processTime_1 + 0.011111111111 < os.clock() then
				t.stats.computeTime += os.clock() - processTime_1
				task.wait()
				processTime_1 = os.clock()
				t.stats.resumptionCount += 1
				
				if var1 then break end
			end
			local origin
			local var2 = getRandomSampleUniformDisk(p1, p2, viewportSize)
			local x = currentCamera:ViewportPointToRay(var2.X, var2.Y)
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
				local var3 = nil
				while instance ~= nil and (instance:IsA("PVInstance") or instance:IsA("Accessory")) and instance ~= workspace do
					if not t.hitCountMap[instance] then
						t.hitCountMap[instance] = { raycastHits = 0, children = {} }
					end
					t.hitCountMap[instance].raycastHits += 1
					
					if var3 then
						t.hitCountMap[instance].children[var3] = true
					end
					var3 = instance
					instance = instance.Parent
				end
				if var3 then
					t.topLevelObjects[var3] = (t.topLevelObjects[var3] or 0) + 1
				end
			end
			t.stats.completedCount += 1
		end
		t.stats.wallTime = os.clock() - processTime
		t.stats.computeTime += os.clock() - processTime_1
		p3(t)
	end)
	
	return t
end

function createPlayerCharacterReferenceToPlayerMap(p4)
	local t = {}
	
	for i, v in ipairs(p4) do
		local character = v.Character
		
		if character then
			t[character] = v
		end
	end
	return t
end

function descendingOrderBySecondElement(p5, p6)
	return p6[2] < p5[2]
end

function createTraversalTaskList(p5, p6)
	-- upvalues: playersService (ref), getFIntIGARSubtreeDivergenceThresholdPerMilleModule (ref)
	local t = {}
	local t_1 = {}
	local var4 = createPlayerCharacterReferenceToPlayerMap(playersService:GetPlayers())
	local t_2 = {}
	
	for i, v in pairs(p6) do
		table.insert(t_2, { i, v })
	end
	local var5, var6
	table.sort(t_2, descendingOrderBySecondElement)
	local var7 = getFIntIGARSubtreeDivergenceThresholdPerMilleModule() / 1000
	
	for i_1, v_1 in ipairs(t_2) do
		var5 = v_1[1]
		var6 = v_1[2]
		
		if var4[var5] ~= nil then
			table.insert(t_1, { player = var4[var5], count = var6 })
			continue
		end
		local var8 = 0
		local var9 = var5
		while p5[var9] do
			local var10 = p5[var9]
			local raycastHits = var10.raycastHits
			local children = var10.children
			local var11 = 0
			
			for i_2, v_2 in pairs(children) do
				if p5[i_2] then
					var11 += 1
				end
			end
			if var11 == 0 then break end
			local var12 = 0
			
			for v_2, v_3 in pairs(children) do
				if p5[v_2] then
					var12 = math.max(var12, p5[v_2].raycastHits)
				end
			end
			if var12 / raycastHits < var7 then break end
			local var13 = nil
			local var14 = 0
			
			for i_4, v_4 in pairs(children) do
				if p5[i_4] and var14 < p5[i_4].raycastHits then
					var13 = i_4
					var14 = p5[i_4].raycastHits
				end
			end
			var9 = var13
			var8 += 1
		end
		table.insert(t, { instance = var9, count = var6 })
		
		if var9 ~= var5 then
			table.insert(t, { instance = var5, count = var6 })
		end
	end
	return t, t_1
end

function mutateMergeExtractedAssets(value, p7, p8)
	for i, v in ipairs(p8.Image) do
		if not value[v] then
			value[v] = true
			table.insert(p7.Image, v)
		end
	end
	for i, v_1 in ipairs(p8.Mesh) do
		if not value[v_1] then
			value[v_1] = true
			table.insert(p7.Mesh, v_1)
		end
	end
	for i, v_2 in ipairs(p8.Video) do
		if not value[v_2] then
			value[v_2] = true
			table.insert(p7.Video, v_2)
		end
	end
	for i, v_3 in ipairs(p8.Model) do
		if not value[v_3] then
			value[v_3] = true
			table.insert(p7.Model, v_3)
		end
	end
	for i, v_4 in ipairs(p8.Package) do
		if not value[v_4.id] then
			value[v_4.id] = true
			table.insert(p7.Package, v_4)
		end
	end
	if game:GetEngineFeature("ExperienceStateCaptureExperienceChatSupport") then
		for i, v_5 in ipairs(p8.Text) do
			if not value[v_5] then
				value[v_5] = true
				table.insert(p7.Text, v_5)
			end
		end
	end
end

function interpretInstanceListForGUIObjects(p9)
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
		cancel = function() end
	}
	
	for i, v in ipairs(p9) do
		local var15 = nil
	end
	return t
end

function interpretAndExtractItemsFromInstanceForPreciseSelection(a)
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
		cancel = function() end,
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
		computation = coroutine.create(function() end)
	}
	
	if not a then
		return t
	end
	local t_1 = {}
	
	local _ = function(p10)
		-- upvalues: extractAssetIdsFromInstanceModule (copy), t_1 (ref), t (ref)
		local var16 = extractAssetIdsFromInstanceModule(p10)
		
		if var16 then
			mutateMergeExtractedAssets(t_1, t.extractedAssets, var16)
		end
		t.stats.instancesTraversed += 1
	end
	
	local var16 = createPlayerCharacterReferenceToPlayerMap(playersService:GetPlayers())
	local var17 = a
	while var17 ~= nil and (var17:IsA("PVInstance") or var17:IsA("Accessory") or (var17:IsA("GuiObject") or var17:IsA("FaceInstance"))) and var17 ~= workspace do
		if var16[var17] == nil then
			local var18 = extractAssetIdsFromInstanceModule(var17)
			
			if var18 then
				mutateMergeExtractedAssets(t_1, t.extractedAssets, var18)
			end
			t.stats.instancesTraversed += 1
			var17 = var17.Parent
		end
		table.insert(t.extractedPlayers, { count = 1, player = var16[var17] })
		
		return t
	end
	for i, v in ipairs(a:GetChildren()) do
		local var19 = extractAssetIdsFromInstanceModule(v)
		
		if var19 then
			mutateMergeExtractedAssets(t_1, t.extractedAssets, var19)
		end
		t.stats.instancesTraversed += 1
	end
	return t
end

function extractItemsFromInterpretations(a, b)
	-- upvalues: extractAssetIdsFromInstanceModule (ref)
	local var20 = false
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
		cancel = function()
			-- upvalues: var20 (write)
			var20 = true
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
	t.computation = coroutine.create(function()
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
			local var21 = t_2[i_2]
			
			if not var21 then
				t.stats.topLevelObjectsSize += 1
			end
			t_2[i_2] = (var21 or 0) + v_2
		end
	end
	local var22, var23 = createTraversalTaskList(t_1, t_2)
	t.extractedPlayers = var23
	t.stats.playersCount = #var23
	t.stats.wallTime = os.clock() - processTime
	t.stats.traversalTaskListSize = #var22
	t.computation = coroutine.create(function()
		-- upvalues: t (ref), var22 (ref), var20 (write), b (ref), t_1 (ref), extractAssetIdsFromInstanceModule (copy)
		local processTime = os.clock()
		local processTime_1 = os.clock()
		
		local _ = function()
			-- upvalues: processTime_1 (write)
			return processTime_1 + 0.011111111111 < os.clock()
		end
		
		local _ = function()
			-- upvalues: t (copy), processTime_1 (write)
			t.stats.computeTime += os.clock() - processTime_1
			task.wait()
			processTime_1 = os.clock()
			t.stats.resumptionCount += 1
		end
		
		local t_2 = {}
		local t_3 = {}
		
		for i, v in ipairs(var22) do
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
	__setRandomGenerator = function(value)
		-- upvalues: random (write)
		random = value
	end
}