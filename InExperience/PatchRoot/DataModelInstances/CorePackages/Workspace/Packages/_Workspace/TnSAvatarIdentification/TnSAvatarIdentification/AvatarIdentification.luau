local tnSAvatarIdentification = script:FindFirstAncestor("TnSAvatarIdentification")
local getFIntReportAnythingAvatarIdentificationCloseDiscardDistanceHundredthsModule = require(tnSAvatarIdentification.Flags.GetFIntReportAnythingAvatarIdentificationCloseDiscardDistanceHundredths)
local getFIntReportAnythingAvatarIdentificationDiscardFractionSkipThresholdPercentModule = require(tnSAvatarIdentification.Flags.GetFIntReportAnythingAvatarIdentificationDiscardFractionSkipThresholdPercent)
local getFIntReportAnythingAvatarIdentificationOffScreenDiscardDistancePercentModule = require(tnSAvatarIdentification.Flags.GetFIntReportAnythingAvatarIdentificationOffScreenDiscardDistancePercent)
local playersService = game:GetService("Players")
local parent = tnSAvatarIdentification.Parent
local getFFlagGetHumanoidDescriptionUpdatesV2E = require(parent.SharedFlags).GetFFlagGetHumanoidDescriptionUpdatesV2E
local getHumanoidDescriptionModule = require(parent.GetHumanoidDescription)
local identificationUtilsModule = require(script.Parent.IdentificationUtils)
local var1 = getFIntReportAnythingAvatarIdentificationCloseDiscardDistanceHundredthsModule() / 100
local var2 = getFIntReportAnythingAvatarIdentificationOffScreenDiscardDistancePercentModule() / 100
local var3 = getFIntReportAnythingAvatarIdentificationDiscardFractionSkipThresholdPercentModule() / 100
local t = {
	getAvatarsForRegion = function(p1, p2, p3, p4, p5)
		local t = {}
		local var4 = p5 < p4
		local var5 = if var4 then p4 / p5 else p5 / p4
		local var6 = if var4 then Vector2.new(var5, 1) else Vector2.new(1, var5)
		
		for i, v in pairs(p1) do
			if intersectCircleBox(p2 * var6, p3 * var5, v.boundingBox.min * var6, v.boundingBox.max * var6, var6) and #v.convexHull >= 3 and intersectCirclePolygon(p2 * var6, p3 * var5, v.convexHull, var6) then
				t[v.player.UserId] = v.player
			end
		end
		return t
	end,
	getAvatarsForPoint = function(p6, p7)
		local t = {}
		
		for i, v in pairs(p6) do
			local boundingBox = v.boundingBox
			
			if p7.X >= boundingBox.min.X and p7.Y >= boundingBox.min.Y and (boundingBox.max.X >= p7.X and boundingBox.max.Y >= p7.Y) then
				local convexHull = v.convexHull
				
				if #convexHull >= 3 then
					local var7 = convexHull[#convexHull]
					local var8 = true
					local var9 = true
					
					for i_1, v_1 in ipairs(convexHull) do
						local var10 = (v_1 - var7):Cross(p7 - var7)
						var9 = var9 and var10 <= 0
						var8 = var8 and var10 >= 0
						var7 = v_1
					end
					if var8 or var9 then
						t[v.player.UserId] = v.player
					end
				end
			end
		end
		return t
	end,
	getVisibleAvatars = function(p8, p9)
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
		local var11
		local character = localPlayer.Character
		local _ = nil
		local var12 = nil
		local t_1 = {}
		
		if character then
			var11 = identificationUtilsModule.getLocalCharacterPosition(character) or currentCamera.CFrame.Position
			
			if identificationUtilsModule.shouldIgnoreLocalCharacter(character) then
				t_1[#t_1 + 1] = character
			end
		else
			var11 = currentCamera.CFrame.Position
			var12 = false
		end
		local viewportInfo = identificationUtilsModule.getViewportInfo()
		t.viewportInfo = viewportInfo
		local t_2 = {}
		local processTime = os.clock()
		t.totalPlayers = #players - 1
		
		local _ = function()
			-- upvalues: t (ref), processTime (ref)
			t.duration = os.clock() - processTime
			
			return t
		end
		
		local _ = function()
			-- upvalues: p9 (ref), processTime (ref)
			return (p9 or 0.5) < os.clock() - processTime
		end
		
		if var11 then
			table.sort(players, function(p10, p11)
				-- upvalues: var11 (write)
				return p10:DistanceFromCharacter(var11) < p11:DistanceFromCharacter(var11)
			end)
		end
		for i, v in ipairs(players) do
			if (v ~= localPlayer or p8) and v.Character then
				if (p9 or 0.5) >= os.clock() - processTime then
					local boundingBox, boundingBox_1 = v.Character:GetBoundingBox()
					local magnitude = (boundingBox.Position - var11).Magnitude
					
					if getDistanceAlongCamLookVector(boundingBox, currentCamera) < 0 then
						t.checkedPlayers += 1
					else
						local viewportCorners, viewportCorners_1 = identificationUtilsModule.getViewportCorners(getBBCorners(boundingBox, boundingBox_1), currentCamera, viewportInfo)
						
						if viewportCorners_1.X == 0 or viewportCorners_1.Y == 0 then
							t.checkedPlayers += 1
						else
							local var13, var14 = getVisibleParts(currentCamera, v, t_1)
							
							if (p9 or 0.5) >= os.clock() - processTime then
								local var15 = #var14 / var13
								local var16, var17 = getCoveringPolygon(var14, currentCamera, viewportInfo)
								local var18 = nil
								local var19 = nil
								
								if getFFlagGetHumanoidDescriptionUpdatesV2E() then
									local humanoidDescription, humanoidDescription_1 = getHumanoidDescriptionModule.getHumanoidDescription(v.UserId)
									var18 = humanoidDescription
									var19 = humanoidDescription_1
								end
								t_2[v.UserId] = {
									player = v,
									distance = magnitude,
									boundingBox = { min = viewportCorners, max = viewportCorners_1 },
									hitRate = var15,
									convexHull = var16,
									pointProcessingStats = var17,
									humanoidDescription = var18,
									humanoidDescriptionStatus = var19
								}
								t.checkedPlayers += 1
							end
							local var20 = t_2
							t.duration = os.clock() - processTime
							
							return var20, t
						end
					end
				end
				local var21 = t_2
				t.duration = os.clock() - processTime
				
				return var21, t
			end
		end
		t.duration = os.clock() - processTime
		
		return t_2, t
	end
}

function getBBCorners(p10, p11)
	local list = table.create(8)
	local xVector = p10.XVector
	local yVector = p10.YVector
	local zVector = p10.ZVector
	local var22 = 1
	
	for i_2 = -0.5, 0.5 do
		local var23 = xVector * i_2 * p11.X
		
		for i_1 = -0.5, 0.5 do
			local var24 = yVector * i_1 * p11.Y
			
			for i = -0.5, 0.5 do
				list[var22] = p10.Position + var23 + var24 + zVector * i * p11.Z
				var22 += 1
			end
		end
	end
	return list
end

local var25 = var2 + 1
local var26 = -var2

local _ = function(p12)
	-- upvalues: var25 (ref), var26 (ref)
	return if var25 >= p12.Y then if p12.Y >= var26 then if var25 >= p12.X then p12.X < var26 else true else true else true
end

local t_1 = {
	total = 0,
	offScreenDiscardCount = 0,
	tooCloseDiscardCount = 0,
	wasSkipped = false
}

function getCoveringPolygon(p12, p13, p14)
	-- upvalues: t_1 (ref), identificationUtilsModule (ref), var1 (ref), var25 (ref), var26 (ref), var3 (ref)
	if #p12 == 0 then
		return {}, t_1
	end
	local t = {}
	
	for i, v in ipairs(p12) do
		local target = v.target
		
		for i_1, v_1 in getBBCorners(target.ExtentsCFrame, target.ExtentsSize) do
			table.insert(t, v_1)
		end
	end
	local t_2 = {}
	local var27 = 0
	local var28 = 0
	assert(p14, "getCoveringPolygon requires viewportInfo")
	
	for i_1, v_1 in ipairs(t) do
		local var29, var30, _ = identificationUtilsModule.worldToFullViewportPointNormalized(v_1, p13, p14)
		
		if var30 < var1 then
			var27 += 1
			continue
		end
		if if var25 >= var29.Y then if var29.Y >= var26 then if var25 >= var29.X then var29.X < var26 else true else true else true then
			var28 += 1
		else
			t_2[#t_2 + 1] = var29
		end
	end
	local t_3 = {
		wasSkipped = false,
		total = #t,
		offScreenDiscardCount = var28,
		tooCloseDiscardCount = var27
	}
	
	if var3 < (var27 + var28) / #t then
		t_3.wasSkipped = true
		
		return {}, t_3
	end
	return getConvexHull(t_2), t_3
end

function getDistanceAlongCamLookVector(p15, p16)
	local cFrame = p16.CFrame
	
	return (p15.Position - cFrame.Position):Dot(cFrame.LookVector)
end

function getVisibleParts(p15, p16, p17)
	local position = p15.CFrame.Position
	local character = p16.Character
	
	if not character or not character.Parent then
		return 0, {}
	end
	local children = character:GetChildren()
	local raycastParams = RaycastParams.new()
	raycastParams.FilterType = Enum.RaycastFilterType.Exclude
	raycastParams.FilterDescendantsInstances = p17
	raycastParams.IgnoreWater = true
	local var31 = 0
	local t = {}
	
	for i, v in ipairs(children) do
		if v:IsA("BasePart") then
			var31 += 1
			local var32 = workspace:Raycast(position, v.CFrame.Position - position, raycastParams)
			
			if var32 and var32.Instance:IsDescendantOf(character) then
				table.insert(t, { result = var32, target = v })
			end
		end
	end
	return var31, t
end

local function _(p18, p19, p20)
	return (p19 - p18):Cross(p20 - p19)
end

function getConvexHull(p18)
	if #p18 <= 2 then
		return {}
	end
	local var33
	local t = {}
	local var34 = p18[1]
	local t_1 = {}
	
	for i = 2, #p18 do
		var33 = p18[i]
		
		if var33.Y < var34.Y or var33.Y == var34.Y and var33.X < var34.X then
			var34 = var33
		end
	end
	table.insert(t, var34)
	
	local function _(vectorA)
		-- upvalues: var34 (write)
		local var35 = vectorA - var34
		
		return math.atan2(var35.Y, var35.X)
	end
	
	for i_1, v in ipairs(p18) do
		if v ~= var34 then
			local var35 = v - var34
			table.insert(t_1, Vector3.new(v.X, v.Y, math.atan2(var35.Y, var35.X)))
		end
	end
	table.sort(t_1, function(vectorA, vectorB)
		-- upvalues: var34 (write)
		return if vectorA.Z == vectorB.Z then (Vector2.new(vectorA.X, vectorA.Y) - var34).Magnitude < (Vector2.new(vectorB.X, vectorB.Y) - var34).Magnitude else vectorA.Z < vectorB.Z
	end)
	local t_2 = {}
	var33 = t_1[1]
	
	for i_2 = 2, #t_1 do
		local var36 = t_1[i_2]
		
		if var33.Z == var36.Z then
			var33 = var36
		else
			table.insert(t_2, Vector2.new(var33.X, var33.Y))
			var33 = var36
		end
	end
	table.insert(t_2, Vector2.new(var33.X, var33.Y))
	
	if #t_2 == 1 then
		return {}
	end
	table.insert(t, t_2[1])
	table.insert(t, t_2[2])
	
	for i_1 = 3, #t_2 do
		local var37 = t_2[i_1]
	end
	return t
end

function projectVertices(p19, p20, p21)
	local var38 = 1e999
	local var39 = -1e999
	
	for i, v in ipairs(p19) do
		local var40 = (v * p21):Dot(p20)
		
		if var40 < var38 then
			var38 = var40
		end
		if var39 < var40 then
			var39 = var40
		end
	end
	return var38, var39
end

function projectCircle(p22, p23, p24)
	local var41 = p24.Unit * p23
	local var42 = (p22 + var41):Dot(p24)
	local var43 = (p22 - var41):Dot(p24)
	
	if var43 < var42 then
		local var44 = var42
		var42 = var43
		var43 = var44
	end
	return var42, var43
end

function getClosestPoint(p22, p23, p24)
	local var41 = -1
	local var42 = 1e999
	
	for i, v in ipairs(p23) do
		v *= p24
		local squareRoot = math.sqrt(math.pow(v.X - p22.X, 2) + math.pow(v.Y - p22.Y, 2))
		
		if squareRoot < var42 then
			var42 = squareRoot
			var41 = i
		end
	end
	return var41
end

function intersectCirclePolygon(p25, p26, p27, p28)
	for i, v in ipairs(p27) do
		local var43 = p27[i % #p27 + 1] * p28 - p27[i] * p28
		local unit = Vector2.new(var43.Y, -var43.X).Unit
		local var44, var45 = projectVertices(p27, unit, p28)
		local var46, var47 = projectCircle(p25, p26, unit)
		
		if var47 <= var44 or var45 <= var46 then
			return false
		end
	end
	local var48 = getClosestPoint(p25, p27, p28)
	
	if var48 == -1 then
		return false
	end
	local unit = (p27[var48] - p25).Unit
	local var49, var50 = projectVertices(p27, unit, p28)
	local var51, var52 = projectCircle(p25, p26, unit)
	
	return var52 <= var49 or var50 <= var51
end

function intersectCircleBox(p29, p30, p31, p32, _)
	local x = p29.X
	local y = p29.Y
	local var53 = x
	local var54 = y
	local x_1 = p31.X
	local y_1 = p31.Y
	local var55 = p32.X - p31.X
	local var56 = p32.Y - p31.Y
	
	if x < x_1 then
		var53 = x_1
	elseif x_1 + var55 < x then
		var53 = x_1 + var55
	end
	if y < y_1 then
		var54 = y_1
	elseif y_1 + var56 < y then
		var54 = y_1 + var56
	end
	local var57 = x - var53
	local var58 = y - var54
	
	return math.sqrt(var57 * var57 + var58 * var58) <= p30
end

return t