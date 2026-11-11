local TnSAvatarIdentification = script:FindFirstAncestor("TnSAvatarIdentification")
local Players = game:GetService("Players")
local Parent = TnSAvatarIdentification.Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local GetFFlagAvatarIdentificationSafeAreaFixFunction = SharedFlagsModule.GetFFlagAvatarIdentificationSafeAreaFix
local GetFFlagGetHumanoidDescriptionUpdatesV2EFunction = SharedFlagsModule.GetFFlagGetHumanoidDescriptionUpdatesV2E
local GetHumanoidDescriptionModule = require(Parent.GetHumanoidDescription)
local IdentificationUtilsModule = require(script.Parent.IdentificationUtils)
local v1 = require(TnSAvatarIdentification.Flags.GetFIntReportAnythingAvatarIdentificationCloseDiscardDistanceHundredths)() / 100
local v2 = require(TnSAvatarIdentification.Flags.GetFIntReportAnythingAvatarIdentificationOffScreenDiscardDistancePercent)() / 100
local v3 = require(TnSAvatarIdentification.Flags.GetFIntReportAnythingAvatarIdentificationDiscardFractionSkipThresholdPercent)() / 100

function getBBCorners(CF, Vector)
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

local function _(Vector): boolean
	-- upvalues: v4 (copy), Negated (copy)
	return v4 < Vector.Y or (Vector.Y < Negated or (v4 < Vector.X or Vector.X < Negated))
end

local config = {
	total = 0,
	offScreenDiscardCount = 0,
	tooCloseDiscardCount = 0,
	wasSkipped = false
}

