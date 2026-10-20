local function _(Value: number, p1: number, p2: number, p3: number): number
	if p2 <= 0 or p3 <= 0 then
		return Value
	else
		local MinValue = p1 + p3 / 2
		local MaxValue = p1 + p2 - p3 / 2
		
		return if MaxValue < MinValue then p1 + p2 / 2 else math.clamp(Value, MinValue, MaxValue)
	end
end

return function(Vector, Vector1, Vector3, p1, p2)
	if Vector1.X <= 0 or Vector1.Y <= 0 then
		return Vector
	end
	local P6 = p1 or Vector2.zero
	local P7 = p2 or Vector1
	local NewScale = Vector.X.Scale * Vector1.X + Vector.X.Offset
	local NewScale1 = Vector.Y.Scale * Vector1.Y + Vector.Y.Offset
	local X: number = P6.X
	local X1: number = P7.X
	local X2: number = Vector3.X
	local ClampedValue = nil
	
	if X1 <= 0 or X2 <= 0 then
		ClampedValue = NewScale
	else
		local MinValue = X + X2 / 2
		local MaxValue = X + X1 - X2 / 2
		ClampedValue = if MaxValue < MinValue then X + X1 / 2 else math.clamp(NewScale, MinValue, MaxValue)
	end
	local Y: number = P6.Y
	local Y1: number = P7.Y
	local Y2: number = Vector3.Y
	local ClampedValue1 = nil
	
	if Y1 <= 0 or Y2 <= 0 then
		ClampedValue1 = NewScale1
	else
		local MinValue1 = Y + Y2 / 2
		local MaxValue1 = Y + Y1 - Y2 / 2
		ClampedValue1 = if MaxValue1 < MinValue1 then Y + Y1 / 2 else math.clamp(NewScale1, MinValue1, MaxValue1)
	end
	return UDim2.fromScale(ClampedValue / Vector1.X, ClampedValue1 / Vector1.Y)
end