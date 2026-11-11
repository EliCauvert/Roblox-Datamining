local _ = require(script:FindFirstAncestor("Foundation").Components.Types)

return function(Frame: Frame, p1)
	if type(p1) == "table" then
		p1.AnchorPoint = Frame.AnchorPoint
		p1.LayoutOrder = Frame.LayoutOrder
		p1.Position = Frame.Position
		p1.Visible = Frame.Visible
		p1.ZIndex = Frame.ZIndex
		p1.onAbsoluteSizeChanged = Frame.onAbsoluteSizeChanged
		p1.onAbsolutePositionChanged = Frame.onAbsolutePositionChanged
		p1.testId = Frame.testId
	end
	return p1
end