local _ = game:GetService("GuiService")
local _ = require(script.Parent.Parent.Properties)

return function(KeyCode, Y) --[[ Line: 8 | Named "getThumbstickInputFromDirectionalInput" ]]
	local ZeroVector = Vector2.zero
	
	if KeyCode == Enum.KeyCode.ButtonUp then
		ZeroVector = Vector2.new(0, Y)
		
		return ZeroVector
	end
	if KeyCode == Enum.KeyCode.ButtonDown then
		ZeroVector = Vector2.new(0, -Y)
		
		return ZeroVector
	end
	if KeyCode == Enum.KeyCode.ButtonLeft then
		ZeroVector = Vector2.new(-Y, 0)
		
		return ZeroVector
	end
	if KeyCode == Enum.KeyCode.ButtonRight then
		ZeroVector = Vector2.new(Y, 0)
	end
	return ZeroVector
end