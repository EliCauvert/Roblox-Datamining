return function(p1, p2: number, Value: number): NumberSequence --[[ Line: 3 ]]
	if p2 <= 0 then
		return NumberSequence.new(0)
	else
		local ClampedValue = math.clamp(Value, 0, 1)
		local ClampedValue1 = math.clamp(p1 / p2, 0, 1)
		
		return if ClampedValue == 0 or ClampedValue1 == 0 then NumberSequence.new(0) elseif ClampedValue1 == 1 then NumberSequence.new(ClampedValue) elseif ClampedValue1 <= 0.001 then NumberSequence.new({
			NumberSequenceKeypoint.new(0, ClampedValue),
			NumberSequenceKeypoint.new(ClampedValue1, 0),
			NumberSequenceKeypoint.new(1, 0)
		}) else NumberSequence.new({
			NumberSequenceKeypoint.new(0, ClampedValue),
			NumberSequenceKeypoint.new(ClampedValue1 - 0.001, ClampedValue),
			NumberSequenceKeypoint.new(ClampedValue1, 0),
			NumberSequenceKeypoint.new(1, 0)
		})
	end
end