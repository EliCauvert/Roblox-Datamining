return {
	getMoveVector = function(p1, p2, p3: number, Value: number)
		if p3 <= 0 then
			return Vector2.zero
		end
		local Offset = p2 - p1
		local Magnitude: number = Offset.Magnitude
		local ScaledClampedValue = p3 * math.clamp(Value, 0, 0.99)
		
		if Magnitude <= ScaledClampedValue then
			return Vector2.zero
		else
			local Smallest = math.min(1, (Magnitude - ScaledClampedValue) / (p3 - ScaledClampedValue))
			local OffsetRatio = Offset / Magnitude
			
			return Vector2.new(OffsetRatio.X, -OffsetRatio.Y) * Smallest
		end
	end,
	getKnobOffset = function(p1, p2, p3)
		local Offset = p2 - p1
		local Magnitude = Offset.Magnitude
		
		return if Magnitude <= p3 or Magnitude == 0 then Offset else Offset * (p3 / Magnitude)
	end,
	combineMove = function(p1, p2)
		local Direction = p1 + p2
		
		return if Direction.Magnitude > 1 then Direction.Unit else Direction
	end
}