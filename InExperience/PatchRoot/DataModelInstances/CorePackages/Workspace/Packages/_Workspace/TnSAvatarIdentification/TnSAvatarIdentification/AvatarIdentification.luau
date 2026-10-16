local TnSAvatarIdentification = script:FindFirstAncestor("TnSAvatarIdentification")
local Players = game:GetService("Players")
local Parent = TnSAvatarIdentification.Parent
local GetFFlagGetHumanoidDescriptionUpdatesV2EFunction = require(Parent.SharedFlags).GetFFlagGetHumanoidDescriptionUpdatesV2E
local GetHumanoidDescriptionModule = require(Parent.GetHumanoidDescription)
local IdentificationUtilsModule = require(script.Parent.IdentificationUtils)
local v1 = require(TnSAvatarIdentification.Flags.GetFIntReportAnythingAvatarIdentificationCloseDiscardDistanceHundredths)() / 100
local v2 = require(TnSAvatarIdentification.Flags.GetFIntReportAnythingAvatarIdentificationOffScreenDiscardDistancePercent)() / 100
local v3 = require(TnSAvatarIdentification.Flags.GetFIntReportAnythingAvatarIdentificationDiscardFractionSkipThresholdPercent)() / 100

function getBBCorners(CF, Vector) --[[ Line: 28 ]]
	local Buffer = table.create(8)
	local XVector = CF.XVector
	local YVector = CF.YVector
	local ZVector = CF.ZVector
	local Count = 1
	
	for i = -0.5, 0.5 do
		local ScaledXVector = XVector * i * Vector.X
		
		for i1 = -0.5, 0.5 do
			local ScaledYVector = YVector * i1 * Vector.Y
			
			for i2 = -0.5, 0.5 do
				Buffer[Count] = CF.Position + ScaledXVector + ScaledYVector + ZVector * i2 * Vector.Z
				Count += 1
			end
		end
	end
	return Buffer
end

local v4 = v2 + 1
local Negated = -v2

local function _(Vector): boolean --[[ Line: 52 ]]
	-- upvalues: v4 (copy), Negated (copy)
	return v4 < Vector.Y or (Vector.Y < Negated or (v4 < Vector.X or Vector.X < Negated))
end

local config = {
	total = 0,
	offScreenDiscardCount = 0,
	tooCloseDiscardCount = 0,
	wasSkipped = false
}

