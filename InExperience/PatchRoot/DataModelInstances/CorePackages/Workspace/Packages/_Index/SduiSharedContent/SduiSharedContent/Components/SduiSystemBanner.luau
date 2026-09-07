local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local systemBanner = require(parent.Foundation).SystemBanner

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), systemBanner (ref)
	return reactModule.createElement(systemBanner, {
		severity = p1.severity,
		variant = p1.variant,
		title = p1.title,
		description = p1.description,
		actions = p1.actions,
		onClose = p1.onClose,
		AnchorPoint = p1.anchorPoint,
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		Visible = p1.visible,
		ZIndex = p1.zIndex,
		testId = p1.testId
	})
end)