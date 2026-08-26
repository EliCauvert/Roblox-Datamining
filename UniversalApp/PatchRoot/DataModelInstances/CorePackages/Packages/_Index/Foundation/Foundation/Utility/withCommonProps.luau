local _ = require(script:FindFirstAncestor("Foundation").Components.Types)

return function(p1, p2)
	if type(p2) == "table" then
		p2.AnchorPoint = p1.AnchorPoint
		p2.LayoutOrder = p1.LayoutOrder
		p2.Position = p1.Position
		p2.Visible = p1.Visible
		p2.ZIndex = p1.ZIndex
		p2.onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged
		p2.onAbsolutePositionChanged = p1.onAbsolutePositionChanged
		p2.testId = p1.testId
	end
	return p2
end