function getCoveringPolygon(List, Camera: Camera, p1)
	-- upvalues: config (copy), GetFFlagAvatarIdentificationSafeAreaFixFunction (copy), IdentificationUtilsModule (copy), v1 (copy), v4 (copy), Negated (copy), v3 (copy)
	if #List == 0 then
		return {}, config
	end
	local ViewportSize = Camera.ViewportSize
	local List1 = {}
	
	for _, value in ipairs(List) do
		local Target = value.target
		
		for _, value1 in getBBCorners(Target.ExtentsCFrame, Target.ExtentsSize) do
			table.insert(List1, value1)
		end
	end
	local VectorRatios = {}
	local Count = 0
	local Count1 = 0
	
	if GetFFlagAvatarIdentificationSafeAreaFixFunction() then
		assert(p1, "getCoveringPolygon requires viewportInfo when FFlagAvatarIdentificationSafeAreaFix is enabled")
		
		for _, value2 in ipairs(List1) do
			local WorldToFullViewportPointNormalizedResult, WorldToFullViewportPointNormalizedResult2, _ = IdentificationUtilsModule.worldToFullViewportPointNormalized(value2, Camera, p1)
			
			if WorldToFullViewportPointNormalizedResult2 < v1 then
				Count += 1
			elseif v4 < WorldToFullViewportPointNormalizedResult.Y or (WorldToFullViewportPointNormalizedResult.Y < Negated or (v4 < WorldToFullViewportPointNormalizedResult.X or WorldToFullViewportPointNormalizedResult.X < Negated)) then
				Count1 += 1
			else
				VectorRatios[#VectorRatios + 1] = WorldToFullViewportPointNormalizedResult
			end
		end
	else
		for _, Position in ipairs(List1) do
			local ViewportPosition, _ = Camera:WorldToViewportPoint(Position)
			local VectorRatio = Vector2.new(ViewportPosition.X, ViewportPosition.Y) / ViewportSize
			
			if ViewportPosition.Z < v1 then
				Count += 1
			elseif v4 < VectorRatio.Y or (VectorRatio.Y < Negated or (v4 < VectorRatio.X or VectorRatio.X < Negated)) then
				Count1 += 1
			else
				VectorRatios[#VectorRatios + 1] = VectorRatio
			end
		end
	end
	local config1 = {
		wasSkipped = false,
		total = #List1,
		offScreenDiscardCount = Count1,
		tooCloseDiscardCount = Count
	}
	
	if v3 < (Count + Count1) / #List1 then
		config1.wasSkipped = true
		
		return {}, config1
	else
		return getConvexHull(VectorRatios), config1
	end
end

function getDistanceAlongCamLookVector(p2, p3)
	local _CFrame = p3.CFrame
	
	return ((p2.Position - _CFrame.Position):Dot(_CFrame.LookVector))
end

function getVisibleParts(p2, Player, FilterDescendantsInstances)
	local Position = p2.CFrame.Position
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

local _ = function(p3, p4, p5)
	return (p4 - p3):Cross(p5 - p4)
end

function getConvexHull(Entry)
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
	
	local function _(p3): number
		-- upvalues: Entry1 (ref)
		local Vector = p3 - Entry1
		
		return (math.atan2(Vector.Y, Vector.X))
	end
	
	for _, Vector in ipairs(Entry) do
		if Vector ~= Entry1 then
			local VectorDelta = Vector - Entry1
			table.insert(List1, (Vector3.new(Vector.X, Vector.Y, (math.atan2(VectorDelta.Y, VectorDelta.X)))))
		end
	end
	table.sort(List1, function(A, B): boolean
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

function projectVertices(List, p3, p4)
	local v5 = 1e999
	local v6 = -1e999
	
	for _, value in ipairs(List) do
		local DotProduct = (value * p4):Dot(p3)
		
		if DotProduct < v5 then
			v5 = DotProduct
		end
		if v6 < DotProduct then
			v6 = DotProduct
		end
	end
	return v5, v6
end

function projectCircle(p5, p6, Direction)
	local ScaledUnit = Direction.Unit * p6
	local DotProduct = (p5 + ScaledUnit):Dot(Direction)
	local DotProduct1 = (p5 - ScaledUnit):Dot(Direction)
	
	if DotProduct1 < DotProduct then
		local DotProduct2 = DotProduct
		DotProduct = DotProduct1
		DotProduct1 = DotProduct2
	end
	return DotProduct, DotProduct1
end

function getClosestPoint(Vector, List, p5): number
	local v7 = -1
	local v8 = 1e999
	
	for i, value in ipairs(List) do
		local Vector1 = value * p5
		local SquareRoot = math.sqrt(math.pow(Vector1.X - Vector.X, 2) + math.pow(Vector1.Y - Vector.Y, 2))
		
		if SquareRoot < v8 then
			v8 = SquareRoot
			v7 = i
		end
	end
	return v7
end

function intersectCirclePolygon(p6, p7, List, p8): boolean
	for i, _ in ipairs(List) do
		local EntryDelta = List[i % #List + 1] * p8 - List[i] * p8
		local Direction = Vector2.new(EntryDelta.Y, -EntryDelta.X).Unit
		local ProjectVerticesResult, ProjectVerticesResult2 = projectVertices(List, Direction, p8)
		local ProjectCircleResult, ProjectCircleResult2 = projectCircle(p6, p7, Direction)
		
		if ProjectCircleResult2 <= ProjectVerticesResult or ProjectVerticesResult2 <= ProjectCircleResult then
			return false
		end
	end
	local ClosestPoint = getClosestPoint(p6, List, p8)
	
	if ClosestPoint == -1 then
		return false
	else
		local Direction = (List[ClosestPoint] - p6).Unit
		local ProjectVerticesResult1, ProjectVerticesResult2_1 = projectVertices(List, Direction, p8)
		local ProjectCircleResult1, ProjectCircleResult2_1 = projectCircle(p6, p7, Direction)
		
		return ProjectCircleResult2_1 > ProjectVerticesResult1 and ProjectVerticesResult2_1 > ProjectCircleResult1
	end
end

function intersectCircleBox(Vector, p9, Vector1, Vector4, _): boolean
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
	
	return math.sqrt(XDelta1 * XDelta1 + YDelta1 * YDelta1) <= p9
end

return {
	getAvatarsForRegion = function(List, p9, p10, p11, p12)
		local Players = {}
		local v9 = p12 < p11
		local X = if v9 then p11 / p12 else p12 / p11
		local _Vector2: Vector2 = if v9 then Vector2.new(X, 1) else Vector2.new(1, X)
		for _, value in pairs(List) do
			if intersectCircleBox(p9 * _Vector2, p10 * X, value.boundingBox.min * _Vector2, value.boundingBox.max * _Vector2, _Vector2) and #value.convexHull >= 3 and intersectCirclePolygon(p9 * _Vector2, p10 * X, value.convexHull, _Vector2) then
				Players[value.player.UserId] = value.player
			end
		end
		return Players
	end,
	getAvatarsForPoint = function(List, Vector)
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
	getVisibleAvatars = function(p13, p14)
		-- upvalues: Players (copy), IdentificationUtilsModule (copy), GetFFlagAvatarIdentificationSafeAreaFixFunction (copy), GetFFlagGetHumanoidDescriptionUpdatesV2EFunction (copy), GetHumanoidDescriptionModule (copy)
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
		local ViewportInfo = nil
		
		if GetFFlagAvatarIdentificationSafeAreaFixFunction() then
			ViewportInfo = IdentificationUtilsModule.getViewportInfo()
			config.viewportInfo = ViewportInfo
		end
		local t = {}
		local ClockTime = os.clock()
		config.totalPlayers = #Players1 - 1
		
		local function _()
			-- upvalues: config (copy), ClockTime (copy)
			config.duration = os.clock() - ClockTime
			
			return config
		end
		
		local _ = function(): boolean
			-- upvalues: p14 (copy), ClockTime (copy)
			return (if p14 then p14 else 0.5) < os.clock() - ClockTime
		end
		
		if LocalCharacterPosition then
			table.sort(Players1, function(A: Player, B: Player): boolean
				-- upvalues: LocalCharacterPosition (ref)
				return A:DistanceFromCharacter(LocalCharacterPosition) < B:DistanceFromCharacter(LocalCharacterPosition)
			end)
		end
		for _, Player in ipairs(Players1) do
			if (Player ~= LocalPlayer or p13) and Player.Character then
				if (p14 or 0.5) < os.clock() - ClockTime then
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
						
						if (p14 or 0.5) < os.clock() - ClockTime then
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