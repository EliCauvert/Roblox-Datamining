local _ = require(script.Parent.ViewportProjection)
local list = { 16, 44, 72 }

local function rectOverlapArea(Vector, Vector1, Gap): number
	return math.max(0, math.min(Vector.x + Vector.width + Gap, Vector1.x + Vector1.width + Gap) - math.max(Vector.x - Gap, Vector1.x - Gap)) * math.max(0, math.min(Vector.y + Vector.height + Gap, Vector1.y + Vector1.height + Gap) - math.max(Vector.y - Gap, Vector1.y - Gap))
end

local function _(p1, p2, Vector, p3): boolean
	return Vector.x - p3 <= p1 and (p1 <= Vector.x + Vector.width + p3 and Vector.y - p3 <= p2) and p2 <= Vector.y + Vector.height + p3
end

local _ = function(p1: number, p2: number, p3: number, p4: number)
	if p1 == 0 then
		return p2 > 0, p3, p4
	end
	local v1 = p2 / p1
	
	if p1 < 0 then
		p3 = math.max(p3, v1)
	else
		p4 = math.min(p4, v1)
	end
	return p3 < p4, p3, p4
end

local function segmentCrossesRect(AnchorX, AnchorY, AttachX, AttachY, Vector): boolean
	local AttachXDelta = AttachX - AnchorX
	local AttachYDelta = AttachY - AnchorY
	local Negated = -AttachXDelta
	local AnchorXDelta = AnchorX - Vector.x
	local Largest = 0
	local Smallest = 1
	local Largest1 = nil
	local IsAnchorXDeltaAbove = nil
	local Smallest1 = nil
	
	if Negated == 0 then
		IsAnchorXDeltaAbove = AnchorXDelta > 0
		Largest1 = Largest
		Smallest1 = Smallest
	else
		local AnchorXDeltaRatio = AnchorXDelta / Negated
		
		if Negated < 0 then
			Largest = math.max(Largest, AnchorXDeltaRatio)
		else
			Smallest = math.min(Smallest, AnchorXDeltaRatio)
		end
		IsAnchorXDeltaAbove = Largest < Smallest
		Largest1 = Largest
		Smallest1 = Smallest
	end
	if IsAnchorXDeltaAbove then
		local XDelta = Vector.x + Vector.width - AnchorX
		local Largest2: number = Largest1
		local Smallest2: number = Smallest1
		local IsXDeltaAbove = nil
		local Largest21 = nil
		local Smallest21 = nil
		
		if AttachXDelta == 0 then
			IsXDeltaAbove = XDelta > 0
			Largest21 = Largest2
			Smallest21 = Smallest2
		else
			local XDeltaRatio = XDelta / AttachXDelta
			
			if AttachXDelta < 0 then
				Largest2 = math.max(Largest2, XDeltaRatio)
			else
				Smallest2 = math.min(Smallest2, XDeltaRatio)
			end
			IsXDeltaAbove = Largest2 < Smallest2
			Largest21 = Largest2
			Smallest21 = Smallest2
		end
		IsAnchorXDeltaAbove = IsXDeltaAbove
		Largest1 = Largest21
		Smallest1 = Smallest21
	end
	if IsAnchorXDeltaAbove then
		local Negated1 = -AttachYDelta
		local AnchorYDelta = AnchorY - Vector.y
		local Largest3: number = Largest1
		local Smallest3: number = Smallest1
		local IsAnchorYDeltaAbove = nil
		local Largest31 = nil
		local Smallest31 = nil
		
		if Negated1 == 0 then
			IsAnchorYDeltaAbove = AnchorYDelta > 0
			Largest31 = Largest3
			Smallest31 = Smallest3
		else
			local AnchorYDeltaRatio = AnchorYDelta / Negated1
			
			if Negated1 < 0 then
				Largest3 = math.max(Largest3, AnchorYDeltaRatio)
			else
				Smallest3 = math.min(Smallest3, AnchorYDeltaRatio)
			end
			IsAnchorYDeltaAbove = Largest3 < Smallest3
			Largest31 = Largest3
			Smallest31 = Smallest3
		end
		IsAnchorXDeltaAbove = IsAnchorYDeltaAbove
		Largest1 = Largest31
		Smallest1 = Smallest31
	end
	if IsAnchorXDeltaAbove then
		local YDelta = Vector.y + Vector.height - AnchorY
		local Largest4: number = Largest1
		local Smallest4: number = Smallest1
		
		if AttachYDelta == 0 then
			return YDelta > 0
		end
		local YDeltaRatio = YDelta / AttachYDelta
		
		if AttachYDelta < 0 then
			Largest4 = math.max(Largest4, YDeltaRatio)
		else
			Smallest4 = math.min(Smallest4, YDeltaRatio)
		end
		IsAnchorXDeltaAbove = Largest4 < Smallest4
	end
	return IsAnchorXDeltaAbove
