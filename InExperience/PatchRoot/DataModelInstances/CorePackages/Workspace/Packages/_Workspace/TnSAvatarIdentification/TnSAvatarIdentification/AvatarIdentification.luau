local tnSAvatarIdentification = script:FindFirstAncestor("TnSAvatarIdentification")
local getFIntReportAnythingAvatarIdentificationCloseDiscardDistanceHundredthsModule = require(tnSAvatarIdentification.Flags.GetFIntReportAnythingAvatarIdentificationCloseDiscardDistanceHundredths)
local getFIntReportAnythingAvatarIdentificationDiscardFractionSkipThresholdPercentModule = require(tnSAvatarIdentification.Flags.GetFIntReportAnythingAvatarIdentificationDiscardFractionSkipThresholdPercent)
local getFIntReportAnythingAvatarIdentificationOffScreenDiscardDistancePercentModule = require(tnSAvatarIdentification.Flags.GetFIntReportAnythingAvatarIdentificationOffScreenDiscardDistancePercent)
local playersService = game:GetService("Players")
local parent = tnSAvatarIdentification.Parent
local getFFlagGetHumanoidDescriptionUpdatesV2E = require(parent.SharedFlags).GetFFlagGetHumanoidDescriptionUpdatesV2E
local getHumanoidDescriptionModule = require(parent.GetHumanoidDescription)
local identificationUtilsModule = require(script.Parent.IdentificationUtils)
local var7 = getFIntReportAnythingAvatarIdentificationCloseDiscardDistanceHundredthsModule() / 100
local var8 = getFIntReportAnythingAvatarIdentificationOffScreenDiscardDistancePercentModule() / 100
local var9 = getFIntReportAnythingAvatarIdentificationDiscardFractionSkipThresholdPercentModule() / 100
local t = {
	getAvatarsForRegion = function(p0, p1, p2, p3, p4) --[[ line: 410 ]]
		local t = {}
		local var15 = p4 < p3
		local var16 = if var15 then p3 / p4 else p4 / p3
		local var17 = if var15 then Vector2.new(var16, 1) else Vector2.new(1, var16)
		
		for i, v in pairs(p0) do
			if intersectCircleBox(p1 * var17, p2 * var16, v.boundingBox.min * var17, v.boundingBox.max * var17, var17) and #v.convexHull >= 3 and intersectCirclePolygon(p1 * var17, p2 * var16, v.convexHull, var17) then
				t[v.player.UserId] = v.player
			end
		end
		return t
	end,
	getAvatarsForPoint = function(p5, p6) --[[ line: 457 ]]
		local t = {}
		
		for i, v in pairs(p5) do
			local boundingBox = v.boundingBox
			
			if p6.X >= boundingBox.min.X and p6.Y >= boundingBox.min.Y and (boundingBox.max.X >= p6.X and boundingBox.max.Y >= p6.Y) then
				local convexHull = v.convexHull
				
				if #convexHull >= 3 then
					local var19 = convexHull[#convexHull]
					local var20 = true
					local var21 = true
					
					for i_1, v_1 in ipairs(convexHull) do
						local var22 = (v_1 - var19):Cross(p6 - var19)
						var21 = var21 and var22 <= 0
						var20 = var20 and var22 >= 0
						var19 = v_1
					end
					if var20 or var21 then
						t[v.player.UserId] = v.player
					end
				end
			end
		end
		return t
	end,
	getVisibleAvatars = function(p7, p8) --[[ line: 494 ]]
		-- upvalues: playersService (ref), identificationUtilsModule (ref), getFFlagGetHumanoidDescriptionUpdatesV2E (ref), getHumanoidDescriptionModule (ref)
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
		local var27
		local character = localPlayer.Character
		local _ = nil
		local var25 = nil
		local t_1 = {}
		
		if character then
			var27 = identificationUtilsModule.getLocalCharacterPosition(character) or currentCamera.CFrame.Position
			
			if identificationUtilsModule.shouldIgnoreLocalCharacter(character) then
				t_1[#t_1 + 1] = character
			end
		else
			var27 = currentCamera.CFrame.Position
			var25 = false
		end
		local viewportInfo = identificationUtilsModule.getViewportInfo()
		t.viewportInfo = viewportInfo
		local t_2 = {}
		local processTime = os.clock()
		t.totalPlayers = #players - 1
		
		local _ = function() --[[ line: 535 ]]
			-- upvalues: t (ref), processTime (ref)
			t.duration = os.clock() - processTime
			
			return t
		end
		
		local _ = function() --[[ line: 539 ]]
			-- upvalues: p8 (ref), processTime (ref)
			return (p8 or 0.5) < os.clock() - processTime
		end
		
		if var27 then
			table.sort(players, function(p9, p10) --[[ line: 546 ]]
				-- upvalues: var27 (write)
				return p9:DistanceFromCharacter(var27) < p10:DistanceFromCharacter(var27)
			end)
		end
		for i, v in ipairs(players) do
			if (v ~= localPlayer or p7) and v.Character then
				if (p8 or 0.5) >= os.clock() - processTime then
					local boundingBox, boundingBox_1 = v.Character:GetBoundingBox()
					local magnitude = (boundingBox.Position - var27).Magnitude
					
					if getDistanceAlongCamLookVector(boundingBox, currentCamera) < 0 then
						t.checkedPlayers += 1
					else
						local viewportCorners, viewportCorners_1 = identificationUtilsModule.getViewportCorners(getBBCorners(boundingBox, boundingBox_1), currentCamera, viewportInfo)
						
						if viewportCorners_1.X == 0 or viewportCorners_1.Y == 0 then
							t.checkedPlayers += 1
						else
							local var36, var37 = getVisibleParts(currentCamera, v, t_1)
							
							if (p8 or 0.5) >= os.clock() - processTime then
								local var39 = #var37 / var36
								local var40, var41 = getCoveringPolygon(var37, currentCamera, viewportInfo)
								local var42 = nil
								local var43 = nil
								
								if getFFlagGetHumanoidDescriptionUpdatesV2E() then
									local humanoidDescription, humanoidDescription_1 = getHumanoidDescriptionModule.getHumanoidDescription(v.UserId)
									var42 = humanoidDescription
									var43 = humanoidDescription_1
								end
								t_2[v.UserId] = {
									player = v,
									distance = magnitude,
									boundingBox = { min = viewportCorners, max = viewportCorners_1 },
									hitRate = var39,
									convexHull = var40,
									pointProcessingStats = var41,
									humanoidDescription = var42,
									humanoidDescriptionStatus = var43
								}
								t.checkedPlayers += 1
							end
							local var38 = t_2
							t.duration = os.clock() - processTime
							
							return var38, t
						end
					end
				end
				local var31 = t_2
				t.duration = os.clock() - processTime
				
				return var31, t
			end
		end
		t.duration = os.clock() - processTime
		
		return t_2, t
	end
}

function getBBCorners(p11, p12) --[[ line: 28 ]]
	local list = table.create(8)
	local xVector = p11.XVector
	local yVector = p11.YVector
	local zVector = p11.ZVector
	local var47 = 1
	
	for i_2 = -0.5, 0.5 do
		local var48 = xVector * i_2 * p12.X
		
		for i_1 = -0.5, 0.5 do
			local var49 = yVector * i_1 * p12.Y
			
			for i = -0.5, 0.5 do
				list[var47] = p11.Position + var48 + var49 + zVector * i * p12.Z
				var47 += 1
			end
		end
	end
	return list
end

local var11 = var8 + 1
local var12 = -var8

local _ = function(p13) --[[ line: 52 ]]
	-- upvalues: var11 (ref), var12 (ref)
	return if var11 >= p13.Y then if p13.Y >= var12 then if var11 >= p13.X then p13.X < var12 else true else true else true
end

local t_1 = {
	total = 0,
	offScreenDiscardCount = 0,
	tooCloseDiscardCount = 0,
	wasSkipped = false
}

function getCoveringPolygon(p14, p15, p16) --[[ line: 73 ]]
	-- upvalues: t_1 (ref), identificationUtilsModule (ref), var7 (ref), var11 (ref), var12 (ref), var9 (ref)
	if #p14 == 0 then
		return {}, t_1
	end
	local t = {}
	
	for i, v in ipairs(p14) do
		local target = v.target
		
		for i_1, v_1 in getBBCorners(target.ExtentsCFrame, target.ExtentsSize) do
			table.insert(t, v_1)
		end
	end
	local t_2 = {}
	local var52 = 0
	local var53 = 0
	assert(p16, "getCoveringPolygon requires viewportInfo")
	
	for i_1, v_1 in ipairs(t) do
		local var55, var56, _ = identificationUtilsModule.worldToFullViewportPointNormalized(v_1, p15, p16)
		
		if var56 < var7 then
			var52 += 1
			continue
		end
		if if var11 >= var55.Y then if var55.Y >= var12 then if var11 >= var55.X then var55.X < var12 else true else true else true then
			var53 += 1
		else
			t_2[#t_2 + 1] = var55
		end
	end
	local t_3 = {
		wasSkipped = false,
		total = #t,
		offScreenDiscardCount = var53,
		tooCloseDiscardCount = var52
	}
	
	if var9 < (var52 + var53) / #t then
		t_3.wasSkipped = true
		
		return {}, t_3
	end
	return getConvexHull(t_2), t_3
end

function getDistanceAlongCamLookVector(p17, p18) --[[ line: 128 ]]
	local cFrame = p18.CFrame
	
	return (p17.Position - cFrame.Position):Dot(cFrame.LookVector)
end

function getVisibleParts(p19, p20, p21) --[[ line: 141 ]]
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
	local var59 = 0
	local t = {}
	
	for i, v in ipairs(children) do
		if v:IsA("BasePart") then
			var59 += 1
			local var61 = workspace:Raycast(position, v.CFrame.Position - position, raycastParams)
			
			if var61 and var61.Instance:IsDescendantOf(character) then
				table.insert(t, { result = var61, target = v })
			end
		end
	end
	return var59, t
end

local function _(p22, p23, p24) --[[ line: 182 | named "counterclockwise" ]]
	return (p23 - p22):Cross(p24 - p23)
end

function getConvexHull(p25) --[[ line: 186 ]]
	if #p25 <= 2 then
		return {}
	end
	local var65
	local t = {}
	local var63 = p25[1]
	local t_1 = {}
	
	for i = 2, #p25 do
		var65 = p25[i]
		
		if var65.Y < var63.Y or var65.Y == var63.Y and var65.X < var63.X then
			var63 = var65
		end
	end
	table.insert(t, var63)
	
	local function _(vectorA) --[[ line: 203 | named "angleFromLowest" ]]
		-- upvalues: var63 (write)
		local var71 = vectorA - var63
		
		return math.atan2(var71.Y, var71.X)
	end
	
	for i_1, v in ipairs(p25) do
		if v ~= var63 then
			local var70 = v - var63
			table.insert(t_1, Vector3.new(v.X, v.Y, math.atan2(var70.Y, var70.X)))
		end
	end
	table.sort(t_1, function(vectorA, vectorB) --[[ line: 215 | named "compareByAngle" ]]
		-- upvalues: var63 (write)
		return if vectorA.Z == vectorB.Z then (Vector2.new(vectorA.X, vectorA.Y) - var63).Magnitude < (Vector2.new(vectorB.X, vectorB.Y) - var63).Magnitude else vectorA.Z < vectorB.Z
	end)
	local t_2 = {}
	var65 = t_1[1]
	
	for i_2 = 2, #t_1 do
		local var67 = t_1[i_2]
		
		if var65.Z == var67.Z then
			var65 = var67
		else
			table.insert(t_2, Vector2.new(var65.X, var65.Y))
			var65 = var67
		end
	end
	table.insert(t_2, Vector2.new(var65.X, var65.Y))
	
	if #t_2 == 1 then
		return {}
	end
	table.insert(t, t_2[1])
	table.insert(t, t_2[2])
	
	for i_1 = 3, #t_2 do
		local var68 = t_2[i_1]
	end
	return t
end

function projectVertices(p26, p27, p28) --[[ line: 287 ]]
	local var72 = 1e999
	local var73 = -1e999
	
	for i, v in ipairs(p26) do
		local var74 = (v * p28):Dot(p27)
		
		if var74 < var72 then
			var72 = var74
		end
		if var73 < var74 then
			var73 = var74
		end
	end
	return var72, var73
end

function projectCircle(p29, p30, p31) --[[ line: 307 ]]
	local var75 = p31.Unit * p30
	local var76 = (p29 + var75):Dot(p31)
	local var77 = (p29 - var75):Dot(p31)
	
	if var77 < var76 then
		local var78 = var76
		var76 = var77
		var77 = var78
	end
	return var76, var77
end

function getClosestPoint(p32, p33, p34) --[[ line: 326 ]]
	local var79 = -1
	local var80 = 1e999
	
	for i, v in ipairs(p33) do
		v *= p34
		local squareRoot = math.sqrt(math.pow(v.X - p32.X, 2) + math.pow(v.Y - p32.Y, 2))
		
		if squareRoot < var80 then
			var80 = squareRoot
			var79 = i
		end
	end
	return var79
end

function intersectCirclePolygon(p35, p36, p37, p38) --[[ line: 340 ]]
	for i, v in ipairs(p37) do
		local var87 = p37[i % #p37 + 1] * p38 - p37[i] * p38
		local unit = Vector2.new(var87.Y, -var87.X).Unit
		local var88, var89 = projectVertices(p37, unit, p38)
		local var90, var91 = projectCircle(p35, p36, unit)
		
		if var91 <= var88 or var89 <= var90 then
			return false
		end
	end
	local var82 = getClosestPoint(p35, p37, p38)
	
	if var82 == -1 then
		return false
	end
	local unit = (p37[var82] - p35).Unit
	local var83, var84 = projectVertices(p37, unit, p38)
	local var85, var86 = projectCircle(p35, p36, unit)
	
	return var86 <= var83 or var84 <= var85
end

function intersectCircleBox(p39, p40, p41, p42, _) --[[ line: 371 ]]
	local x = p39.X
	local y = p39.Y
	local var92 = x
	local var93 = y
	local x_1 = p41.X
	local y_1 = p41.Y
	local var94 = p42.X - p41.X
	local var95 = p42.Y - p41.Y
	
	if x < x_1 then
		var92 = x_1
	elseif x_1 + var94 < x then
		var92 = x_1 + var94
	end
	if y < y_1 then
		var93 = y_1
	elseif y_1 + var95 < y then
		var93 = y_1 + var95
	end
	local var96 = x - var92
	local var97 = y - var93
	
	return math.sqrt(var96 * var96 + var97 * var97) <= p40
end

return t