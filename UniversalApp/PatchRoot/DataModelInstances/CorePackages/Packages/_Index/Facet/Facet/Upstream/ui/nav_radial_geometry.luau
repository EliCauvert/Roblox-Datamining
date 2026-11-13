local _ = require("./radial_types")
local NavPathShapesModule = require("./nav_path_shapes")
local config = {
	N = 0,
	NE = 45,
	E = 90,
	SE = 135,
	S = 180,
	SW = 225,
	W = 270,
	NW = 315
}
local self = setmetatable({}, { __mode = "k" })
local NavRadialGeometryModule = {
	arc = function(NewAngle)
		local config = {
			["top-left"] = 90,
			["top-right"] = 180,
			["bottom-right"] = 270,
			["bottom-left"] = 0
		}
		local Entry = config[NewAngle] or 0
		
		if config[NewAngle] then
			return Entry, 90
		else
			return Entry, 360
		end
	end,
	delta = function(Degrees, Angle): number
		return (Degrees - Angle + 180) % 360 - 180
	end,
	sectors = function(p1, p2: number, p3: number, p4, Inner, Outer)
		-- upvalues: config (copy)
		local t = {}
		local t1 = {}
		
		for i = 1, #p1 do
			local Item = p1[i]
			local Degrees = nil
			local Smallest = nil
			
			if p4 == "compass" then
				local Entry = if Item.slot then config[Item.slot] else nil
				assert(Entry ~= nil, "RadialMenu: compass items require slot N, NE, E, SE, S, SW, W, or NW")
				Degrees = Entry
				assert(not t1[Degrees], "RadialMenu: conflicting compass slot " .. tostring(Item.slot))
				t1[Degrees] = true
				Smallest = 45
				
				if p3 < 360 then
					local DegreesRemainder = (Degrees - p2) % 360
					Smallest = math.min(Smallest, DegreesRemainder * 2, (p3 - DegreesRemainder) * 2)
					assert(Smallest > 0, "RadialMenu: corner compass slots must be inside the arc, not on its edge")
				end
			else
				Smallest = p3 / #p1
				Degrees = if p3 == 360 then p2 + (i - 1) * Smallest else p2 + (i - 0.5) * Smallest
			end
			assert(p3 == 360 or (Degrees - p2) % 360 <= p3, "RadialMenu: compass slot is outside the corner arc")
			local InnerRatio = (Inner + Outer) / 2
			t[i] = {
				list = false,
				id = Item.id,
				item = Item,
				path = {},
				key = Item.id,
				index = i,
				angle = Degrees,
				span = Smallest,
				inner = Inner,
				outer = Outer,
				x = math.sin((math.rad(Degrees))) * InnerRatio,
				y = -math.cos((math.rad(Degrees))) * InnerRatio,
				size = math.min(Outer - Inner, InnerRatio * 2 * math.sin((math.rad(math.min(Smallest, 180) / 2))) * 0.86)
			}
		end
		return t
	end,
	labelBounds = function(Vector, Height: number)
		-- upvalues: self (copy)
		local SelfEntry = self[Vector]
		
		if SelfEntry and SelfEntry.x == Vector.x and SelfEntry.y == Vector.y and SelfEntry.inner == Vector.inner and SelfEntry.outer == Vector.outer and SelfEntry.angle == Vector.angle and SelfEntry.span == Vector.span and SelfEntry.height == Height then
			return SelfEntry.bounds
		end
		local Height1: number = Height
		local ScaledInner = Vector.inner * Vector.inner
		local ScaledOuter = Vector.outer * Vector.outer
		local Sine = math.sin((math.rad(Vector.angle)))
		local Cosine = math.cos((math.rad(Vector.angle)))
		local SpanDelta = Vector.span / 2 - 2
		local Cosine1 = math.cos((math.rad(SpanDelta)))
		local ScaledCosine = Cosine1 * Cosine1
		
		local function _(p5, p6): boolean
			-- upvalues: ScaledOuter (copy), SpanDelta (copy), Sine (copy), Cosine (copy), Cosine1 (copy), ScaledCosine (copy)
			local v1 = p5 * p5 + p6 * p6
			
			if ScaledOuter < v1 or SpanDelta < 0 then
				return false
			else
				local SineDelta = p5 * Sine - p6 * Cosine
				
				return if Cosine1 >= 0 then SineDelta >= 0 and v1 * ScaledCosine <= SineDelta * SineDelta else SineDelta >= 0 or SineDelta * SineDelta <= v1 * ScaledCosine
			end
		end
		
		local function fits(Height: number, Height1: number): boolean
			-- upvalues: Vector (copy), ScaledInner (copy), ScaledOuter (copy), SpanDelta (copy), Sine (copy), Cosine (copy), Cosine1 (copy), ScaledCosine (copy)
			local NewHeight = Height / 2 + 3
			local NewHeight1 = Height1 / 2 + 3
			local Largest = math.max(0, math.abs(Vector.x) - NewHeight)
			local Largest1 = math.max(0, math.abs(Vector.y) - NewHeight1)
			
			if Largest * Largest + Largest1 * Largest1 < ScaledInner then
				return false
			end
			local XDelta = Vector.x - NewHeight
			local YDelta = Vector.y - NewHeight1
			local NewXDelta = XDelta * XDelta + YDelta * YDelta
			local Flag = nil
			
			if ScaledOuter < NewXDelta or SpanDelta < 0 then
				Flag = false
			else
				local XDeltaDelta = XDelta * Sine - YDelta * Cosine
				Flag = if Cosine1 >= 0 then XDeltaDelta >= 0 and NewXDelta * ScaledCosine <= XDeltaDelta * XDeltaDelta else XDeltaDelta >= 0 or XDeltaDelta * XDeltaDelta <= NewXDelta * ScaledCosine
			end
			if Flag then
				local XDelta1 = Vector.x - NewHeight
				local NewY = Vector.y + NewHeight1
				local NewXDelta1 = XDelta1 * XDelta1 + NewY * NewY
				
				if ScaledOuter < NewXDelta1 or SpanDelta < 0 then
					Flag = false
				else
					local XDeltaDelta = XDelta1 * Sine - NewY * Cosine
					Flag = if Cosine1 >= 0 then XDeltaDelta >= 0 and NewXDelta1 * ScaledCosine <= XDeltaDelta * XDeltaDelta else XDeltaDelta >= 0 or XDeltaDelta * XDeltaDelta <= NewXDelta1 * ScaledCosine
				end
				if Flag then
					local NewX = Vector.x + NewHeight
					local YDelta1 = Vector.y - NewHeight1
					local NewNewX = NewX * NewX + YDelta1 * YDelta1
					
					if ScaledOuter < NewNewX or SpanDelta < 0 then
						Flag = false
					else
						local NewXDelta2 = NewX * Sine - YDelta1 * Cosine
						Flag = if Cosine1 >= 0 then NewXDelta2 >= 0 and NewNewX * ScaledCosine <= NewXDelta2 * NewXDelta2 else NewXDelta2 >= 0 or NewXDelta2 * NewXDelta2 <= NewNewX * ScaledCosine
					end
					if Flag then
						local NewX1 = Vector.x + NewHeight
						local NewY1 = Vector.y + NewHeight1
						local NewNewX1 = NewX1 * NewX1 + NewY1 * NewY1
						
						if ScaledOuter < NewNewX1 or SpanDelta < 0 then
							return false
						end
						local NewXDelta3 = NewX1 * Sine - NewY1 * Cosine
						
						if Cosine1 >= 0 then
							Flag = false
							
							if NewXDelta3 >= 0 then
								return NewNewX1 * ScaledCosine <= NewXDelta3 * NewXDelta3
							end
						else
							Flag = NewXDelta3 >= 0 or NewXDelta3 * NewXDelta3 <= NewNewX1 * ScaledCosine
						end
					end
				end
			end
			return Flag
		end
		
		if not fits(Height, Height) then
			local v1 = 0
			local Height2: number = Height
			
			for _ = 1, 14 do
				local HeightRatio = (v1 + Height2) / 2
				
				if fits(HeightRatio, HeightRatio) then
					v1 = HeightRatio
				else
					Height2 = HeightRatio
				end
			end
			Height = v1
		end
		local v2 = 0
		local Smallest = math.min(160, Vector.outer * 2)
		
		for _ = 1, 14 do
			local SmallestRatio = (v2 + Smallest) / 2
			
			if fits(SmallestRatio, Height) then
				v2 = SmallestRatio
			else
				Smallest = SmallestRatio
			end
		end
		local Bounds = { w = v2, h = Height }
		table.freeze(Bounds)
		self[Vector] = {
			x = Vector.x,
			y = Vector.y,
			inner = Vector.inner,
			outer = Vector.outer,
			angle = Vector.angle,
			span = Vector.span,
			height = Height1,
			bounds = Bounds
		}
		
		return Bounds
	end
}

