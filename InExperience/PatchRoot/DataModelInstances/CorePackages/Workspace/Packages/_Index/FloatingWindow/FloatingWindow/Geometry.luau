local CornerModule = require(script.Parent.Corner)

local function _(Value: number, MinValue: number, MaxValue: number): number
	return if MaxValue <= MinValue then (MinValue + MaxValue) / 2 else math.clamp(Value, MinValue, MaxValue)
end

local GeometryModule = {
	hasPositiveSize = function(Vector): boolean
		return Vector.X > 0 and Vector.Y > 0
	end,
	resolveCenter = function(Vector, Vector1): Vector2
		return Vector2.new(Vector.X.Scale * Vector1.X + Vector.X.Offset, Vector.Y.Scale * Vector1.Y + Vector.Y.Offset)
	end,
	centerLimits = function(Vector, p1: number)
		local Vector1 = p1 / 2
		
		return {
			left = Vector1.X,
			right = Vector.X - Vector1.X,
			top = Vector1.Y,
			bottom = Vector.Y - Vector1.Y
		}
	end,
	clampToLimits = function(Vector, CenterLimitsResult): Vector2
		local X: number = Vector.X
		local Left: number = CenterLimitsResult.left
		local Right: number = CenterLimitsResult.right
		local LeftRatio = if Right <= Left then (Left + Right) / 2 else math.clamp(X, Left, Right)
		local Y: number = Vector.Y
		local Top: number = CenterLimitsResult.top
		local Bottom: number = CenterLimitsResult.bottom
		
		return Vector2.new(LeftRatio, if Bottom <= Top then (Top + Bottom) / 2 else math.clamp(Y, Top, Bottom))
	end
}

function GeometryModule.clampCenter(p1, p2, p3)
	-- upvalues: GeometryModule (copy)
	return GeometryModule.clampToLimits(p1, GeometryModule.centerLimits(p2, p3))
end

local _ = function(p1, p2)
	-- upvalues: CornerModule (copy)
	return if p1 then if p2 then CornerModule.TopLeft else CornerModule.BottomLeft elseif p2 then CornerModule.TopRight else CornerModule.BottomRight
end

local _ = function(BottomLeft): boolean
	-- upvalues: CornerModule (copy)
	return BottomLeft == CornerModule.TopLeft or BottomLeft == CornerModule.BottomLeft
end

local _ = function(TopLeft): boolean
	-- upvalues: CornerModule (copy)
	return TopLeft == CornerModule.TopLeft or TopLeft == CornerModule.TopRight
end

function GeometryModule.nearestCorner(Vector, Vector1)
	-- upvalues: CornerModule (copy)
	local IsYBelow = Vector.Y <= Vector1.Y / 2
	
	return if Vector.X < Vector1.X / 2 then if IsYBelow then CornerModule.TopLeft else CornerModule.BottomLeft elseif IsYBelow then CornerModule.TopRight else CornerModule.BottomRight
end

function GeometryModule.fixedAxisCorner(p1, p2, p3, p4)
	-- upvalues: GeometryModule (copy), CornerModule (copy)
	local NearestCornerResult = GeometryModule.nearestCorner(p1, p2)
	local CenterLimitsResult = GeometryModule.centerLimits(p2, p3)
	local IsLeftBelow = CenterLimitsResult.left < CenterLimitsResult.right
	local IsTopBelow = CenterLimitsResult.top < CenterLimitsResult.bottom
	local NearestCornerResult1 = if IsLeftBelow then NearestCornerResult else p4
	local IsNearestCornerResultMatch: boolean = NearestCornerResult1 == CornerModule.TopLeft or NearestCornerResult1 == CornerModule.BottomLeft
	local NearestCornerResult2 = if IsTopBelow then NearestCornerResult else p4
	local IsNearestCornerResultMatch1: boolean = NearestCornerResult2 == CornerModule.TopLeft or NearestCornerResult2 == CornerModule.TopRight
	
	return if IsNearestCornerResultMatch then if IsNearestCornerResultMatch1 then CornerModule.TopLeft else CornerModule.BottomLeft elseif IsNearestCornerResultMatch1 then CornerModule.TopRight else CornerModule.BottomRight
end

function GeometryModule.cornerTarget(p1, p2, TopLeft)
	-- upvalues: GeometryModule (copy), CornerModule (copy)
	local CenterLimitsResult = GeometryModule.centerLimits(p1, p2)
	local IsTopLeftMatch: boolean = TopLeft == CornerModule.TopLeft or TopLeft == CornerModule.BottomLeft
	local IsTopLeftMatch1: boolean = TopLeft == CornerModule.TopLeft or TopLeft == CornerModule.TopRight
	
	return GeometryModule.clampToLimits(Vector2.new(if IsTopLeftMatch then CenterLimitsResult.left else CenterLimitsResult.right, if IsTopLeftMatch1 then CenterLimitsResult.top else CenterLimitsResult.bottom), CenterLimitsResult)
end

function GeometryModule.normalizedCenter(Vector, Vector1): Vector2
	return Vector2.new(math.clamp(Vector.X / Vector1.X, 0, 1), (math.clamp(Vector.Y / Vector1.Y, 0, 1)))
end

function GeometryModule.normalizedCornerPosition(TopLeft): Vector2
	-- upvalues: CornerModule (copy)
	local IsTopLeftMatch: boolean = TopLeft == CornerModule.TopLeft or TopLeft == CornerModule.BottomLeft
	local IsTopLeftMatch1: boolean = TopLeft == CornerModule.TopLeft or TopLeft == CornerModule.TopRight
	
	return Vector2.new(if IsTopLeftMatch then 0 else 1, if IsTopLeftMatch1 then 0 else 1)
end

return GeometryModule