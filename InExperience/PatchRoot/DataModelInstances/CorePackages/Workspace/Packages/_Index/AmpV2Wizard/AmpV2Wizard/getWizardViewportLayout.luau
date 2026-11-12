return function(p1, p2, p3)
	local NewMin = p2.Min + Vector2.new(p3.left, p3.top)
	local MaxDelta = p2.Max - Vector2.new(p3.right, p3.bottom)
	local MaxDelta1 = p1.Max - p1.Min
	local ClampedValue = math.clamp(NewMin.X - p1.Min.X, 0, MaxDelta1.X)
	local ClampedValue1 = math.clamp(NewMin.Y - p1.Min.Y, 0, MaxDelta1.Y)
	local Largest: number = if p1.Min.X <= NewMin.X then math.max(0, p1.Min.X - p2.Min.X) else 0
	local Largest1: number = if p1.Min.Y <= NewMin.Y then math.max(0, p1.Min.Y - p2.Min.Y) else 0
	
	return {
		contentPosition = UDim2.fromOffset(ClampedValue, ClampedValue1),
		contentSize = UDim2.new(1, -ClampedValue - math.clamp(p1.Max.X - MaxDelta.X, 0, MaxDelta1.X - ClampedValue), 1, -ClampedValue1 - math.clamp(p1.Max.Y - MaxDelta.Y, 0, MaxDelta1.Y - ClampedValue1)),
		backgroundPosition = UDim2.fromOffset(-Largest, -Largest1),
		backgroundSize = UDim2.new(1, Largest + (if MaxDelta.X <= p1.Max.X then math.max(0, p2.Max.X - p1.Max.X) else 0), 1, Largest1 + (if MaxDelta.Y <= p1.Max.Y then math.max(0, p2.Max.Y - p1.Max.Y) else 0))
	}
end