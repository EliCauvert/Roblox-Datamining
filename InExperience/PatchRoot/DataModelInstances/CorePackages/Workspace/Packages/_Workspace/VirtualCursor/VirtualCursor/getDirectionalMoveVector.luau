local function getDirectionForKeycode(p0, p1)
	return if p0 == Enum.KeyCode.ButtonUp then Vector2.new(0, -p1) elseif p0 == Enum.KeyCode.ButtonDown then Vector2.new(0, p1) elseif p0 == Enum.KeyCode.ButtonLeft then Vector2.new(-p1, 0) elseif p0 == Enum.KeyCode.ButtonRight then Vector2.new(p1, 0) else Vector2.zero
end

return function(p2)
	-- upvalues: getDirectionForKeycode (ref)
	local zero = Vector2.zero
	
	for i, v in p2 do
		zero += getDirectionForKeycode(i, v)
	end
	if zero.Magnitude > 1 then
		zero = zero.Unit
	end
	return zero
end