function getCoveringPolygon(List, p1, p2) --[[ Line: 73 ]]
	-- upvalues: config (copy), IdentificationUtilsModule (copy), v1 (copy), v4 (copy), Negated (copy), v3 (copy)
	if #List == 0 then
		return {}, config
	end
	local List1 = {}
	
	for _, value in ipairs(List) do
		local Target = value.target
		
		for _, value1 in getBBCorners(Target.ExtentsCFrame, Target.ExtentsSize) do
			table.insert(List1, value1)
		end
	end
	local Vectors = {}
	local TooCloseDiscardCount = 0
	local OffScreenDiscardCount = 0
	assert(p2, "getCoveringPolygon requires viewportInfo")
	
	for _, value2 in ipairs(List1) do
		local WorldToFullViewportPointNormalizedResult, WorldToFullViewportPointNormalizedResult2, _ = IdentificationUtilsModule.worldToFullViewportPointNormalized(value2, p1, p2)
		
		if WorldToFullViewportPointNormalizedResult2 < v1 then
			TooCloseDiscardCount += 1
		elseif v4 < WorldToFullViewportPointNormalizedResult.Y or (WorldToFullViewportPointNormalizedResult.Y < Negated or (v4 < WorldToFullViewportPointNormalizedResult.X or WorldToFullViewportPointNormalizedResult.X < Negated)) then
			OffScreenDiscardCount += 1
		else
			Vectors[#Vectors + 1] = WorldToFullViewportPointNormalizedResult
		end
	end
	local config1 = {
		wasSkipped = false,
		total = #List1,
		offScreenDiscardCount = OffScreenDiscardCount,
		tooCloseDiscardCount = TooCloseDiscardCount
	}
	
	if v3 < (TooCloseDiscardCount + OffScreenDiscardCount) / #List1 then
		config1.wasSkipped = true
		
		return {}, config1
	else
		return getConvexHull(Vectors), config1
	end
end

function getDistanceAlongCamLookVector(p3, p4) --[[ Line: 128 ]]
	local _CFrame = p4.CFrame
	
	return ((p3.Position - _CFrame.Position):Dot(_CFrame.LookVector))
end

function getVisibleParts(p3, Player, FilterDescendantsInstances) --[[ Line: 141 ]]
	local Position = p3.CFrame.Position
	local Character = Player.Character
	
	if not Character or not Character.Parent then
		return 0, {}
	end
	local Children = Character:GetChildren()
	local RaycastParams1 = RaycastParams.new()
	RaycastParams1.FilterType = Enum.RaycastFilterType.Exclude
	RaycastParams1.FilterDescendantsInstances = FilterDescendantsInstances
	RaycastParams1.IgnoreWater = true
	local Count = 0
	local List = {}
	
	for _, Part in ipairs(Children) do
		if Part:IsA("BasePart") then
			Count += 1
			local RaycastResult = workspace:Raycast(Position, Part.CFrame.Position - Position, RaycastParams1)
			
			if RaycastResult and RaycastResult.Instance:IsDescendantOf(Character) then
				table.insert(List, { result = RaycastResult, target = Part })
			end
		end
	end
	return Count, List
end

local _ = function(p4, p5, p6) --[[ Line: 182 | Named "counterclockwise" ]]
	return (p5 - p4):Cross(p6 - p5)
end

function getConvexHull(Entry) --[[ Line: 186 ]]
	if #Entry <= 2 then
		return {}
	end
	local List = {}
	local Entry1 = Entry[1]
	local List1 = {}
	
	for i = 2, #Entry do
		local Entry2 = Entry[i]
		
		if Entry2.Y < Entry1.Y or Entry2.Y == Entry1.Y and Entry2.X < Entry1.X then
			Entry1 = Entry2
		end
	end
	table.insert(List, Entry1)
	
	local function _(p4): number --[[ Line: 203 | Named "angleFromLowest" ]]
		-- upvalues: Entry1 (ref)
		local Vector = p4 - Entry1
		
		return (math.atan2(Vector.Y, Vector.X))
	end
	
	for _, Vector in ipairs(Entry) do
		if Vector ~= Entry1 then
			local VectorDelta = Vector - Entry1
			table.insert(List1, (Vector3.new(Vector.X, Vector.Y, (math.atan2(VectorDelta.Y, VectorDelta.X)))))
		end
	end
	table.sort(List1, function(A, B): boolean --[[ Line: 215 | Named "compareByAngle" ]]
		-- upvalues: Entry1 (ref)
		return if A.Z == B.Z then (Vector2.new(A.X, A.Y) - Entry1).Magnitude < (Vector2.new(B.X, B.Y) - Entry1).Magnitude else A.Z < B.Z
	end)
	local List2 = {}
	local Entry3 = List1[1]
	
	for i1 = 2, #List1 do
		local Entry4 = List1[i1]
		
		if Entry3.Z == Entry4.Z then
			Entry3 = Entry4
		else
			table.insert(List2, Vector2.new(Entry3.X, Entry3.Y))
			Entry3 = Entry4
		end
	end
	table.insert(List2, Vector2.new(Entry3.X, Entry3.Y))
	
	if #List2 == 1 then
		return {}
	end
	table.insert(List, List2[1])
	table.insert(List, List2[2])
	
	for i2 = 3, #List2 do
		local Entry5 = List2[i2]
		while #List > 1 do
			local Entry6 = List[#List]
			
			if (Entry6 - List[#List - 1]):Cross(Entry5 - Entry6) > 0 then break end
			table.remove(List)
		end
		table.insert(List, Entry5)
	end
	return List
end

function projectVertices(List, p4, p5) --[[ Line: 287 ]]
	local v5 = 1e999
	local v6 = -1e999
	
	for _, value in ipairs(List) do
		local DotProduct = (value * p5):Dot(p4)
		
		if DotProduct < v5 then
			v5 = DotProduct
		end
		if v6 < DotProduct then
			v6 = DotProduct
		end
	end
	return v5, v6
end

function projectCircle(p6, p7, Direction) --[[ Line: 307 ]]
	local ScaledUnit = Direction.Unit * p7
	local DotProduct = (p6 + ScaledUnit):Dot(Direction)
	local DotProduct1 = (p6 - ScaledUnit):Dot(Direction)
	
	if DotProduct1 < DotProduct then
		local DotProduct2 = DotProduct
		DotProduct = DotProduct1
		DotProduct1 = DotProduct2
	end
	return DotProduct, DotProduct1
end

function getClosestPoint(Vector, List, p6): number --[[ Line: 326 ]]
	local v7 = -1
	local v8 = 1e999
	
	for i, value in ipairs(List) do
		local Vector1 = value * p6
		local SquareRoot = math.sqrt(math.pow(Vector1.X - Vector.X, 2) + math.pow(Vector1.Y - Vector.Y, 2))
		
		if SquareRoot < v8 then
			v8 = SquareRoot
			v7 = i
		end
	end
	return v7
end

function intersectCirclePolygon(p7, p8, List, p9): boolean --[[ Line: 340 ]]
	for i, _ in ipairs(List) do
		local EntryDelta = List[i % #List + 1] * p9 - List[i] * p9
		local Direction = Vector2.new(EntryDelta.Y, -EntryDelta.X).Unit
		local ProjectVerticesResult, ProjectVerticesResult2 = projectVertices(List, Direction, p9)
		local ProjectCircleResult, ProjectCircleResult2 = projectCircle(p7, p8, Direction)
		
		if ProjectCircleResult2 <= ProjectVerticesResult or ProjectVerticesResult2 <= ProjectCircleResult then
			return false
		end
	end
	local ClosestPoint = getClosestPoint(p7, List, p9)
	
	if ClosestPoint == -1 then
		return false
	else
		local Direction = (List[ClosestPoint] - p7).Unit
		local ProjectVerticesResult1, ProjectVerticesResult2_1 = projectVertices(List, Direction, p9)
		local ProjectCircleResult1, ProjectCircleResult2_1 = projectCircle(p7, p8, Direction)
		
		return ProjectCircleResult2_1 > ProjectVerticesResult1 and ProjectVerticesResult2_1 > ProjectCircleResult1
	end
end

function intersectCircleBox(Vector, p10, Vector1, Vector4, _): boolean --[[ Line: 371 ]]
	local X = Vector.X
	local Y = Vector.Y
	local X1 = X
	local Y1 = Y
	local X2 = Vector1.X
	local Y2 = Vector1.Y
	local XDelta = Vector4.X - Vector1.X
	local YDelta = Vector4.Y - Vector1.Y
	
	if X < X2 then
		X1 = X2
	elseif X2 + XDelta < X then
		X1 = X2 + XDelta
	end
	if Y < Y2 then
		Y1 = Y2
	elseif Y2 + YDelta < Y then
		Y1 = Y2 + YDelta
	end
	local XDelta1 = X - X1
	local YDelta1 = Y - Y1
	
	return math.sqrt(XDelta1 * XDelta1 + YDelta1 * YDelta1) <= p10
end

return {
	getAvatarsForRegion = function(List, p10, p11, p12, p13) --[[ Line: 410 ]]
		local Players = {}
		local v9 = p13 < p12
		local X = if v9 then p12 / p13 else p13 / p12
		local _Vector2: Vector2 = if v9 then Vector2.new(X, 1) else Vector2.new(1, X)
		for _, value in pairs(List) do
			if intersectCircleBox(p10 * _Vector2, p11 * X, value.boundingBox.min * _Vector2, value.boundingBox.max * _Vector2, _Vector2) and #value.convexHull >= 3 and intersectCirclePolygon(p10 * _Vector2, p11 * X, value.convexHull, _Vector2) then
				Players[value.player.UserId] = value.player
			end
		end
		return Players
	end,
	getAvatarsForPoint = function(List, Vector) --[[ Line: 457 ]]
		local Players = {}
		
		for _, value in pairs(List) do
			local BoundingBox = value.boundingBox
			local IsXBelow: boolean = Vector.X < BoundingBox.min.X or Vector.Y < BoundingBox.min.Y or BoundingBox.max.X < Vector.X or BoundingBox.max.Y < Vector.Y
			local ConvexHull = nil
			
			if not IsXBelow then
				ConvexHull = value.convexHull
				IsXBelow = #ConvexHull < 3
			end
			if not IsXBelow then
				local ConvexHullEntry = ConvexHull[#ConvexHull]
				local v10 = true
				local v11 = true
				
				for _, value1 in ipairs(ConvexHull) do
					local CrossProduct: number = (value1 - ConvexHullEntry):Cross(Vector - ConvexHullEntry)
					v11 = v11 and CrossProduct <= 0
					v10 = v10 and CrossProduct >= 0
					ConvexHullEntry = value1
				end
				if v10 or v11 then
					Players[value.player.UserId] = value.player
				end
			end
		end
		return Players
	end,
	getVisibleAvatars = function(p14, p15) --[[ Line: 494 ]]
		-- upvalues: Players (copy), IdentificationUtilsModule (copy), GetFFlagGetHumanoidDescriptionUpdatesV2EFunction (copy), GetHumanoidDescriptionModule (copy)
		local Players1 = Players:GetPlayers()
		local config = { totalPlayers = 0, checkedPlayers = 0, duration = 0 }
		local CurrentCamera = workspace.CurrentCamera
		
		if not CurrentCamera then
			return {}, config
		end
		local LocalPlayer = Players.LocalPlayer
		
		if not LocalPlayer then
			return {}, config
		end
		local Character = LocalPlayer.Character
		local LocalCharacterPosition = nil
		local Characters = {}
		
		if Character then
			LocalCharacterPosition = IdentificationUtilsModule.getLocalCharacterPosition(Character) or CurrentCamera.CFrame.Position
			
			if IdentificationUtilsModule.shouldIgnoreLocalCharacter(Character) then
				Characters[#Characters + 1] = Character
			end
		else
			LocalCharacterPosition = CurrentCamera.CFrame.Position
		end
		local ViewportInfo = IdentificationUtilsModule.getViewportInfo()
		config.viewportInfo = ViewportInfo
		local t = {}
		local ClockTime = os.clock()
		config.totalPlayers = #Players1 - 1
		
		local function _() --[[ Line: 535 ]]
			-- upvalues: config (copy), ClockTime (copy)
			config.duration = os.clock() - ClockTime
			
			return config
		end
		
		local _ = function(): boolean --[[ Line: 539 ]]
			-- upvalues: p15 (copy), ClockTime (copy)
			return (if p15 then p15 else 0.5) < os.clock() - ClockTime
		end
		
		if LocalCharacterPosition then
			table.sort(Players1, function(A: Player, B: Player): boolean --[[ Line: 546 ]]
				-- upvalues: LocalCharacterPosition (ref)
				return A:DistanceFromCharacter(LocalCharacterPosition) < B:DistanceFromCharacter(LocalCharacterPosition)
			end)
		end
		for _, Player in ipairs(Players1) do
			if (Player ~= LocalPlayer or p14) and Player.Character then
				if (p15 or 0.5) < os.clock() - ClockTime then
					config.duration = os.clock() - ClockTime
					
					return t, config
				end
				local BoundingCFrame, BoundingSize = Player.Character:GetBoundingBox()
				local Distance = (BoundingCFrame.Position - LocalCharacterPosition).Magnitude
				
				if getDistanceAlongCamLookVector(BoundingCFrame, CurrentCamera) < 0 then
					config.checkedPlayers += 1
				else
					local ViewportCorners, ViewportCorners2 = IdentificationUtilsModule.getViewportCorners(getBBCorners(BoundingCFrame, BoundingSize), CurrentCamera, ViewportInfo)
					
					if ViewportCorners2.X == 0 or ViewportCorners2.Y == 0 then
						config.checkedPlayers += 1
					else
						local VisibleParts, VisibleParts2 = getVisibleParts(CurrentCamera, Player, Characters)
						
						if (p15 or 0.5) < os.clock() - ClockTime then
							config.duration = os.clock() - ClockTime
							
							return t, config
						end
						local HitRate = #VisibleParts2 / VisibleParts
						local CoveringPolygon, CoveringPolygon2 = getCoveringPolygon(VisibleParts2, CurrentCamera, ViewportInfo)
						local HumanoidDescription = nil
						local HumanoidDescriptionStatus = nil
						
						if GetFFlagGetHumanoidDescriptionUpdatesV2EFunction() then
							HumanoidDescription, HumanoidDescriptionStatus = GetHumanoidDescriptionModule.getHumanoidDescription(Player.UserId)
						end
						t[Player.UserId] = {
							player = Player,
							distance = Distance,
							boundingBox = { min = ViewportCorners, max = ViewportCorners2 },
							hitRate = HitRate,
							convexHull = CoveringPolygon,
							pointProcessingStats = CoveringPolygon2,
							humanoidDescription = HumanoidDescription,
							humanoidDescriptionStatus = HumanoidDescriptionStatus
						}
						config.checkedPlayers += 1
					end
				end
			end
		end
		config.duration = os.clock() - ClockTime
		
		return t, config
	end
}