end

local _ = function(p1, p2, p3, p4, p5, p6): number
	local v1 = (p3 - p1) * (p6 - p2) - (p4 - p2) * (p5 - p1)
	
	return if v1 > 0 then 1 elseif v1 < 0 then -1 else 0
end

local function segmentsCross(AnchorX, AnchorY, AttachX, AttachY, AnchorX1, AnchorY1, AttachX1, AttachY1): boolean
	local v1 = false
	local AttachXDelta = (AttachX - AnchorX) * (AnchorY1 - AnchorY) - (AttachY - AnchorY) * (AnchorX1 - AnchorX)
	local AttachXDelta1 = (AttachX - AnchorX) * (AttachY1 - AnchorY) - (AttachY - AnchorY) * (AttachX1 - AnchorX)
	
	if (if AttachXDelta > 0 then 1 elseif AttachXDelta < 0 then -1 else 0) * (if AttachXDelta1 > 0 then 1 elseif AttachXDelta1 < 0 then -1 else 0) < 0 then
		local AttachXDelta2 = (AttachX1 - AnchorX1) * (AnchorY - AnchorY1) - (AttachY1 - AnchorY1) * (AnchorX - AnchorX1)
		local AttachXDelta21 = (AttachX1 - AnchorX1) * (AttachY - AnchorY1) - (AttachY1 - AnchorY1) * (AttachX - AnchorX1)
		v1 = (if AttachXDelta2 > 0 then 1 elseif AttachXDelta2 < 0 then -1 else 0) * (if AttachXDelta21 > 0 then 1 elseif AttachXDelta21 < 0 then -1 else 0) < 0
	end
	return v1
end

local function optionsFor(Vector, X, Y: number, Margin, XDelta)
	-- upvalues: list (copy)
	local List = {}
	
	for _, value in list do
		for _, DirectionX in { -1, 1 } do
			local NewX = if DirectionX > 0 then Vector.x + value * 0.4 else Vector.x - value * 0.4 - X
			table.insert(List, {
				key = `s{DirectionX}{value}`,
				directionX = DirectionX,
				x = if DirectionX > 0 then Vector.x + value else Vector.x - value - X,
				y = Vector.y - Y / 2
			})
			table.insert(List, {
				key = `u{DirectionX}{value}`,
				directionX = DirectionX,
				x = NewX,
				y = Vector.y - Y - value * 0.7
			})
			table.insert(List, {
				key = `d{DirectionX}{value}`,
				directionX = DirectionX,
				x = NewX,
				y = Vector.y + value * 0.7
			})
		end
	end
	table.insert(List, {
		key = "gl",
		directionX = -1,
		x = Margin,
		y = Vector.y - Y / 2
	})
	table.insert(List, {
		key = "gr",
		directionX = 1,
		x = XDelta,
		y = Vector.y - Y / 2
	})
	
	return List
end

