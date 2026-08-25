local _ = game:GetService("GuiService")
local _ = require(script.Parent.Parent.Properties)

return function(p0, p1)
	local zero = Vector2.zero
	
	if p0 == Enum.KeyCode.ButtonUp then
		zero = Vector2.new(0, p1)
		
		return zero
	elseif p0 == Enum.KeyCode.ButtonDown then
		zero = Vector2.new(0, -p1)
		
		return zero
	elseif p0 == Enum.KeyCode.ButtonLeft then
		zero = Vector2.new(-p1, 0)
		
		return zero
	elseif p0 == Enum.KeyCode.ButtonRight then
		zero = Vector2.new(p1, 0)
	end
	return zero
end