local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local _ = require(parent.SduiCompat)
local badge = require(parent.Foundation).Badge

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), badge (ref)
	return reactModule.createElement(badge, {
		text = p0.text,
		icon = p0.icon,
		variant = p0.variant,
		testId = p0.testId,
		onAbsoluteSizeChanged = p0.onAbsoluteSizeChanged,
		onAbsolutePositionChanged = p0.onAbsolutePositionChanged,
		AnchorPoint = p0.anchorPoint,
		LayoutOrder = p0.layoutOrder,
		Position = p0.position,
		Visible = p0.visible,
		ZIndex = p0.zIndex
	})
end)