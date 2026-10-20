local function _(Value: number, MinValue: number, MaxValue: number): number
	return if MaxValue <= MinValue then (MinValue + MaxValue) / 2 else math.clamp(Value, MinValue, MaxValue)
end

return {
	hasPositiveSize = function(Vector): boolean
		return Vector.X > 0 and Vector.Y > 0
	end,
	resolveCenter = function(Vector, Vector1): Vector2
		return Vector2.new(Vector.X.Scale * Vector1.X + Vector.X.Offset, Vector.Y.Scale * Vector1.Y + Vector.Y.Offset)
	end,
	clampCenter = function(Vector, Vector1, p1: number): Vector2
		local Vector3 = p1 / 2
		local X: number = Vector.X
		local X1: number = Vector3.X
		local XDelta = Vector1.X - Vector3.X
		local XRatio = if XDelta <= X1 then (X1 + XDelta) / 2 else math.clamp(X, X1, XDelta)
		local Y: number = Vector.Y
		local Y1: number = Vector3.Y
		local YDelta = Vector1.Y - Vector3.Y
		
		return Vector2.new(XRatio, if YDelta <= Y1 then (Y1 + YDelta) / 2 else math.clamp(Y, Y1, YDelta))
	end
}