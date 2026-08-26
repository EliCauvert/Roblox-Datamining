local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local _ = require(parent.SduiCompat)
local badge = require(parent.Foundation).Badge

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), badge (ref)
	return reactModule.createElement(badge, {
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