return {
	findProblems = function(List, List1)
		-- upvalues: rectOverlapArea (copy), segmentsCross (copy), segmentCrossesRect (copy)
		local t = {}
		
		for _, value in List1 do
			t[value.id] = value
		end
		local t1 = {}
		
		for i, Vector in List do
			local Entry = t[Vector.id]
			local X = if Entry then Entry.x else Vector.anchorX
			local Y = if Entry then Entry.y else Vector.anchorY
			t1[i] = {
				anchorX = X,
				anchorY = Y,
				attachX = math.clamp(X, Vector.x, Vector.x + Vector.width),
				attachY = math.clamp(Y, Vector.y, Vector.y + Vector.height)
			}
		end
		local List2 = {}
		
		for i1, Vector1 in List do
			local Entry = t1[i1]
			
			for _, Vector2 in List1 do
				local v1: number = if Vector2.id == Vector1.id then 6 else 4
				local X = Vector2.x
				local Y = Vector2.y
				
				if Vector1.x - v1 <= X and (X <= Vector1.x + Vector1.width + v1 and (Vector1.y - v1 <= Y and Y <= Vector1.y + Vector1.height + v1)) then
					table.insert(List2, "coversPin")
				end
			end
			for i2 = i1 + 1, #List do
				local Entry1 = List[i2]
				local Entry2 = t1[i2]
				
				if rectOverlapArea(Vector1, Entry1, 0) > 0 then
					table.insert(List2, "overlap")
				end
				if segmentsCross(Entry.anchorX, Entry.anchorY, Entry.attachX, Entry.attachY, Entry2.anchorX, Entry2.anchorY, Entry2.attachX, Entry2.attachY) then
					table.insert(List2, "leadersCross")
				end
				if segmentCrossesRect(Entry.anchorX, Entry.anchorY, Entry.attachX, Entry.attachY, Entry1) or segmentCrossesRect(Entry2.anchorX, Entry2.anchorY, Entry2.attachX, Entry2.attachY, Vector1) then
					table.insert(List2, "leaderThroughCard")
				end
			end
		end
		return List2
	end,
	layout = function(Tbl, p1)
		-- upvalues: optionsFor (copy), rectOverlapArea (copy), segmentsCross (copy), segmentCrossesRect (copy)
		local Copy = table.clone(Tbl)
		table.sort(Copy, function(A, B): boolean
			-- upvalues: p1 (copy)
			local IsIdMatch = A.id == p1.focusId
			
			return if IsIdMatch == (B.id == p1.focusId) then if A.score == B.score then A.id < B.id else B.score < A.score else IsIdMatch
		end)
		local List = {}
		while p1.maxCount < #Copy do
			table.insert(List, 1, (table.remove(Copy)))
		end
		local X = p1.cardSize.X
		local Y = p1.cardSize.Y
		local Margin = p1.margin
		local XDelta = p1.viewportSize.X - p1.margin - X
		local Top = p1.top
		local YDelta = p1.viewportSize.Y - p1.bottom - Y
		local XRatio = p1.viewportSize.X / 2
		local Pins = p1.pins or {}
		
		local function place(Vector, List, Key)
			-- upvalues: optionsFor (upval), X (copy), Y (copy), Margin (copy), XDelta (copy), Top (copy), YDelta (copy), rectOverlapArea (upval), p1 (copy), segmentsCross (upval), segmentCrossesRect (upval), Pins (copy), XRatio (copy)
			local v2 = nil
			
			for _, Vector1 in optionsFor(Vector, X, Y, Margin, XDelta) do
				if not Key or Vector1.key == Key then
					local ClampedValue = math.clamp(Vector1.x, Margin, (math.max(Margin, XDelta)))
					local ClampedValue1 = math.clamp(Vector1.y, Top, (math.max(Top, YDelta)))
					local Vector2 = {
						x = ClampedValue,
						y = ClampedValue1,
						width = X,
						height = Y
					}
					local ClampedValue2 = math.clamp(Vector.x, ClampedValue, ClampedValue + X)
					local ClampedValue3 = math.clamp(Vector.y, ClampedValue1, ClampedValue1 + Y)
					local NewMagnitude = math.abs(ClampedValue - Vector1.x) + math.abs(ClampedValue1 - Vector1.y)
					local X1 = Vector.x
					local Y1 = Vector.y
					
					if Vector2.x - 6 <= X1 and (X1 <= Vector2.x + Vector2.width + 6 and (Vector2.y - 6 <= Y1 and Y1 <= Vector2.y + Vector2.height + 6)) then
						NewMagnitude += 5000
					end
					local Sign = math.sign(ClampedValue + X / 2 - Vector.x)
					
					for _, Vector3 in List do
						NewMagnitude += rectOverlapArea(Vector2, Vector3, p1.gap) * 2400 / (X * Y)
						
						if rectOverlapArea(Vector2, Vector3, 0) > 0 then
							NewMagnitude += 1000
						end
						if segmentsCross(Vector.x, Vector.y, ClampedValue2, ClampedValue3, Vector3.anchorX, Vector3.anchorY, Vector3.attachX, Vector3.attachY) then
							NewMagnitude += 1000
						end
						local AnchorX = Vector3.anchorX
						local AnchorY = Vector3.anchorY
						
						if Vector2.x - 4 <= AnchorX and (AnchorX <= Vector2.x + Vector2.width + 4 and (Vector2.y - 4 <= AnchorY and AnchorY <= Vector2.y + Vector2.height + 4)) then
							NewMagnitude += 1000
						end
						if segmentCrossesRect(Vector.x, Vector.y, ClampedValue2, ClampedValue3, Vector3) or segmentCrossesRect(Vector3.anchorX, Vector3.anchorY, Vector3.attachX, Vector3.attachY, Vector2) then
							NewMagnitude += 1000
						end
						if Sign == math.sign(Vector3.x + X / 2 - Vector3.anchorX) and (Vector.y - Vector3.anchorY) * (ClampedValue1 - Vector3.y) < 0 then
							NewMagnitude += 120
						end
					end
					for _, pin in Pins do
						if pin.id ~= Vector.id then
							local X2 = pin.x
							local Y2 = pin.y
							
							if Vector2.x - 4 <= X2 and (X2 <= Vector2.x + Vector2.width + 4 and (Vector2.y - 4 <= Y2 and Y2 <= Vector2.y + Vector2.height + 4)) then
								NewMagnitude += 1000
							end
						end
					end
					if p1.avatarRect then
						NewMagnitude += rectOverlapArea(Vector2, p1.avatarRect, 0) * 200 / (X * Y)
					end
					local NewNewMagnitude = NewMagnitude + math.sqrt((ClampedValue2 - Vector.x) ^ 2 + (ClampedValue3 - Vector.y) ^ 2) * 0.5
					
					if Vector1.directionX * (Vector.x - XRatio) < -8 then
						NewNewMagnitude += 22
					end
					if p1.previousKeys and p1.previousKeys[Vector.id] == Vector1.key then
						NewNewMagnitude -= 30
					end
					if v2 == nil or NewNewMagnitude < v2.cost then
						v2 = {
							id = Vector.id,
							x = ClampedValue,
							y = ClampedValue1,
							width = X,
							height = Y,
							anchorX = Vector.x,
							anchorY = Vector.y,
							attachX = ClampedValue2,
							attachY = ClampedValue3,
							key = Vector1.key,
							cost = NewNewMagnitude
						}
					end
				end
			end
			return v2
		end
		
		local List1 = {}
		
		for _, value in Copy do
			table.insert(List1, (place(value, List1)))
		end
		local function _(p2)
			-- upvalues: List1 (copy)
			local List = {}
			
			for i, value in List1 do
				if i ~= p2 then
					table.insert(List, value)
				end
			end
			return List
		end
		
		local function refine()
			-- upvalues: List1 (copy), place (copy), Copy (copy)
			for _ = 1, 2 do
				for i = 1, #List1 do
					local Entry = Copy[i]
					local List = {}
					
					for i2, value in List1 do
						if i2 ~= i then
							table.insert(List, value)
						end
					end
					List1[i] = place(Entry, List)
				end
			end
			for i1 = 1, #List1 do
				local Entry = Copy[i1]
				local List = {}
				
				for i3, value1 in List1 do
					if i3 ~= i1 then
						table.insert(List, value1)
					end
				end
				List1[i1] = place(Entry, List, List1[i1].key)
			end
		end
		
		refine()
		
		local function isCoveredByFocus(Vector): boolean
			-- upvalues: List1 (copy), p1 (copy)
			for _, Vector1 in List1 do
				if Vector1.id == p1.focusId and Vector1 ~= Vector then
					local AnchorX = Vector.anchorX
					local AnchorY = Vector.anchorY
					
					if Vector1.x - 4 <= AnchorX and (AnchorX <= Vector1.x + Vector1.width + 4 and (Vector1.y - 4 <= AnchorY and AnchorY <= Vector1.y + Vector1.height + 4)) then
						return true
					end
				end
			end
			return false
		end
		while true do
			local Index = nil
			for i, value1 in List1 do
				if value1.id ~= p1.focusId and (value1.cost > 520 or isCoveredByFocus(value1)) and (Index == nil or Copy[i].score <= Copy[Index].score) then
					Index = i
				end
			end
			if Index == nil then break end
			table.remove(Copy, Index)
			table.remove(List1, Index)
			local Removed = table.remove(List, 1)
			
			if Removed then
				table.insert(Copy, Removed)
				table.insert(List1, (place(Removed, List1)))
			end
			refine()
		end
		local List2 = {}
		
		for _, Vector in List1 do
			table.insert(List2, {
				id = Vector.id,
				x = Vector.x,
				y = Vector.y,
				width = Vector.width,
				height = Vector.height,
				anchorX = Vector.anchorX,
				anchorY = Vector.anchorY,
				attachX = Vector.attachX,
				attachY = Vector.attachY,
				key = Vector.key
			})
		end
		return List2
	end
}