function NavRadialGeometryModule.fitContent(Tbl, p5: number, p6: number, p7, p8)
	-- upvalues: NavRadialGeometryModule (copy)
	local Copy = table.clone(Tbl)
	
	if p8 == "none" then
		return Copy
	end
	local v3 = p5 / 2 + p7
	local v4 = p6 / 2 + p7
	local Largest = math.max(0, math.abs(Tbl.x) - v3)
	local Largest1 = math.max(0, math.abs(Tbl.y) - v4)
	local SquareRoot = math.sqrt(Largest * Largest + Largest1 * Largest1)
	local Largest2 = 0
	local Largest21 = 0
	
	for _, value in { -v3, v3 } do
		for _, value1 in { -v4, v4 } do
			local NewX = Tbl.x + value
			local NewY = Tbl.y + value1
			Largest2 = math.max(Largest2, (math.sqrt(NewX * NewX + NewY * NewY)))
			Largest21 = math.max(Largest21, (math.abs((NavRadialGeometryModule.delta(math.deg((math.atan2(NewX, -NewY))), Tbl.angle)))))
		end
	end
	if p8 ~= "angular" then
		local Smallest = math.min(Tbl.outer, Largest2)
		Copy.inner = math.max(Tbl.inner, SquareRoot)
		Copy.outer = Smallest
	end
	if p8 ~= "radial" then
		Copy.span = math.min(Tbl.span, Largest21 * 2 + math.deg((Tbl.gap or 2) / math.max(1, Copy.inner)))
	end
	return Copy
