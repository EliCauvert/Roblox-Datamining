local function getDirectionForKeycode(p1, p2)
	return if p1 == Enum.KeyCode.ButtonUp then Vector2.new(0, -p2) elseif p1 == Enum.KeyCode.ButtonDown then Vector2.new(0, p2) elseif p1 == Enum.KeyCode.ButtonLeft then Vector2.new(-p2, 0) elseif p1 == Enum.KeyCode.ButtonRight then Vector2.new(p2, 0) else Vector2.zero
end

return function(p1)
	-- upvalues: getDirectionForKeycode (ref)
	local zero = Vector2.zero
	
	for i, v in p1 do
		zero += getDirectionForKeycode(i, v)
	end
	if zero.Magnitude > 1 then
		zero = zero.Unit
	end
	return zero
end