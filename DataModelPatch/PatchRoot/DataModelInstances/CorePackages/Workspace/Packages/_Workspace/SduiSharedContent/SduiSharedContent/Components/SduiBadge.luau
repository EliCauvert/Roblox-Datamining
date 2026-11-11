local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.SduiCompat)
local Badge = require(Parent.Foundation).Badge

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), Badge (copy)
	return ReactModule.createElement(Badge, {
		text = p1.text,
		icon = p1.icon,
		variant = p1.variant,
		testId = p1.testId,
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
		onAbsolutePositionChanged = p1.onAbsolutePositionChanged,
		AnchorPoint = p1.anchorPoint,
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		Visible = p1.visible,
		ZIndex = p1.zIndex
	})
end)