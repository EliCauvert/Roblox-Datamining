local _ = game:GetService("GuiService")
local _ = require(script.Parent.Parent.Properties)

return function(p1, p2)
	local zero = Vector2.zero
	
	if p1 == Enum.KeyCode.ButtonUp then
		zero = Vector2.new(0, p2)
		
		return zero
	elseif p1 == Enum.KeyCode.ButtonDown then
		zero = Vector2.new(0, -p2)
		
		return zero
	elseif p1 == Enum.KeyCode.ButtonLeft then
		zero = Vector2.new(-p2, 0)
		
		return zero
	elseif p1 == Enum.KeyCode.ButtonRight then
		zero = Vector2.new(p2, 0)
	end
	return zero
end