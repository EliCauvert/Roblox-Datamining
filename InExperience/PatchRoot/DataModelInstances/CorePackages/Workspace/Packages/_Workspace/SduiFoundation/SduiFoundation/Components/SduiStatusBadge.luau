local Parent = script:FindFirstAncestor("SduiFoundation").Parent
local ReactModule = require(Parent.React)
local StatusBadge = require(Parent.Foundation).StatusBadge

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), StatusBadge (copy)
	return ReactModule.createElement(StatusBadge, {
		text = p1.text or "",
		variant = p1.variant,
		shape = p1.shape,
		size = p1.size,
		testId = p1.testId,
		AnchorPoint = p1.anchorPoint,
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		Visible = p1.visible,
		ZIndex = p1.zIndex
	})
end)