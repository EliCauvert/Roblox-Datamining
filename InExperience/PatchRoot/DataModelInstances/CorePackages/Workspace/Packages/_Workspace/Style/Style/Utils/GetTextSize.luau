local GetTextSizeFunction = require(script:FindFirstAncestor("Style").Parent.UIBlox).Core.Text.GetTextSize
local _Vector2 = Vector2.new(2, 2)

return function(p1, p2, p3, p4, p5)
	-- upvalues: GetTextSizeFunction (copy), _Vector2 (copy)
	local TextSize = GetTextSizeFunction(p1, p2, p3, p4)
	
	return if p5 == nil or p5.addTemporaryPadding ~= false then TextSize else TextSize - _Vector2
end