local function _(Value: number, p1: number): number
	return math.max(math.abs(Value) - p1, 0) / (1 - p1) * math.sign(Value)
end

return {
	applyStickDeadzone = function(Offset, p1)
		if Offset.Magnitude < p1 then
			return Vector2.zero
		else
			local Angle = math.atan2(Offset.Y, Offset.X)
			local Magnitude = math.abs(math.cos(Angle) * p1)
			local Magnitude1 = math.abs(math.sin(Angle) * p1)
			local X: number = Offset.X
			local Y: number = Offset.Y
			
			return Vector2.new(math.max(math.abs(X) - Magnitude, 0) / (1 - Magnitude) * math.sign(X), math.max(math.abs(Y) - Magnitude1, 0) / (1 - Magnitude1) * math.sign(Y))
		end
	end,
	applyTriggerDeadzone = function(Value: number, p1: number): number
		return if Value < p1 then 0 else math.max(math.abs(Value) - p1, 0) / (1 - p1) * math.sign(Value)
	end
}