end

function NavRadialGeometryModule.hit(p9, Y: number, p10, p11, p12, p13)
	-- upvalues: NavRadialGeometryModule (copy)
	local SquareRoot = math.sqrt(Y * Y + p10 * p10)
	local DegreesRemainder = math.deg((math.atan2(Y, -p10))) % 360
	
	local function contains(Vector, p14): boolean
		-- upvalues: SquareRoot (copy), p12 (copy), p11 (copy), Y (copy), p10 (copy), NavRadialGeometryModule (upval), DegreesRemainder (copy)
		return SquareRoot >= Vector.inner and Vector.outer + (p12 or 0) >= SquareRoot and (if p11 == "buttons" and p12 == nil then (Y - Vector.x) ^ 2 + (p10 - Vector.y) ^ 2 <= (Vector.size / 2) ^ 2 else math.abs((NavRadialGeometryModule.delta(DegreesRemainder, Vector.angle))) < Vector.span / 2 + p14)
	end
	
	local v5 = nil
	local v6 = nil
	
	for i = #p9, 1, -1 do
		v6 = p9[i]
		
		if not contains(v6, 0) then
			continue
		end
		v5 = v6
		break
	end
	return if v5 and p13 and contains(p13, 3) then p13 else v5
end

function NavRadialGeometryModule.paint(p14)
	-- upvalues: NavPathShapesModule (copy)
	local Smallest = math.min((p14.gap or 2) / 2, (p14.inner + p14.outer) / 2 * math.sin((math.rad(p14.span / 4))))
	local Degrees = math.deg((math.asin(Smallest / ((p14.inner + p14.outer) / 2))))
	local NewAngle = p14.angle - p14.span / 2 + Degrees
	local SpanDelta = p14.span - Degrees * 2
	local Smallest1 = 1e999
	local Smallest2 = 1e999
	local Largest = -1e999
	local Largest1 = -1e999
	local List = { NewAngle, NewAngle + SpanDelta }
	
	for i = 0, 720, 90 do
		if (i - NewAngle) % 360 <= SpanDelta then
			table.insert(List, i)
		end
	end
	for _, Degrees1 in List do
		for _, value in { p14.inner, p14.outer } do
			local ScaledSine = math.sin((math.rad(Degrees1))) * value
			local v7 = -math.cos((math.rad(Degrees1))) * value
			Smallest1 = math.min(Smallest1, ScaledSine)
			Largest = math.max(Largest, ScaledSine)
			Smallest2 = math.min(Smallest2, v7)
			Largest1 = math.max(Largest1, v7)
		end
	end
	for _, value1 in { -1, 1 } do
		local Radians = math.rad(p14.angle + value1 * p14.span / 2)
		
		for _, value2 in { p14.inner, p14.outer } do
			local SineDelta = math.sin(Radians) * value2 - value1 * Smallest * math.cos(Radians)
			local v8 = -math.cos(Radians) * value2 - value1 * Smallest * math.sin(Radians)
			Smallest1 = math.min(Smallest1, SineDelta)
			Largest = math.max(Largest, SineDelta)
			Smallest2 = math.min(Smallest2, v8)
			Largest1 = math.max(Largest1, v8)
		end
	end
	local Largest2 = math.max(1, Largest - Smallest1)
	local Largest3 = math.max(1, Largest1 - Smallest2)
	local ArcResult = NavPathShapesModule.arc(NewAngle, SpanDelta, { radius = (p14.inner + p14.outer) / (p14.outer * 2) })
	
	for _, value3 in { { 1, -1 }, { #ArcResult, 1 } } do
		local v9 = ArcResult[value3[1]]
		local v10 = value3[2]
		local Radians = math.rad(p14.angle + v10 * p14.span / 2)
		local InnerRatio = (p14.inner + p14.outer) / 2
		v9.x = 0.5 + (math.sin(Radians) * InnerRatio - v10 * Smallest * math.cos(Radians)) / (2 * p14.outer)
		v9.y = 0.5 + (-math.cos(Radians) * InnerRatio - v10 * Smallest * math.sin(Radians)) / (2 * p14.outer)
		local SquareRoot = math.sqrt(v9.outX ^ 2 + v9.outY ^ 2)
		local ScaledSine = math.sin(Radians) * SquareRoot
		v9.outX = math.cos(Radians) * SquareRoot
		v9.outY = ScaledSine
		local Negated = -v9.outY
		v9.inX = -v9.outX
		v9.inY = Negated
	end
	for _, value4 in ArcResult do
		value4.x = (value4.x * 2 * p14.outer - p14.outer - Smallest1) / Largest2
		value4.y = (value4.y * 2 * p14.outer - p14.outer - Smallest2) / Largest3
		value4.inX *= 2 * p14.outer / Largest2
		value4.outX *= 2 * p14.outer / Largest2
		value4.inY *= 2 * p14.outer / Largest3
		value4.outY *= 2 * p14.outer / Largest3
	end
	return {
		x = Smallest1,
		y = Smallest2,
		w = Largest2,
		h = Largest3,
		points = ArcResult
	}
end

return NavRadialGeometryModule