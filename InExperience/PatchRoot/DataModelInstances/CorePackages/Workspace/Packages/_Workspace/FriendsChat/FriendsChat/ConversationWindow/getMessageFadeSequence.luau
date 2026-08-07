return function(p0, p1, p2) --[[ line: 3 ]]
	if p1 <= 0 then
		return NumberSequence.new(0)
	end
	local clampedValue = math.clamp(p2, 0, 1)
	local clampedValue_1 = math.clamp(p0 / p1, 0, 1)
	
	return if clampedValue == 0 or clampedValue_1 == 0 then NumberSequence.new(0) elseif clampedValue_1 == 1 then NumberSequence.new(clampedValue) elseif clampedValue_1 <= 0.001 then NumberSequence.new({
		NumberSequenceKeypoint.new(0, clampedValue),
		NumberSequenceKeypoint.new(clampedValue_1, 0),
		NumberSequenceKeypoint.new(1, 0)
	}) else NumberSequence.new({
		NumberSequenceKeypoint.new(0, clampedValue),
		NumberSequenceKeypoint.new(clampedValue_1 - 0.001, clampedValue),
		NumberSequenceKeypoint.new(clampedValue_1, 0),
		NumberSequenceKeypoint.new(1, 0)
	})
end