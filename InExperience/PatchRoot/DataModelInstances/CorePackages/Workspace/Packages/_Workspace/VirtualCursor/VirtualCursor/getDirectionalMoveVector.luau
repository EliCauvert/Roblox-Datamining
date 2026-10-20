local function getDirectionForKeycode(KeyCode, Y)
	return if KeyCode == Enum.KeyCode.ButtonUp then Vector2.new(0, -Y) elseif KeyCode == Enum.KeyCode.ButtonDown then Vector2.new(0, Y) elseif KeyCode == Enum.KeyCode.ButtonLeft then Vector2.new(-Y, 0) elseif KeyCode == Enum.KeyCode.ButtonRight then Vector2.new(Y, 0) else Vector2.zero
end

return function(List)
	-- upvalues: getDirectionForKeycode (copy)
	local ZeroVector = Vector2.zero
	
	for i, value in List do
		ZeroVector += getDirectionForKeycode(i, value)
	end
	if ZeroVector.Magnitude > 1 then
		ZeroVector = ZeroVector.Unit
	end
	return ZeroVector
end