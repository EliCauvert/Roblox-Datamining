local tnSAvatarIdentification = script:FindFirstAncestor("TnSAvatarIdentification")
local getFIntReportAnythingAvatarIdentificationCloseDiscardDistanceHundredthsModule = require(tnSAvatarIdentification.Flags.GetFIntReportAnythingAvatarIdentificationCloseDiscardDistanceHundredths)
local getFIntReportAnythingAvatarIdentificationDiscardFractionSkipThresholdPercentModule = require(tnSAvatarIdentification.Flags.GetFIntReportAnythingAvatarIdentificationDiscardFractionSkipThresholdPercent)
local getFIntReportAnythingAvatarIdentificationOffScreenDiscardDistancePercentModule = require(tnSAvatarIdentification.Flags.GetFIntReportAnythingAvatarIdentificationOffScreenDiscardDistancePercent)
local playersService = game:GetService("Players")
local parent = tnSAvatarIdentification.Parent
local sharedFlagsModule = require(parent.SharedFlags)
local getFFlagAvatarIdentificationSafeAreaFix = sharedFlagsModule.GetFFlagAvatarIdentificationSafeAreaFix
local getFFlagGetHumanoidDescriptionUpdatesV2E = sharedFlagsModule.GetFFlagGetHumanoidDescriptionUpdatesV2E
local getHumanoidDescriptionModule = require(parent.GetHumanoidDescription)
local identificationUtilsModule = require(script.Parent.IdentificationUtils)
local var8 = getFIntReportAnythingAvatarIdentificationCloseDiscardDistanceHundredthsModule() / 100
local var9 = getFIntReportAnythingAvatarIdentificationOffScreenDiscardDistancePercentModule() / 100
local var10 = getFIntReportAnythingAvatarIdentificationDiscardFractionSkipThresholdPercentModule() / 100
local t = {
	getAvatarsForRegion = function(p0, p1, p2, p3, p4) --[[ line: 431 ]]
		local t = {}
		local var16 = p4 < p3
		local var17 = if var16 then p3 / p4 else p4 / p3
		local var18 = if var16 then Vector2.new(var17, 1) else Vector2.new(1, var17)
		
		for i, v in pairs(p0) do
			if intersectCircleBox(p1 * var18, p2 * var17, v.boundingBox.min * var18, v.boundingBox.max * var18, var18) and #v.convexHull >= 3 and intersectCirclePolygon(p1 * var18, p2 * var17, v.convexHull, var18) then
				t[v.player.UserId] = v.player
			end
		end
		return t
	end,
	getAvatarsForPoint = function(p5, p6) --[[ line: 478 ]]
		local t = {}
		
		for i, v in pairs(p5) do
			local boundingBox = v.boundingBox
			
			if p6.X >= boundingBox.min.X and p6.Y >= boundingBox.min.Y and (boundingBox.max.X >= p6.X and boundingBox.max.Y >= p6.Y) then
				local convexHull = v.convexHull
				
				if #convexHull >= 3 then
					local var20 = convexHull[#convexHull]
					local var21 = true
					local var22 = true
					
					for i_1, v_1 in ipairs(convexHull) do
						local var23 = (v_1 - var20):Cross(p6 - var20)
						var22 = var22 and var23 <= 0
						var21 = var21 and var23 >= 0
						var20 = v_1
					end
					if var21 or var22 then
						t[v.player.UserId] = v.player
					end
				end
			end
		end
		return t
	end,
	getVisibleAvatars = function(p7, p8) --[[ line: 515 ]]
		-- upvalues: playersService (ref), identificationUtilsModule (ref), getFFlagAvatarIdentificationSafeAreaFix (ref), getFFlagGetHumanoidDescriptionUpdatesV2E (ref), getHumanoidDescriptionModule (ref)
		local players = playersService:GetPlayers()
		local t = { totalPlayers = 0, checkedPlayers = 0, duration = 0 }
		local currentCamera = workspace.CurrentCamera
		
		if not currentCamera then
			return {}, t
		end
		local localPlayer = playersService.LocalPlayer
		
		if not localPlayer then
			return {}, t
		end
		local var28
		local character = localPlayer.Character
		local _ = nil
		local var26 = nil
		local t_1 = {}
		
		if character then
			var28 = identificationUtilsModule.getLocalCharacterPosition(character) or currentCamera.CFrame.Position
			
			if identificationUtilsModule.shouldIgnoreLocalCharacter(character) then
				t_1[#t_1 + 1] = character
			end
		else
			var28 = currentCamera.CFrame.Position
			var26 = false
		end
		local viewportInfo = nil
		
		if getFFlagAvatarIdentificationSafeAreaFix() then
			viewportInfo = identificationUtilsModule.getViewportInfo()
			t.viewportInfo = viewportInfo
		end
		local t_2 = {}
		local processTime = os.clock()
		t.totalPlayers = #players - 1
		
		local _ = function() --[[ line: 559 ]]
			-- upvalues: t (ref), processTime (ref)
			t.duration = os.clock() - processTime
			
			return t
		end
		
		local _ = function() --[[ line: 563 ]]
			-- upvalues: p8 (ref), processTime (ref)
			return (p8 or 0.5) < os.clock() - processTime
		end
		
		if var28 then
			table.sort(players, function(p9, p10) --[[ line: 570 ]]
				-- upvalues: var28 (write)
				return p9:DistanceFromCharacter(var28) < p10:DistanceFromCharacter(var28)
			end)
		end
		for i, v in ipairs(players) do
			if (v ~= localPlayer or p7) and v.Character then
				if (p8 or 0.5) >= os.clock() - processTime then
					local boundingBox, boundingBox_1 = v.Character:GetBoundingBox()
					local magnitude = (boundingBox.Position - var28).Magnitude
					
					if getDistanceAlongCamLookVector(boundingBox, currentCamera) < 0 then
						t.checkedPlayers += 1
					else
						local viewportCorners, viewportCorners_1 = identificationUtilsModule.getViewportCorners(getBBCorners(boundingBox, boundingBox_1), currentCamera, viewportInfo)
						
						if viewportCorners_1.X == 0 or viewportCorners_1.Y == 0 then
							t.checkedPlayers += 1
						else
							local var37, var38 = getVisibleParts(currentCamera, v, t_1)
							
							if (p8 or 0.5) >= os.clock() - processTime then
								local var40 = #var38 / var37
								local var41, var42 = getCoveringPolygon(var38, currentCamera, viewportInfo)
								local var43 = nil
								local var44 = nil
								
								if getFFlagGetHumanoidDescriptionUpdatesV2E() then
									local humanoidDescription, humanoidDescription_1 = getHumanoidDescriptionModule.getHumanoidDescription(v.UserId)
									var43 = humanoidDescription
									var44 = humanoidDescription_1
								end
								t_2[v.UserId] = {
									player = v,
									distance = magnitude,
									boundingBox = { min = viewportCorners, max = viewportCorners_1 },
									hitRate = var40,
									convexHull = var41,
									pointProcessingStats = var42,
									humanoidDescription = var43,
									humanoidDescriptionStatus = var44
								}
								t.checkedPlayers += 1
							end
							local var39 = t_2
							t.duration = os.clock() - processTime
							
							return var39, t
						end
					end
				end
				local var32 = t_2
				t.duration = os.clock() - processTime
				
				return var32, t
			end
		end
		t.duration = os.clock() - processTime
		
		return t_2, t
	end
}

function getBBCorners(p11, p12) --[[ line: 29 ]]
	local list = table.create(8)
	local xVector = p11.XVector
	local yVector = p11.YVector
	local zVector = p11.ZVector
	local var48 = 1
	
	for i_2 = -0.5, 0.5 do
		local var49 = xVector * i_2 * p12.X
		
		for i_1 = -0.5, 0.5 do
			local var50 = yVector * i_1 * p12.Y
			
			for i = -0.5, 0.5 do
				list[var48] = p11.Position + var49 + var50 + zVector * i * p12.Z
				var48 += 1
			end
		end
	end
	return list
end

local var12 = var9 + 1
local var13 = -var9

local _ = function(p13) --[[ line: 53 ]]
	-- upvalues: var12 (ref), var13 (ref)
	return if var12 >= p13.Y then if p13.Y >= var13 then if var12 >= p13.X then p13.X < var13 else true else true else true
end

local t_1 = {
	total = 0,
	offScreenDiscardCount = 0,
	tooCloseDiscardCount = 0,
	wasSkipped = false
}

function getCoveringPolygon(p14, p15, p16) --[[ line: 74 ]]
	-- upvalues: t_1 (ref), getFFlagAvatarIdentificationSafeAreaFix (ref), identificationUtilsModule (ref), var8 (ref), var12 (ref), var13 (ref), var10 (ref)
	if #p14 == 0 then
		return {}, t_1
	end
	local viewportSize = p15.ViewportSize
	local t = {}
	
	for i, v in ipairs(p14) do
		local target = v.target
		
		for i_2, v_1 in getBBCorners(target.ExtentsCFrame, target.ExtentsSize) do
			table.insert(t, v_1)
		end
	end
	local t_2 = {}
	local var53 = 0
	local var54 = 0
	
	if getFFlagAvatarIdentificationSafeAreaFix() then
		assert(p16, "getCoveringPolygon requires viewportInfo when FFlagAvatarIdentificationSafeAreaFix is enabled")
		
		for i_1, v_1 in ipairs(t) do
			local var55, var56, _ = identificationUtilsModule.worldToFullViewportPointNormalized(v_1, p15, p16)
			
			if var56 < var8 then
				var53 += 1
				continue
			end
			if if var12 >= var55.Y then if var55.Y >= var13 then if var12 >= var55.X then var55.X < var13 else true else true else true then
				var54 += 1
			else
				t_2[#t_2 + 1] = var55
			end
		end
	else
		for i_1, v_1 in ipairs(t) do
			local var57, _ = p15:WorldToViewportPoint(v_1)
			local var58 = Vector2.new(var57.X, var57.Y) / viewportSize
			
			if var57.Z < var8 then
				var53 += 1
				continue
			end
			if if var12 >= var58.Y then if var58.Y >= var13 then if var12 >= var58.X then var58.X < var13 else true else true else true then
				var54 += 1
			else
				t_2[#t_2 + 1] = var58
			end
		end
	end
	local t_3 = {
		wasSkipped = false,
		total = #t,
		offScreenDiscardCount = var54,
		tooCloseDiscardCount = var53
	}
	
	if var10 < (var53 + var54) / #t then
		t_3.wasSkipped = true
		
		return {}, t_3
	end
	return getConvexHull(t_2), t_3
end

function getDistanceAlongCamLookVector(p17, p18) --[[ line: 149 ]]
	local cFrame = p18.CFrame
	
	return (p17.Position - cFrame.Position):Dot(cFrame.LookVector)
end

function getVisibleParts(p19, p20, p21) --[[ line: 162 ]]
	local position = p19.CFrame.Position
	local character = p20.Character
	
	if not character or not character.Parent then
		return 0, {}
	end
	local children = character:GetChildren()
	local raycastParams = RaycastParams.new()
	raycastParams.FilterType = Enum.RaycastFilterType.Exclude
	raycastParams.FilterDescendantsInstances = p21
	raycastParams.IgnoreWater = true
	local var62 = 0
	local t = {}
	
	for i, v in ipairs(children) do
		if v:IsA("BasePart") then
			var62 += 1
			local var64 = workspace:Raycast(position, v.CFrame.Position - position, raycastParams)
			
			if var64 and var64.Instance:IsDescendantOf(character) then
				table.insert(t, { result = var64, target = v })
			end
		end
	end
	return var62, t
end

local function _(p22, p23, p24) --[[ line: 203 | named "counterclockwise" ]]
	return (p23 - p22):Cross(p24 - p23)
end

function getConvexHull(p25) --[[ line: 207 ]]
	if #p25 <= 2 then
		return {}
	end
	local var68
	local t = {}
	local var66 = p25[1]
	local t_1 = {}
	
	for i = 2, #p25 do
		var68 = p25[i]
		
		if var68.Y < var66.Y or var68.Y == var66.Y and var68.X < var66.X then
			var66 = var68
		end
	end
	table.insert(t, var66)
	
	local function _(vectorA) --[[ line: 224 | named "angleFromLowest" ]]
		-- upvalues: var66 (write)
		local var74 = vectorA - var66
		
		return math.atan2(var74.Y, var74.X)
	end
	
	for i_1, v in ipairs(p25) do
		if v ~= var66 then
			local var73 = v - var66
			table.insert(t_1, Vector3.new(v.X, v.Y, math.atan2(var73.Y, var73.X)))
		end
	end
	table.sort(t_1, function(vectorA, vectorB) --[[ line: 236 | named "compareByAngle" ]]
		-- upvalues: var66 (write)
		return if vectorA.Z == vectorB.Z then (Vector2.new(vectorA.X, vectorA.Y) - var66).Magnitude < (Vector2.new(vectorB.X, vectorB.Y) - var66).Magnitude else vectorA.Z < vectorB.Z
	end)
	local t_2 = {}
	var68 = t_1[1]
	
	for i_2 = 2, #t_1 do
		local var70 = t_1[i_2]
		
		if var68.Z == var70.Z then
			var68 = var70
		else
			table.insert(t_2, Vector2.new(var68.X, var68.Y))
			var68 = var70
		end
	end
	table.insert(t_2, Vector2.new(var68.X, var68.Y))
	
	if #t_2 == 1 then
		return {}
	end
	table.insert(t, t_2[1])
	table.insert(t, t_2[2])
	
	for i_1 = 3, #t_2 do
		local var71 = t_2[i_1]
	end
	return t
end

function projectVertices(p26, p27, p28) --[[ line: 308 ]]
	local var75 = 1e999
	local var76 = -1e999
	
	for i, v in ipairs(p26) do
		local var77 = (v * p28):Dot(p27)
		
		if var77 < var75 then
			var75 = var77
		end
		if var76 < var77 then
			var76 = var77
		end
	end
	return var75, var76
end

function projectCircle(p29, p30, p31) --[[ line: 328 ]]
	local var78 = p31.Unit * p30
	local var79 = (p29 + var78):Dot(p31)
	local var80 = (p29 - var78):Dot(p31)
	
	if var80 < var79 then
		local var81 = var79
		var79 = var80
		var80 = var81
	end
	return var79, var80
end

function getClosestPoint(p32, p33, p34) --[[ line: 347 ]]
	local var82 = -1
	local var83 = 1e999
	
	for i, v in ipairs(p33) do
		v *= p34
		local squareRoot = math.sqrt(math.pow(v.X - p32.X, 2) + math.pow(v.Y - p32.Y, 2))
		
		if squareRoot < var83 then
			var83 = squareRoot
			var82 = i
		end
	end
	return var82
end

function intersectCirclePolygon(p35, p36, p37, p38) --[[ line: 361 ]]
	for i, v in ipairs(p37) do
		local var90 = p37[i % #p37 + 1] * p38 - p37[i] * p38
		local unit = Vector2.new(var90.Y, -var90.X).Unit
		local var91, var92 = projectVertices(p37, unit, p38)
		local var93, var94 = projectCircle(p35, p36, unit)
		
		if var94 <= var91 or var92 <= var93 then
			return false
		end
	end
	local var85 = getClosestPoint(p35, p37, p38)
	
	if var85 == -1 then
		return false
	end
	local unit = (p37[var85] - p35).Unit
	local var86, var87 = projectVertices(p37, unit, p38)
	local var88, var89 = projectCircle(p35, p36, unit)
	
	return var89 <= var86 or var87 <= var88
end

function intersectCircleBox(p39, p40, p41, p42, _) --[[ line: 392 ]]
	local x = p39.X
	local y = p39.Y
	local var95 = x
	local var96 = y
	local x_1 = p41.X
	local y_1 = p41.Y
	local var97 = p42.X - p41.X
	local var98 = p42.Y - p41.Y
	
	if x < x_1 then
		var95 = x_1
	elseif x_1 + var97 < x then
		var95 = x_1 + var97
	end
	if y < y_1 then
		var96 = y_1
	elseif y_1 + var98 < y then
		var96 = y_1 + var98
	end
	local var99 = x - var95
	local var100 = y - var96
	
	return math.sqrt(var99 * var99 + var100 * var100) <= p40
end

return t